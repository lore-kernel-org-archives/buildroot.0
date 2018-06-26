From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 22:04:47 +0200
Subject: [Buildroot] [PATCH 1/1] patchelf: Add patch to fix relative
 rpath issue on PPC
In-Reply-To: <20180625214407.12687-1-bryce.ferguson@rockwellcollins.com>
References: <20180625214407.12687-1-bryce.ferguson@rockwellcollins.com>
Message-ID: <20180626220447.012c12ed@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jun 2018 16:44:07 -0500, Bryce Ferguson wrote:
> This commit adds a patch to the host package patchelf to fix an
> issue with endianness when the --make-rpath-relative option is
> specified. Currently, patchelf does not take into account the
> architecture of the target ELF when it performs the fixup on the
> RPATH. Thus, if it differs from the host in endianness, the RUNPATH
> field will be invalid. The patch fixes the bug reported here:
> 
> https://bugs.busybox.net/show_bug.cgi?id=11101
> 
> Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
> ---
>  ...LF-endianness-before-writing-new-run.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/patchelf/0004-patchelf-Check-ELF-endianness-before-writing-new-run.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
