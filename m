From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 23:28:38 +0100
Subject: [Buildroot] [PATCH 0/6 v3] Detect and fix circular dependencies
 (branch yem/fixes)
In-Reply-To: <cover.1454880734.git.yann.morin.1998@free.fr>
References: <cover.1454880734.git.yann.morin.1998@free.fr>
Message-ID: <20160207232838.6d288eae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  7 Feb 2016 22:34:26 +0100, Yann E. MORIN wrote:

> Yann E. MORIN (6):
>       package/avahi: break circular dependencies

Applied after adding a comment in avahi.mk to explain why we disabled
gtk2/gtk3 support.

>       support/graph-depends: add option to specify output file

Applied after changing the metavar from DOT_FILE to OUT_FILE, in order
to be consistent with the rest of the patch.

>       core: catch failures in graph-depends
>       support/graph-depends: detect circular dependencies
>       support/graph-depends: teach it to only check dependencies
>       core: add a make target to check the dependencies

All applied. To be honest, I only quickly skimmed through the circular
dependency checking function. It seemed reasonable, but I clearly
didn't do a very thorough verification of it.

What about submitting an autobuild-run patch now to make use of this
functionality? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
