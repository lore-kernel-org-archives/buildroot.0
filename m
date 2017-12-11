From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Dec 2017 23:03:09 +0100
Subject: [Buildroot] [PATCH-2017.02.x] tor: security bump to version
 0.2.9.14
In-Reply-To: <20171211091722.13814-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 11 Dec 2017 10:17:22 +0100")
References: <20171211091722.13814-1-peter@korsgaard.com>
Message-ID: <87bmj4vs6a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following securoty issues:
 > - CVE-2017-8819: In Tor before 0.2.5.16, 0.2.6 through 0.2.8 before
 >   0.2.8.17, 0.2.9 before 0.2.9.14, 0.3.0 before 0.3.0.13, and 0.3.1 before
 >   0.3.1.9, the replay-cache protection mechanism is ineffective for v2 onion
 >   services, aka TROVE-2017-009.  An attacker can send many INTRODUCE2 cells
 >   to trigger this issue.

 > - CVE-2017-8820: In Tor before 0.2.5.16, 0.2.6 through 0.2.8 before
 >   0.2.8.17, 0.2.9 before 0.2.9.14, 0.3.0 before 0.3.0.13, and 0.3.1 before
 >   0.3.1.9, remote attackers can cause a denial of service (NULL pointer
 >   dereference and application crash) against directory authorities via a
 >   malformed descriptor, aka TROVE-2017-010.

 > - CVE-2017-8821: In Tor before 0.2.5.16, 0.2.6 through 0.2.8 before
 >   0.2.8.17, 0.2.9 before 0.2.9.14, 0.3.0 before 0.3.0.13, and 0.3.1 before
 >   0.3.1.9, an attacker can cause a denial of service (application hang) via
 >   crafted PEM input that signifies a public key requiring a password, which
 >   triggers an attempt by the OpenSSL library to ask the user for the
 >   password, aka TROVE-2017-011.

 > - CVE-2017-8822: In Tor before 0.2.5.16, 0.2.6 through 0.2.8 before
 >   0.2.8.17, 0.2.9 before 0.2.9.14, 0.3.0 before 0.3.0.13, and 0.3.1 before
 >   0.3.1.9, relays (that have incompletely downloaded descriptors) can pick
 >   themselves in a circuit path, leading to a degradation of anonymity, aka
 >   TROVE-2017-012.

 > - CVE-2017-8823: In Tor before 0.2.5.16, 0.2.6 through 0.2.8 before
 >   0.2.8.17, 0.2.9 before 0.2.9.14, 0.3.0 before 0.3.0.13, and 0.3.1 before
 >   0.3.1.9, there is a use-after-free in onion service v2 during intro-point
 >   expiration because the expiring list is mismanaged in certain error cases,
 >   aka TROVE-2017-013.

 > For more details, see the release notes:
 > https://lists.torproject.org/pipermail/tor-announce/2017-December/000147.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
