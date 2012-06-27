From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Jun 2012 22:08:37 +0200
Subject: [Buildroot] mii-diag static problem
In-Reply-To: <CAL0cBcqPeAwdWO57QLxo0-bRrSckxkvWECer0aGkiEDdQxEQDA@mail.gmail.com>
 (Jonas Keidel's message of "Wed, 27 Jun 2012 16:23:48 +0200")
References: <fb9da18885b4c307d8cc1c677e4e544e@jonas-keidel.de>
 <CAL0cBcqPeAwdWO57QLxo0-bRrSckxkvWECer0aGkiEDdQxEQDA@mail.gmail.com>
Message-ID: <87sjdg5xh6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jonas" == Jonas Keidel <jonas@jonas-keidel.de> writes:

 Jonas> Hey baruch,

 Jonas> There is noch error message, i just need to get mii-diag (or
 Jonas> even better mii-tool) compiled the static way, so that it will
 Jonas> work with busybox and my configuration. Is that possible?

We have the 'Build options->prefer static libraries' option, but
mii-diag wasn't following it until a few minutes ago when I committed a
fix (a0f965d).

With that fixed, it works:

file output/target/usr/sbin/mii-diag
output/target/usr/sbin/mii-diag: ELF 32-bit LSB executable, ARM, version 1 (SYSV), statically linked, stripped

cat defconfig
BR2_arm=y
BR2_arm926t=y
BR2_PREFER_STATIC_LIB=y
BR2_PACKAGE_MII_DIAG=y

So with latest git it is possible.

-- 
Bye, Peter Korsgaard
