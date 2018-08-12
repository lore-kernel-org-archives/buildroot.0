From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 17:03:31 +0200
Subject: [Buildroot] Bump ATF version in arm_juno_defconfig ?
In-Reply-To: <b3321ee8-8265-e448-21fe-1b722cbb68ef@synopsys.com>
References: <20180423221713.275f1f66@windsurf>
 <b3321ee8-8265-e448-21fe-1b722cbb68ef@synopsys.com>
Message-ID: <20180812170331.2dc2b9e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 May 2018 17:52:07 +0100, Joao Pinto wrote:

> > You originally contributed the arm_juno_defconfig in Buildroot. It
> > currently uses v1.2 of ATF, and I encountered a build failure with this
> > ATF version as part of the Buildroot test suite:
> > 
> >     ./build/juno/release/bl1/context_mgmt.o: In function `cm_prepare_el3_exit':
> >     context_mgmt.c:(.text.cm_prepare_el3_exit+0x54): undefined reference to `cm_set_next_context'
> >     context_mgmt.c:(.text.cm_prepare_el3_exit+0x54): relocation truncated to fit: R_AARCH64_JUMP26 against undefined symbol `cm_set_next_context'
> > 
> > This issue has been fixed since ATF v1.3. Do you think you could
> > provide a patch bumping the ATF version ? The latest version is ATF
> > v1.5, so if you could bump the defconfig, it would be nice.
> > 
> > In addition, it would be great if you could send a patch adding
> > yourself in the DEVELOPERS file for this platform, so we easily know who
> > to contact for questions related to this platform.
> 
> My team member Gustavo will check this out and he will be the maintainer if it
> is ok for you.

Following this discussion, Gustavo never sent any patch to fix
arm_juno_defconfig, and the ATF build broken was still broken as of
today. So I went ahead, and bumped the ATF version to 1.3, to at least
fix the build issue.

It would be nice if you could give it a test on the actual hardware,
and perhaps bump ATF to an ever newer version.

See
https://git.buildroot.org/buildroot/commit/?id=395bc11dde5b4ef034118a9be568131f134daaa3
for details.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
