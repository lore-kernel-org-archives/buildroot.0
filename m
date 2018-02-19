From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Feb 2018 23:48:52 +0100
Subject: [Buildroot] [PATCH] quagga: add upstream security fixes
In-Reply-To: <20180219155059.25120-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 19 Feb 2018 16:50:59 +0100")
References: <20180219155059.25120-1-peter@korsgaard.com>
Message-ID: <87a7w4h9yj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2018-5378

 >     It was discovered that the Quagga BGP daemon, bgpd, does not
 >     properly bounds check data sent with a NOTIFY to a peer, if an
 >     attribute length is invalid. A configured BGP peer can take
 >     advantage of this bug to read memory from the bgpd process or cause
 >     a denial of service (daemon crash).

 >     https://www.quagga.net/security/Quagga-2018-0543.txt

 > CVE-2018-5379

 >     It was discovered that the Quagga BGP daemon, bgpd, can double-free
 >     memory when processing certain forms of UPDATE message, containing
 >     cluster-list and/or unknown attributes, resulting in a denial of
 >     service (bgpd daemon crash).

 >     https://www.quagga.net/security/Quagga-2018-1114.txt

 > CVE-2018-5380

 >     It was discovered that the Quagga BGP daemon, bgpd, does not
 >     properly handle internal BGP code-to-string conversion tables.

 >     https://www.quagga.net/security/Quagga-2018-1550.txt

 > CVE-2018-5381

 >     It was discovered that the Quagga BGP daemon, bgpd, can enter an
 >     infinite loop if sent an invalid OPEN message by a configured peer.
 >     A configured peer can take advantage of this flaw to cause a denial
 >     of service (bgpd daemon not responding to any other events; BGP
 >     sessions will drop and not be reestablished; unresponsive CLI
 >     interface).

 >     https://www.quagga.net/security/Quagga-2018-1975.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
