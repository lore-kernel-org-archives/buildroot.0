From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 17:54:46 +0100
Subject: [Buildroot] target/device/Atmel kernel patches
In-Reply-To: <69C4B5A4F9B74F77AE1E58B4F020A786@aeglos> (Ulf Samuelsson's
	message of "Thu\, 29 Jan 2009 17\:28\:12 +0100")
References: <87ab9d4w6j.fsf@macbook.be.48ers.dk>
	<1233005366.2298.118.camel@elrond.atmel.com>
	<871vup4ul9.fsf@macbook.be.48ers.dk>
	<1233008389.2298.129.camel@elrond.atmel.com>
	<87vds114op.fsf@macbook.be.48ers.dk>
	<FE6DCE243B7A4724B6B33E85771AD61F@aeglos>
	<871vumtb1w.fsf@macbook.be.48ers.dk>
	<A223C54B106543948AC36303E7C74F76@aeglos>
	<8763jyrtfb.fsf@macbook.be.48ers.dk>
	<69C4B5A4F9B74F77AE1E58B4F020A786@aeglos>
Message-ID: <87skn2qch5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> As I see it, you get the base kernel from www.kernel.org

Yes, more or less directly, and that's fine for evaluation boards -
But for real development on specialized hardware that's rarely enough,
hence the need for either:

 - Provide a way to add project specific patches on top

OR

 - Take the kernel from somewhere else (some other
   cvs/svn/git/whatever repo).

I suspect we need to support both.

 Ulf> and if you dont want to host kernel patches for AT91,  then
 Ulf> it will be no problem to download them from $(ATMEL_MIRROR).
 Ulf> I just think there are other things in higher need of attention
 Ulf> than removing these patches RIGHT NOW.
 Ulf> I see that moving these patches from svn to a mirror should
 Ulf> be done before the next release of buildroot.

No, but we're doing a bunch of cleanups now - And as I mentioned before,
the arch-arm directory seems a bit extreme as it is.

I don't think adding a bunch of special case handling to buildroot to
download AT91 patches from somewhere is a better solution. We should
rather generalize the setup so you can handle it outside BR and just
point BR to a repo or a directory full of patches.

-- 
Bye, Peter Korsgaard
