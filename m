From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jun 2012 21:15:44 +0200
Subject: [Buildroot] [Buildroot patch] Add package nss-mdns.
In-Reply-To: <87fw9tg7d3.fsf@macbook.be.48ers.dk>
References: <1338927777-10637-1-git-send-email-marek.belisko@gmail.com>
 <87fw9tg7d3.fsf@macbook.be.48ers.dk>
Message-ID: <20120617211544.01133d76@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 17 Jun 2012 19:45:28 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Minor nit, we normally use ' = ' rather than ':='.
> 
> Care to fix this and resubmit?

I think it should also install a simple /etc/nsswitch.conf, which makes
use of the mdns resolving mechanism.

Something like:

==
hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4
==

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
