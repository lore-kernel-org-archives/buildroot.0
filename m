From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 8 Dec 2015 16:10:20 +0000
Subject: [Buildroot] [PATCH v1] read-edid: bump version to 3.0.2
In-Reply-To: <1449520389-23420-1-git-send-email-ps.report@gmx.net>
References: <1449520389-23420-1-git-send-email-ps.report@gmx.net>
Message-ID: <566700EC.4070000@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On 07/12/15 20:33, Peter Seiderer wrote:
> - update hash
> - change from autotools to cmake package
> - update license info
> - enable get-edid command (i2c build)
> - add patch fixing install error because of missing file COPYING

Out of curiosity, have you reported that problem upstream? I think it
always good to know the upstream status of the patches we add in Buildroot.

> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ grep -E ^READ_EDID_VERSION package/read-edid/read-edid.mk
READ_EDID_VERSION = 3.0.2

$ file output/target/usr/bin/get-edid
output/target/usr/bin/get-edid: ELF 32-bit LSB executable, MIPS, MIPS32
rel2 version 1, dynamically linked, interpreter /lib/ld.so.1, for
GNU/Linux 2.6.32, not stripped

Regards,

Vincent.
