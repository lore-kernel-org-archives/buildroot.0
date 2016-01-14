From: =?UTF-8?Q?Vicen=C3=A7?= <vicencb@gmail.com>
Date: Thu, 14 Jan 2016 11:49:40 +0100
Subject: [Buildroot] argp-standalone broken when optimization is enabled
In-Reply-To: <20160114101914.36da8560@free-electrons.com>
References: <CAAMcf8C=SMLHGaz0aYy3A+xDA0fDNkncW5=J6KE-K8X8dYeLsQ@mail.gmail.com>
 <20160114101914.36da8560@free-electrons.com>
Message-ID: <CAAMcf8A=g3W+RAPrwQNeRsVYRV0_Y+NqaRM+NbeDD7zXGwVfmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 14, 2016 at 10:19 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Vicen?,
>
> Thanks for your report.
>
> On Wed, 13 Jan 2016 18:15:37 +0100, Vicen? wrote:
>> Hello,
>> could this patch be added to buildroot to fix the issue:
>>
>> https://dev.openwrt.org/browser/trunk/package/libs/argp-standalone/patches/002-no_optimize.patch
>
> Could you describe more precisely what doesn't work ? The OpenWRT
> patch unfortunately doesn't give any details about what it is fixing.

Hello Thomas,
In the OpenWRT page there is a link to the bug fixed by this patch:
https://dev.openwrt.org/ticket/20460
The configuration that fails in my case is when this buildroot options
are enabled:
BR2_OPTIMIZE_3
BR2_TOOLCHAIN_EXTERNAL_GCC_5
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
BR2_PACKAGE_LIBV4L_UTILS

The error reported is the same as in OpenWRT.
argp is provided with the glibc, but the standalone version is
automatically selected when building some packages with musl.
So, libc != glibc plus some other specific package triggers the issue.

Hope this helps.
Thanks,
  Vicente.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
