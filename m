From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Oct 2017 19:49:17 +0200
Subject: [Buildroot] [PATCH v1] qt5base: remove nostrip qmake.conf
 config option
In-Reply-To: <20171027193047.388c0893@gmx.net>
References: <20171027160522.21892-1-ps.report@gmx.net>
 <20171027183441.529e95d6@windsurf.lan>
 <20171027193047.388c0893@gmx.net>
Message-ID: <20171027194917.3f3dd39e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 Oct 2017 19:30:47 +0200, Peter Seiderer wrote:

> > I think we do want qmake to *not* strip anything, and leave it to
> > Buildroot's BR2_STRIP_strip option to decide whether stripping should
> > happen or not.  
> 
> Mhhh, I see the reason for the in-buildroot usage of qmake, but still a bit
> annoying for out-of-buildroot usage (but maybe a  'qmake CONIFG-=nostrip'
> works here),

Hum, OK, I see the problem.

> would still prefer to keep the simple/original qmake default and
> (maybe) add an additional 'CONFIG+=nostrip' to all in-buildroot qmake
> usages?

Having to explicitly specify CONFIG+=nostrip to each and every qmake
based package is not going to be very nice. Can we have a Buildroot
specific qmake.conf that inherits a common one, and is used by
Buildroot when building qmake packages ?

Or is it enough to just specify CONFIG+=nostrip in $(QT_QMAKE) and
$(QT5_QMAKE) ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
