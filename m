From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 15:30:40 +0200
Subject: [Buildroot] [PATCH] parted: properly link with libiconv
In-Reply-To: <20171007230611.25347-1-arnout@mind.be>
References: <20171007230611.25347-1-arnout@mind.be>
Message-ID: <20171008153040.5700dfea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 8 Oct 2017 01:06:11 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> parted uses libiconv but doesn't link with it. All the checks are there
> in configure, but the Makefile.am doesn't add it to the link. Add a
> patch to fix this.
> 
> Also add an optional dependency on libiconv, so it is reproducible.
> 
> While we're at it, regenerate the existing patches on top of v3.2, and
> make patch 0003 a properly git formatted one.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: srg.venema at gmail.com
> ---
>  ...rch-linux.c-Compile-without-ENABLE_DEVICE.patch |  8 ++---
>  .../0002-configure.ac-uclinux-is-also-linux.patch  |  4 +--
>  ...Include-fcntl.h-to-get-loff_t-definition.patch} | 19 ++++++++----
>  ...arted-labels-link-with-libiconv-if-needed.patch | 34 ++++++++++++++++++++++
>  package/parted/parted.mk                           |  7 ++++-
>  5 files changed, 60 insertions(+), 12 deletions(-)
>  rename package/parted/{0003-fix-includes-for-musl.patch => 0003-Include-fcntl.h-to-get-loff_t-definition.patch} (36%)
>  create mode 100644 package/parted/0004-libparted-labels-link-with-libiconv-if-needed.patch

Applied to master, thanks. Don't forget to send the patch upstream.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
