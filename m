From: =?UTF-8?Q?Vicen=C3=A7?= <vicencb@gmail.com>
Date: Thu, 14 Jan 2016 12:54:40 +0100
Subject: [Buildroot] argp-standalone broken when optimization is enabled
In-Reply-To: <20160114115735.079123f4@free-electrons.com>
References: <CAAMcf8C=SMLHGaz0aYy3A+xDA0fDNkncW5=J6KE-K8X8dYeLsQ@mail.gmail.com>
 <20160114101914.36da8560@free-electrons.com>
 <CAAMcf8AcZzNpGrvfOaGO-EBPZHfyzojNsKusZr2RuEfC9xE+iw@mail.gmail.com>
 <20160114115735.079123f4@free-electrons.com>
Message-ID: <CAAMcf8CKZ+ZFbTgTgdkWGMSiV4Xitnb-PpzsZeOSs800O9ieQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 14, 2016 at 11:57 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Vicen?,
>
> Please keep the Buildroot list in Cc, thanks!
>
> On Thu, 14 Jan 2016 11:26:45 +0100, Vicen? wrote:
>> On Thu, Jan 14, 2016 at 10:19 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> > Vicen?,
>> >
>> > Thanks for your report.
>> >
>> > On Wed, 13 Jan 2016 18:15:37 +0100, Vicen? wrote:
>> >> Hello,
>> >> could this patch be added to buildroot to fix the issue:
>> >>
>> >> https://dev.openwrt.org/browser/trunk/package/libs/argp-standalone/patches/002-no_optimize.patch
>> >
>> > Could you describe more precisely what doesn't work ? The OpenWRT
>> > patch unfortunately doesn't give any details about what it is fixing.
>>
>> Hello Thomas,
>> In the OpenWRT page there is a link to the bug fixed by this patch:
>> https://dev.openwrt.org/ticket/20460
>> The configuration that fails in my case is when this buildroot options
>> are enabled:
>> BR2_OPTIMIZE_3
>> BR2_TOOLCHAIN_EXTERNAL_GCC_5
>> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
>> BR2_PACKAGE_LIBV4L_UTILS
>>
>> The error reported is the same as in OpenWRT.
>> argp is provided with the glibc, but the standalone version is
>> automatically selected when building some packages with musl.
>> So, libc != glibc plus some other specific package triggers the issue.
>
> Thanks for the details. Then I think
> http://review.gluster.org/#/c/6034/ is a better solution than the one
> taken by OpenWRT. Can you try this change ?

Hello Thomas,
I can confirm that
http://review.gluster.org/changes/6034/revisions/b2dfa011a3fdcb7d22764d143517d0fbd1c2a201/patch?zip
works fine.
It just needs to tweak the file paths.
And it is a proper solution, indeed better than just disabling optimizations.

Thanks!
  Vicente.

>
> It originates from https://bugzilla.redhat.com/show_bug.cgi?id=1201898.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
