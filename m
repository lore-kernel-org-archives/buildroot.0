From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Feb 2010 16:54:40 +0100
Subject: [Buildroot] [PATCH 15/16] ace_of_penguins: mark as BROKEN
In-Reply-To: <bf37d2e1dfc2249239e95c5a83fbcad4441e6670.1266691382.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sat, 20 Feb 2010 19:43:06 +0100")
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<bf37d2e1dfc2249239e95c5a83fbcad4441e6670.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <877hq5jmf3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This package is BROKEN in the way it compiles make-imglib and text2c
 Thomas> for the host while being in cross-compiled mode. It does not use
 Thomas> CC_FOR_BUILD and CFLAGS_FOR_BUILD as it should.

 Thomas> No upstream release has been made since 2001 and since it is a
 Thomas> relatively useless package, I don't think it's worth the trouble to
 Thomas> sanitize its build system.

I agree.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/games/ace_of_penguins/Config.in |    1 +
 Thomas>  1 files changed, 1 insertions(+), 0 deletions(-)

 Thomas> diff --git a/package/games/ace_of_penguins/Config.in b/package/games/ace_of_penguins/Config.in
 Thomas> index 1d5a367..2240e7c 100644
 Thomas> --- a/package/games/ace_of_penguins/Config.in
 Thomas> +++ b/package/games/ace_of_penguins/Config.in
 Thomas> @@ -3,6 +3,7 @@ config BR2_PACKAGE_ACE_OF_PENGUINS
 Thomas>  	select BR2_PACKAGE_LIBPNG
 Thomas>  	depends on BR2_PACKAGE_XORG7
 Thomas>  	depends on BR2_PACKAGE_XLIB_LIBXPM
 Thomas> +	depends on BROKEN

It's nice to add a short # comment about why it's broken, like:

games/vice/Config.in:   depends on BROKEN # doesn't build, wrong dependencie

-- 
Bye, Peter Korsgaard
