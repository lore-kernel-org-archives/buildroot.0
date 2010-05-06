From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 6 May 2010 19:24:56 +0000 (UTC)
Subject: [Buildroot] Can't get inetd/busybox-telnetd to work
Message-ID: <hrv528$56b$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been trying to get inetd and busybox's telnetd to work, but I'm
stumped.

Here's my inetd.conf file:

telnet stream  tcp  nowait root /usr/sbin/telnetd  /usr/sbin/telnetd

When I telnet to my board, this is what happens:

  $ telnet 10.0.0.99 
  Trying 10.0.0.99...
  Connected to 10.0.0.99.
  Escape character is '^]'.
  buildroot login: root
  Login incorrect

I can't figure out why the login is "incorrect".  The root user
doesn't have a password.

Telnetd and login are both from busybox 1.16.

When I run inetd in the foreground and tell it to log to stderr it's
completely mute.
 
What tricks are there to get busybox's inetd/telnetd/login to work?

-- 
Grant Edwards               grant.b.edwards        Yow! Is it NOUVELLE
                                  at               CUISINE when 3 olives are
                              gmail.com            struggling with a scallop
                                                   in a plate of SAUCE MORNAY?
