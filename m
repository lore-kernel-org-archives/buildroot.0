From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Sep 2014 23:14:38 +0200
Subject: [Buildroot] [PATCH 1/2] libqrencode: link with pthread to avoid
	build failure
In-Reply-To: <1410704092-3006-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Sun, 14 Sep 2014 10:14:51 -0400")
References: <1410704092-3006-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87fvft52gx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > Fixes: http://autobuild.buildroot.net/results/1ca0719dd1fe0bbc528ec99b5bc2b42e985bfdca/
 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
 > ---
 >  package/libqrencode/libqrencode.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/libqrencode/libqrencode.mk b/package/libqrencode/libqrencode.mk
 > index d445763..085d0ae 100644
 > --- a/package/libqrencode/libqrencode.mk
 > +++ b/package/libqrencode/libqrencode.mk
 > @@ -11,6 +11,8 @@ LIBQRENCODE_INSTALL_STAGING = YES
 >  LIBQRENCODE_LICENSE = LGPLv2.1+
 >  LIBQRENCODE_LICENSE_FILES = COPYING
 
 > +LIBQRENCODE_CONF_OPT = LIBS='-pthread'
 > +

Looking at configure.ac I see that pthread support is optional, so this
should only be done if BR2_TOOLCHAIN_HAS_THREADS, otherwise we need to
pass --disable-thread-safety.

Committed with that fixed, thanks. The 2nd patch then doesn't make any
sense, so I've dropped that one.

-- 
Bye, Peter Korsgaard
