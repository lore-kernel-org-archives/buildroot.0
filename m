From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 4 Feb 2009 17:11:02 -0200
Subject: [Buildroot] uClibc-0.9.30-avr32-2.1.5.tar.bz2 is missing
Message-ID: <d6cda7730902041111h26b28bc7l4ab8f2fff3ef9e1c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

    The avr32 configurations can't download
uClibc-0.9.30-avr32-2.1.5.tar.bz2. The primary site
(ftp://www.at91.com) gives Connection refused, and the buildroot
mirror doesn't have it.
    Same goes for binutils-2.18-avr32-1.0.1.tar.bz2

    According to [1], avr32 support was in uClibc svn after 0.9.29
release, so upstream 0.9.30 should have support to it. Unfortunally I
don't see any easy way to work around this, disabling only the vendor
specific uclibc while keeping it for the rest of the toolchain. If we
remove the external source toolchain handling from uclibc.mk, it will
affect versions prior to .30.

[1] http://avr32linux.org/twiki/bin/view/Main/MicroClibcPatches

Thanks,
   Thiago A. Correa
