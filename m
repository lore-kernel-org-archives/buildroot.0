From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Mar 2017 21:09:57 +0100
Subject: [Buildroot] libglu config error, while X.Org enabled
In-Reply-To: <CAOMZO5BrHBr8HkrC7hepcAMHE-sgE9MbhQmnWhybwKqqYuW9xQ@mail.gmail.com>
References: <CAD6G_RTkov1OJatw14LDVTNodndDav5JSeqgPF0FajGKg=4J7A@mail.gmail.com>
 <CAOMZO5BrHBr8HkrC7hepcAMHE-sgE9MbhQmnWhybwKqqYuW9xQ@mail.gmail.com>
Message-ID: <20170308210957.44b05474@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Mar 2017 14:35:31 -0300, Fabio Estevam wrote:

> It seems you want to use X11 with mx6. In this case you would need to
> use Russell's X11 driver:
> 
> http://git.arm.linux.org.uk/cgit/xf86-video-armada.git/tree/README?h=unstable-devel
> 
> Then you need to create support for it in Buildroot.

Or you can also use package/x11r7/xdriver_xf86-video-imx-viv/, which is
the X11 driver from Freescale, based on the proprietary Vivante OpenGL
implementation.

However, the full OpenGL support in Buildroot with Vivante is not
completely correct, so it won't work out of the box.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
