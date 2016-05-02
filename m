From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 May 2016 17:37:39 +0200
Subject: [Buildroot] [PATCH] x264: needs mmu
In-Reply-To: <572771B9.6080807@zacarias.com.ar> (Gustavo Zacarias's message of
 "Mon, 2 May 2016 12:26:49 -0300")
References: <1462193087-19193-1-git-send-email-gustavo@zacarias.com.ar>
 <87inywqy9f.fsf@dell.be.48ers.dk> <572771B9.6080807@zacarias.com.ar>
Message-ID: <87eg9kqxmk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > On 02/05/16 12:23, Peter Korsgaard wrote:
 >> Hmm, is that really generally true? I don't quite see why you cannot
 >> have madvise() without mmu. Looking at uClibc-ng, the option enabling
 >> madvise support doesn't depend on MMU support.

 > I've based the rule on previous 80b9dfce, 5b309e1a and 8d446718
 > scenarios and didn't investigate myself.

Ok - Thomas, do you know if madvise generally isn't available or if it
is something specific to the binary bfin toolchain?

I'll kick off a build with our new stm32f defconfig and look.

-- 
Venlig hilsen,
Peter Korsgaard 
