From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Dec 2011 23:18:00 +0100
Subject: [Buildroot] [PATCH 1/1] Don't use host gcc use target
	tools.(signed-off this time)
In-Reply-To: <1323513989-8594-1-git-send-email-sagaert.johan@skynet.be>
 (Sagaert Johan's message of "Sat, 10 Dec 2011 11:46:29 +0100")
References: <1323513989-8594-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <87k462bvmv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

Please don't add comments like that in the subject, as that goes in the
final commit message - Rather put it after the '---' line and before the
patch.

 Sagaert> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>


 Sagaert> ---
 Sagaert>  package/libcgi/libcgi.mk |    2 ++
 Sagaert>  1 files changed, 2 insertions(+), 0 deletions(-)

 Sagaert> diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
 Sagaert> index 5867ff9..e70be80 100644
 Sagaert> --- a/package/libcgi/libcgi.mk
 Sagaert> +++ b/package/libcgi/libcgi.mk
 Sagaert> @@ -7,5 +7,7 @@ LIBCGI_VERSION:=1.0
 Sagaert>  LIBCGI_SOURCE:=libcgi-$(LIBCGI_VERSION).tar.gz
 Sagaert>  LIBCGI_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libcgi
 Sagaert>  LIBCGI_INSTALL_STAGING=YES
 Sagaert> +#Don't use host compiler
 Sagaert> +LIBCGI_MAKE_ENV = CC="$(TARGET_CC)"  AR="$(TARGET_AR)"

We should also pass TARGET_CFLAGS, to ensure the right compiler flags
are used.

I fixed that up and cleaned up some whitespace issues while I was at it
and committed, thanks.

-- 
Bye, Peter Korsgaard
