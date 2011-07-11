From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 13:42:30 +0200
Subject: [Buildroot] [PATCH v2] busybox: provide /etc/mdev.conf if mdev
	is used
In-Reply-To: <1310379951-11019-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Mon, 11 Jul 2011 12:25:51 +0200")
References: <1310140073-14231-1-git-send-email-luca@lucaceresoli.net>
 <1310379951-11019-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87tyatnivt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> Without an mdev.conf file installed, mdev generates some /dev entries in
 Luca> an incorrect or non-standard way. Some examples:
 Luca>  1. /dev/null has permissions 660, but it should be accessible to normal
 Luca>     users;
 Luca>  2. alsa devices get created in /dev, not /dev/snd as is more common,
 Luca>     and as the default value of BR2_PACKAGE_ALSA_LIB_DEVDIR suggests;
 Luca>  3. event<N> files are created in /dev, not /dev/input.

 Luca> This mdev.conf is a selection from the examples provided in the busybox
 Luca> sources with minor tweaks.

Committed, thanks.

-- 
Bye, Peter Korsgaard
