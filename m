From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sat, 25 Oct 2014 16:28:31 +0200
Subject: [Buildroot] [PATCH v2] linux-headers: allow use of headers from
 kernel "package" selected
In-Reply-To: <1413560410.19660.5.camel@abrodkin-8560l.internal.synopsys.com>
References: <1413132543-7148-1-git-send-email-abrodkin@synopsys.com>
 <CABbD_XBjo-UJf95vFi5innY4db=CzKDLeKqgXSsmEsf7eWw5yw@mail.gmail.com>
 <1413560410.19660.5.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <CABbD_XAv=+=zGo4mOkuCRCd9ay4TPyuuU0P_N8hLT0=UZL-PZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

Much more significant one is how to get kernel sources for
> "linux-headers" package from the same location as "linux" package will
> get them.
>
> We cannot rely on internal variables of "linux" package like LINUX_xxx
> because they could be resolved later than we need them.
>
Could you point me some examples, in which cases can these be computed too
late?


> So we need to do the same one calculations as we do in "linux.mk" see:
> linux/linux.mk: # Compute LINUX_SOURCE and LINUX_SITE from the
> configuration
>
Maybe add an extra target for computing the variables somewhere, and make
both
linux and linux-headers depend on it?


>
> In the best case it's dummy code duplication which inevitably will bite
> us in the future. Still I didn't find any better solution. Any input is
> much appreciated.

I agree, code duplication is at least not future-proof :)

Best regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141025/1092b844/attachment.html>
