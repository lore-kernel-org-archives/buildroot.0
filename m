From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jun 2011 00:16:30 +0200
Subject: [Buildroot] [PATCH 7/8] package/autotools: add --{enable,
 disable}-{shared, static} automatically
In-Reply-To: <87k4cq7rdq.fsf@macbook.be.48ers.dk>
References: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
	<cover.1306792524.git.thomas.petazzoni@free-electrons.com>
	<dac0f2005b38138ceb18943190580c3bd392a4fa.1306792524.git.thomas.petazzoni@free-electrons.com>
	<87k4cq7rdq.fsf@macbook.be.48ers.dk>
Message-ID: <20110613001630.1281e5c3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 12 Jun 2011 21:59:29 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> But it does mean that autotools stuff now gets built twice, increasing
> the build time..

It's true that I haven't checked the impact on the build time. Does it
really build libraries twice ? Isn't only the link stage performed
twice ?

If the impact on the build time is too high, then we could probably
make the static library generation conditional. I enabled it so that
the staging directory contains static libraries, which allows users to
statically link their programs against some libraries.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
