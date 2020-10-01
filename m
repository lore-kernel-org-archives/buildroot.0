From: Qais Yousef <qais.yousef@arm.com>
Date: Thu, 1 Oct 2020 21:46:59 +0100
Subject: [Buildroot] [RFC PATCH 0/4] add BCC and bpftrace packages
In-Reply-To: <b25b6c1c-b013-9a84-8a57-bd44738c6453@gmail.com>
References: <20200929102618.28571-1-qais.yousef@arm.com>
 <b25b6c1c-b013-9a84-8a57-bd44738c6453@gmail.com>
Message-ID: <20201001204658.p3glxx22kevypsiw@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain

On 09/29/20 23:08, Romain Naour wrote:
> Hi Qais,
> 
> Le 29/09/2020 ? 12:26, Qais Yousef a ?crit?:
> > *** RESEND AFTER SUBSCRIBING TO THE LIST ***
> > 
> > The following series adds 2 new packages:
> > 
> > 	* BPF Compiler Collection (BCC)
> > 	* bpftrace
> > 
> > It is based on 2020.08 tag. Can rebase on tip of master after this initial RFC
> > review.
> > 
> > The support was validated on x86_64 and aarch64 (little endian). Hence
> > restricted to these 2 archs only. aarch64 big endian is set as valid, but when
> > I tried to compile that I think LLVM or clang support for aarch64_be + BPF was
> > generating some errors; or something else was missing. So it might be a better
> > idea to remove BR2_aarch64_be from Config.in dependency.
> > 
> > I tried to enable i386 and arm (aarch32); but I encountered some issues and
> > decided to narrow the initial support to what I got working in hope that other
> > archs support can follow through later if people are interested.
> > 
> > IIRC the issues were:
> > 
> > 	* bpftrace doesn't support these 2 archs.
> > 	* BCC had some build failures on arm.
> > 	* BCC had runtime issues on i386.
> > 
> > Marking this as RFC as it is something that was done over several weekends and
> > my last contribution to buildroot was many many years ago. So I am sure there
> > are many rough edges to tackle. Beside from my vague description above, you
> > might have gotten the hint it's been a while since I last touched it. But I'd
> > like to get the support merged, so hopefully starting a discussion with what
> > I have now is a better start.
> 
> I reviewed your RFC series. I'm agree that bcc is difficult to cross-compile...

Thanks a lot for your review! I will try to address as much as I can over the
weekend and either post a new series or get back to you with more info.

> 
> I suggest adding bpftrace to the bcc series from Jugurtha and keeping you as
> author of this package.

I did test it and I think using it as a base makes sense. I will try to review
it over the weekend too.

> 
> @jugurtha can you have a look at bpftrace package ?
> 
> I'll mark your RFC series "Changes requested" in patchwork.
> Thanks!

Thanks!

--
Qais Yousef
