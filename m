From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jun 2010 22:22:19 +0200
Subject: [Buildroot] buildroot for Freescale P2020RDB board
In-Reply-To: <FCD7AA7B-967C-436A-8C06-381EEBD8C729@gmail.com>
References: <AANLkTilZluCVpvJzNT8FhStCyABMxOtL_Sh_RC9d_Ibh@mail.gmail.com>
	<20100607204413.540d07fe@surf>
	<FCD7AA7B-967C-436A-8C06-381EEBD8C729@gmail.com>
Message-ID: <20100607222219.60312e32@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 7 Jun 2010 21:18:03 +0200
Marcus Tangermann <marcus.tangermann@gmail.com> wrote:

> The board is supported by recent kernels as I've managed to build a  
> working 2.6.33 from kernel.org using the toolchain provided by  
> Freescale. So maybe my problems result from the toolchain generated  
> within buildroot.

Ah, great. You'll still have to tell how the kernel should be
configured, anyway.

> Sorry, I know. Unfortunately there is no further information. The  
> board simply stops, no console output.

Ok, so it might be a non-working userspace or an incorrect console=
configuration in the kernel command line.

> You can download the whole BSP from Freescale:
> http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=P2020&fpsp=1&tab=Design_Tools_Tab

Which one exactly ? Those are multi-GB downloads, I'd prefer to pick
the right one from the beginning. Or maybe, better, you can put the
toolchain only online ?

> Yes, sounds reasonable ;-) Any chance to use eglibc based external  
> toolchains?

If they support --sysroot, then yes. If then don't, then no.

What does CROSS-gcc -v from your toolchain returns ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
