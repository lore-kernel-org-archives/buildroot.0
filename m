From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 06 Sep 2014 23:21:51 +0200
Subject: [Buildroot] [PATCH] strace: upgrade to 4.9, supports ARC
In-Reply-To: <87tx4os7nd.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 03 Sep 2014 23:42:30 +0200")
References: <1409644247-11683-1-git-send-email-vgupta@synopsys.com>
 <87ha0pk84o.fsf@dell.be.48ers.dk>
 <C2D7FE5348E1B147BCA15975FBA230753C5CF960@IN01WEMBXA.internal.synopsys.com>
 <87tx4os7nd.fsf@dell.be.48ers.dk>
Message-ID: <878ulwmols.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "Vineet" == Vineet Gupta <Vineet.Gupta1@synopsys.com> writes:
 > Hi,

 >>> Do you know if this is fixable, or should we just make it depend on
 >>> BR2_LARGEFILE?

 >> It seems patch-01 (which I didn't remove) would already handle the !LFS case, but
 >> that apparently is not case as u show above.

 >> Can u please check if the 4.8 strace builds OK w/o !LFS. If so that would mean
 >> something in upstream strace renders the patch-01 as useless or needing modification.

 > Yes, strace 4.8 builds ok without LFS.

 > So either we extend patch 01 or we drop the patch and make strace depend
 > on LFS (which is nice as we get rid of a patch, but less nice as it is
 > then more difficult to debug !LFS setups).

 > Anybody feel strongly for one or the other?

I didn't hear any feedback, so I decided to drop the patch and make
strace depend on LFS.

Committed, thanks.

-- 
Bye, Peter Korsgaard
