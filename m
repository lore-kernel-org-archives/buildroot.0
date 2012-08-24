From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Aug 2012 23:46:41 +0200
Subject: [Buildroot] [PATCH] ifplugd: add --with-initdir= to config
 command
In-Reply-To: <CABYt4-b-E630NcSDfb3MjoRkQ6gMGxmvNta_zNyS-P_O8fPsFA@mail.gmail.com>
References: <1345298656-12714-1-git-send-email-shawnjgoff@gmail.com>
 <20120821115651.7908bfa9@skate>
 <CABYt4-bHDJt9sQd4OyebD-4xg8EU+4ppFJv6y9HEBWFPBs4NDQ@mail.gmail.com>
 <20120822095459.4a73afb0@skate>
 <CABYt4-b-E630NcSDfb3MjoRkQ6gMGxmvNta_zNyS-P_O8fPsFA@mail.gmail.com>
Message-ID: <20120824234641.03cd3b23@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Aug 2012 08:39:55 -0400,
Shawn Goff <shawnjgoff@gmail.com> a ?crit :

> Error:
> configure: error: missing --with-initdir=DIR
> full output from make: http://sprunge.us/eRQT

Ok. It was working here because the ./configure script of ifplug looks
at /etc on the build system to see if /etc/init.d exists. Since it's
the case on my machine, it did work. But apparently, it's not the case
on yours, and it's not good to depend on such thing from the build
machine, so I applied your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
