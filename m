From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Fri, 29 Apr 2011 13:38:17 +0200
Subject: [Buildroot] Making --localstatedir=/var global?
Message-ID: <BANLkTi==ps=OpY80aRQBrEL7KcyowjPgOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I see many packages defines localstatedir to point at /var - what do
you think about making it a global default by putting it in
Makefile.autotools.in?

There are a few exceptions though:
dhcp/dhcp.mk: defines localstatedir to /var/lib/dhcp
links/links.mk: defines localstatedir to /tmp
proftpd/proftpd.mk: defines localstatedir to /var/run

All of these are (AFAIK) errornous use of the localstatedir variable,
and could be corrected using patches instead.

Thoughts?
