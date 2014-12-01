From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 22:59:27 +0100
Subject: [Buildroot] [PATCHv3 19/74] gpsd: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <20141130153815.GX4124@free.fr> (Yann E. MORIN's message of "Sun, 
 30 Nov 2014 16:38:15 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-20-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141130153815.GX4124@free.fr>
Message-ID: <87egsjc9q8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 >> +define GPSD_INSTALL_INIT_SYSV
 >> +	$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd
 >> +	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd

 > Unrelated to your patch, but since the variable is a plural DEVICES, I
 > would expect to be able to set more than one device. In this case, what
 > is the format of this devices list? Is it comma-separated? If so, the
 > sed expression above would break, no?

 > (Cc-ing Simon and Gustavo, since they have contributed significantly to
 > that package.)

I don't know gpsd, but judging from Config.in, S50gpsd and
http://www.catb.org/gpsd/gpsd.html it looks to be space separated, so it
should be OK (unless one of the words ends up with a comma).


-- 
Bye, Peter Korsgaard
