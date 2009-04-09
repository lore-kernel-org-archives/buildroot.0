From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Apr 2009 11:34:40 +0200
Subject: [Buildroot] JFFS2 / MTD suggestions
In-Reply-To: <49DDACBA.8020708@free.fr> (Cyril HAENEL's message of "Thu\,
	09 Apr 2009 10\:07\:22 +0200")
References: <20090407083540.15437e75@surf> <49DB861E.8040503@free.fr>
	<874ox02xqa.fsf@macbook.be.48ers.dk> <49DDACBA.8020708@free.fr>
Message-ID: <87zleqxj9r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cyril" == Cyril HAENEL <chaenel@free.fr> writes:

Hi,

 Cyril> ./configure --target=arm-linux --host=arm-linux
 Cyril> --build=i386-pc-linux-gnu --prefix=/usr --exec-prefix=/usr
 Cyril> --sysconfdir=/etc --without-html-dir --disable-gtk-doc --disable-nls
 Cyril> --disable-largefile

 Cyril> And it works !! And make compiles lzo successfully.

You also need to set CC to your target compiler and so on.

 Cyril> Really curious, the configure script blocks (with exactly the same
 Cyril> command line) only when called from high level makefile !?

Well, you need to compare apples to apples - Buildroot sets a bunch of
environment variables before calling configure as you can see when you
run it.

It's kind of hard to debug here as I cannot reproduce it. Do you have
C++ support enabled in your config? Do you get anything interesting in
the build_arm/lzo-2.03/config.log file?

-- 
Bye, Peter Korsgaard
