From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 10 Apr 2008 08:31:03 +1000
Subject: [Buildroot] Editing filesystem files
In-Reply-To: <11ea01c89a37$87cb1010$f52f9e86@LPSC0173W>
References: <111801c89984$f480be70$f52f9e86@LPSC0173W>
	<11ea01c89a37$87cb1010$f52f9e86@LPSC0173W>
Message-ID: <20080409223102.GA4582@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 09, 2008 at 01:47:41PM +0200, Guillaume Dargaud wrote:
> Following up on this, when do the files in target/generic/target_skeleton 
> get copied in project_build_powerpc/genepy/root  ?
> 
> It seems to happen the very first time in run make and then never again, no 
> matter what I try (even after make clean).

Yes that's my experience.

> The documentation says:
> "So simply rebuilding the image by running make should propagate any new 
> changes to the image."
> but I just don't see that happening, even if I "rm -rf 
> project_build_powerpc/genepy/root" (only dynamically created files get 
> rebuilt there then).

If you delete the root it should re-copy the target_skeleton, but you
may find that lots of other files don't get reinstalled (particularly
some of the toolchain libraries).

Unfortunately some of the packages don't use files in the root as their
test, but stamp files elsewhere in the build tree. Or they don't depend
on enough files in the root...

With an external toolchain it's safe to delete most of the root I've
found.

Dependencies between files in the root and the target_skeleton would be
preferable. This would detect everything other than file deletions.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
