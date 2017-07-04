From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Jul 2017 17:33:26 +0200
Subject: [Buildroot] [PATCH] bind: security bump to version 9.11.1-P2
In-Reply-To: <20170702150148.22879-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 2 Jul 2017 17:01:48 +0200")
References: <20170702150148.22879-1-peter@korsgaard.com>
Message-ID: <877ezo2p4p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-3142: An error in TSIG authentication can permit unauthorized zone
 > transfers

 > An attacker who is able to send and receive messages to an authoritative DNS
 > server and who has knowledge of a valid TSIG key name may be able to
 > circumvent TSIG authentication of AXFR requests via a carefully constructed
 > request packet. A server that relies solely on TSIG keys for protection with
 > no other ACL protection could be manipulated into:

 > * providing an AXFR of a zone to an unauthorized recipient
 > * accepting bogus NOTIFY packets

 > https://kb.isc.org/article/AA-01504/74/CVE-2017-3142

 > CVE-2017-3041: An error in TSIG authentication can permit unauthorized dynamic
 > updates

 > An attacker who is able to send and receive messages to an authoritative DNS
 > server and who has knowledge of a valid TSIG key name for the zone and service
 > being targeted may be able to manipulate BIND into accepting an unauthorized
 > dynamic update.

 > https://kb.isc.org/article/AA-01503/74/CVE-2017-3143

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
