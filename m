From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Sep 2009 17:19:39 +0200
Subject: [Buildroot] mpfr-2.4.1.patch not found
In-Reply-To: <4ABB81D2.4060602@gmail.com> (Emmanuel Riou's message of "Thu\,
	24 Sep 2009 15\:27\:30 +0100")
References: <1253772735.451.111.camel@station1.ormlab.com>
	<4ABB135A.5010408@cetoncorp.com> <87r5tw63jp.fsf@macbook.be.48ers.dk>
	<4ABB81D2.4060602@gmail.com>
Message-ID: <87y6o4gyk4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Emmanuel" == Emmanuel Riou <riou.emmanuel@googlemail.com> writes:

Hi,

 Emmanuel> I have just experienced the same problem. It looks like this
 Emmanuel> is a relative path issue actually: When you look at mpfr.mk
 Emmanuel> the patch command is the following: ( cd $(MPFR_DIR); patch
 Emmanuel> -p1 -N -Z < $(MPFR_PATCH_SOURCE); ) with
 Emmanuel> MPFR_PATCH_SOURCE:=$(DL_DIR)/$(MPFR_PATCH_FILE) which is
 Emmanuel> replaced

You're right, that's a drop out from the recent dl dir move patch.  I
didn't notice as I have BUILDROOT_DL_DIR defined in my environment to an
absolute patch.

I have fixed it in git (bdccd7b2e67cc) - Thanks!

-- 
Bye, Peter Korsgaard
