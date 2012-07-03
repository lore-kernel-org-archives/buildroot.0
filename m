From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Jul 2012 17:59:21 +0200
Subject: [Buildroot] gtk+
In-Reply-To: <1341329317.31903.16.camel@sven>
References: <1341046722.72419.YahooMailNeo@web160706.mail.bf1.yahoo.com>
 <20120703111106.7f544276@skate> <1341329317.31903.16.camel@sven>
Message-ID: <20120703175921.508fc6fc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 03 Jul 2012 17:28:37 +0200,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> I don't quite understand why pango needs C++ support though. As far as I
> know it is written in plain C. The pango Config.in file refers to
> freetype:
> 
>         depends on BR2_INSTALL_LIBSTDCPP # freetype support
> 
> But freetype itself doesn't depend on C++ support.

I haven't looked in details, but:

commit 1c4dbb5fa7df89731e5d59f680e9dc34f24f8835
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Mon Aug 30 10:02:39 2010 +0200

    pango: needs C++ for freetype handling
    
    Pango was recently updated to v1.28 as a dependency of webkit, but its
    freetype support has unfortunately been rewritten with parts in C++
    (since pango 1.25), so adjust dependencies of pango and users of it to
    require C++ support.

Regards,    

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
