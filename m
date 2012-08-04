From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Aug 2012 13:05:07 +0200
Subject: [Buildroot] avoiding the need to enter password
In-Reply-To: <CAGXs5wVSxtaZP47Owd+O+gqzqCZZcmuYJ-msSyTyU7pyED_q=g@mail.gmail.com>
References: <CAGXs5wVSxtaZP47Owd+O+gqzqCZZcmuYJ-msSyTyU7pyED_q=g@mail.gmail.com>
Message-ID: <20120804130507.13db9c42@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 4 Aug 2012 12:48:19 +0300,
Kevin Wilson <wkevils@gmail.com> a ?crit :

> When booting to Buildroot  (which I had built from tree) I get the
> message: Welcome to Buildroot
> buildroot login:
> 
> Is there a way to disable the need to enter password so that it will
> boot automatically instead that I will have each time enter the
> default password (which is "root")?

The default password is not "root". The default password is empty.

You can change /etc/inittab so that instead of starting /sbin/getty it
starts /bin/sh. But obviously, doing so that anyone connecting to your
system with a serial port has direct root access.

But generally, this isn't needed: you just start whatever application
you need through /etc/init.d/ scripts, and those applications get
started regardless of whether you logged into the system or not.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
