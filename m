From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Sep 2012 17:11:22 +0200
Subject: [Buildroot] Python running very slow with buildroot 2012.05
In-Reply-To: <5048B5E7.7050002@zacarias.com.ar>
References: <1346940241.6846.YahooMailNeo@web110707.mail.gq1.yahoo.com>
 <20120906161509.2f5fc914@skate>
 <1346941637.60509.YahooMailNeo@web110712.mail.gq1.yahoo.com>
 <20120906163440.69c585eb@skate> <5048B5E7.7050002@zacarias.com.ar>
Message-ID: <20120906171122.40d2226e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 06 Sep 2012 11:40:39 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> Also if, say, the main system is already running something with the
> exact same glibc it's already preloaded, whereas if it's the
> first/only thing uclibc-based it gets all the penalties, even after
> the first run. Regards.

Aaah, good point. Most likely his Linux distro has gazillions of
programs already running, so most of the glibc code is already in
memory. If not parts of the Python interpreter code itself. While on
the Buildroot system, no Python code has been executed since boot, and
only a minimal set of userspace applications has been executed, so not
much of uClibc code is in memory.

But I would strongly suspect that the Linux distro is already running a
Python app somewhere, so the Python interpreter is in memory already.

Well, to conclude: you're comparing apples to oranges and you really
cannot draw any conclusion from your "benchmark".

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
