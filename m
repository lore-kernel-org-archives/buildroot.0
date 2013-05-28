From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 May 2013 23:39:31 +0200
Subject: [Buildroot] [PATCH] flex: propagate m4 dependency on wchar
In-Reply-To: <1369776420-4492-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 May 2013 23:27:00 +0200")
References: <1369776420-4492-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bo7u9430.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Commit fe6a9e5e9d4046173a60235f8fd9a3b4746929c6 missed the fact that
 Thomas> m4 has a dependency on wide char support, so this dependency should be
 Thomas> propagated to flex.

 Thomas> Fixes:

 Thomas>   http://autobuild.buildroot.org/results/495/49502b2e33a346b2fcebf5e2da00af2661b54d6e/build-end.log

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/flex/Config.in |    1 +
 Thomas>  1 file changed, 1 insertion(+)

 Thomas> diff --git a/package/flex/Config.in b/package/flex/Config.in
 Thomas> index 1ecd0c3..45e3bac 100644
 Thomas> --- a/package/flex/Config.in
 Thomas> +++ b/package/flex/Config.in
 Thomas> @@ -14,5 +14,6 @@ config BR2_PACKAGE_FLEX_BINARY
 Thomas>  	depends on BR2_PACKAGE_FLEX
 Thomas>  	# runtime dependency
 Thomas>  	select BR2_PACKAGE_M4
 Thomas> +	depends on BR2_USE_WCHAR

It would be good with a '# m4' comment.

 Thomas>  	help
 Thomas>  	  Install the flex binary tool in the target filesystem.

We should also show a comment explaining the dependency if not
available.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
