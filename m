From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 14:30:59 +0100
Subject: [Buildroot] [PATCH] package/rauc: disable systemd for host build
In-Reply-To: <20201113151558.1041972-1-b.bilas@grinn-global.com> (Bartosz
 Bilas's message of "Fri, 13 Nov 2020 16:15:58 +0100")
References: <20201113151558.1041972-1-b.bilas@grinn-global.com>
Message-ID: <87v9e883qk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Bilas <b.bilas@grinn-global.com> writes:

 > Since there is no necessity to have the support of systemd
 > within the host variant let's disable it unconditionally
 > to solve the following errors:

 > /usr/bin/install -c -m 644 data/rauc.service '/usr/lib/systemd/system'
 > /usr/bin/install: cannot create regular file '/usr/lib/systemd/system/rauc.service': Permission denied
 > /usr/bin/install -c -m 644 data/de.pengutronix.rauc.conf 'no'
 > make[4]: *** [Makefile:1700: install-nodist_systemdunitDATA] Error 1
 > make[4]: *** Waiting for unfinished jobs....

 > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
