From: Hamish Moffatt <hamish@cloud.net.au>
Date: Mon, 10 Nov 2008 17:05:05 +1100
Subject: [Buildroot] latest iptables requires IPv6
Message-ID: <20081110060504.GA31507@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

r23403 | correa | 2008-09-16 12:12:23 +1000 (Tue, 16 Sep 2008) | 1 line

Fix iptables compile error by updating to Makefile.autotools.in and
bumping version to 1.4.1


This new version of iptables requires IPv6. The old iptables.mk patched
the old version to work without it, but that appears to be a lot harder
in this version.

Do the rest of you have IPV6 enabled in uClibc? I don't (unnecessary bloat).
Any suggestions? Anyone got a patch?

It looks like a few functions in xtables.c could be disabled, and
Makefile.am modified not to compile the ipv6-specific programs
(ip6tables etc).. all this would need a runtime IPV6 detection because
of external toolchains.

thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
