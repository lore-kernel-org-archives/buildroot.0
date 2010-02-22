From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Feb 2010 17:00:14 +0100
Subject: [Buildroot] [PATCH 12/16] libpng: enable compilation on the host
In-Reply-To: <8e8a4ee518b84a7e5f16764022ea2cf8ba455627.1266691382.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sat, 20 Feb 2010 19:43:03 +0100")
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<8e8a4ee518b84a7e5f16764022ea2cf8ba455627.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87k4u5i7ld.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> libpng is needed on the host to build ace_of_penguins.
 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/libpng/libpng.mk |    4 ++++
 Thomas>  1 files changed, 4 insertions(+), 0 deletions(-)

 Thomas> diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
 Thomas> index 1297c89..1b50707 100644
 Thomas> --- a/package/libpng/libpng.mk
 Thomas> +++ b/package/libpng/libpng.mk
 Thomas> @@ -11,7 +11,11 @@ LIBPNG_INSTALL_STAGING = YES
 Thomas>  LIBPNG_CONF_OPT = --without-libpng-compat
 Thomas>  LIBPNG_DEPENDENCIES = host-pkg-config zlib
 
 Thomas> +HOST_LIBPNG_CONF_OPT = --without-libpng-compat
 Thomas> +HOST_LIBPNG_DEPENDENCIES = host-zlib
 Thomas> +

What about host-pkg-config?

-- 
Bye, Peter Korsgaard
