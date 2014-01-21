From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 21 Jan 2014 19:14:08 +0100
Subject: [Buildroot] [PATCH 1/2] Remove some absolute paths
In-Reply-To: <87k3dtiv2b.fsf@dell.be.48ers.dk>
References: <1388421102-29198-1-git-send-email-bjorn.forsman@gmail.com>
 <CAAXf6LU_YFDERq8aEYTfWa-H7ijBV-e9VNCnpnYTa7pAduobfg@mail.gmail.com>
 <87k3dtiv2b.fsf@dell.be.48ers.dk>
Message-ID: <CAEYzJUHaFZjx++SKC=ER4MxSoZ-0UaPf4Tk1X91GsaNf8kVoqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 January 2014 09:43, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
> Hi,
>
>  > Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
>  > Although the discussion raised some interesting points, I believe this
>  > patch is ok to accept as-is.
>
> True. The explicit /bin/echo was afaik to make sure we end up with an
> echo variant (most likely coreutils) that understands -e, but if we're
> changing it to printf anyway.
>
> Committed, thanks.

Oops, this patch wasn't supposted to be commited all by itself and not
followed by the "[PATCH 2/2] Prefer
'printf' over 'echo -e' (for portability)" patch. With the current use
of "echo -e" there will be breakage if /bin/sh is dash.

Peter, could you apply the 2nd patch also and then I can submit a
separate patch afterwards to stop the echo/printf mix?

Best regards,
Bj?rn Forsman
