From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 21:19:36 +0200
Subject: [Buildroot] [PATCH] package/oprofile: fix build with binutils
 >= 2.34
In-Reply-To: <20200325062634.1780288-1-thomas.petazzoni@bootlin.com>
References: <20200325062634.1780288-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200329211936.28bc7e9a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 Mar 2020 07:26:34 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The libbfd library provided by binutils unfortunately changed its API
> in binutils >= 2.34. This is causing some build failures at the moment
> on architectures such as ARC that are using a very recent binutils
> version, but it would also cause build failures on other architectures
> once they start using binutils 2.34.
> 
> We fix this build issue by backporting an upstream oprofile
> patch. However, this patch touches configure.ac, which means we need
> to autoreconf, which needs another fix in configure.ac for autoreconf
> to succeed.
> 
> With all that in place, this commit fixes:
> 
>   http://autobuild.buildroot.net/results/583d281c6cd2aecb65556080b379db24101ae3a8/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...d-foreign-option-to-AM_INIT_AUTOMAKE.patch |  36 ++++
>  ...o-handle-the-binutils-2.34-api-chang.patch | 169 ++++++++++++++++++
>  package/oprofile/oprofile.mk                  |   3 +
>  3 files changed, 208 insertions(+)
>  create mode 100644 package/oprofile/0002-configure.ac-add-foreign-option-to-AM_INIT_AUTOMAKE.patch
>  create mode 100644 package/oprofile/0003-Macro-wrappers-to-handle-the-binutils-2.34-api-chang.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
