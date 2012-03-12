From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Mar 2012 12:33:22 +0100
Subject: [Buildroot] [PATCH 1/3] intltool: no business defining PERLLIB
In-Reply-To: <3fb8fff01011dbe187d729419e8c6156@zacarias.com.ar>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-2-git-send-email-gustavo@zacarias.com.ar>
 <20120312075840.648c0cba@skate>
 <3fb8fff01011dbe187d729419e8c6156@zacarias.com.ar>
Message-ID: <20120312123322.230c968b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 12 Mar 2012 07:14:51 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> >>  HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
> >> -HOST_INTLTOOL_CONF_OPT = \
> >> -  PERLLIB=$(HOST_DIR)/usr/lib/perl
> >
> > Has this been tested on a system where libxml-parser-perl is not
> > installed?
> >
> > Thomas
> 
> That's easy to reproduce and yes, did so by doing "mv /usr/lib/perl5 
> /usr/lib/perl5.oops"
> As long as your distro uses /usr/lib/perl5 and not /usr/lib/perl or 
> some other directory of course, but the same thing applies anyway.

Yes, of course, I missed the fact that you were using a host-microperl,
which I guess it built to look in $(HOST_DIR)/usr/lib/perl by default.
This PERLLIB option is needed if you want to use the Perl provided by
the distro, and you need it to look into this specific place for Perl
modules.

As said in my other mail, I am not convinced we need host-microperl.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
