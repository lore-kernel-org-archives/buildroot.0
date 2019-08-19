From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Aug 2019 07:35:11 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libmicrohttpd: bump to
 version 0.9.66
In-Reply-To: <1565878960-17760-1-git-send-email-pjtexier@koncepto.io>
 (Pierre-Jean Texier's message of "Thu, 15 Aug 2019 16:22:40 +0200")
References: <1565878960-17760-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <87k1b9g1kg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:

 > See https://lists.gnu.org/archive/html/libmicrohttpd/2019-08/msg00000.html
 > Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Does this not belong on master? According to the release notes it is a
bugfix release:

This is a bugfix release.

Notable changes since version 0.9.65:
* Added callback to allow OCSP stapling (NEW)
* Fixed 0.9.64 regression breaking key-value pair lookups
  via MHD_lookup_connection_value() involving bitmasks
* Fixed hang when combining epoll, https and protocol upgrade
  (such as WebSockets) with larger messages
* Fixed potential connection hang when client included upload
  data in non-POST/PUT requests

And so was 0.9.65:

https://lists.gnu.org/archive/html/libmicrohttpd/2019-07/msg00000.html


> ---
 >  package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 >  package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
 > index 315c706..a7fbe92 100644
 > --- a/package/libmicrohttpd/libmicrohttpd.hash
 > +++ b/package/libmicrohttpd/libmicrohttpd.hash
 > @@ -1,3 +1,3 @@
 >  # Locally calculated
 > -sha256 e792d8ed5990823a0baadea0adf94365999e702f6f1314ef9c555018dafc350e  libmicrohttpd-0.9.64.tar.gz
 > +sha256 4e66d4db1574f4912fbd2690d10d227cc9cc56df6a10aa8f4fc2da75cea7ab1b  libmicrohttpd-0.9.66.tar.gz
 >  sha256 7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
 > diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
 > index 3d96bfc..3bc3339 100644
 > --- a/package/libmicrohttpd/libmicrohttpd.mk
 > +++ b/package/libmicrohttpd/libmicrohttpd.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -LIBMICROHTTPD_VERSION = 0.9.64
 > +LIBMICROHTTPD_VERSION = 0.9.66
 >  LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 >  LIBMICROHTTPD_LICENSE_FILES = COPYING
 >  LIBMICROHTTPD_INSTALL_STAGING = YES
 > -- 
 > 2.7.4

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
