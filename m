From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jun 2014 20:06:16 +0200
Subject: [Buildroot] [PATCH] dbus: use -pthread instead of -lpthread
In-Reply-To: <53B19643.1010904@imgtec.com>
References: <1404145692-47530-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140630164911.GI4425@tarshish> <53B19643.1010904@imgtec.com>
Message-ID: <20140630200616.35edc9da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 30 Jun 2014 17:54:27 +0100, Vicente Olivert Riera wrote:

> >>   ifeq ($(BR2_PREFER_STATIC_LIB),y)
> >> -DBUS_CONF_OPT += LIBS='-lpthread'
> >> +DBUS_CONF_OPT += LIBS='-pthread'
> >
> > Can you explain how this change solves the build failure?
> 
> Yes. When dnsmasq tries to link against dbus it checks the dbus 
> pkgconfig file to obtain the LIBS that it need to pass to the linker. In 
> the dbus .pc file you have "-ldbus-1 -lpthread" because you used 
> -lpthread when building dbus. If you use -pthread when you build dbus, 
> then you will have -pthread in the dbus .pc file as well.

I think it'd be good to have an updated version of the patch that gives
this explanation + an explanation of the difference between -pthread
and -lpthread and how this difference solves the problem.

Also, would it be possible to get this bug fixed in upstream DBus?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
