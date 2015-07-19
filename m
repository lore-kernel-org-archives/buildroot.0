From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 11:53:52 +0200
Subject: [Buildroot] [PATCH 2/2 v2] pkg-infra: munging .la files is not
 limited to autotools packages
In-Reply-To: <2498f2352f5b65d77d91f6405d39e6349de640dc.1430687963.git.yann.morin.1998@free.fr>
References: <cover.1430687963.git.yann.morin.1998@free.fr>
 <2498f2352f5b65d77d91f6405d39e6349de640dc.1430687963.git.yann.morin.1998@free.fr>
Message-ID: <20150719115352.7d513f34@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  3 May 2015 23:30:39 +0200, Yann E. MORIN wrote:
> Currently, we're only fixing libtool's .la files for autotools packages,
> and even more so, only for those that do not define their own
> _INSTALL_STAGING_CMDS.
> 
> However, .la files might also be installed by non-autotools packages,
> like the NVidia GPU binary blob (libGL.la).
> 
> So, move that code into the global build rule, so all packages get their
> .la files fixed, whether they be autotools packages or not, and whether
> they define their own _INSTALL_STAGING_CMDS or not.
> 
> Also print a message.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  package/pkg-autotools.mk | 27 ---------------------------
>  package/pkg-generic.mk   | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+), 27 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
