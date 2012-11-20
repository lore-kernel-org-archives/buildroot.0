From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Tue, 20 Nov 2012 02:02:51 -0800 (PST)
Subject: [Buildroot] GTK vs Qt
In-Reply-To: <20121120100105.4cafd18d@skate>
References: <1353393604.95219.YahooMailNeo@web164605.mail.gq1.yahoo.com>
 <20121120100105.4cafd18d@skate>
Message-ID: <1353405771.50495.YahooMailNeo@web164602.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Does it mean that I cannot start?Qt programs built the way 
to use X (on Buildroot built linux)? Or does it mean that I 
must use QtCreator if I want GUI on embedded boards with 
Buildroot built linux ?

Regards 

________________________________
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Zoran Djordjevic <djdjdjole@yahoo.com> 
Cc: "buildroot at busybox.net" <buildroot@busybox.net> 
Sent: Tuesday, November 20, 2012 10:01 AM
Subject: Re: [Buildroot] GTK vs Qt
  
Dear Zoran Djordjevic,

On Mon, 19 Nov 2012 22:40:04 -0800 (PST), Zoran Djordjevic wrote:

> When I run GTK demo programs on my ARM board?(built during linux building 
> by Buildroot), I start them by quoting it in xinitrc file (together with window 
> manager)?and then giving xinit command (is there some other way ?). 
> However, when running Qt demo?programs (linux built with Qt support), I can 
> start them with quoting only?-qws option (obviously programs are built with
> QtCreator) - ie. no xinit ...?
> Difference is also regarding startup times (which is?pretty big?difference when
> speaking of first start).
> What interests me is why different methods of starting GTK and Qt programs and
> also why so huge startup?time difference ?

The Qt you're using runs directly on the framebuffer, so there is no
X.org server. But it's also possible to run Qt on top of X.org (through
not supported by Buildroot at this time).

The Gtk version you're using runs on top of the X.org server, so the
X.org server has to start and initialize itself before starting your
application. It is also possible to run Gtk on top of DirectFB, which
is a lightweight library on top of the framebuffer. However, the Gtk
DirectFB backend has proven to not be that well maintained over the
years, so I'm not sure it's really a good choice.

So basically, you're comparing something that runs on top of X.org with
something that doesn't run on top of X.org.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121120/6d6b5294/attachment.html>
