From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Tue, 13 Nov 2018 12:39:03 +0100
Subject: [Buildroot] Building u-boot on PowerPC64 (but u-boot only
 supports 32 bits)
In-Reply-To: <472968048.1756802.1542106328583.JavaMail.zimbra@datacom.com.br>
References: <CAM+bi4taykZ3P631XxP3uwGubbKFCb-BSp+dJaiixpKMK3jweA@mail.gmail.com>
 <472968048.1756802.1542106328583.JavaMail.zimbra@datacom.com.br>
Message-ID: <20181113113902.GA20009@salem.gmr.ssr.upm.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 13, 2018 at 08:52:08AM -0200, Carlos Santos wrote:
> > From: "Alvaro Gamez" <alvaro.gamez@hazent.com>
> > To: "buildroot" <buildroot@buildroot.org>
> > Sent: Ter?a-feira, 13 de novembro de 2018 7:10:34
> > Subject: [Buildroot] Building u-boot on PowerPC64 (but u-boot only supports 32 bits)
> 
> > I can no doubt create another project that is intended only for building u-boot,
> > but then why would I use buildroot instead of simply compiling u-boot? I'd
> > really like to have everything integrated on buildroot, and I guess this can be
> > useful for any other packages.
> 
> Here at DATACOM our initial approach was building u-boot along with the
> firmware on 32-bit projects and have separate 32-bit projects to build
> it for 64-bit processors.
> 
> After some time we decided to provide u-boot as a pre-built binary for
> each board. The boot loader is a very critical part of any system and
> once it starts working as expected there is to reason to rebuild it over
> and over again. In fact it would be risky to do that.

Thanks for sharing your experience! You're right in this last part, I won't
be needing to recompile u-boot each time I upgrade they payload of my system.

Since I'm using buildroot as a submodule, I don't really need to manage a
full repository or project, but just a new defconfig that builds the
toolchain I need to compile uboot and uboot itself.

Except for this case, I don't know if there's any other use case that
involves compiling software both for 32 and 64 bits on a single project.
If there is, maybe it's still worthwhile taking a look at how can two
different toolchains be built and selected on buildroot, but I guess that's
gonna turn out to be pretty complex.

Best regards!

-- 
Alvaro G. M.
