From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Aug 2012 17:42:16 +0200
Subject: [Buildroot] avoiding the need to enter password
In-Reply-To: <CAGXs5wViA3UoPPd6_Q1SHuC8JO_M6hTemt80LntGuu0rU_jY6g@mail.gmail.com>
References: <CAGXs5wVSxtaZP47Owd+O+gqzqCZZcmuYJ-msSyTyU7pyED_q=g@mail.gmail.com>
 <20120804130507.13db9c42@skate>
 <CAGXs5wViA3UoPPd6_Q1SHuC8JO_M6hTemt80LntGuu0rU_jY6g@mail.gmail.com>
Message-ID: <20120804174216.0e4d7349@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 4 Aug 2012 16:55:08 +0300,
Kevin Wilson <wkevils@gmail.com> a ?crit :

> I tried it replacing  /bin.sh instead of the
> /sbin/getty line in /etc/inittab and indeed it boots into prompt
> without need to enter password.
> Is there a way to enforce it running the /etc/profile in boot
> in such a case ?
> (It seems to me that /etc/profile is not executed)

Try:

ttyS0::respawn:-/bin/sh

(i.e add a '-' in front of the /bin/sh command. It will make your shell
a login shell, which I think should tell the shell to
read /etc/profile).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
