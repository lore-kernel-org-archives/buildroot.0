From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 6 May 2010 22:07:59 +0200
Subject: [Buildroot] Can't get inetd/busybox-telnetd to work
In-Reply-To: <hrv528$56b$1@dough.gmane.org>
References: <hrv528$56b$1@dough.gmane.org>
Message-ID: <t2ze7c6a05e1005061307g5578d1e0w715da4946b5fbbcb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, May 6, 2010 at 9:24 PM, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> I've been trying to get inetd and busybox's telnetd to work, but I'm
> stumped.
>
> Here's my inetd.conf file:
>
> telnet stream ?tcp ?nowait root /usr/sbin/telnetd ?/usr/sbin/telnetd
If you don't need login you can start telnetd this way:
/usb/sbin/telnet -l /bin/sh
You should be able to connect without login prompt.
>
> When I telnet to my board, this is what happens:
>
> ?$ telnet 10.0.0.99
> ?Trying 10.0.0.99...
> ?Connected to 10.0.0.99.
> ?Escape character is '^]'.
> ?buildroot login: root
> ?Login incorrect
>
> I can't figure out why the login is "incorrect". ?The root user
> doesn't have a password.
>
> Telnetd and login are both from busybox 1.16.
>
> When I run inetd in the foreground and tell it to log to stderr it's
> completely mute.
>
> What tricks are there to get busybox's inetd/telnetd/login to work?
>
> --
> Grant Edwards ? ? ? ? ? ? ? grant.b.edwards ? ? ? ?Yow! Is it NOUVELLE
> ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?at ? ? ? ? ? ? ? CUISINE when 3 olives are
> ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?gmail.com ? ? ? ? ? ?struggling with a scallop
> ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? in a plate of SAUCE MORNAY?
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

good luck,

Marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
