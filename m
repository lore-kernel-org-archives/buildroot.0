From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2019 20:24:20 +0100
Subject: [Buildroot] [PATCH v5 2/2] busybox: wait for ipv6 default route
 in udhcpc6
In-Reply-To: <20190521025428.9409-2-sam@mendozajonas.com> (Samuel
 Mendoza-Jonas's message of "Tue, 21 May 2019 12:54:28 +1000")
References: <20190521025428.9409-1-sam@mendozajonas.com>
 <20190521025428.9409-2-sam@mendozajonas.com>
Message-ID: <87y2x6htzv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Mendoza-Jonas <sam@mendozajonas.com> writes:

 > udhcpc6 implements "stateful" DHCPv6 for explicitly requesting an address
 > and other configuration information. A major difference between DHCPv4
 > and DHCPv6 is that DHCPv6 does *not* advertise a default route; this is
 > determined by normal IPv6 autoconfiguration.
 > Included is a change from Rob, which if handling a DHCPv6 address waits

Who is Rob?

 > a moment for the IPv6 route to be configured; as above this doesn't come
 > from DHCPv6 but rather the IPv6 Router Advertisement (RA) which happens
 > independently from udhcpc6. The intent here is to try and ensure that
 > the interface is route-able upon the script's completion as it would be
 > if called from udhcpc.

 > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
 > ---
 > v5: Split into two patches, modify the wait_for_ipv6_default_route loop
 > to resemble the loop in package/ifupdown-scripts/network/if-pre-up.d/wait_iface
 > v4: Expand description of stateful DHCPv6 in commit message
 > v3: Point out 'stateful' DHCPv6 in commit, send to the correct list...
 > v2: Avoid bashisms

Committed after extending/rewording the commit message a bit, including
mentioning IF_WAIT_DELAY - thanks.

-- 
Bye, Peter Korsgaard
