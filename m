From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Mar 2015 13:14:33 -0300
Subject: [Buildroot] Reduce toolchain options
Message-ID: <550069E9.5060403@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi.
How about we kill non-lfs and non-ipv6 toolchains?
It's 2015 after all, and the size delta is minor:

tar file delta, arm926 uclibc+busybox
=====================================
Threading (NPTL)        +153600 bytes
Largefile               +20480 bytes
IPv6                    +10240 bytes
RPC                     +61440 bytes
WCHAR                   +30720 bytes

Benefits:
* Less toolchain options to test/care for in packages
* More bang for the buck for autobuilders with less combinations to test

Even though the size delta would be somewhat more (tiny though) when
adding packages/libraries that's generally offset by the added size of
said packages.

The only downside i can think of is badly designed packages that won't
work well on a non-ipv6 linux kernel. These should be very few, if any.

LFS is a no brainer IMO.

Regards.
