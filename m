From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Nov 2019 23:15:39 +0100
Subject: [Buildroot] [PATCH v3] package/rcw: add option to generate the
 RCW
In-Reply-To: <20190803210052.6240-1-arnout@mind.be>
References: <20190803210052.6240-1-arnout@mind.be>
Message-ID: <20191112231539.61a328d1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  3 Aug 2019 23:00:52 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> From: Jared Bents <jared.bents@rockwellcollins.com>
> 
> When the rcw tools is built, it is probably to generate the RCW (Reset
> Configuration Word) of the target. So it makes sense to do this directly
> in the Buildroot infra and install it in the images directory, just like
> we do for e.g. device tree blobs.
> 
> Add an option BR2_PACKAGE_HOST_RCW_CUSTOM_PATH that allows to specify
> the source for the RCW. And while we're at it, make it possible to
> specify multiple .rcw and .rcwi files, just like for device trees.
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> [Arnout:
>   * Reword help text and commit message
>   * Remove definition of RCW_DELIVERY_FILE
>   * Define and use RCW_FILES
>   * Enclose everything in ifneq($(RCW_FILES),)
>   * Enclose error in ifeq($(BR_BUILDING),y)
>   * Add actual error message
>   * Don't limit to only %.rcwi files
>   * Don't delete *.bin
> ]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Note to Jared: if you follow my suggestion of not copying things, then
> most of my changes become irrelevant, so you can remove the piece
> between square brackets above.

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
