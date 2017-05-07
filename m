From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 15:38:43 +0200
Subject: [Buildroot] Buildroot defconfig failures
In-Reply-To: <20170507145548.336e29ad@free-electrons.com>
References: <20170507145548.336e29ad@free-electrons.com>
Message-ID: <20170507153843.529dc316@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 May 2017 14:55:48 +0200, Thomas Petazzoni wrote:

>  - All Freescale defconfigs that rely on git.freescale.com are failing
>    with "Connection timed out". I'm also not able to clone from
>    git.freescale.com from my local machine, at least with git://. I'm
>    currently trying with http://. If that works, I'll update the
>    defconfigs accordingly.
> 
>    Fabio, do you have a suggestion?

Cloning from http:// also fails:

>>> linux rel_imx_4.1.15_2.0.0_ga Downloading
Doing shallow clone
Cloning into 'linux-rel_imx_4.1.15_2.0.0_ga'...
fatal: dumb http transport does not support --depth
Shallow clone failed, falling back to doing a full clone
Doing full clone
Cloning into 'linux-rel_imx_4.1.15_2.0.0_ga'...
Checking connectivity... done.
warning: remote HEAD refers to nonexistent ref, unable to checkout.

Could not fetch special ref 'rel_imx_4.1.15_2.0.0_ga'; assuming it is not special.

While the tag rel_imx_4.1.15_2.0.0_ga clearly exists in
http://git.freescale.com/git/cgit.cgi/imx/linux-imx.git/.

Peter: as a temporary fix, could you put
http://git.freescale.com/git/cgit.cgi/imx/linux-imx.git/snapshot/linux-imx-rel_imx_4.1.15_2.0.0_ga.tar.gz
in http://sources.buildroot.net ? Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
