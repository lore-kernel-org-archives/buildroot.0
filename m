From: Julien Boibessot <julien.boibessot@free.fr>
Date: Fri, 24 Feb 2017 15:37:00 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-16
In-Reply-To: <20170217211242.GC3470@free.fr>
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr>
Message-ID: <c5d029d5-f610-6709-852a-b84c7ad6313d@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Yann,
sorry for my late analysis.

On 17/02/2017 22:12, Yann E. MORIN wrote:
> <cut>....
>>          arc |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/89864a1cf0d8b27b3efdf3c36ccb3244e88a6746
>     undefined reference to `dl_iterate_phdr'
>     ld: GOT and PLT relocations cannot be fixed with a non dynamic linker
>
> Static linking issue. Julien B.?

It seems that adding "-static" to final linking command solves the
problem. It's strange that other static builds on other ARCH are working ?
Should I add a ~ "LDGLAGS += -static" in opentyrian.mk ?

Regards,
Julien
