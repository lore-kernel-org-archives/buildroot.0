From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 14 Aug 2017 18:37:10 -0400
Subject: [Buildroot] [PATCH v7 1/3] rpi-userland: fix opengl library
 symlinks
In-Reply-To: <20170814214724.GG2810@scaer>
References: <20170813135650.14067-1-gael.portay@savoirfairelinux.com>
 <20170813135650.14067-2-gael.portay@savoirfairelinux.com>
 <20170814214724.GG2810@scaer>
Message-ID: <20170814223710.wii6x3weja5nhen6@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Mon, Aug 14, 2017 at 11:47:24PM +0200, Yann E. MORIN wrote:
> Ga?l, All,
> 
> On 2017-08-13 09:56 -0400, Ga?l PORTAY spake thusly:
> > The Qt WebEngine module loads libEGL.so.1 and libGLESv2.so.2 libraries.
> > Paths are hard-coded [1].
> 
> But now they no longer do that:
> 
>     https://github.com/qt/qtwebengine/commit/d4c621f6a6b87f2a86069fa393b9f7c4f9e7b9ad
> 

Good catch!

> > This patch sets up cmake to create those library links.
> > 
> > 	$ ls -l output/target/usr/lib/libEGL* output/target/usr/lib/libGLESv2*
> > 	-rwxr-xr-x 1 buildroot buildroot 130032 Aug 10 21:17 output/target/usr/lib/libEGL.so
> > 	lrwxrwxrwx 1 buildroot buildroot      9 Aug  9 12:30 output/target/usr/lib/libEGL.so.1 -> libEGL.so
> > 	-rwxr-xr-x 1 buildroot buildroot  71088 Aug 10 21:16 output/target/usr/lib/libGLESv2.so
> > 	lrwxrwxrwx 1 buildroot buildroot     12 Aug  9 12:30 output/target/usr/lib/libGLESv2.so.2 -> libGLESv2.so
> > 
> > A pull request is pending [2].
> > 
> > [1] https://github.com/qt/qtwebengine/blob/5.9.1/src/core/surface_factory_qt.cpp#L76-L86
> > [2] https://github.com/raspberrypi/userland/pull/379
> 
> Upstream was not too happy with your MR... :-(
> 
> So, do you think you could look at backporting the Qt patch instead?
> 

For sure, I will restart a build with this commit and without my patch.

Regards,
Gael
