From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 16:33:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/patchelf: Pull in upstream
 bugfixes
In-Reply-To: <20201005185034.37131-1-conrad.ratschan@rockwellcollins.com>
References: <20201005185034.37131-1-conrad.ratschan@rockwellcollins.com>
Message-ID: <20201006163354.4c6ea501@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  5 Oct 2020 13:50:34 -0500
Conrad Ratschan <conrad.ratschan@rockwellcollins.com> wrote:

> On Buildroot 2020.02.6 when building iputils for powerpc with
> BR2_PIC_PIE enabled, the arping/rdisc/tftpd binaries will segfault at
> runtime. This can be traced back to a few bugs in patchelf corrupting
> the ELFs when resizing the RPATH to replace "$ORIGIN/" with "/usr/sbin".
> 
> This patch pulls in upstream fixes to prevent the binaries from being
> needlessly inflated, prevent the startPage from always being adjusted,
> fix a few minor bugs, and fix incorrect endianness handling.
> 
> Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>

So the idea of backporting all those changes for patchelf 0.9 instead
of bumping to patchelf 0.12 is to minimize the changes for Buildroot's
LTS 2020.02.x branch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
