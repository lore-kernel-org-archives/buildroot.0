From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Dec 2018 22:59:13 +0100
Subject: [Buildroot] [PATCH-2018.02.x 2/2] samba4: security bump to
 version 4.8.7
In-Reply-To: <20181129143113.19270-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 29 Nov 2018 15:31:13 +0100")
References: <20181129143113.19270-1-peter@korsgaard.com>
 <20181129143113.19270-2-peter@korsgaard.com>
Message-ID: <871s6y46ha.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 >  - CVE-2018-14629:
 >    All versions of Samba from 4.0.0 onwards are vulnerable to infinite
 >    query recursion caused by CNAME loops. Any dns record can be added via
 >    ldap by an unprivileged user using the ldbadd tool, so this is a
 >    security issue.

 >  - CVE-2018-16841:
 >    When configured to accept smart-card authentication, Samba's KDC will call
 >    talloc_free() twice on the same memory if the principal in a validly signed
 >    certificate does not match the principal in the AS-REQ.

 >    This is only possible after authentication with a trusted certificate.

 >    talloc is robust against further corruption from a double-free with
 >    talloc_free() and directly calls abort(), terminating the KDC process.

 >    There is no further vulnerability associated with this issue, merely a
 >    denial of service.

 >  - CVE-2018-16851:
 >    During the processing of an LDAP search before Samba's AD DC returns
 >    the LDAP entries to the client, the entries are cached in a single
 >    memory object with a maximum size of 256MB.  When this size is
 >    reached, the Samba process providing the LDAP service will follow the
 >    NULL pointer, terminating the process.

 >    There is no further vulnerability associated with this issue, merely a
 >    denial of service.

 >  - CVE-2018-16853:
 >    A user in a Samba AD domain can crash the KDC when Samba is built in the
 >    non-default MIT Kerberos configuration.

 >    With this advisory we clarify that the MIT Kerberos build of the Samba
 >    AD DC is considered experimental.  Therefore the Samba Team will not
 >    issue security patches for this configuration.

 > For more details, see the release notes:

 > https://www.samba.org/samba/history/samba-4.8.7.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
