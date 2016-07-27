From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 10:13:48 +0200
Subject: [Buildroot] [PATCH] nettle: disable assembly optimizations for
	ARMv7M
In-Reply-To: <87zip3y0ca.fsf@dell.be.48ers.dk>
References: <1469405759-3224-1-git-send-email-gustavo@zacarias.com.ar>
 <20160725224844.2ea67984@free-electrons.com>
 <87y44oyu6q.fsf@dell.be.48ers.dk>
 <20160727091544.3f40cf72@free-electrons.com>
 <87zip3y0ca.fsf@dell.be.48ers.dk>
Message-ID: <20160727101348.6861fa2e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Jul 2016 10:03:17 +0200, Peter Korsgaard wrote:

>  > I don't think this is equivalent. Indeed, ARMv6 doesn't have Thumb2 (at
>  > least from Buildroot point of view), while the assembly code in Nettle
>  > is OK for ARMv6.  
> 
> True, but then the commit message doesn't make any sense as it said it
> required thumb2 and classic in structions.

That's not what the commit message said. The commit message said:

"""
    nettle: disable assembly optimizations for ARMv7M
    
    It's thumb2-only and it requires ARM instructions.
"""

So it did not say at all that nettle requires Thumb-2 *and* classic. It
said that ARMv7M provides only thumb2, and that nettle requires ARM
instructions.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
