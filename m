From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Jan 2017 09:22:11 +0100
Subject: [Buildroot] [PATCH] libmad: disable ASO support for thumb-only
	ARM cores
In-Reply-To: <20170108043713.4enoz63hnwtzt7sh@tarshish> (Baruch Siach's
 message of "Sun, 8 Jan 2017 06:37:13 +0200")
References: <20170107231126.2321-1-peter@korsgaard.com>
 <20170108043713.4enoz63hnwtzt7sh@tarshish>
Message-ID: <87eg0ermfg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Sun, Jan 08, 2017 at 12:11:26AM +0100, Peter Korsgaard wrote:
 >> Fixes:
 >> http://autobuild.buildroot.net/results/8d4/8d4ea8613487297f2c33f3b9cbd8903cfb96e4c6/
 >> 
 >> The ARM specific optimizations enabled by LIBMAD_ASO needs classic ARM
 >> instructions support, so disable for thumb-only cores.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/libmad/Config.in | 3 ++-
 >> 1 file changed, 2 insertions(+), 1 deletion(-)
 >> 
 >> diff --git a/package/libmad/Config.in b/package/libmad/Config.in
 >> index 7d66976c1..2f7543f74 100644
 >> --- a/package/libmad/Config.in
 >> +++ b/package/libmad/Config.in
 >> @@ -37,7 +37,8 @@ config BR2_PACKAGE_LIBMAD_SSO
 >> 
 >> config BR2_PACKAGE_LIBMAD_ASO
 >> bool "Architecture-specific optimizations"
 >> -	default y

 > Why is this change needed? Isn't the added dependency enough?

You're right, I didn't mean to remove this. I'll fix that up while
applying - Thanks!

-- 
Bye, Peter Korsgaard
