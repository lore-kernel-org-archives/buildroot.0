From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Oct 2018 18:08:35 +0200
Subject: [Buildroot] [PATCH] tinc: security bump to version 1.0.35
In-Reply-To: <20181009083959.17108-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 9 Oct 2018 10:39:59 +0200")
References: <20181009083959.17108-1-peter@korsgaard.com>
Message-ID: <87va5sfxx8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2018-16758: Michael Yonli discovered that tinc 1.0.34 and earlier allow
 > a man-in-the-middle attack that, even if the MITM cannot decrypt the traffic
 > sent between the two endpoints, when the MITM can correctly predict when an
 > ephemeral key exchange message is sent in a TCP connection between two
 > nodes, allows the MITM to force one node to send UDP packets in plaintext.
 > The tinc 1.1pre versions are not affected by this.

 > CVE-2018-16738: Michael Yonli discoverd that tinc versions 1.0.30 to 1.0.34
 > allow an oracle attack, similar to CVE-2018-16737, but due to the
 > mitigations put in place for the Sweet32 attack in tinc 1.0.30, it now
 > requires a timing attack that has only a limited time to complete.  Tinc
 > 1.1pre16 and earlier are also affected if there are nodes on the same VPN
 > that still use the legacy protocol from tinc version 1.0.x.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
