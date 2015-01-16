From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 09:22:26 +0100
Subject: [Buildroot] support for cortex m3/m4 with newlib
In-Reply-To: <CAOudHSX=sc7hwE0PObED1jtDp7pOs-=PPVG_Rsh6+di9iYWojA@mail.gmail.com>
References: <CAOudHSX=sc7hwE0PObED1jtDp7pOs-=PPVG_Rsh6+di9iYWojA@mail.gmail.com>
Message-ID: <20150116092226.0f2859dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Jan 2015 17:57:32 -0500, Cjw X wrote:

> I've been working on modifying buildroot to support cortex m3/m4 processors
> against the newlib library.
> 
> This way I can use buildroot to build RTOS's for those processors. I've
> been using buildroot for years to build linux systems and I would like to
> expand that for the smaller processors with different operating systems.
> 
> I am making some progress. The toolchain already works. I'm now starting to
> go down the road of supporting RTOS's.
> 
> I'm going to keep going regardless, but I wanted to check to find out if
> this interests the community.
> 
> Does this interest people?

Support for Cortex-M3/M4 based platforms is definitely interesting.
However, I'm wondering if it really makes sense for Buildroot to
support non-Linux operating systems. To me, the main value of Buildroot
is the 1200+ packages that we have, and all of them are based on the
fact that you run a Linux kernel underneath.

What would Buildroot do for a newlib based system, except building the
toolchain? If it's really only about building the toolchain, then maybe
using Crosstool-NG is a better idea, since it already has newlib
support if I remember correctly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
