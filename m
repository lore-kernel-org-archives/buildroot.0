From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2021 21:29:53 +0100
Subject: [Buildroot] [PATCH] package/nodejs: security bump to version
 v12.21.0
In-Reply-To: <20210225102634.15970-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 25 Feb 2021 11:26:33 +0100")
References: <20210225102634.15970-1-peter@korsgaard.com>
Message-ID: <87wnuvvqke.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2021-22883: HTTP2 'unknownProtocol' cause Denial of Service by resource exhaustion

 > Affected Node.js versions are vulnerable to denial of service attacks when
 > too many connection attempts with an 'unknownProtocol' are established.
 > This leads to a leak of file descriptors.  If a file descriptor limit is
 > configured on the system, then the server is unable to accept new
 > connections and prevent the process also from opening, e.g.  a file.  If no
 > file descriptor limit is configured, then this lead to an excessive memory
 > usage and cause the system to run out of memory.

 > CVE-2021-22884: DNS rebinding in --inspect

 > Affected Node.js versions are vulnerable to denial of service attacks when
 > the whitelist includes ?localhost6?.  When ?localhost6? is not present in
 > /etc/hosts, it is just an ordinary domain that is resolved via DNS, i.e.,
 > over network.  If the attacker controls the victim's DNS server or can spoof
 > its responses, the DNS rebinding protection can be bypassed by using the
 > ?localhost6? domain.  As long as the attacker uses the ?localhost6? domain,
 > they can still apply the attack described in CVE-2018-7160.

 > For more details, see the advisory:
 > https://nodejs.org/en/blog/vulnerability/february-2021-security-releases/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
