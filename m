From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Feb 2018 09:09:39 +0100
Subject: [Buildroot] __mcount on ARC
In-Reply-To: <8e90a87a-7e64-6662-3309-ce0325bc686f@gmail.com>
References: <8e90a87a-7e64-6662-3309-ce0325bc686f@gmail.com>
Message-ID: <20180219090939.1f050545@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Alexey in Cc.

On Sun, 18 Feb 2018 19:45:08 +0100, Zoltan Gyarmati wrote:

> I'm investigating this [1] autobuild error, where the gpsd build fails
> while profiling is enabled, due to undefined reference to `__mcount', on
> ARC arch.
> 
> Ironically enough due to a bug in the gpsd build config the -pg flag is
> not passed to the linker only to the compiler, but after patching that
> one, the build issue remains.
> According to this thread [2] this happened earlier with ARC but other
> package, so is there anything particular about ARC regarding to
> profiling? Should we just disable the gpsd profiling option on ARC?
> 
> [1]
> http://autobuild.buildroot.net/results/88870f5bf4aff557d8eac4e1cc5d3e397e607af0/
> 
> [2]
> http://buildroot-busybox.2317881.n4.nabble.com/autobuild-buildroot-net-Build-results-for-2017-11-19-td180416.html

Alexey, could you comment on this ? I vaguely remember that profiling
was not supported on ARC at some point, but I have no idea if this is
still the case or not.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
