From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Oct 2009 09:37:47 +0200
Subject: [Buildroot] [PATCH] libarchive: add conditional dependency on
	zlib
In-Reply-To: <1256246073-31069-1-git-send-email-s.neumann@raumfeld.com> (Sven
	Neumann's message of "Thu\, 22 Oct 2009 23\:14\:33 +0200")
References: <1256246073-31069-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <878wf2o910.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> If zlib is selected, then it should be built before libarchive so that
 Sven> libarchive picks up the headers and includes support for zlib
 Sven> compression.

 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
 Sven> ---
 Sven>  package/libarchive/libarchive.mk |    3 +++
 Sven>  1 files changed, 3 insertions(+), 0 deletions(-)

 Sven> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
 Sven> index 32f68f7..6a2706f 100644
 Sven> --- a/package/libarchive/libarchive.mk
 Sven> +++ b/package/libarchive/libarchive.mk
 Sven> @@ -10,6 +10,9 @@ LIBARCHIVE_LIBTOOL_PATCH = NO
 Sven>  LIBARCHIVE_INSTALL_STAGING = YES
 Sven>  LIBARCHIVE_INSTALL_TARGET = YES
 
 Sven> +ifeq ($(BR2_PACKAGE_ZLIB),y)
 Sven> +LIBARCHIVE_DEPENDENCIES = zlib
 Sven> +

Where's the endif?


-- 
Bye, Peter Korsgaard
