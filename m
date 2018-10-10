From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:47:41 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-waf: add support for <pkg>_SUBDIR
In-Reply-To: <CAKAx1cj8sSdbR6_NJu=tiHB=EPO_bjb571k4Yu5rVo_g5h66dw@mail.gmail.com>
References: <CAKAx1cj8sSdbR6_NJu=tiHB=EPO_bjb571k4Yu5rVo_g5h66dw@mail.gmail.com>
Message-ID: <20181010214741.6ff1f7ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lionel,

Thanks for your patch, sorry for the slow reply. See some feedback
below.

On Wed, 19 Sep 2018 15:31:40 +0200, Lionel Orry wrote:
> In the Buildroot manual, it is specified that the Waf-based
> infrastructure supports the <pkg>_SUBDIR variable, which was not true.
> 
> This patch makes use of this variable by changing to the given
> sub-directory before executing waf commands.
> 
> Signed-off-by: Lionel Orry <lionel.orry@gmail.com>

First, could you update the Buildroot manual to document this new
variable of the waf package infrastructure ?

> +$(2)_SRCDIR            = $$($(2)_DIR)/$$($(2)_SUBDIR)

Could you try after dropping this line? In fact the generic package
infrastructure already defines <pkg>_SRCDIR as <pkg>_DIR/<pkg>_SUBDIR,
so it shouldn't be needed to replicate that here.

And bonus point if you submit another patch that drops those redundant
lines from pkg-cmake, pkg-meson and pkg-python, of course after testing
that it still works fine :)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
