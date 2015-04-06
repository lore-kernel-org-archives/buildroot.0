From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 12:26:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/vlc: bump to 2.2.0
In-Reply-To: <4ecf72039d9f27d864bc0d72b6738e5fa3e5192a.1425507251.git.yann.morin.1998@free.fr>
References: <cover.1425507251.git.yann.morin.1998@free.fr>
 <4ecf72039d9f27d864bc0d72b6738e5fa3e5192a.1425507251.git.yann.morin.1998@free.fr>
Message-ID: <20150406122642.34f14e41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  4 Mar 2015 23:15:34 +0100, Yann E. MORIN wrote:
> Since we bumped FreeRDP, vlc no longer builds:
>     http://autobuild.buildroot.org/results/8d9/8d91e3ffccee753135e9d0faa2b1ae00875606c9/
>     http://autobuild.buildroot.org/results/e1f/e1f6526d1a4ac2c95998793efea2188faa708e29/
> 
> Fix that by bumping vlc to 2.2.0, as vlc-2.1.6will never support this
> new version of FreeRDP.
> 
> Add dependency on kernel headers >= 3.7, because it needs DTV_STREAM_ID.
> I stumbled on this whith a toolchain using headers forom 3.5, but only
> tested with a toolchain with headers from 3.9, so there might be other
> dependencies I missed on 3.8 or even 3.9. Let's wait for build failures
> to find out...
> 
> There are quite a bunch of new --enable/disable options, so I've tried
> to catter for all the changes. Most notably, there's no longer a flag to
> enable.disable GL, it is now always auto-detected. Also, I've added
> flags for GLES which we were missing so far, so we had to rely on the
> build order to detect those dependencies (which was OK becasue libgles
> sorts before vlc). Finally, SVG now has two flags to enable different
> parts of SVG support, but they both depend on the same library, so
> enable both.
> 
> There are new support for some features, like acceleration on RPI, but
> that can well wait for further patches when someone is interested ;-) ,
> vdpau HW accelearation on NVidia (we have a package for that, but not
> able to test, so not added), vpx support (we have a libvpx package,
> but I had no time to test), x262 and x265 support for which we're
> currently lacking the packaging, and a few other exotic stuff...
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I was a bit annoyed by the dependency on headers >= 3.7, but since
nobody else complained/reviewed the patch, I just applied it. If
someone is disturbed by this dependency on headers >= 3.7, then that
someone will now realize that he/she should review more patches in
Buildroot, and will fix the thing if needed :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
