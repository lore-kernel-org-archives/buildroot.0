From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 22:54:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: fix CVE-2020-15900
In-Reply-To: <20200810091441.508401-1-fontaine.fabrice@gmail.com>
References: <20200810091441.508401-1-fontaine.fabrice@gmail.com>
Message-ID: <20200813225410.2d57c598@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Aug 2020 11:14:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> A memory corruption issue was found in Artifex Ghostscript 9.50 and
> 9.52. Use of a non-standard PostScript operator can allow overriding of
> file access controls. The 'rsearch' calculation for the 'post' size
> resulted in a size that was too large, and could underflow to max
> uint32_t. This was fixed in commit
> 5d499272b95a6b890a1397e11d20937de000d31b.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...emory-Corruption-in-Ghostscript-9-52.patch | 54 +++++++++++++++++++
>  package/ghostscript/ghostscript.mk            |  3 ++
>  2 files changed, 57 insertions(+)
>  create mode 100644 package/ghostscript/0002-Bug-702582-CVE-2020-15900-Memory-Corruption-in-Ghostscript-9-52.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
