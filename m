From: Hamish Moffatt <hamish@cloud.net.au>
Date: Mon, 8 Sep 2008 23:43:12 +1000
Subject: [Buildroot] Makefile.autotools.in stamp files breaks
	multiple	projects
In-Reply-To: <20080908153954.5ad16cc0@atmel.com>
References: <20080904025034.GA18148@cloud.net.au>
	<20080905043047.GA25440@cloud.net.au>
	<20080908153954.5ad16cc0@atmel.com>
Message-ID: <20080908134312.GA11819@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 08, 2008 at 03:39:54PM +0200, Hans-Christian Egtvedt wrote:
> On Fri, 5 Sep 2008 14:30:47 +1000
> Hamish Moffatt <hamish@cloud.net.au> wrote:
> 
> > On Thu, Sep 04, 2008 at 12:50:35PM +1000, Hamish Moffatt wrote:
> > > 2. The .stamp_install files could be put somewhere under
> > > $(TARGET_DIR) instead of $(BUILD_DIR); they'd need to be stripped
> > > out by the various generators in target/.. though.
> > 
> > Here's my patch to move the target-installed and post-install-hook
> > stamps to $(PROJECT_BUILD_DIR)/.stamp/$(PKG)_xyz instead of
> > $(BUILD_DIR)/$(PKG)/.stamp_xyz, so that these actions will be repeated
> > for each project.
> > 
> > Any comments before I commit it?
> > 
> 
> I think it sounds nice, I did not look into the patch in detail but the
> solution seems good. The stamp directory could even be visible IMHO.

That's true, I might rename it to $(PROJECT_BUILD_DIR)/autotools-stamps.

Thanks for your feedback. I'll commit tomorrow.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
