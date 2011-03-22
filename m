From: =?ISO-8859-1?Q?P=E4r_Degerman?= <par@degerman.org>
Date: Tue, 22 Mar 2011 23:17:31 +0100
Subject: [Buildroot] Adding owfs to buildroot fails with "cannot find
	/lib//libc.so.0"
In-Reply-To: <AANLkTik2NRrzq81T=M4fadTW2YuPVSBgS20iYYHNWi7B@mail.gmail.com>
References: <AANLkTikv8x-OmUoOvhJF-3Ly-fV6oLRzSKYY1ZP8s3R5@mail.gmail.com>
	<AANLkTinhuHrKgnufO1mpJ6rbqqLiOv8T3gPsVuJZEarF@mail.gmail.com>
	<AANLkTik2NRrzq81T=M4fadTW2YuPVSBgS20iYYHNWi7B@mail.gmail.com>
Message-ID: <AANLkTimARf5jiWBTfc8hd5rhOexk8Z-jJgfC2wucT07q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, replying to myself here. I solved the problem by manually editing
the libtool file (after the configure step).

The file contained these two lines;
LTCC="gcc"

CC="gcc"

The LTCC variable was defined two times, but at the first location it was
LTCC="/home/degerman/buildroot-2010.11/output/staging/usr/bin/i486-unknown-linux-uclibc-gcc
--sysroot=/home/degerman/buildroot-2010.11/output/staging"

Which seemed to be more correct to me. I simply replaced the
LTCC="gcc" and CC="gcc" lines with;

LTCC="/home/degerman/buildroot-2010.11/output/staging/usr/bin/i486-unknown-linux-uclibc-gcc
--sysroot=/home/degerman/buildroot-2010.11/output/staging"

and

CC="/home/degerman/buildroot-2010.11/output/staging/usr/bin/i486-unknown-linux-uclibc-gcc
--sysroot=/home/degerman/buildroot-2010.11/output/staging"

This made the package compile and link correctly. Does anyone know how
I can tell configure (which I guess generates the libtool file) to use
the correct compiler for those two variables? Is this perhaps a bug in
the autoconfig files for owfs?

Best regards
P?r
