From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 23:38:52 +0200
Subject: [Buildroot] [PATCH] libtool: use a different way to avoid
 autoreconfiguration
In-Reply-To: <1395270180-12701-1-git-send-email-arnout@mind.be>
References: <1395270180-12701-1-git-send-email-arnout@mind.be>
Message-ID: <20140417233852.3882fe94@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Thu, 20 Mar 2014 00:03:00 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> In 4268d39, a patch was added to update libtool.m4 for MIPS n64 targets.
> However, this caused the configure script to be regenerated during the
> build steps, which in turn caused build failures on Fedora 12 hosts. In
> ed73d1d, this was fixed by patching the installed libtool.m4 file
> instead of the source file.
> 
> However, ed73d1d did not take into account that the target libtool will
> also install libtool.m4 to staging, and that that version has
> precedence over the one in HOST_DIR.
> 
> Therefore, this patch takes a different approach: the source file is
> patched in the usual way, and instead the reconfigure is avoided by
> touching the generated files.
> 
> On the target, we also cannot use the AUTORECONF mechanism because of
> some mysterious Makefile.inc file. So just use the same approach and
> wait for upstream to make a new release.
> 
> Fixes:
>    http://autobuild.buildroot.net/results/b86/b86a83c6549004f226e7255242e54ef4e50c5ec3/
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied, thanks.

Can you let me know if this patch was superseds
http://patchwork.ozlabs.org/patch/331090/ ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
