From: Lionel Orry <lionel.orry@gmail.com>
Date: Fri, 4 Apr 2014 07:46:02 +0200
Subject: [Buildroot] new package not built, AR prefix not passed to make
In-Reply-To: <2059325585.268239.1396548704994.JavaMail.root@mail>
References: <CAKAx1ci6nKBQH66UEpBdxDmtSPTpRf3HhPMbgrgCAKt5v3DU1w@mail.gmail.com>
 <2059325585.268239.1396548704994.JavaMail.root@mail>
Message-ID: <CAKAx1cgicTecQtCh8Uu5+yiy6gnzU0aDj3H_GGZYF2Don4EcuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 3, 2014 at 8:11 PM, ?meric Vigier
<emeric.vigier@savoirfairelinux.com> wrote:
> Hi Lionel,
>
> ----- Mail original -----
>> Hi Emeric,
>>
>> On Thu, Apr 3, 2014 at 5:32 PM, ?meric Vigier
>> <emeric.vigier@savoirfairelinux.com> wrote:
>> > Hi Builders,
>> >
>> > I am facing two basic issues after adding a new library to
>> > buildroot:
>> >
>> > 1. "make" does not build it
>> > ---------------------------
>> > What I did can be summed up in these files:
>> >
>> >   $ grep company package/Config.in
>> >   source "package/company/Config.in"
>> >
>> >   $ cat package/company/libfpga/Config.in
>> >   config BR2_PACKAGE_COMPANY_LIBFPGA
>> >         bool "libfpga"
>> >         select BR2_TOOLCHAIN_USES_GLIBC
>> >         help
>> >           library providing access to FPGA functions
>> >
>>
>> Don't you also need a package/company/Config.in then, with the
>> following content :
>>
>> menu "Company-specific packages"
>> source "package/company/libfpga/Config.in"
>> endmenu
>>
>> ?
>
> I forgot to dump it in my email, but I wrote it as follows:
>
>   $ cat package/company/Config.in
>   menuconfig BR2_PACKAGE_COMPANY
>         bool "Company Library and embedded tools"
>         help
>           Company Library and embedded tools
>
>   if BR2_PACKAGE_COMPANY
>   source "package/company/libfpga/Config.in"
>   endif # BR2_PACKAGE_COMPANY
>
> I also tried with your syntax, no luck.
> My Config.in are sane I believe. I can see all the required options in menuconfig
> And they end up in .config correctly.
>
> Regards,
> Emeric

You may also want to check if the libfpga buld folder already exists,
and stamps in it, in doubt you can try

rm -r output/build/libfpga-1.0

Cheers
