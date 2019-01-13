From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 14:23:07 +0100
Subject: [Buildroot] [PATCH 1/1] Makefile.in: set -fno-dwarf2-cfi-asm
 for m68k_cf
In-Reply-To: <20190112195039.24984-1-fontaine.fabrice@gmail.com>
References: <20190112195039.24984-1-fontaine.fabrice@gmail.com>
Message-ID: <20190113142307.55b7cd45@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Jan 2019 20:50:39 +0100, Fabrice Fontaine wrote:
> Another package (libsquish) is affected by the
> "Internal error in emit_expr_encoded at dw2gencfi.c:215".
> 
> This error already affects 5 packages and is due to binutils, see:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
> 
> No report has been made to binutils yet however as suggested by Yann
> during review of woff2 workaround
> (https://patchwork.ozlabs.org/patch/911344/), remove the workarounds
> from all these packages and put it in package/Makefile.in
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/77e06c092f4e7804dc166e259b25e779e5f1e83a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/Makefile.in              | 6 ++++++
>  package/berkeleydb/berkeleydb.mk | 7 -------
>  package/kmsxx/kmsxx.mk           | 6 ------
>  package/lcdapi/lcdapi.mk         | 6 ------
>  package/libasplib/libasplib.mk   | 8 --------
>  package/woff2/woff2.mk           | 6 ------
>  6 files changed, 6 insertions(+), 33 deletions(-)

Applied to master, thanks. Let's see if it breaks some packages or
not :)

It would be nice to make a proper bug report to upstream binutils,
though.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
