From: Philippe Pepiot <phil@philpep.org>
Date: Tue, 11 Jan 2011 02:17:33 +0100
Subject: [Buildroot] New packages : daemontools, ucspi-tcp and djbdns
Message-ID: <4D2BAFAD.8080506@philpep.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *

http://philpep.org/pub/buildroot_daemontools_ucspi-tcp_djbdns.diff

This is a mix between OpenWrt (from FreeWrt) and debian packages.

The build system is special (Testing compilation and sometime run test
code). Thus, patch for cross compilation removes all run tests and
others build machine specifics.

djbdns and ucspi-tcp includes the ipv6 patch from
http://www.fefe.de/dns/. For testing ipv6 the build system try to
compile a small test with a struct sockaddr_in6 object, so build it with
a toolchain without ipv6 should work.

djbdns depend on ucspi-tcp (for axfrdns), and optionally on daemontools.

I don't provide any init script because there are several way to run
tinydns/dnscache/axfrdns/walldns/rbldns and theses packages provide lot
of small binary tools which can work together but this is not necessary.

As I'm new to buildroot here's some questions :

- Should the package fetch himself the bigs ipv6 patchs on
http://www.fefe.de ?
- Provide a ready to use tinydns/dnscache configuration or let the user
choose the best config (with or without the use of daemontools, for
example) ?
- Someone can test build it with another toolchain than
buildroot-toolchain+largefile+ipv6+wchar+rpc ?

Thanks for buildroot. And sorry for my English :)
