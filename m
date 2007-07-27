From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 27 Jul 2007 08:29:19 +0200
Subject: [Buildroot] sqlite failure
Message-ID: <1185517759.12803.3.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trying to build sqlite, which fails.


++++++++++++++++++++++++++++++++++++++++++++++++++++
checking for getaddrinfo... yes
checking for broken poll() implementation... no
configure: **************************************** SSL
checking for SSL directory... Not found

Couldn't find your SSL library installation dir
Use --with-ssl option to fix this problem
-----------------------------------------------------

Does that mean that "sqlite" depends on openssl
and we should select that in the Config.in

If so, it is imaginable that another SSL package could
be made available, so maybe "sqlite" should depend
on "BR2_SSL" and "openssl" and other SSL packages, would
select "BR2_SSL".

Thoughts?


Best Regards
Ulf Samuelsson
