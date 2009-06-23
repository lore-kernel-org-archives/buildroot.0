From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Jun 2009 20:58:34 +0200
Subject: [Buildroot] Can't debug threaded app on ARM920 (SIG32)
In-Reply-To: <h1r6b2$kd5$2@ger.gmane.org>
References: <h1obk9$cnn$2@ger.gmane.org>
	<h1r6b2$kd5$2@ger.gmane.org>
Message-ID: <20090623205834.67e9e8f5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 23 Jun 2009 18:19:14 +0000 (UTC),
Grant Edwards <grant.b.edwards@gmail.com> a ?crit :

> > I'm trying to debug a threaded application using gdbserver on
> > an ARM920T platform (Atmel AT91RM9200 eval board), and I'm not
> > having much luck.  Whenver a new thread is started, I see a
> > SIG32:
> 
> Gdb 6.8 is broken for ARM targets.  6.7.1 works fine.

I was also having an issue with gdb 6.8 on ARM targets, with an error
message saying ?register no longer active?. It is fixed by
http://cvs.fedoraproject.org/viewvc/devel/gdb/gdb-6.8-bz436037-reg-no-longer-active.patch?revision=1.1

Not sure it is your problem, though.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
