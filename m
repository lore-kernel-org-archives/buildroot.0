From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 14:50:46 +0200
Subject: [Buildroot] [PATCH 1/3] package/libcamera: Prevent builds on
 m68k
In-Reply-To: <20200904095148.844292-2-kieran.bingham@ideasonboard.com>
References: <20200904095148.844292-1-kieran.bingham@ideasonboard.com>
 <20200904095148.844292-2-kieran.bingham@ideasonboard.com>
Message-ID: <20200904145046.46cbb14c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  4 Sep 2020 10:51:45 +0100
Kieran Bingham <kieran.bingham@ideasonboard.com> wrote:

> The ControlValue structure is currently defined with a 16-bit hole
> (causing unaligned access to the numElements_ field, though that's a
> separate topic).
> 
> This structure has a static assertion to ensure that its size does not
> change without due care, as it forms part of our ABI and is used in
> Serialisation between the pipeline handlers and IPA componenents.
> 
> The m68k architecture is the only target which fails this assertion,
> which is likely because it can pack the structure more efficiently,
> producing a different binary size.
> 
> This is likely an area we will tackle before stabilising our ABI, but
> until then, disable m68k builds as libcamera is not expected to be
> supported on this target.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

We normally ask to have an autobuilder failure reference here. No need
to resend just for that, we can add it when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
