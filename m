From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 13 Nov 2018 08:52:08 -0200 (BRST)
Subject: [Buildroot] Building u-boot on PowerPC64 (but u-boot only
 supports 32 bits)
In-Reply-To: <CAM+bi4taykZ3P631XxP3uwGubbKFCb-BSp+dJaiixpKMK3jweA@mail.gmail.com>
References: <CAM+bi4taykZ3P631XxP3uwGubbKFCb-BSp+dJaiixpKMK3jweA@mail.gmail.com>
Message-ID: <472968048.1756802.1542106328583.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Alvaro Gamez" <alvaro.gamez@hazent.com>
> To: "buildroot" <buildroot@buildroot.org>
> Sent: Ter?a-feira, 13 de novembro de 2018 7:10:34
> Subject: [Buildroot] Building u-boot on PowerPC64 (but u-boot only supports 32 bits)

> Hi!

> I'm facing the same problem as discussed here [
> https://community.nxp.com/thread/376769 |
> https://community.nxp.com/thread/376769 ]

> Basically, when compiling uboot against PowerPC64 e6500, buildroot fails with
> this:
> cc1: error: -mcall not supported in this configuration
> cc1: error: -mrelocatable not supported in this configuration
> cc1: error: -meabi not supported in this configuration

> The explanation is that u-boot doesn't support 64 bits builds of (some/all?)
> PowerPC CPUs.

> Of course, the solution to this is simply to use a 32 bit toolchain, but I don't
> want to use a 32 bit toolchain on all the other parts that my root filesystem
> consists of, including both kernel and applications.

You are not alone.

> So, here's the question: is there anyway to make buildroot generate TWO
> toolchains, in 32 and 64 bit versions, and mark specific packages (in this
> case, u-boot) to use one or the other?

At the moment, no.

> I can no doubt create another project that is intended only for building u-boot,
> but then why would I use buildroot instead of simply compiling u-boot? I'd
> really like to have everything integrated on buildroot, and I guess this can be
> useful for any other packages.

Here at DATACOM our initial approach was building u-boot along with the
firmware on 32-bit projects and have separate 32-bit projects to build
it for 64-bit processors.

After some time we decided to provide u-boot as a pre-built binary for
each board. The boot loader is a very critical part of any system and
once it starts working as expected there is to reason to rebuild it over
and over again. In fact it would be risky to do that.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
