From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Oct 2014 21:09:39 +0200
Subject: [Buildroot] [PATCH] ARC: gcc - fixes for improperly calculated
	jump/branch offsets
In-Reply-To: <1412792377-6312-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Wed, 8 Oct 2014 11:19:37 -0700")
References: <1412792377-6312-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87ppe2bcp8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Symptoms usually seen are like that:
 ---> ---
 > Error: operand out of range (128 is not between -128 and 127)
 ---> ---
 > where range may differ.

 > Since compiler tries to use jump/branch instructions with the shortes encoding
 > of offset it's important to calculate required offset properly.

 > In case of miscalculation by compiler later assembler throws an error because of
 > inability to encode requested value.

 > Fixes are taken from current development branch of GCC for ARC and will be a
 > part of the next release of ARC tools, so at that point patch should be dropped.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 > Cc: Anton Kolesov <akolesov@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

This presumably fixes the recent autobuild issues?

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
