From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Oct 2017 23:01:01 +0200
Subject: [Buildroot] [PATCH] musl: add upstream security fix for
	CVE-2017-15650
In-Reply-To: <20171021191259.20733-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 21 Oct 2017 21:12:59 +0200")
References: <20171021191259.20733-1-peter@korsgaard.com>
Message-ID: <87po9gb4he.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the upstream announcement:
 > http://www.openwall.com/lists/oss-security/2017/10/19/5

 > Felix Wilhelm has discovered a flaw in the dns response parsing for
 > musl libc 1.1.16 that leads to overflow of a stack-based buffer.
 > Earlier versions are also affected.

 > When an application makes a request via getaddrinfo for both IPv4 and
 > IPv6 results (AF_UNSPEC), an attacker who controls or can spoof the
 > nameservers configured in resolv.conf can reply to both the A and AAAA
 > queries with A results. Since A records are smaller than AAAA records,
 > it's possible to fit more addresses than the precomputed bound, and a
 > buffer overflow occurs.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
