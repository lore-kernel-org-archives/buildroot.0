From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 20:48:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: add
 security fix for CVE-2020-14347
In-Reply-To: <ovpn1hxmln.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Fri, 28 Aug 2020 19:03:20 +0200")
References: <20200810064109.447089-1-bernd.kuhls@t-online.de>
 <20200811234906.051e8caa@windsurf.home>
 <ovpn1hxmln.ln2@ID-313208.user.individual.net>
Message-ID: <878sdymwsk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Am Tue, 11 Aug 2020 23:49:06 +0200 schrieb Thomas Petazzoni via buildroot:
 >> This raises a question: what about the older X.org server releases?
 >> According to the NIST CVE entry, all versions prior to 1.20.9 are
 >> affected, so should the patch be backported to the other X.org server
 >> versions we support ?

 > Hi Thomas,

 > the bump to 1.20.9 fixed four CVEs in total which makes backporting 
 > upstream patches more complicated as time passes by and new issues arise, 
 > upstream does not update the older branches anymore:
 > https://cgit.freedesktop.org/xorg/xserver/

 > Due to the fact that personally I have no use for the older X.org server 
 > versions I would like to raise the question whether we can remove them? 
 > From my POV these older versions are unmaintained in buildroot because I 
 > want to concentrate on the current release which is the one I am using.

They were added to support various binary X11 video drivers,
E.G. nvidia-tegra23 for 1.14.x and amd-catalyst for 1.19.x. Given that
none of them have seen any real updates for ~5 years, I am fine with
removing those packages and the older xserver versions.

Care to send patches for this?

-- 
Bye, Peter Korsgaard
