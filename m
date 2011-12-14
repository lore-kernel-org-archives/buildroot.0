From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2011 17:46:53 +0100
Subject: [Buildroot] [PATCH] Rework of shutdown policy in inittab
In-Reply-To: <CAAXf6LU1QuFL=pOD09e0dzA1ntsauaFSD2qUr-OPEbmXB74fyw@mail.gmail.com>
References: <1314966310-4360-1-git-send-email-maxime.ripard@free-electrons.com>
 <CAAXf6LU1QuFL=pOD09e0dzA1ntsauaFSD2qUr-OPEbmXB74fyw@mail.gmail.com>
Message-ID: <20111214174653.7319339e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 7 Dec 2011 07:52:20 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> I think there are at least two solutions:
> 1. Keep the new behavior created with this patch, but make sure that
> the release notes clearly state this behavior change and update the
> documentation.

I'd go for this one. All initscripts in Buildroot itself implement the
start/stop/restart logic, so author of scripts that haven't been
submitted upstream should have read this as a suggestion of following a
similar scheme.

> 2. Adapt the new behavior: currently you are following
> /etc/init.d/Sxxxx files/links, while I think that the default policy
> on many distributions is to use /etc/init.d/Kxxxx for shutdown (and
> Sxxxx only for startup). In this scenario, users who have custom Sxxx
> init scripts will not be impacted. Only if they choose to, can they
> create appropriate Kxxxx links and provide stop functions.
> For scripts present in the buildroot distribution, we can provide
> appropriate S and K links immediately.

IMO, it would be ugly to have Sxxfoobar be a regular file (the script
itself) and Kxxfoobar be a symbolic link. So it means that we would
have to change all all scripts to /etc/init.d/foobar, and then create
symbolic links Sxxfoobar and Kxxfoobar. That's an alternative solution,
certainly, but it triples the number of files/symlinks required.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
