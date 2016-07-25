From: Joel Stanley <joel@jms.id.au>
Date: Mon, 25 Jul 2016 15:50:41 +0930
Subject: [Buildroot] [PATCH] package/pflash: new package
In-Reply-To: <cang6dxeas.ln2@ID-313208.user.individual.net>
References: <1469426487-19558-1-git-send-email-joel@jms.id.au>
 <cang6dxeas.ln2@ID-313208.user.individual.net>
Message-ID: <CACPK8XfyY+DPSkoU78_Yc=tXhhWeukBXeVkXDGKrRNnyEvdApw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 25, 2016 at 3:44 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Hi,
>
> Am Mon, 25 Jul 2016 15:31:27 +0930 schrieb Joel Stanley:
>
>> diff --git a/package/pflash/Config.in b/package/pflash/Config.in
>> new file mode 100644
>> index 000000000000..315989724088
>> --- /dev/null
>> +++ b/package/pflash/Config.in
>> @@ -0,0 +1,6 @@
>> +config BR2_PACKAGE_PFLASH
>> +     bool "pflash"
>> +     depends on BR2_arm || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64
>> +     help
>> +       PNOR Flash reading and writing tool for OpenPower servers. Used for
>> +       firmware upgrades and extracting diagnostic infromation from flash.
>
> please add
>
>          https://github.com/open-power/skiboot
>
> to the help text.

Good idea.

>
>> diff --git a/package/pflash/pflash.mk b/package/pflash/pflash.mk
>> new file mode 100644
>> index 000000000000..ab19ad699866
>> --- /dev/null
>> +++ b/package/pflash/pflash.mk
>> @@ -0,0 +1,32 @@
>> +################################################################################
>> +#
>> +# pflash
>> +#
>> +################################################################################
>> +
>> +PFLASH_VERSION = skiboot-5.2.4
>> +
>
> no newline here.
>
>> +PFLASH_SITE = $(call github,open-power,skiboot,$(PFLASH_VERSION))
>> +PFLASH_INSTALL_STAGING = YES
>
> Do other packages need header files from pflash? If not, it is
> not necessary to install the package to staging.

Thanks for the explanation. We don't install any headers so I can drop this.

Thanks for the review!

Cheers,

Joel

> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
