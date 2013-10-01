From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Oct 2013 19:46:00 +0200
Subject: [Buildroot] [PATCH v2] aiccu: patched Makefile to enable static
	linking
In-Reply-To: <8761th1l3m.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 01 Oct 2013 09:55:25 +0200")
References: <1380563862-4241-1-git-send-email-rommel@layer-7.net>
 <8761th1l3m.fsf@dell.be.48ers.dk>
Message-ID: <871u4428br.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

 M> + ifeq ($(shell uname | grep -c "Linux"),1)
 M> + CFLAGS	+= -D AICCU_GNUTLS
 M> +-LDFLAGS += -lgnutls
 M> ++LDFLAGS += -lgnutls -lhogweed -lnettle -lgmp -lz

 Peter> Thanks. The problem is that zlib (and libidn, p11-kit and libtasn1) are
 Peter> all optional for gnutls (but needed in LDFLAGS when statically linking),
 Peter> so this doesn't really work.

 Peter> Perhaps we should handle it in aiccu.mk instead, either manually or
 Peter> using pkg-config --static --libs gnutls

Committed with that changed, thanks.

-- 
Bye, Peter Korsgaard
