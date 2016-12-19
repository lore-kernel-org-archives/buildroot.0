From: Andreas Naumann <dev@andin.de>
Date: Mon, 19 Dec 2016 10:13:34 +0100
Subject: [Buildroot] [PATCH v3 5/7] Revert "qt5base: install bundled
 fonts to target"
In-Reply-To: <20161216214754.0acb270a@gmx.net>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
 <1481641171-10407-6-git-send-email-anaumann@ultratronik.de>
 <20161216214754.0acb270a@gmx.net>
Message-ID: <5e676b76-658f-29ff-6880-a6ad750a23e5@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

>>
>> qtbase carries nor more fonts since c5ceabb9a1caf6b9b7615a28c3097f221772f645
>>
>> This reverts commit cdfa21b06041eb601e0bea79f2c8f50e9d637384.
>>
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
>> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
>> ---
>>  package/qt5/qt5base/qt5base.mk | 8 --------
>>  1 file changed, 8 deletions(-)
>>
>> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
>> index 79ad868..fffadad 100644
>> --- a/package/qt5/qt5base/qt5base.mk
>> +++ b/package/qt5/qt5base/qt5base.mk
>> @@ -230,14 +230,6 @@ define QT5BASE_INSTALL_TARGET_PLUGINS
>>  	done
>>  endef
>>
>> -define QT5BASE_INSTALL_TARGET_FONTS
>> -	if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
>> -		mkdir -p $(TARGET_DIR)/usr/lib/fonts ; \
>> -		cp -dpfr $(STAGING_DIR)/usr/lib/fonts/* $(TARGET_DIR)/usr/lib/fonts ; \
>> -	fi
>> -endef
>> -
>> -
>>  define QT5BASE_INSTALL_TARGET_EXAMPLES
>>  	example_dirs=$$(cd $(@D)/examples; find . -mindepth 1 -maxdepth 1 -type d); \
>>  	for example in $${example_dirs}; do \
>
> The revert is not complete, there are two occurrence of QT5BASE_INSTALL_TARGET_FONTS left:
>
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index d240a0a58..5ae0b016e 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -235,14 +235,12 @@ endef
>
>  ifeq ($(BR2_STATIC_LIBS),y)
>  define QT5BASE_INSTALL_TARGET_CMDS
> -       $(QT5BASE_INSTALL_TARGET_FONTS)
>         $(QT5BASE_INSTALL_TARGET_EXAMPLES)
>  endef
>  else
>  define QT5BASE_INSTALL_TARGET_CMDS
>         $(QT5BASE_INSTALL_TARGET_LIBS)
>         $(QT5BASE_INSTALL_TARGET_PLUGINS)
> -       $(QT5BASE_INSTALL_TARGET_FONTS)
>         $(QT5BASE_INSTALL_TARGET_EXAMPLES)
>  endef
>  endif

Of course. Will fix, thanks.
Andreas

>
>
> Regards,
> Peter
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
