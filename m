From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 11:01:10 +0200
Subject: [Buildroot] Patchwork cleanup #10: triaging proposal
In-Reply-To: <CAAXf6LWVLLjPHwjLX1tYKf8BSvnt2TpGq=P5oO+MFvf2P_QnUQ@mail.gmail.com>
References: <CAAXf6LX2ma3KGuJvskRdLapnev6S2_honVsYaQ5RCzkizbs9OQ@mail.gmail.com>
 <20140628220856.5fa5db8b@free-electrons.com>
 <CAAXf6LWVLLjPHwjLX1tYKf8BSvnt2TpGq=P5oO+MFvf2P_QnUQ@mail.gmail.com>
Message-ID: <20140629110110.38f06de5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 29 Jun 2014 10:35:06 +0200, Thomas De Schampheleire wrote:

> > If this gets applied, it needs to go together with
> > http://patchwork.ozlabs.org/patch/319108/. However, I'd like to see a
> > solution that merges the existing qemu package with the qemu-system
> > package proposed by Gustavo.
> 
> That's fine too. In this case we should mark it as D and add it to the
> Buildroot TODO list. Maybe Gustavo could look into it...

I think Gustavo is not that much interested into merging his
qemu-system package with the existing qemu package. We had a bit of
discussion about this a few weeks ago, and it seems like someone else
needs to step up and offer a proper patch series based on Frank patches
for qemu user, and Gustavo patches for qemu system.

> >> I would guess the same decision as the previous patch applies here:
> >> B reject
> >
> > Yeah, same problem. Maybe my previous opinion is wrong, and we should
> > just patch Buildroot's uClibc as needed, and not exclude all
> > problematic packages from being used with an external uClibc toolchain.
> 
> but then they'll continue to fail with external toolchains, right?

Well, we would not allow the selection of the problematic packages with
external uClibc toolchains. It's sad because it means people building a
toolchain with Buildroot and then re-using it as an external toolchain
will no longer be able to build certain packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
