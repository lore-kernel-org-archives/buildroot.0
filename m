From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Oct 2012 15:47:21 +0200
Subject: [Buildroot] [PATCH] netatalk: bump version
In-Reply-To: <1349108616-5814-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Mon, 1 Oct 2012 18:23:36 +0200")
References: <1349108616-5814-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87sj9p3wk6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 Maxime> Netatalk goes to version 3.0.
 Maxime> The startup script has changed too, there is now only one binary called
 Maxime> netatalk. No more afpd, cnid, ... at startup ! They are executed by netatalk.

 Maxime> All the config is done within /etc/afp.conf, look at :
 Maxime> http://netatalk.sourceforge.net/3.0/htmldocs/upgrade.html
 Maxime> for more info about the upgrade process.

I did a quick test build here:

  CC     afpd-switch.o
status.c:38:18: fatal error: krb5.h: No such file or directory
compilation terminated.
make[4]: *** [afpd-status.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[4]: Leaving directory `/home/peko/source/buildroot/output/build/netatalk-3.0/etc/afpd'

We don't have kerberos in buildroot, so I added --without-kerberos and
committed, thanks.

-- 
Bye, Peter Korsgaard
