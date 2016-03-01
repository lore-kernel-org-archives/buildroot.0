From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Mar 2016 13:58:25 +0100
Subject: [Buildroot] [PATCH] imx-gpu-viv: fix build dependencies when
 linking against libGAL.so
In-Reply-To: <1456835986-16764-1-git-send-email-antoine.tenart@free-electrons.com>
References: <1456835986-16764-1-git-send-email-antoine.tenart@free-electrons.com>
Message-ID: <20160301135825.78e0c6a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Antoine Tenart,

On Tue,  1 Mar 2016 13:39:46 +0100, Antoine Tenart wrote:
> Packages like QT5 Base with OpenGL and X support link against libGAL.so
> at build time. This results in an error because some X functions used
> in libGAL.so aren't referenced as the libXdamage, libXext and libXfixes
> packages aren't built and installed into sysroot at the time. Fix this
> by adding these three packages as build dependencies of imx-gpu-viv.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>

Just to expand on the explanation: since imx-gpu-viv is just a bunch of
pre-built binaries, it was thought that it was sufficient to handle its
dependencies as runtime dependencies. However, while indeed those
dependencies are not needed for imx-gpu-viv itself to build fine, they
are needed for the things that depend on imx-gpu-viv to build properly.

Therefore, such dependencies cannot be treated as runtime dependencies,
and should therefore be handled as normal build dependencies.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
