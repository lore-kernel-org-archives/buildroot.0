From: Ormund Williams <ormundw@panix.com>
Date: Thu, 24 Sep 2009 14:54:23 -0400
Subject: [Buildroot] mpfr-2.4.1.patch not found
In-Reply-To: <87y6o4gyk4.fsf@macbook.be.48ers.dk>
References: <1253772735.451.111.camel@station1.ormlab.com>
	<4ABB135A.5010408@cetoncorp.com> <87r5tw63jp.fsf@macbook.be.48ers.dk>
	<4ABB81D2.4060602@gmail.com>  <87y6o4gyk4.fsf@macbook.be.48ers.dk>
Message-ID: <1253818463.451.130.camel@station1.ormlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2009-09-24 at 17:19 +0200, Peter Korsgaard wrote:
> >>>>> "Emmanuel" == Emmanuel Riou <riou.emmanuel@googlemail.com> writes:
> 
> Hi,
> 
>  Emmanuel> I have just experienced the same problem. It looks like this
>  Emmanuel> is a relative path issue actually: When you look at mpfr.mk
>  Emmanuel> the patch command is the following: ( cd $(MPFR_DIR); patch
>  Emmanuel> -p1 -N -Z < $(MPFR_PATCH_SOURCE); ) with
>  Emmanuel> MPFR_PATCH_SOURCE:=$(DL_DIR)/$(MPFR_PATCH_FILE) which is
>  Emmanuel> replaced
> 
> You're right, that's a drop out from the recent dl dir move patch.  I
> didn't notice as I have BUILDROOT_DL_DIR defined in my environment to an
> absolute patch.
> 
> I have fixed it in git (bdccd7b2e67cc) - Thanks!
> 
Thanks, this had me confused since the patch was in my dl directory.
-- 
Ormund Williams
OrmLab LLC
