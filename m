From: Diego Iastrubni <diegoiast@gmail.com>
Date: Tue, 14 Dec 2010 17:28:54 +0200
Subject: [Buildroot] cannot log to my build root
In-Reply-To: <20101214160558.325cddcb@surf>
References: <AANLkTine190SpsTRLjzsOvdTFjAXiEwDK4yd8Vmkhsj_@mail.gmail.com>
	<20101214142544.7863d2d2@surf>
	<AANLkTi=GjsSptGonZv0S+BqCgYZZYoTOC=K+mTYpLrSd@mail.gmail.com>
	<20101214150520.253b9bae@surf>
	<AANLkTi=YP74FxwLhGyYo7gn5WFpR6PK8Qqw4UTWTE08N@mail.gmail.com>
	<20101214154228.51a969b6@surf>
	<AANLkTikOXep3YnuzHai4fzM-QEGb8BqSZvPsdRvQ_Hkc@mail.gmail.com>
	<20101214160558.325cddcb@surf>
Message-ID: <AANLkTinQYpMH5VVCiXwLpN4io7rh=VaML+AX3yAOD5_F@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 14, 2010 at 5:05 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> This last line "can't access tty; job control turned off" means that
> the shell has been started directly on /dev/console, which is normal is
> you start a shell directly from an init.d script, because those scripts
> are executed with /dev/console as the standard input, standard output,
> standard err.
>

Not that I am aware of.


>
> You really having *nothing* else on the serial line after what you
> sent ?
>
> There is the application I am developing. It sends text to stdout, which is
on the serial console (as you described above).


> According to your Buildroot configuration, your /etc/inittab should
> contain a line :
>
> ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
>
/ # cat /etc/inittab | grep getty
# Set up a couple of getty's
tty1::respawn:/sbin/getty 38400 tty1
tty2::respawn:/sbin/getty 38400 tty2
# Put a getty on the serial port
ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL


> and you should see a login prompt on this serial line.
>
> It's the /etc/inittab file that decides on which terminals a login
> prompt should appear, by starting a getty program on those terminals.
>
> What does your /etc/inittab look like ?
>

I probably did not express myself properly. I do soo login (which is started
by getty). The only problem is that whatever I do in "login" I get kicked
out -

buildroot login: root
Password: *[just enter]*
Login incorrect

The sad thing is that I do remember that once it did work and I would get by
just typing the username.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101214/870d7bab/attachment.html>
