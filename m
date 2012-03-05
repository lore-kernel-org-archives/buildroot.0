From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Mar 2012 19:38:18 +0100
Subject: [Buildroot] udev build error solved : core dependency tar must
 be > 1.20
In-Reply-To: <3727543134DD41C589596DA3C5EC9F5B@JohanW7>
References: <3727543134DD41C589596DA3C5EC9F5B@JohanW7>
Message-ID: <20120305193818.031c5332@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 5 Mar 2012 18:01:16 +0100,
"Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

> It seems the tar -J option was introduced with tar version 1.21 
> I upgraded my host to the latest tar version (1.26) and now it udev
> 181 builds. Maybe this is something to check for in  the core
> dependencies check. My debian lenny had version 1.20 in its package
> list. 

Or rather we should patch the udev code so that it doesn't use -J, but
instead bunzip2 + tar.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
