From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:25:11 +0200
Subject: [Buildroot] [PATCH] bind: bump version to 9.11.0-P5 (security)
In-Reply-To: <20170413133209.36781-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Thu, 13 Apr 2017 14:32:09 +0100")
References: <20170413133209.36781-1-Vincent.Riera@imgtec.com>
Message-ID: <871sshwqug.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Security Fixes:
 >  - rndc "" could trigger an assertion failure in named. This flaw is
 >    disclosed in (CVE-2017-3138). [RT #44924]
 >  - Some chaining (i.e., type CNAME or DNAME) responses to upstream
 >    queries could trigger assertion failures. This flaw is disclosed in
 >    CVE-2017-3137. [RT #44734]
 >  - dns64 with break-dnssec yes; can result in an assertion failure. This
 >    flaw is disclosed in CVE-2017-3136. [RT #44653]
 >  - If a server is configured with a response policy zone (RPZ) that
 >    rewrites an answer with local data, and is also configured for DNS64
 >    address mapping, a NULL pointer can be read triggering a server
 >    crash. This flaw is disclosed in CVE-2017-3135. [RT #44434]
 >  - A coding error in the nxdomain-redirect feature could lead to an
 >    assertion failure if the redirection namespace was served from a
 >    local authoritative data source such as a local zone or a DLZ instead
 >    of via recursive lookup. This flaw is disclosed in CVE-2016-9778.
 >    [RT #43837]
 >  - named could mishandle authority sections with missing RRSIGs,
 >    triggering an assertion failure. This flaw is disclosed in
 >    CVE-2016-9444. [RT #43632]
 >  - named mishandled some responses where covering RRSIG records were
 >    returned without the requested data, resulting in an assertion
 >    failure. This flaw is disclosed in CVE-2016-9147. [RT #43548]
 >  - named incorrectly tried to cache TKEY records which could trigger an
 >    assertion failure when there was a class mismatch. This flaw is
 >    disclosed in CVE-2016-9131. [RT #43522]
 >  - It was possible to trigger assertions when processing responses
 >    containing answers of type DNAME. This flaw is disclosed in
 >    CVE-2016-8864. [RT #43465]

 > Full release notes:

 >   ftp://ftp.isc.org/isc/bind9/9.11.0-P5/RELEASE-NOTES-bind-9.11.0-P5.html

 > Also, remove --enable-rrl configure option from bind.mk as it doesn't
 > exist anymore.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
