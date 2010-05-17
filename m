From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 May 2010 15:00:43 +0200
Subject: [Buildroot] [PATCH 7/8] avahi: needs IPv6
In-Reply-To: Peter Korsgaard's message of "\(unknown date\)"
References: <cover.1273836748.git.thomas.petazzoni@free-electrons.com>
	<cover.1273836748.git.thomas.petazzoni@free-electrons.com>
	<a535d4a03f344d8b31ffe0d95fa4d2147e0d3eb8.1273836748.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87wrv2znr8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
 Thomas> Otherwise the build fails with:
 Thomas> socket.c: In function 'avahi_mdns_mcast_join_ipv6':
 Thomas> socket.c:159: error: 'IPV6_DROP_MEMBERSHIP' undeclared (first use in this function)
 Thomas> socket.c:159: error: (Each undeclared identifier is reported only once
 Thomas> socket.c:159: error: for each function it appears in.)
 Thomas> socket.c:161: error: 'IPV6_ADD_MEMBERSHIP' undeclared (first use in this function)

 Peter> Strange, I'm using it here with a non-ipv6 / non-locale toolchain.

Looking closer I see that's with uclibc 0.9.30 - On 0.9.31 those defines
are protected by __UCLIBC_HAS_IPV6__.

I'll add a patch #ifdef'ing those functions out if not available, which
should give the same behaviour as with < 0.9.31.

-- 
Bye, Peter Korsgaard
