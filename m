From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Wed, 18 Mar 2015 19:05:28 -0400 (EDT)
Subject: [Buildroot] [PATCH 2/5] board/raspberrypi: install Device Tree
In-Reply-To: <20150318224438.GB4578@free.fr>
References: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1426632719-4807-3-git-send-email-vivien.didelot@savoirfairelinux.com>
 <20150318224438.GB4578@free.fr>
Message-ID: <1106715418.1139219.1426719928308.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> > Add a post-image script to Raspberry Pi configs with a Device Tree
> > (raspberrypi_dt and raspberrypi2), which calls the mkknlimg tool on the
> > resulting zImage kernel, in order to install the Device Tree as
> > described in the board readme file.
> 
> No, it is not "installing" the device tree. It merely appends a marker
> at the end of the kernel image.
> 
> That marker instructs the RPi bootloader that the kernel is Device Tree
> aware, and thus the bootloader will load the device tree blobs; if the
> marker is missing, the bootloader will not load a device tree blob, and
> will pass ATAGS.

Indeed, I misunderstood the statement from the readme file. Depending on
how this patchset goes, I'll add this comment to the post-image script
in a follow-up patch or in a new version.

Thanks for the explanation,
-v
