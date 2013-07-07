From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Jul 2013 21:58:21 +0200
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
In-Reply-To: <1373222539-8915-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 7 Jul 2013 20:42:19 +0200")
References: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87zjtygn1e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> MAKEFLAGS can carry options that make Buildroot failed, eg. '-jN'.
 Samuel> To avoid this, unset the MAKEFLAGS environment variable.

Unfortunately this also drops '-s' from child make invocations, making
silent builds significantly more noisy.

We have .NOTPARALLEL: in the top level Makefile, isn't that enough to
ensure funky MAKEFLAGS settings? Anything else you encountered?


 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Samuel> ---
 Samuel>  Makefile | 1 +
 Samuel>  1 file changed, 1 insertion(+)

 Samuel> diff --git a/Makefile b/Makefile
 Samuel> index 015fbdf..11a7b70 100644
 Samuel> --- a/Makefile
 Samuel> +++ b/Makefile
 Samuel> @@ -207,6 +207,7 @@ unexport CFLAGS
 Samuel>  unexport CXXFLAGS
 Samuel>  unexport GREP_OPTIONS
 Samuel>  unexport CONFIG_SITE
 Samuel> +unexport MAKEFLAGS
 Samuel>  unexport QMAKESPEC
 Samuel>  unexport TERMINFO
 
 Samuel> -- 
 Samuel> 1.8.3.2

 Samuel> _______________________________________________
 Samuel> buildroot mailing list
 Samuel> buildroot at busybox.net
 Samuel> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
