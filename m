From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sat, 1 Nov 2008 12:11:13 +0100
Subject: [Buildroot] my first patch !
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAPwkCc3TmKtGu5F8XdCF1qkBAAAAAA==@cimeq.qc.ca>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAIMsuCDiF8RCojvQ+E2NNJQBAAAAAA==@cimeq.qc.ca>
	<20081031171037.GF27517@mx.loc>
	<!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAPwkCc3TmKtGu5F8XdCF1qkBAAAAAA==@cimeq.qc.ca>
Message-ID: <20081101111112.GN14184@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 31, 2008 at 02:03:55PM -0400, Jonathan Dumaresq wrote:
>Mmm,
>
>I have replaced my old files by the one in you git. Now I get this:

you cannot use the version from git as a drop-in replacement, svn misses
some required improvements for this to work. Just see the diff between
the version in git and svn and back out the AUTO_CONFIGURE_TARGET hunk.

>/bin/bash: line 1:
>--with-cc=/buildroot/buildroot-avr32-v2.2.0-rc6/build_avr32/staging_dir/usr/
>bin/avr32-linux-uclibc-gcc: No such file or directory
>make: ***
>[/buildroot/buildroot-avr32-v2.2.0-rc6/build_avr32/net-snmp-5.4.1/.configure
>d] Error 127
>
>if I do
>=/buildroot/buildroot-avr32-v2.2.0-rc6/build_avr32/staging_dir/usr/bin/avr32
>-linux-uclibc-gcc
>
>I have the no input file message. So the avr32-linux-uclibc-gcc is there.

Please look carefully. There is no executable named "--with-...."
