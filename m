From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Jun 2021 22:54:11 +0200
Subject: [Buildroot] [PATCH 04/15] package/pkg-generic.mk: Fix .la files
 overwrite detection
In-Reply-To: <20210621141130.48654-5-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-5-herve.codina@bootlin.com>
Message-ID: <20210621225411.1c5280f0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Jun 2021 16:11:19 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> During per-package build, original .la files are modified by
> fixup-libtool-files calls.
> But since fixup-libtool-files modifies files using sed --in-place,
> these modification are done using a temporary file and a call to
> rename. Rename breaks the hardlink to the original file and leave the
> temporary file in per-package TARGET dir.
> As the original file is not modified, this is no longer considered as
> an overwrite.
> 
> To fix this detection, this patch simply considers the what is done

"the what" -> "that what"

> by fixup-libtool-files is part of the original snapshot used to
> detect overwrites. And so, the original snapshot is taken after
> fixup-libtool-files call.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

With that:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
