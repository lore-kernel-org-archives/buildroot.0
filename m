From: Christian Stewart <christian@paral.in>
Date: Sat, 5 Sep 2020 19:33:23 -0700
Subject: [Buildroot] OpenSSH login problem
In-Reply-To: <CA+h8R2qO01wwrEJdTx2puEbDv6mv31YxyAjG5nCn6hosPAW_aQ@mail.gmail.com>
References: <cc86bfd55f944197bcd610626edecf2f@go-sys.de>
 <52-5f356200-5-2c492440@36238474>
 <4d943f9a8e974a60a5167db44bce6cd1@go-sys.de>
 <CA+h8R2oi0GRLYdumQOYxwON=xd7p_8pn+WoknjRd5N24Vr_5KQ@mail.gmail.com>
 <20200816220620.65159d1d@windsurf.home>
 <CA+h8R2qO01wwrEJdTx2puEbDv6mv31YxyAjG5nCn6hosPAW_aQ@mail.gmail.com>
Message-ID: <CA+h8R2pjvm7Wr_hkS2wtqhzqESmgqTtxivkdTLdEr07ngJLTbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Finally got around to running this test.

I previously tested an Odroid XU4 with GCC 10 and latest binutils, and
it worked.

Now with a test against GCC 9 on a Odroid HC2, it's not working (ssh
exits immediately after successful auth).

Testing against OpenSSH 8.3p1 now and figuring out exactly why this is
happening, if it's the GCC version or what.

On Mon, Aug 17, 2020 at 2:36 PM Christian Stewart <christian@paral.in> wrote:
> On Sun, Aug 16, 2020 at 1:06 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > On Sun, 16 Aug 2020 12:59:02 -0700
> > Christian Stewart <christian@paral.in> wrote:
> >
> > > FWIW I actually had the same, was trying to test an odroid XU4 and the
> > > SSH server was immediately closing the connection. I double-checked
> > > that openssh was at the latest version & I was on the latest buildroot
> > > master as well, and assumed at the time it must have had something to
> > > do with the kernel bump I was testing.
> > >
> > > Now I'm thinking maybe this was causing it. Will test again later today.
> >
> > Could you try applying:
> >
> >  https://github.com/openssh/openssh-portable/commit/beee0ef61866cb567b9abc23bd850f922e59e3f0
> >  https://github.com/openssh/openssh-portable/commit/69298ebfc2c066acee5d187eac8ce9f38c796630
> >
> > and see if it helps ?

Have not tried these yet but I think they are included in 8.3 anyway.

> == Test 1: pi3 w/ gcc 10 glibc binutils 2.34
>
> PASS

Strangely this one worked.

Best regards,
Christian
