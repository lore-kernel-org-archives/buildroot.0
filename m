From: Emmanuel Riou <riou.emmanuel@googlemail.com>
Date: Thu, 24 Sep 2009 15:40:39 +0100
Subject: [Buildroot] mpfr-2.4.1.patch not found
In-Reply-To: <87r5tw63jp.fsf@macbook.be.48ers.dk>
References: <1253772735.451.111.camel@station1.ormlab.com>	<4ABB135A.5010408@cetoncorp.com>
	<87r5tw63jp.fsf@macbook.be.48ers.dk>
Message-ID: <4ABB84E7.9070001@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Austin" == Austin Foxley <austinf@cetoncorp.com> writes:
> 
>  Austin> On 09/23/2009 11:12 PM, Ormund Williams wrote:
>  >> /bin/sh: ./../dl/mpfr-2.4.1.patch: No such file or directory
>  >> make: *** [.../buildroot/output/toolchain/mpfr-2.4.1/.unpacked] Error 1
>  >> 
>  >> Where is this patch suppose to come from?
> 
>  Austin> http://www.mpfr.org/mpfr-2.4.1/mpfr-2.4.1.patch I would think, but that gives me
>  Austin> a 404 currently.
> 
> http://www.mpfr.org/mpfr-2.4.1/patches to be exact, but we rename that
> unlucky filename to mpfr-2.4.1.patch after downloading (see mpfr.mk).
> 
> It's on the mirror as well:
> 
> http://buildroot.net/downloads/sources/mpfr-2.4.1.patch
> 
I have just experienced the problem. It looks like this is a relative 
path issue actually:
When you look at mpfr.mk the patch command is the following:
( cd $(MPFR_DIR); patch -p1 -N -Z < $(MPFR_PATCH_SOURCE); )
with MPFR_PATCH_SOURCE:=$(DL_DIR)/$(MPFR_PATCH_FILE) which is replaced 
in my case by ./dl/mpfr-2.4.1.patch where it should be an absolute path.

Emmanuel.
