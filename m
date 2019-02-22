From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 17:58:41 +0100
Subject: [Buildroot] [PATCH] package/bind: security bump to version
 9.11.5-P4
In-Reply-To: <20190222134038.28900-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 22 Feb 2019 14:40:38 +0100")
References: <20190222134038.28900-1-peter@korsgaard.com>
Message-ID: <87y367iwu6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - named could crash during recursive processing of DNAME records when
 >   deny-answer-aliases was in use.  This flaw is disclosed in CVE-2018-5740.
 >   [GL #387]

 > - When recursion is enabled but the allow-recursion and allow-query-cache
 >   ACLs are not specified, they should be limited to local networks, but they
 >   were inadvertently set to match the default allow-query, thus allowing
 >   remote queries.  This flaw is disclosed in CVE-2018-5738.  [GL #309]

 > - Code change #4964, intended to prevent double signatures when deleting an
 >   inactive zone DNSKEY in some situations, introduced a new problem during
 >   zone processing in which some delegation glue RRsets are incorrectly
 >   identified as needing RRSIGs, which are then created for them using the
 >   current active ZSK for the zone.  In some, but not all cases, the
 >   newly-signed RRsets are added to the zone's NSEC/NSEC3 chain, but
 >   incompletely -- this can result in a broken chain, affecting validation of
 >   proof of nonexistence for records in the zone.  [GL #771]

 > - named could crash if it managed a DNSSEC security root with managed-keys
 >   and the authoritative zone rolled the key to an algorithm not supported by
 >   BIND 9.  This flaw is disclosed in CVE-2018-5745.  [GL #780]

 > - named leaked memory when processing a request with multiple Key Tag EDNS
 >   options present.  ISC would like to thank Toshifumi Sakaguchi for bringing
 >   this to our attention.  This flaw is disclosed in CVE-2018-5744.  [GL
 >   #772]

 > - Zone transfer controls for writable DLZ zones were not effective as the
 >   allowzonexfr method was not being called for such zones.  This flaw is
 >   disclosed in CVE-2019-6465.  [GL #790]

 > For more details, see the release notes:

 > http://ftp.isc.org/isc/bind9/9.11.5-P4/RELEASE-NOTES-bind-9.11.5-P4.html

 > Change the upstream URL to HTTPS as the webserver uses HSTS:

 >>>> bind 9.11.5-P4 Downloading
 > URL transformed to HTTPS due to an HSTS policy

 > Update the hash of the license file to account for a change of copyright
 > year:

 > -Copyright (C) 1996-2018  Internet Systems Consortium, Inc. ("ISC")
 > +Copyright (C) 1996-2019  Internet Systems Consortium, Inc. ("ISC")

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
