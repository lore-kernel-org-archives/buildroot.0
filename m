From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 21:40:53 +0100
Subject: [Buildroot] [PATCH] package/libpcap: disable dbus to break
 circular dependency
In-Reply-To: <87d1255df9dbfe03c8503a1fdb74bb2385675351.1552156094.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sat, 9 Mar 2019 20:28:14 +0200")
References: <87d1255df9dbfe03c8503a1fdb74bb2385675351.1552156094.git.baruch@tkos.co.il>
Message-ID: <87mulik7qi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The optional dbus dependency of libpcap creates a circular dependency
 > chain:

 > $ make libpcap-show-recursive-depends

 > Recursion detected for  : systemd
 > which is a dependency of: dbus
 > which is a dependency of: libpcap
 > which is a dependency of: iptables
 > which is a dependency of: systemd
 > make: *** [package/libpcap/libpcap.mk:55: libpcap-show-recursive-depends] Error 1

 > Of all these dependencies the one of libpcap on dbus seems to be less
 > useful. Drop it.

 > Fixes:
 > http://autobuild.buildroot.net/results/0b5d18bff816cbcee11e8645449701722d956de5/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
