From: Michael Nosthoff <buildroot@heine.tech>
Date: Sun, 13 Sep 2020 12:03:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/re2: needs threads
In-Reply-To: <20200912170420.325240-1-fontaine.fabrice@gmail.com>
References: <20200912170420.325240-1-fontaine.fabrice@gmail.com>
Message-ID: <19c58f3e-bccd-b129-f3de-e3878864284a@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On 12.09.20 19:04, Fabrice Fontaine wrote:
> re2 unconditionally uses -pthread and add it to re2.pc
>
> Moreover, it fails to buid without threads on:
>
> In file included from /home/peko/autobuild/instance-0/output-1/per-package/re2/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabihf/include/c++/8.3.0/arm-buildroot-linux-uclibcgnueabihf/bits/os_defines.h:39,
>                   from /home/peko/autobuild/instance-0/output-1/per-package/re2/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabihf/include/c++/8.3.0/arm-buildroot-linux-uclibcgnueabihf/bits/c++config.h:508,
>                   from /home/peko/autobuild/instance-0/output-1/per-package/re2/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabihf/include/c++/8.3.0/bits/stl_algobase.h:59,
>                   from /home/peko/autobuild/instance-0/output-1/per-package/re2/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabihf/include/c++/8.3.0/memory:62,
>                   from /home/peko/autobuild/instance-0/output-1/build/re2-2020-08-01/re2/filtered_re2.h:24,
>                   from /home/peko/autobuild/instance-0/output-1/build/re2-2020-08-01/re2/filtered_re2.cc:5:
> /home/peko/autobuild/instance-0/output-1/per-package/re2/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/features.h:218:5: warning: #warning requested reentrant code, but thread support was disabled [-Wcpp]
>   #   warning requested reentrant code, but thread support was disabled
>       ^~~~~~~
> In file included from /home/peko/autobuild/instance-0/output-1/build/re2-2020-08-01/re2/prog.h:22,
>                   from /home/peko/autobuild/instance-0/output-1/build/re2-2020-08-01/re2/bitstate.cc:28:
> /home/peko/autobuild/instance-0/output-1/build/re2-2020-08-01/re2/re2.h:768:16: error: 'once_flag' in namespace 'std' does not name a type
>     mutable std::once_flag rprog_once_;
>                  ^~~~~~~~~
> /home/peko/autobuild/instance-0/output-1/build/re2-2020-08-01/re2/re2.h:768:11: note: 'std::once_flag' is defined in header '<mutex>'; did you forget to '#include <mutex>'?
> /home/peko/autobuild/instance-0/output-1/build/re2-2020-08-01/re2/re2.h:218:1:
> +#include <mutex>
>
> Fixes:
>   - http://autobuild.buildroot.org/results/7d7c6dcac3cb8ea6deb753178e85eb1c5c74c8e3

thanks for taking care of this!


Reviewed-by: Michael Nosthoff <buildroot@heine.tech>
