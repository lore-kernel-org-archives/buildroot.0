From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:56:16 +0100
Subject: [Buildroot] [PATCH 1/1] support/scripts/genimage.sh: allow
 setting rootpath from parameters.
In-Reply-To: <20190903120951.3318-1-raphael.melotte@essensium.com>
References: <20190903120951.3318-1-raphael.melotte@essensium.com>
Message-ID: <20200106215616.483b5fba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Rapha?l,

On Tue,  3 Sep 2019 14:09:51 +0200
raphael.melotte at essensium.com wrote:

> From: Rapha?l M?lotte <raphael.melotte@essensium.com>
> 
> Previously the rootpath was always set to $TARGET_DIR.
> This patch allows using other directories as rootpath.
> 
> When you use genimage's mountpoints to generate an image with
> multiple (non-empty) partitions, it does two things:
> - copy $TARGET_DIR to $GENIMAGE_TMP/root
> - move any mountpoint from GENIMAGE_TMP/root to $GENIMAGE_TMP/<mountpoint>

The feedback on your patch was mostly negative. In addition, in the
mean time, commit 31d1fb27b0e62a6542112a7476ff188f2f7b8d38 was made,
which ensures --rootpath points to an empty directory, solving one of
the issues pointed out by your patch.

For other use-cases, a custom call to genimage is preferred, the
support/scripts/genimage.sh is not meant to be a full-featured
replacement to calling genimage directly.

So I've marked your patch as Rejected in our patch tracking system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
