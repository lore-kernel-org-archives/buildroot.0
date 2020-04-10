From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Apr 2020 22:46:11 +0200
Subject: [Buildroot] [PATCH v1] package/assimp: fix musl zlib/zip
 related compile failure
In-Reply-To: <20200410163237.30240-1-ps.report@gmx.net>
References: <20200410163237.30240-1-ps.report@gmx.net>
Message-ID: <20200410224611.1db11073@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Apr 2020 18:32:37 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> As assimp fails to use system provided zlib/zip (and is picky
> about the provided versions) use assimp contributed one
> and backport one part of upstream patch to fix musl compile.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/4b373ae7d8fd40efe3e2592f94f2d769d6a77669
> 
>   In file included from .../assimp-5.0.1/code/3MF/D3MFExporter.cpp:61:
>   .../assimp-5.0.1/contrib/zip/src/zip.h:30:15: error: conflicting declaration 'typedef long int ssize_t'
>    typedef long  ssize_t;  /* byte count or error */
>                  ^~~~~~~
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...ssize_t-typedef-mismatch-for-musl-co.patch | 50 +++++++++++++++++++
>  package/assimp/Config.in                      |  1 -
>  package/assimp/assimp.mk                      |  3 +-
>  3 files changed, 51 insertions(+), 3 deletions(-)
>  create mode 100644 package/assimp/0002-contrib-zip-fix-ssize_t-typedef-mismatch-for-musl-co.patch

I've applied, but it's not really great to be forced to use the
internal zlib. Could you try to work this out with upstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
