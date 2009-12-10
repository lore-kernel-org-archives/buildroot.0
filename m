From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Dec 2009 09:29:53 +0100
Subject: [Buildroot] RTNETLINK error
In-Reply-To: <4B2CB099CF3D4F40B1B1442281CA94FFC4C929@EXCHANGEVS01.appsig.com>
References: <4B2CB099CF3D4F40B1B1442281CA94FFC4C929@EXCHANGEVS01.appsig.com>
Message-ID: <20091210092953.73963a39@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 9 Dec 2009 11:20:12 -0800,
"NEAL, RYAN" <RYAN_NEAL@appsig.com> a ?crit :

> Starting network...
> 
> ip: RTNETLINK answers: File exists
> 
> And then it hangs.  I looked through the inittab -> rcS -> S40network
> to find that it is coming from the ifup call (on the loopback
> interface?).

Are you sure your /etc/inittab is properly configured to set-up a getty
or shell on whichever serial line you're using ?

This "ip: RTNETLINK" is something I also have, but the system is fully
functional. However, when I forget to adapt the /etc/inittab to the
board serial port configuration, I get the same behaviour as you do.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
