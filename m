From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:38:49 +0200
Subject: [Buildroot] [PATCH v2] dvdrw-tools: fix minor()/major() build
 failure due to glibc 2.28
In-Reply-To: <20180908112506.26647-1-giulio.benetti@micronovasrl.com>
References: <20180908112506.26647-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180908153849.23d8a4df@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Sep 2018 13:25:06 +0200, Giulio Benetti wrote:
> glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
> and therefore <sys/sysmacros.h> must be included explicitly when
> major()/minor() are used.
> 
> This commit adds a patch to directly include <sys/sysmacros.h> into
> growisofs.c where minor() and major() macros are used.
> 
> Fixes:
> http://autobuild.buildroot.net/results/763/763879f845ffd43343a7b4d548b1eba991d572bd//
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> Changes V1->V2:
> * remove #include <sys/sysmacros.h> from transport.hxx, it's useless, only
>   growisofs.c needs it.
> 
>  ...ude-sysmacros.h-to-compile-with-newer-gcc.patch | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch
> 
> diff --git a/package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch b/package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch
> new file mode 100644
> index 0000000000..e1b893d0be
> --- /dev/null
> +++ b/package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch
> @@ -0,0 +1,14 @@
> +growisofs.c: include sysmacros.h to compile with newer gcc

The problem has nothing to do with a "newer gcc". I'm not sure why you
got the commit log correct (glibc 2.28 is the reason for the problem),
but not the patch description.

Anyway, I fixed the patch description, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
