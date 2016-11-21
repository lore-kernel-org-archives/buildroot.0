From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 21:41:25 +0100
Subject: [Buildroot] [PATCH 4/4] qextserialport: fix static build
In-Reply-To: <20161120221329.5827-4-arnout@mind.be>
References: <20161120221329.5827-1-arnout@mind.be>
 <20161120221329.5827-4-arnout@mind.be>
Message-ID: <20161121214125.2bb92b98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Nov 2016 23:13:29 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> By default, qextserialport will attempt to build a shared library.
> qesp_static has to be set in CONFIG to build static. Note that
> static+shared is not supported, in that case we just build shared.
> 
> The install target commands also have to be gated in that case,
> because the *.so files don't exist. For completeness we both set
> QEXTSERIALPORT_INSTALL_STAGING to NO and don't define
> QEXTSERIALPORT_INSTALL_TARGET_CMDS for static builds, although one
> of them would be sufficient.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c9233ad71fd60d0e6a85731a8bd4e598bd84947a
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

It's a bit annoying that this comes late in the series. Some of the
rework in the previous patches are not technically needed to get this
build fix, and with the way your patch series is organized, we have to
merge more-or-less unrelated cleanups in master to get the build fix.

Patches 1/4 to 3/4 don't look too complicated, so maybe I'll merge.
I'll just wait and see if people agree or not.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
