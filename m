From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 23:47:56 +0100
Subject: [Buildroot] [RFC 2/3] rpi-userland: fix opengl library symlinks
In-Reply-To: <20170322223851.vlc46h63xsksr3f5@gportay>
References: <20170322181331.23500-1-gael.portay@savoirfairelinux.com>
 <20170322181331.23500-3-gael.portay@savoirfairelinux.com>
 <20170322225421.5ce139f6@free-electrons.com>
 <20170322223851.vlc46h63xsksr3f5@gportay>
Message-ID: <20170322234756.0a6deb80@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 18:38:51 -0400, Ga?l PORTAY wrote:

> WebEngine is not linked against those libraries: libraries are dynamically
> loaded.

Ah, it uses dlopen() on specifically libEGL.so.1 and libOpenGLES.so.2,
OK. Then it makes sense. Maybe your patch should be submitted upstream
to rpi-userland?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
