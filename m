From: Spielmann Werner <Werner.Spielmann@SWAROVSKI.COM>
Date: Wed, 26 Nov 2014 06:37:05 +0000
Subject: [Buildroot] buildroot-20141121 -> building RTAI => syntax error
 near unexpected token
In-Reply-To: <878uizs2f9.fsf@dell.be.48ers.dk>
References: <2e63bbce0d1b4475b10927b4b08aeb5c@dsw332.wattens.swarovski.com>
 <878uizs2f9.fsf@dell.be.48ers.dk>
Message-ID: <8e7d180773194d04b83f7a52d6b1a444@dsw332.wattens.swarovski.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

thanks a lot for your help!
You were absolutely right!

Have a nice day!

Werner


-----Urspr?ngliche Nachricht-----
Von: Peter Korsgaard [mailto:jacmet at gmail.com] Im Auftrag von Peter Korsgaard
Gesendet: Dienstag, 25. November 2014 16:52
An: Spielmann Werner
Cc: buildroot at busybox.net
Betreff: Re: buildroot-20141121 -> building RTAI => syntax error near unexpected token

>>>>> "Spielmann" == Spielmann Werner <Werner.Spielmann@SWAROVSKI.COM> writes:

 > Hallo,
 > here I'm back with new troubles...   ;-)



 > Please is there anybody out there who can give me a hint?



 > I want to build the system on an Ubuntu 14.04/32 bit system - but building rtai there is aproblem I don't understand.

 > It seems the sed-action failed.


 > (SED) 's%^staging=.*%staging=/home/spiewe/svnws/buildroot-2014.11.21/output/host/usr/i686-buildroot-linux-uclibc/sysroot%' /home/spiewe/svnws/buildroot-2014.11.21/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/bin/rtai-config

 > /bin/sh: -c: line 0: syntax error near unexpected token `'s%^staging=.*%staging=/home/spiewe/svnws/buildroot-2014.11.21/output/host/usr/i686-buildroot-linux-uclibc/sysroot%''

Good catch! There's a dollar sign ($) missing before (SED). Please change it in package/rtai/rtai.mk (RTAI_POST_PATCH_FIXUP).

I'll fix it in git for the upcoming 2014.11 release.

--
Bye, Peter Korsgaard
