From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 May 2015 23:22:15 +0200
Subject: [Buildroot] [PATCH] package/iproute2: disable iptables support
	for static build
In-Reply-To: <1431982453-17867-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Mon, 18 May 2015 22:54:13 +0200")
References: <1431982453-17867-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87vbfl39tk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > If iptable support is enabled, it will try to build m_xt.so even
 > for static build only.

 > So, disable iptables support for static build and remove
 > TC_CONFIG_IPSET and TC_CONFIG_XT if previously added by the
 > configure script.

 > Fixes:
 > http://autobuild.buildroot.net/results/3b3/3b37871bdf5766677fc20dca22c13177091d104f/

FYI, I ended up applying Baruch's patch (and then some followup patches
of my own). Your two patches were almost identical, but for his patch I
didn't have to drop the SED lines, and I was lazy ;)

Thanks!

-- 
Bye, Peter Korsgaard
