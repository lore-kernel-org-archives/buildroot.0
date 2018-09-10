From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 10 Sep 2018 20:55:11 +0100
Subject: [Buildroot] [PATCH v5 0/3] Add tainting support to buildroot
In-Reply-To: <20180910213756.49d85d30@windsurf>
References: <CA+_SqVbJqv2On+9UPE4pcoyiK1wfDZp=t1h1yMdfVB-CQGp91g@mail.gmail.com>
 <20180909133341.GJ2841@scaer>
 <CA+_SqVafj+DAsaBtSPJkf2bwbmh_3JojRjBrzG0oT6GduKTG4g@mail.gmail.com>
 <20180909142019.GK2841@scaer>
 <CA+_SqVZ8-qKU9AxV+kAo6ch4QGKtPJWKS_jOGKMGPjsVTTp5mA@mail.gmail.com>
 <20180909185518.GA2409@scaer>
 <CA+_SqVa2EiU2OXNoc0O=o7GwB0wW15jMjmnY60LL6bKV2PSeRQ@mail.gmail.com>
 <CA+_SqVbyxT0xCg-7mtryFm-=GRCqwZo2hPpwNaVe8nG8_wxxbA@mail.gmail.com>
 <20180910150009.GA2674@scaer>
 <CA+TH9Vm1m+xUC3NydquYNw67SCFLNYvi_rqufxVw3BTtmOS=xQ@mail.gmail.com>
 <20180910180705.GF2674@scaer> <20180910213756.49d85d30@windsurf>
Message-ID: <CA+_SqVbxLaZKdesO-T3M78h9aa6aooJ2YV-LAuWHU7ZxosZyZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,
On Mon, Sep 10, 2018 at 8:38 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 10 Sep 2018 20:07:05 +0200, Yann E. MORIN wrote:
>
> > If you are going so far as to explicitly write this line, just hide the
> > package behing BR2_REPRODUCIBLE instead, yes.
>
> I think BR2_REPRODUCIBLE is not the same thing. BR2_REPRODUCIBLE means
> "assuming we have the same source code and configuration, we guarantee
> that the binary results will be bit-to-bit identical".
>
> While the reproducibility issue we are talking about in this thread is
> about having the same source code each time the build is done. It's
> obviously a requirement for BR2_REPRODUCIBLE to work, but the fact that
> we build with the same source code each time the build is done is a
> property of Buildroot regardless of whether BR2_REPRODUCIBLE is enabled
> or not.
>
> So I'm sorry, but this suggestion to hide a package behind
> BR2_REPRODUCIBLE because the *source* is not guaranteed to be the same
> each time is not a good suggestion IMO, as it's confusing two
> different "reproducible" properties.

I agree with you and indeed this patch series born after our
discussion at the Buildroot developers meeting.
I think we should find a common ground on this ...

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
