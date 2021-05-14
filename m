From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 May 2021 23:01:25 +0200
Subject: [Buildroot] [PATCH] package/prosody: security bump to version
 0.11.9
In-Reply-To: <20210514094309.18354-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 14 May 2021 11:43:09 +0200")
References: <20210514094309.18354-1-peter@korsgaard.com>
Message-ID: <87r1i9owre.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2021-32918: DoS via insufficient memory consumption controls

 >   It was discovered that default settings leave Prosody susceptible to
 >   remote unauthenticated denial-of-service (DoS) attacks via memory
 >   exhaustion when running under Lua 5.2 or Lua 5.3.  Lua 5.2 is the default
 >   and recommended Lua version for Prosody 0.11.x series.

 > - CVE-2021-32920: DoS via repeated TLS renegotiation causing excessive CPU
 >   consumption

 >   It was discovered that Prosody does not disable SSL/TLS renegotiation,
 >   even though this is not used in XMPP.  A malicious client may flood a
 >   connection with renegotiation requests to consume excessive CPU resources
 >   on the server.

 > - CVE-2021-32921: Use of timing-dependent string comparison with sensitive
 >   values

 >   It was discovered that Prosody does not use a constant-time algorithm for
 >   comparing certain secret strings when running under Lua 5.2 or later.
 >   This can potentially be used in a timing attack to reveal the contents of
 >   secret strings to an attacker.

 > - CVE-2021-32917: Use of mod_proxy65 is unrestricted in default
 >   configuration

 >   mod_proxy65 is a file transfer proxy provided with Prosody to facilitate
 >   the transfer of files and other data between XMPP clients.

 >   It was discovered that the proxy65 component of Prosody allows open access
 >   by default, even if neither of the users have an XMPP account on the local
 >   server, allowing unrestricted use of the server?s bandwidth.

 > - CVE-2021-32919: Undocumented dialback-without-dialback option insecure

 >   The undocumented option ?dialback_without_dialback? enabled an
 >   experimental feature for server-to-server authentication.  A flaw in this
 >   feature meant it did not correctly authenticate remote servers, allowing a
 >   remote server to impersonate another server when this option is enabled.

 > For more details, see the advisory:
 > https://prosody.im/security/advisory_20210512/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
