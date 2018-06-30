From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 30 Jun 2018 20:30:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-06-29
In-Reply-To: <20180630060034.AFC6220A33@mail.bootlin.com>
References: <20180630060034.AFC6220A33@mail.bootlin.com>
Message-ID: <f38c57af-44a3-2766-2512-1f0e9f4f4f98@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 30/06/2018 ? 08:00, Thomas Petazzoni a ?crit?:
> Hello,
> 
> Build statistics for 2018-06-29
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  19 |   2 |   0 |  21 |
>    2018.05.x |  16 |   1 |   0 |  17 |
>       master | 141 |  44 |   0 | 185 |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                host-llvm-6.0.0 | 2 
> 
> Detail of failures
> ------------------
> 
>          arm |                host-llvm-6.0.0 | NOK | http://autobuild.buildroot.net/results/84222a111d7a4cecb14f9fb280ff5763d61ed592 |     
>       x86_64 |                host-llvm-6.0.0 | NOK | http://autobuild.buildroot.net/results/d9265c7a1f9d6568d0a187dc52a08168e1954c91 |     

It seems that gcc 8.1.1 from the host (ArchLinux) is buggy, there is no such
error with a Fedora 28 with gcc 8 installed.

1)
/usr/include/c++/8.1.1/type_traits:1054:12: internal compiler error:
Segmentation fault
     struct is_nothrow_move_constructible
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Please submit a full bug report,
with preprocessed source if appropriate.
See <https://bugs.archlinux.org/> for instructions.

2)

/home/joseph/buildroot-test/instance-13/output/build/host-llvm-6.0.0/include/llvm/ADT/MapVector.h:104:3:
internal compiler error: Segmentation fault
   }
   ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <https://bugs.archlinux.org/> for instructions.

Best regards,
Romain
