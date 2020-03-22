From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 22:34:58 +0100
Subject: [Buildroot] [PATCH v1] package/php: fix aarch64 uclibc-ng
 compile
In-Reply-To: <20200309145038.18093-1-ps.report@gmx.net>
References: <20200309145038.18093-1-ps.report@gmx.net>
Message-ID: <20200322223458.72d67b97@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  9 Mar 2020 15:50:38 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> The aarch64 compile uses the sys/auxv.h header which is not
> provided by ulcibc-ng. Add configure.ac patch to check for
> the header before using it in ext/standard/crc32.c.
> 
> Fixes:
> 
>   https://bugs.busybox.net/show_bug.cgi?id=12626
> 
>   build/php-7.4.3/ext/standard/crc32.c:26:12: schwerwiegender Fehler: sys/auxv.h: Datei oder Verzeichnis nicht gefunden
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...Check-for-sys-auxv.h-before-using-it.patch | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/php/0005-Check-for-sys-auxv.h-before-using-it.patch

Applied to master, thanks. I've added a reference to the upstream
commit, since it has now been merged upstream.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
