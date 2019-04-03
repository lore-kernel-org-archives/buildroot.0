From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 21:38:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/quota: fix build on m68k
In-Reply-To: <20190402171835.26696-1-fontaine.fabrice@gmail.com>
References: <20190402171835.26696-1-fontaine.fabrice@gmail.com>
Message-ID: <20190403213848.3cf9a7b8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  2 Apr 2019 19:18:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> PIE breaks the build on m68k, so add an upstream patch to disable PIE.
> Obviously, when we start seriously testing the BR2_RELRO_FULL option, we
> will realize that it is broken on some architectures, and will probably
> disable it on m68k.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/25985bbc160e3d62b23c4c613b2a81f3711621e3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-configure.ac-add-disable-pie-option.patch | 55 ++++++++++++++++++++++
>  package/quota/quota.mk                             |  1 +
>  2 files changed, 56 insertions(+)
>  create mode 100644 package/quota/0001-configure.ac-add-disable-pie-option.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
