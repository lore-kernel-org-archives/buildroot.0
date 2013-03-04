From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Mar 2013 10:30:05 +0100
Subject: [Buildroot] [PATCH 10/33] ltp-testsuite: add warning about
	bessel function support if uclibc toolchain
In-Reply-To: <1353543503-8952-11-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Thu, 22 Nov 2012 01:18:00 +0100")
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-11-git-send-email-s.martin49@gmail.com>
Message-ID: <876217ecma.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Samuel> ---
 Samuel>  package/ltp-testsuite/Config.in | 4 ++++
 Samuel>  1 file changed, 4 insertions(+)

 Samuel> diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
 Samuel> index 86aa4fb..30ba70f 100644
 Samuel> --- a/package/ltp-testsuite/Config.in
 Samuel> +++ b/package/ltp-testsuite/Config.in
 Samuel> @@ -1,3 +1,7 @@
 Samuel> +comment "Note that ltp-testsuite needs a uclibc toolchain with DO_XSI_MATH (bessel functions) enabled"

It also needs UCLIBC_HAS_OBSOLETE_BSD_SIGNAL and UCLIBC_SV4_DEPRECATED
so I reworked this a bit and committed, thanks.

-- 
Bye, Peter Korsgaard
