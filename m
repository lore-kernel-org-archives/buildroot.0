From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 22 Mar 2017 18:38:51 -0400
Subject: [Buildroot] [RFC 2/3] rpi-userland: fix opengl library symlinks
In-Reply-To: <20170322225421.5ce139f6@free-electrons.com>
References: <20170322181331.23500-1-gael.portay@savoirfairelinux.com>
 <20170322181331.23500-3-gael.portay@savoirfairelinux.com>
 <20170322225421.5ce139f6@free-electrons.com>
Message-ID: <20170322223851.vlc46h63xsksr3f5@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Mar 22, 2017 at 10:54:21PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 22 Mar 2017 14:13:30 -0400, Ga?l PORTAY wrote:
> > Qt WebEngine module is linked against libEGL.so.1 and libGLESv2.so.2.
> 

I write this patch a month ago, I don't remember when it crashes (maybe at
runtime...).

> I don't understand this. Does WebEngine contains pre-built binaries? If
> so, then most likely they are only available for a few architectures,
> and Qt WebEngine should only be available for those few architectures.
> 
> If everything is source code, then presumably the build system uses
> -lEGL -lGLESv2, which tells gcc to look for libEGL.so and libGLESv2.so,
> so those .1 and .2 suffixes should not matter.
> 

Indeed.

I just did a quick look up into the sources [1], and my message is totally
wrong! My excuses...

WebEngine is not linked against those libraries: libraries are dynamically
loaded.

> Can you give some more details here?
> 

Do you want I reproduce the crash? To make sure this quick investigation is
correct?

> Also: if this is needed for the qtwebengine build to be successful, it
> should appear *before* the qtwebengine patch in the series.
> 

Indeed (again)...

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

Regards,
Gael

[1] https://github.com/qt/qtwebengine/blob/dev/src/core/surface_factory_qt.cpp#L76-L86
