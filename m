From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Dec 2012 21:53:16 +0100
Subject: [Buildroot] [PATCH 3/8] rt-tests: requires thread support in
	the toolchain
In-Reply-To: <3b534b03d272d7da09743acab71910ab1acb6592.1355076808.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 9 Dec 2012 19:13:58 +0100")
References: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
 <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
 <3b534b03d272d7da09743acab71910ab1acb6592.1355076808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87a9tnvtfn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The rt-tests package extensively use threads, so this package should
 Thomas> only be available if the toolchain has thread support.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/rt-tests/Config.in |    1 +
 Thomas>  1 file changed, 1 insertion(+)

 Thomas> diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
 Thomas> index e645266..337c020 100644
 Thomas> --- a/package/rt-tests/Config.in
 Thomas> +++ b/package/rt-tests/Config.in
 Thomas> @@ -1,5 +1,6 @@
 Thomas>  config BR2_PACKAGE_RT_TESTS
 Thomas>  	bool "rt-tests"
 Thomas> +	depends on BR2_TOOLCHAIN_HAS_THREADS

You forgot to add a comment when not available. I've added that and
committed, thanks.

-- 
Bye, Peter Korsgaard
