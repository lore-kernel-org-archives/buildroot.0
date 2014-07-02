From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 02 Jul 2014 23:12:25 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-07-01
References: <20140702063009.4715D1017F9@stock.ovh.net>
 <20140702094513.6ec730f0@free-electrons.com>
Message-ID: <XnsA35EEC130C64AberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140702094513.6ec730f0 at free-electrons.com: 

>>    powerpc |     xserver_xorg-server-1.15.1 | NOK |
>>    http://autobuild.buildroot.net/results/1f25f744771fbb5124dca4563d79ea
>>    92cbfd72a3/ 
> 
> Bernd, despite the commit
> http://git.buildroot.net/buildroot/commit/?id=e244eb12dfc50bb56167d5fdaef
> 3aac52b0ff6a3 being merged, we still see a parallel installation issue
> here it seems. 

Hi,

unlike the time when I created the patch you mentioned (still no feedback on 
upstream bugzilla for it btw.) I can not reproduce the build error today, 
even with BR2_JLEVEL=128 :(

Currently I am investigating the necessity to keep "install-data" in 
XSERVER_XORG_SERVER_INSTALL_STAGING_OPT, maybe calling both "install install-
data" causes the build error... This was introduced in 2008

http://git.buildroot.net/buildroot/commit/package/x11r7/xserver_xorg-
server/xserver_xorg-server.mk?id=d4e56ff4dc8a0528550eb8503956bdcddb2fe516

and might not be needed anymore. Currently I am comparing the build results 
with and without the "install-data" make target. This will take some time 
because of the various options the package provides ;)

Regards, Bernd
