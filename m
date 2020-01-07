From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Jan 2020 09:35:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/mmc-utils: fix build with SSP
In-Reply-To: <20200102143800.20983f88@windsurf> (Thomas Petazzoni's message of
 "Thu, 2 Jan 2020 14:38:00 +0100")
References: <20191031110655.1189-1-fontaine.fabrice@gmail.com>
 <20200102143800.20983f88@windsurf>
Message-ID: <87r20bk6kr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Thu, 31 Oct 2019 12:06:55 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> Set AM_CFLAGS to an empty value to avoid the following redefinition
 >> error when building with our custom _FORTIFY_SOURCE:
 >> 
 >> /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/host/bin/mips-linux-gnu-gcc
 >> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 >> -Wall -Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64
 >> -D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 >> -D_FILE_OFFSET_BITS=64 -Os -D_FORTIFY_SOURCE=1
 >> -Wp,-MMD,3rdparty/hmac_sha/.hmac_sha2.o.d,-MT,3rdparty/hmac_sha/hmac_sha2.o
 >> -c 3rdparty/hmac_sha/hmac_sha2.c -o 3rdparty/hmac_sha/hmac_sha2.o
 >> <command-line>:0:0: error: "_FORTIFY_SOURCE" redefined [-Werror]
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/cfef9315441b5f4909b58a6dccd8bea8e67ae992
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/mmc-utils/mmc-utils.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > Applied to master, thanks.

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
