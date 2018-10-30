From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 21:09:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: Add upstream patch to
 fix CVE-2018-15688
In-Reply-To: <20181030175013.7786-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 30 Oct 2018 18:50:13 +0100")
References: <20181030175013.7786-1-bernd.kuhls@t-online.de>
Message-ID: <87bm7bdwnh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

Please always add a short description what the CVE is about. I have
added:

Systemd-networkd is vulnerable to an out out-of-bounds heap write in the
DHCPv6 client when handling options sent by network adjacent DHCP
servers. A attacker could exploit this via malicious DHCP server to
corrupt heap memory on client machines, resulting in a denial of service
or potential code execution.


> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  ...we-have-enough-space-for-the-DHCP6-o.patch | 30 +++++++++++++++++++
 >  1 file changed, 30 insertions(+)
 >  create mode 100644 package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch

 > diff --git
 > a/package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
 > b/package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
 > new file mode 100644
 > index 0000000000..6a72a38988
 > --- /dev/null
 > +++ b/package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
 > @@ -0,0 +1,30 @@
 > +From 49653743f69658aeeebdb14faf1ab158f1f2cb20 Mon Sep 17 00:00:00 2001
 > +From: Lennart Poettering <lennart@poettering.net>
 > +Date: Fri, 19 Oct 2018 12:12:33 +0200
 > +Subject: [PATCH] dhcp6: make sure we have enough space for the DHCP6 option
 > + header
 > +
 > +Fixes CVE-2018-15688:
 > +https://security-tracker.debian.org/tracker/CVE-2018-15688

That page mentions that a similar fix is needed for networkmanager. Will
you also send a patch for that?

Committed, thanks.

-- 
Bye, Peter Korsgaard
