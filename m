From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Tue, 22 Oct 2019 13:24:39 +0000
Subject: [Buildroot] [PATCH] package/ofono: use target ell library if
 enabled
In-Reply-To: <20191022135939.06701cb8@windsurf>
References: <20191022104757.109356-1-nicolas.serafini@sensefly.com>
 <20191022135939.06701cb8@windsurf>
Message-ID: <20191022152437.00000b45@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 22 Oct 2019 13:59:39 +0200 Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

>On Tue, 22 Oct 2019 10:48:31 +0000
>Nicolas Serafini <nicolas.serafini@sensefly.com> wrote:
>
>> Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
>> ---
>>  package/ofono/ofono.mk | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
>> index ce05dfcadf..85e249a233 100644
>> --- a/package/ofono/ofono.mk
>> +++ b/package/ofono/ofono.mk
>> @@ -49,7 +49,9 @@ else
>>  OFONO_CONF_OPTS += --disable-bluetooth
>>  endif
>>  
>> -# required by 0003-build-Add-check-for-explicit_bzero-support.patch
>
>Dropping this comment is correct, because indeed this patch no longer
>exists.
>
>> +ifeq ($(BR2_PACKAGE_ELL),y)
>>  OFONO_AUTORECONF = YES
>
>But why are you keeping AUTORECONF = YES here ?
>
>Also, dropping autoreconf should be in a separate patch.

Yeah, you're absolutely right, I don't know why I left that.

>
>> +OFONO_CONF_OPTS += --enable-external-ell
>
>You forgot:
>
>OFONO_DEPENDENCIES += ell
>else
>OFONO_CONF_OPTS += --disable-external-ell

I'm going to fix it in a new patch.

Thank you for your review.

Nicolas

>
>Thanks,
>
>Thomas
