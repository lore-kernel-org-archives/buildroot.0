From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 7 Dec 2012 13:40:21 +0100
Subject: [Buildroot] [PATCH] barebox: use the symlink to copy the
 barebox binary to the images directory
In-Reply-To: <CAHkwnC-cDVkM3pHJVkKa3rq3ubjR8fQS7PSrT=AFjzmyDPHpvw@mail.gmail.com>
References: <1353587711-26855-1-git-send-email-gregory.hermant@calao-systems.com>
 <CAHkwnC-cDVkM3pHJVkKa3rq3ubjR8fQS7PSrT=AFjzmyDPHpvw@mail.gmail.com>
Message-ID: <CAHkwnC8aSg-2DH9Hc-e9YKysjjbTn-5HXyCCyWPc7LGRiO5idg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 7, 2012 at 12:10 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> On Thu, Nov 22, 2012 at 1:35 PM, Gregory Hermant
> <gregory.hermant@calao-systems.com> wrote:
>> Barebox creates a symlink to the binary. This symlink points to
>> the barebox.bin or to the compressed zbarebox.bin binary.
>>
>> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
>> ---
>>  boot/barebox/barebox.mk |    6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
>> index a025d5f..6cc4976 100644
>> --- a/boot/barebox/barebox.mk
>> +++ b/boot/barebox/barebox.mk
>> @@ -72,7 +72,11 @@ define BAREBOX_BUILD_CMDS
>>  endef
>>
>>  define BAREBOX_INSTALL_IMAGES_CMDS
>> -       cp $(@D)/barebox.bin $(BINARIES_DIR)
>> +       if test -h $(@D)/barebox-flash-image ; then \
>> +               cp -L $(@D)/barebox-flash-image $(BINARIES_DIR)/barebox.bin ; \
>> +       else \
>> +               cp $(@D)/barebox.bin $(BINARIES_DIR);\
>> +       fi
>>  endef
>>
>>  ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> Tested-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Acked-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Tested-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Thanks
--
Fabio Porcedda
