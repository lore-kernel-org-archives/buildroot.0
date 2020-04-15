From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 22:48:01 +0200
Subject: [Buildroot] [PATCH] package/gnuradio: revert patch 003
 suppression
In-Reply-To: <20200414085154.12044-1-gwenj@trabucayre.com>
References: <20200414085154.12044-1-gwenj@trabucayre.com>
Message-ID: <20200415224801.75b052b3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Apr 2020 10:51:54 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Patch 0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch is applied
> in gnuradio master branch but has not been backported to maint-3.8.
> So this patch can't be supressed.

It's good to point to which specific commit introduced the issue, so I
reworded this to:

    In commit 14476b7fcaf102dcc39b5d4919a4f08660f821de ("package/gnuradio:
    bump to 3.8.1.0"), all gnuradio patches were dropped. However, it
    turns out that the path
    0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch was
    applied in gnuradio master branch but has not been backported to
    maint-3.8.  So this patch can't be supressed as we are using gnuradio
    3.8.1.0.
    

> diff --git a/package/gnuradio/0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch b/package/gnuradio/0003-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch

0003... but it's now the only patch on gnuradio, so I renamed it to
0001.

Applied with this fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
