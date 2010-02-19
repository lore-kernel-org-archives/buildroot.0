From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Feb 2010 11:12:28 +0100
Subject: [Buildroot] [PATCH 1/3] Add libxpm as a dependency of
	ace_of_penguins
In-Reply-To: <3df93063da925eb9787be0a98ce88d079173f762.1266536162.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri, 19 Feb 2010 00:36:04 +0100")
References: <cover.1266536162.git.thomas.petazzoni@free-electrons.com>
	<cover.1266536162.git.thomas.petazzoni@free-electrons.com>
	<3df93063da925eb9787be0a98ce88d079173f762.1266536162.git.thomas.petazzoni@free-electrons.com>
Message-ID: <873a0xlek3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> ace_of_penguins fails to build when xlib_libXpm is not selected. Add
 Thomas> it has a dependency. However, contrary to normal dependencies to
 Thomas> libraries (where we use 'select') we use 'depends on' here, otherwise
 Thomas> the X.org server will be get selected automatically without the user
 Thomas> noticing.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/games/ace_of_penguins/Config.in          |    1 +
 Thomas>  package/games/ace_of_penguins/ace_of_penguins.mk |    2 +-
 Thomas>  2 files changed, 2 insertions(+), 1 deletions(-)

 Thomas> diff --git a/package/games/ace_of_penguins/Config.in b/package/games/ace_of_penguins/Config.in
 Thomas> index edbaf26..1d5a367 100644
 Thomas> --- a/package/games/ace_of_penguins/Config.in
 Thomas> +++ b/package/games/ace_of_penguins/Config.in
 Thomas> @@ -2,6 +2,7 @@ config BR2_PACKAGE_ACE_OF_PENGUINS
 Thomas>  	bool "ace_of_penguins"
 Thomas>  	select BR2_PACKAGE_LIBPNG
 Thomas>  	depends on BR2_PACKAGE_XORG7
 Thomas> +	depends on BR2_PACKAGE_XLIB_LIBXPM

But we already depend on XORG7, so selecting LIBXPM seems ok to me?
Longer term we should certainly make it possible to build X stuff
without also building a X server.


-- 
Bye, Peter Korsgaard
