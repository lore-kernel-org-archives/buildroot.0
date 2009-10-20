From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Oct 2009 22:37:33 +0200
Subject: [Buildroot] [PATCH] libarchive: make bsdtar and bsdcpio
	binaries configurable
In-Reply-To: <1256070708-18078-1-git-send-email-s.neumann@raumfeld.com> (Sven
	Neumann's message of "Tue\, 20 Oct 2009 22\:31\:48 +0200")
References: <1256070708-18078-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87ljj5ssxe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> libarchive comes with two binaries, bsdtar and bsdcpio that used
 Sven> to be installed by default. This change makes this configurable
 Sven> with the default not to build and install the binaries.
 Sven> ---
 Sven>  package/libarchive/Config.in     |   15 +++++++++++++++
 Sven>  package/libarchive/libarchive.mk |    4 ++++
 Sven>  2 files changed, 19 insertions(+), 0 deletions(-)

 Sven> diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
 Sven> index 9154861..079e0f8 100644
 Sven> --- a/package/libarchive/Config.in
 Sven> +++ b/package/libarchive/Config.in
 Sven> @@ -9,3 +9,18 @@ config BR2_PACKAGE_LIBARCHIVE
 
 Sven>  comment "libarchive requires a toolchain with WCHAR support"
 Sven>  	depends on !BR2_USE_WCHAR
 Sven> +
 Sven> +config BR2_PACKAGE_LIBARCHIVE_BSDTAR
 Sven> +	bool "bsdtar"
 Sven> +	depends on BR2_PACKAGE_LIBARCHIVE
 Sven> +	help
 Sven> +	  The 'bsdtar' program is a full-featured 'tar'
 Sven> +          replacement built on libarchive.

Indentation of 2nd line here and below is wrong - Other than that it
looks good, committed.

-- 
Bye, Peter Korsgaard
