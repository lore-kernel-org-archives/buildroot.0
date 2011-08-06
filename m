From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2011 09:11:33 +0200
Subject: [Buildroot] Still cannot get a booting system
In-Reply-To: <000501cc53d3$0ae00480$20a00d80$@com>
References: <000501cc53d3$0ae00480$20a00d80$@com>
Message-ID: <20110806091133.645d6d95@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sat, 6 Aug 2011 01:51:57 +0100,
"Sam Nazarko" <samnazarko@stmteam.com> a ?crit :

> I don't get what is necessary to just get a basic system booting on an i386
> machine. Seems like it's not possible.

It is possible. It is more likely a misconfiguration on your side.

> I had success with ucLibc on 2011.02,
> but can't get anything to work on 2011.05. Even when using the default
> kernel in 2011.02, no dice. I've looked at everything, like building the
> kernel from 2011.02 release and combining with the tarFS of a 2011.05 gcLibc
> build (using same kernel headers of course) but no dice. It hangs on the
> initialisation of USB:

I don't think it hangs on the initialization of USB, but rather that a
getty program (which displays the login prompt) is not started on the
terminal your looking at. By default, Buildroot configures the inittab
file to start a getty on ttyS0, but you may need to adjust this in :

System configuration
 -> Port to run a getty (login prompt) on

See also our FAQ:
 http://buildroot.org/downloads/buildroot.html#faq

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
