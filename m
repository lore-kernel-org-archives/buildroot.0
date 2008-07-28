From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Mon, 28 Jul 2008 14:50:29 +0200
Subject: [Buildroot] Bash failing
In-Reply-To: <8bf7d05b0807280413t58506a27jcfcf36ae301de559@mail.gmail.com>
References: <8bf7d05b0807260046q35afd439kf3d0a8b950dc5344@mail.gmail.com>	<488D8691.6070904@cetrtapot.si>
	<8bf7d05b0807280413t58506a27jcfcf36ae301de559@mail.gmail.com>
Message-ID: <488DC095.7000303@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan and Caroline Moore wrote:
> OK I guess I need some more help.
> 
> I thought buildroot took care of these details or am I meant to do
> something before typing make?

It should. ncurses package is responsible for termcap.h. I've just built 
the bash for i686 here, and haven't stumbled across your problem.

> 
> Would it help if I attached some of the files?

Show us the output of:
/buildroot $ find build_<arch> -name termcap.h

Here, for i686 it is:
/buildroot $ find build_i686 -name termcap.h
build_i686/ncurses-5.6/include/termcap.h
build_i686/bash-3.2/lib/termcap/termcap.h
build_i686/staging_dir/usr/include/termcap.h

.. adn for generic arm:
/buildroot $ find build_arm -name termcap.h
build_arm/ncurses-5.6/include/termcap.h
build_arm/bash-3.2/lib/termcap/termcap.h
build_arm/staging_dir/usr/include/termcap.h

The last line one is the one I suppose you are missing although I can't see why!?

Regards,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
