From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 4 Jul 2016 15:45:56 +0200
Subject: [Buildroot] [PATCH v2 1/1] acpica: new package
In-Reply-To: <abb8c8a9-0bca-a441-b2bf-2c5f419e0d72@gmail.com>
References: <20160703104535.10401-1-nunes.erico@gmail.com>
 <abb8c8a9-0bca-a441-b2bf-2c5f419e0d72@gmail.com>
Message-ID: <CAK4VdL0dXyheLx2LJusbfdJRD+3yYuEi7-E-cGruvB1178tKVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Jul 3, 2016 at 3:45 PM, Romain Naour <romain.naour@gmail.com> wrote:
> Thanks to TARGET_CONFIGURE_OPTS, CC="$(TARGET_CC) should be removed...
> But indeed if we do that it will use host compiler.
>
> To fix that we need to patch generate/unix/Makefile.config
> -CC =    gcc
> +CC ?=    gcc

Thanks for re-reviewing!
Yes indeed as the package resets CC in the Makefile, setting it in the
environment via TARGET_CONFIGURE_OPTS won't be enough (I tried to
explain that in the changelog after the commit message).
In my opinion (agreeing with Arnout), in this case it is less bloaty
to just pass it again in the arguments, rather than patching the
package.

On Mon, Jul 4, 2016 at 3:33 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Sun, 2016-07-03 at 12:45 +0200, Erico Nunes wrote:
>> The ACPI Component Architecture (ACPICA) project provides an operating
>> system (OS)-independent reference implementation of the Advanced
>> Configuration and Power Interface Specification (ACPI).
>>
>> It contains tools such as acpidump, iasl, acpixtract, etc.
>
> Thank you for doing this!
> Though in our case we need this as a host tool. Can you add support into
> next version of the patch?

Hi Andy.

Thank you for the feedback!
I think, though, that we would need to have some other target
Buildroot target package depending on a host version of this one, in
order to have it accepted with a host version. Otherwise it is an
orphan host package. Or do we have a strong reason to have it enabled
as a host package of its own (maybe adding a Config.in.host in this
case)?

Erico
