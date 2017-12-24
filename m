From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 24 Dec 2017 11:36:33 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-12-23
In-Reply-To: <20171224070010.58DF22070B@mail.free-electrons.com>
References: <20171224070010.58DF22070B@mail.free-electrons.com>
Message-ID: <d5eb5b67-0a7b-0490-d119-e6ffc4a0dae3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 24/12/2017 ? 08:00, Thomas Petazzoni a ?crit?:
> Hello,
> 
> Build statistics for 2017-12-23
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>       master | 228 |  61 |   6 | 295 |
>    2017.08.x |  22 |   3 |   0 |  25 |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>          host-ti-cgt-pru-2.1.4 | 2 
>              libostree-2017.15 | 2 
>                   gqview-2.1.5 | 1 
>               host-erlang-20.0 | 1 
>              host-gauche-0.9.5 | 1 
> host-mfgtools-b219fc219a35c... | 1 
>             liburiparser-0.8.1 | 1 
> make[2]: *** [libtests/buil... | 1 
> make[2]: *** [Makefile:71: ... | 1 

> 
> 
> Detail of failures
> ------------------
>       x86_64 |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/0b6336c3ebb2540fef592c68a26c8f1362e842c9 |     
I'm not able to reproduce this one.

>          arm | host-mfgtools-b219fc219a35c... | NOK | http://autobuild.buildroot.net/results/7c2bbbe13ab315684f3502afd96958a76879b1d5 |     
Fixed by http://patchwork.ozlabs.org/patch/852720/

>          arm |          host-ti-cgt-pru-2.1.4 | TIM | http://autobuild.buildroot.net/results/6458f64954e6622ba6251bead5ee945ca4524adc |     
>          arm |          host-ti-cgt-pru-2.1.4 | TIM | http://autobuild.buildroot.net/results/48200a9b8a79c1b429ae69ccbd71a558accf2007 |     
The TI installer is stuck in a futex(wait) system call.
Bump the version to 2.2.1 should fix the issue.

>    powerpc64 |                   gqview-2.1.5 | TIM |
http://autobuild.buildroot.net/results/b492f6c90ee03c2812694a0f60b89c641e87223a
|
>      powerpc |             liburiparser-0.8.1 | TIM | http://autobuild.buildroot.net/results/e7816d6a15d2a96ca9a401e95955c75d54e7d6da |     
>       x86_64 | make[2]: *** [libtests/buil... | TIM | http://autobuild.buildroot.net/results/fded34f8e5da52737f4c40107e28ad77a223d64b |     
>       x86_64 | make[2]: *** [Makefile:71: ... | TIM | http://autobuild.buildroot.net/results/52f9379d98a1826e1d0faa60ba89a8d5ac09895e |     
The default timeout value seems too short for my autobuilder.

> 
> Results for branch '2017.08.x'
> ==============================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                  host-icu-59.1 | 1 
>                  libcue-v1.4.0 | 1 
>               wireshark-2.2.10 | 1 
> 
> 
> Detail of failures
> ------------------
> 
>         i586 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/a0c0c3c6958ae7aeb5b51a3203f8952ec63b8891 | ORPH

This patch needs to be backported to 2017.08 and maybe 2017.02.
http://patchwork.ozlabs.org/patch/820673/

>          sh4 |                  libcue-v1.4.0 | NOK | http://autobuild.buildroot.net/results/51d585cbf387fb514d04304aa0ea38324a02362e | ORPH
This patch needs to be backported to 2017.08 and 2017.02.
http://patchwork.ozlabs.org/patch/852038/

Best regards,
Romain
