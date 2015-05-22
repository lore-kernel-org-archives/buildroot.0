From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2015 07:58:05 +0200
Subject: [Buildroot] [PATCH] package/protobuf: autoreconf is now needed
In-Reply-To: <1432269020-9421-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Fri, 22 May 2015 06:30:20 +0200")
References: <1432269020-9421-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87h9r52lxu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Since its update, the *_SITE points to the git repository, so configure
 > script is not generated in this tarball.

 > Fixes:
 >   http://autobuild.buildroot.org/results/ccb/ccba6d8c73b5e826b86065b77b3fe5077db7b99c/
 >   http://autobuild.buildroot.org/results/57e/57ea34e9b48293075e10f0dd2331de2785730827/
 >   and many more...

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > ---
 >  package/protobuf/protobuf.mk | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
 > index b426873..438c0d8 100644
 > --- a/package/protobuf/protobuf.mk
 > +++ b/package/protobuf/protobuf.mk
 > @@ -8,6 +8,9 @@ PROTOBUF_VERSION = v2.5.0
 >  PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
 >  PROTOBUF_LICENSE = BSD-3c
 >  PROTOBUF_LICENSE_FILES = COPYING.txt
 > +# no configure script
 > +PROTOBUF_AUTORECONF = YES
 > +HOST_PROTOBUF_AUTORECONF = YES

FYI, The HOST_ variable defaults to the value of the target one, so I've
dropped the redundant 2nd line.

-- 
Bye, Peter Korsgaard
