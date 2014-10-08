From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 8 Oct 2014 20:11:11 +0000
Subject: [Buildroot] [PATCH] ARC: gcc - fixes for improperly calculated
 jump/branch offsets
In-Reply-To: <87ppe2bcp8.fsf@dell.be.48ers.dk>
References: <1412792377-6312-1-git-send-email-abrodkin@synopsys.com>
 <87ppe2bcp8.fsf@dell.be.48ers.dk>
Message-ID: <1412799069.8158.1.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, 2014-10-08 at 21:09 +0200, Peter Korsgaard wrote:
> >>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
> 
>  > Symptoms usually seen are like that:
>  ---> ---
>  > Error: operand out of range (128 is not between -128 and 127)
>  ---> ---
>  > where range may differ.
> 
>  > Since compiler tries to use jump/branch instructions with the shortes encoding
>  > of offset it's important to calculate required offset properly.
> 
>  > In case of miscalculation by compiler later assembler throws an error because of
>  > inability to encode requested value.
> 
>  > Fixes are taken from current development branch of GCC for ARC and will be a
>  > part of the next release of ARC tools, so at that point patch should be dropped.
> 
>  > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>  > Cc: Anton Kolesov <akolesov@synopsys.com>
>  > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  > Cc: Peter Korsgaard <peter@korsgaard.com>
> 
> This presumably fixes the recent autobuild issues?

At least the one reported against "hostapd" here.

> >          arc |                    hostapd-2.2 | NOK |
http://autobuild.buildroot.net/results/bc5100d6462af4e2805f2bc8d39c87a55d843e2b/
> 
> {standard input}: Assembler messages:
> {standard input}:863: Error: operand out of range (512 is not between
-512 and 511)
> make[1]: *** [../src/wps/wps_attr_parse.o] Error 1
> make[1]: *** Waiting for unfinished jobs....

This should be now solved.

-Alexey
