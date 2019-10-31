From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 15:14:58 +0100
Subject: [Buildroot] [PATCH v5,
 1/1] package/libopenssl: set no-asm with generic architectures
In-Reply-To: <20191019122759.529-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 19 Oct 2019 14:27:59 +0200")
References: <20191019122759.529-1-fontaine.fabrice@gmail.com>
Message-ID: <87imo5xaql.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use no-asm when building with generic architectures such as gcc or
 > linux-generic32, see https://github.com/openssl/openssl/issues/9839

 > This will fix a static build failure on x86_64 due to the removal of
 > x86/x86_64 BSAES and AES_ASM support by
 > https://github.com/openssl/openssl/commit/87bea6550ae0dda7c40937cff2e86cc2b0b09491

 > Fixes:
 >  - http://autobuild.buildroot.org/results/e4f04bb13ec1b82b73db645bea4933e52bca4185

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v4 -> v5 (after review of Thomas Petazzoni):
 >  - Reword commit message to remove statically

 > Changes v3 -> v4 (after review of Thomas Petazzoni):
 >  - Fix copy/paste error and remove the second assignation

 > Changes v2 -> v3 (after review of Thomas Petazzoni):
 >  - Set no-asm with linux-generic32

 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Set no-asm with all static builds and not only x86_64

 >  package/libopenssl/libopenssl.mk | 8 ++++++--
 >  1 file changed, 6 insertions(+), 2 deletions(-)

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
