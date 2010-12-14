From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Dec 2010 16:37:54 +0100
Subject: [Buildroot] cannot log to my build root
In-Reply-To: <AANLkTinQYpMH5VVCiXwLpN4io7rh=VaML+AX3yAOD5_F@mail.gmail.com>
References: <AANLkTine190SpsTRLjzsOvdTFjAXiEwDK4yd8Vmkhsj_@mail.gmail.com>
	<20101214142544.7863d2d2@surf>
	<AANLkTi=GjsSptGonZv0S+BqCgYZZYoTOC=K+mTYpLrSd@mail.gmail.com>
	<20101214150520.253b9bae@surf>
	<AANLkTi=YP74FxwLhGyYo7gn5WFpR6PK8Qqw4UTWTE08N@mail.gmail.com>
	<20101214154228.51a969b6@surf>
	<AANLkTikOXep3YnuzHai4fzM-QEGb8BqSZvPsdRvQ_Hkc@mail.gmail.com>
	<20101214160558.325cddcb@surf>
	<AANLkTinQYpMH5VVCiXwLpN4io7rh=VaML+AX3yAOD5_F@mail.gmail.com>
Message-ID: <20101214163754.6b1e664f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Dec 2010 17:28:54 +0200
Diego Iastrubni <diegoiast@gmail.com> wrote:

> > This last line "can't access tty; job control turned off" means that
> > the shell has been started directly on /dev/console, which is normal is
> > you start a shell directly from an init.d script, because those scripts
> > are executed with /dev/console as the standard input, standard output,
> > standard err.
> 
> Not that I am aware of.

Huh, sorry ?

> I probably did not express myself properly. I do soo login (which is started
> by getty). The only problem is that whatever I do in "login" I get kicked
> out -
> 
> buildroot login: root
> Password: *[just enter]*
> Login incorrect
> 
> The sad thing is that I do remember that once it did work and I would get by
> just typing the username.

Do you have the default /etc/securetty file, the default /etc/passwd
and the default /etc/shadow files ?

I tested a basic Buildroot build just two days ago, and I could log in
as root on ttyS0 without any problem.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
