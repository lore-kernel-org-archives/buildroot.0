From: Jan Heylen <heyleke@gmail.com>
Date: Fri, 5 Jan 2018 13:57:36 +0100
Subject: [Buildroot] [PATCH v4 2/2] opentracing-cpp: new package
In-Reply-To: <20180103214052.7e2e5499@windsurf.lan>
References: <1515010165-25315-1-git-send-email-heyleke@gmail.com>
 <1515010165-25315-3-git-send-email-heyleke@gmail.com>
 <20180103214052.7e2e5499@windsurf.lan>
Message-ID: <CAGszK3hp_CMYoO2nqmKx+nzwnss_tVm6LzqEE_85tmhTWDcVmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Jan 3, 2018 at 9:40 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed,  3 Jan 2018 21:09:25 +0100, Jan Heylen wrote:
>
>> diff --git a/package/opentracing-cpp/Config.in b/package/opentracing-cpp/Config.in
>> new file mode 100644
>> index 0000000..f13d21b
>> --- /dev/null
>> +++ b/package/opentracing-cpp/Config.in
>> @@ -0,0 +1,16 @@
>> +config BR2_PACKAGE_OPENTRACING_CPP
>> +     bool "opentracing-cpp"
>> +     depends on BR2_INSTALL_LIBSTDCPP
>> +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>> +     depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
>> +     depends on !BR2_m68k_cf # exception_ptr
>
> So exception_ptr is not available on m68k coldfire, regardless of the
> gcc version ?
>
> If so, we perhaps want to introduce something like:
>
> config BR2_TOOLCHAIN_HAS_EXECPTION_PTR
>         bool
>         default y
>         depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
>         depends on !BR2_m68k_cf
>
> but please confirm first that there really is something special about
> m68k coldfire.

Done by experiment, in V6 added BR2_m68k_cf to
BR2_TOOLCHAIN_HAS_GCC_BUG_64735. See V6 op this patchset.

>
>> +     help
>> +       OpenTracing API for C++
>> +
>> +       http://opentracing.io
>> +
>> +comment "opentracing-cpp needs a toolchain w/ C++11"
>
> This should be:
>
>         opentracing-cpp needs a toolchain w/ C++, gcc >= 4.8"

Done in V6.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
