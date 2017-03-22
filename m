From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 22:54:21 +0100
Subject: [Buildroot] [RFC 2/3] rpi-userland: fix opengl library symlinks
In-Reply-To: <20170322181331.23500-3-gael.portay@savoirfairelinux.com>
References: <20170322181331.23500-1-gael.portay@savoirfairelinux.com>
 <20170322181331.23500-3-gael.portay@savoirfairelinux.com>
Message-ID: <20170322225421.5ce139f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 14:13:30 -0400, Ga?l PORTAY wrote:
> Qt WebEngine module is linked against libEGL.so.1 and libGLESv2.so.2.

I don't understand this. Does WebEngine contains pre-built binaries? If
so, then most likely they are only available for a few architectures,
and Qt WebEngine should only be available for those few architectures.

If everything is source code, then presumably the build system uses
-lEGL -lGLESv2, which tells gcc to look for libEGL.so and libGLESv2.so,
so those .1 and .2 suffixes should not matter.

Can you give some more details here?

Also: if this is needed for the qtwebengine build to be successful, it
should appear *before* the qtwebengine patch in the series.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
