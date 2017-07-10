From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 13:35:55 +0200
Subject: [Buildroot] [PATCH] board: add support for nanopi-m1-plus
In-Reply-To: <CAA4kGkp6Royw9_xPoRK2Fhg8Qk5MovKUm-XNGbaFegeA31UNDA@mail.gmail.com>
References: <1499364298-8433-1-git-send-email-chakra@openedev.com>
 <20170706212626.0abcaf57@windsurf.lan>
 <CAA4kGkp6Royw9_xPoRK2Fhg8Qk5MovKUm-XNGbaFegeA31UNDA@mail.gmail.com>
Message-ID: <20170710133555.3819183c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Jul 2017 16:58:01 +0530, Chakra D wrote:

> Will add the info about mainline
> 
> > Also, please put this patch in:
> >
> > board/friendlyarm/nanopi-m1-plus/linux/patches/

I was wrong, it should be the opposite:

board/friendlyarm/nanopi-m1-plus/patches/linux/

> > and name it just 0001-<something>.patch (i.e without the linux- prefix).
> >  
> 
> Do we need additional "patches" directory here ? Is this a convention
> we need to follow for adding patches ?

See above. With BR2_GLOBAL_PATCH_DIR, you need one sub-directory per
package. So, you can do:

BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-m1-plus/"

with the Linux patch in board/friendlyarm/nanopi-m1-plus/linux

or you can do:

BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-m1-plus/patches/"

with the Linux patch in board/friendlyarm/nanopi-m1-plus/patches/linux

The latter being the preferred way. See board/beaglebone/ for example.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
