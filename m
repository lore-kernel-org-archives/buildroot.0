From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 6 May 2010 19:36:19 +0000 (UTC)
Subject: [Buildroot] Can't get inetd/busybox-telnetd to work
References: <hrv528$56b$1@dough.gmane.org>
Message-ID: <hrv5ni$7qu$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-05-06, Grant Edwards <grant.b.edwards@gmail.com> wrote:

> I've been trying to get inetd and busybox's telnetd to work, but I'm
> stumped.
>
> Here's my inetd.conf file:
>
> telnet stream  tcp  nowait root /usr/sbin/telnetd  /usr/sbin/telnetd
>
> When I telnet to my board, this is what happens:
>
>   $ telnet 10.0.0.99 
>   Trying 10.0.0.99...
>   Connected to 10.0.0.99.
>   Escape character is '^]'.
>   buildroot login: root
>   Login incorrect
>
> I can't figure out why the login is "incorrect".  The root user
> doesn't have a password.

Doh!

I forgot to disable support for /etc/securetty (and pts/N wasn't in
/etc/securetty).

-- 
Grant Edwards               grant.b.edwards        Yow! TONY RANDALL!  Is YOUR
                                  at               life a PATIO of FUN??
                              gmail.com            
