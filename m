From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 22:06:20 +0200
Subject: [Buildroot] OpenSSH login problem
In-Reply-To: <CA+h8R2oi0GRLYdumQOYxwON=xd7p_8pn+WoknjRd5N24Vr_5KQ@mail.gmail.com>
References: <cc86bfd55f944197bcd610626edecf2f@go-sys.de>
 <52-5f356200-5-2c492440@36238474>
 <4d943f9a8e974a60a5167db44bce6cd1@go-sys.de>
 <CA+h8R2oi0GRLYdumQOYxwON=xd7p_8pn+WoknjRd5N24Vr_5KQ@mail.gmail.com>
Message-ID: <20200816220620.65159d1d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 Aug 2020 12:59:02 -0700
Christian Stewart <christian@paral.in> wrote:

> FWIW I actually had the same, was trying to test an odroid XU4 and the
> SSH server was immediately closing the connection. I double-checked
> that openssh was at the latest version & I was on the latest buildroot
> master as well, and assumed at the time it must have had something to
> do with the kernel bump I was testing.
> 
> Now I'm thinking maybe this was causing it. Will test again later today.

Could you try applying:

 https://github.com/openssh/openssh-portable/commit/beee0ef61866cb567b9abc23bd850f922e59e3f0
 https://github.com/openssh/openssh-portable/commit/69298ebfc2c066acee5d187eac8ce9f38c796630

and see if it helps ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
