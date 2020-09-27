From: Qais Yousef <qais.yousef@arm.com>
Date: Sun, 27 Sep 2020 20:38:30 +0100
Subject: [Buildroot] [RFC PATCH 0/4] add BCC and bpftrace packages
In-Reply-To: <89cf8133-e2d3-0a83-e526-8605eca10d56@gmail.com>
References: <20200926193133.31390-1-qais.yousef@arm.com>
 <89cf8133-e2d3-0a83-e526-8605eca10d56@gmail.com>
Message-ID: <20200927193829.hz5f4fx6amddca53@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain

On 09/26/20 23:06, Romain Naour wrote:
> Hello Qais,
> 
> Le 26/09/2020 ? 21:31, Qais Yousef a ?crit?:
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
> Thanks for this contribution, first make sure to subscribe to the Buildroot
> mailing list. Otherwise your patch are not automatically recorded in patchwork.

Thanks for the quick response. I did subscribe now. Do I need to resend the
series?

> 
> There is an existing patch series proposed by Jugurtha Belkalem earlier this year:
> 
> http://patchwork.ozlabs.org/project/buildroot/list/?series=197400

I did see that actually. I can't remember if I tried it, but it focused on
luajit and seemed partially enabling BCC. I never used BCC with lua before.
Will go give it another look anyway.

> 
> Can you review it and check if it fix errors you noticed on aarch64.
> Jugurtha did a test on a Raspberry-pi 64 bits.

My issue for aarch64 was for big endian builds. I think the dependency chain
for big endian aarch64 was missing something.

aarch64 little endian works fine and have been using it for a short while now.

Thanks

--
Qais Yousef
