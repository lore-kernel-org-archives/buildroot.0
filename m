From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Sat, 19 Apr 2014 12:49:30 +0200
Subject: [Buildroot] [PATCH 1/1] libsoxr: new package
In-Reply-To: <20140419095242.4f405cdd@skate>
References: <1397867553-7107-1-git-send-email-hadrien.boutteville@gmail.com>
 <20140419095242.4f405cdd@skate>
Message-ID: <535254BA.9060004@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 19 Apr 2014 09:52:42 +0200, Thomas Petazzoni wrote:
> Really no toolchain dependencies? Can you test this package with the
> following toolchain configurations:
> 
>  http://autobuild.buildroot.org/toolchains/configs/free-electrons/bfin-linux-uclibc.config
>   -> this one tests !MMU
> 
>  http://autobuild.buildroot.org/toolchains/configs/free-electrons/bfin-uclinux.config
>   -> this one tests !MMU and static library only
> 
>  http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-full-nothread.config
>   -> this one tests the absence of thread support
> 
>  http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-basic.config
>   -> and this one tests a minimal toolchain
> 

I packaged it with minimal toolchain configuration and checked for these
cases, it built fine. I rebuilt with your configurations and it is
always good.

At first glance the threads references in the code depend on OpenMP, and
I disabled it.

I don't have time today to test the execution with static library and no
thread, I just tested with a standard ARM configuration.

>> diff --git a/package/libsoxr/libsoxr.mk b/package/libsoxr/libsoxr.mk
>> new file mode 100644
>> index 0000000..c0fb72b
>> --- /dev/null
>> +++ b/package/libsoxr/libsoxr.mk
>> @@ -0,0 +1,24 @@
>> +################################################################################
>> +#
>> +# libsoxr
>> +#
>> +################################################################################
>> +
>> +LIBSOXR_VERSION = 0.1.1
>> +LIBSOXR_SITE = git://git.code.sf.net/p/soxr/code
> 
> The project apparently provides a tarball. Could you use the tarball
> instead of the Git repository?

OK. Is it better to always use the tarball if available?

>> +LIBSOXR_LICENSE = LGPLv2.1
> 
> According to the LICENSE file, the license is LGPLv2.1+

Corrected, thanks !

Regards,

Hadrien
