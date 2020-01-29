From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jan 2020 20:48:38 +0100
Subject: [Buildroot] [PATCH] package/go: security bump to version 1.13.7
In-Reply-To: <20200128223743.17366-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 28 Jan 2020 23:37:43 +0100")
References: <20200128223743.17366-1-peter@korsgaard.com>
Message-ID: <87h80e9h7t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - Panic in crypto/x509 certificate parsing and golang.org/x/crypto/cryptobyte

 > On 32-bit architectures, a malformed input to crypto/x509 or the ASN.1
 > parsing functions of golang.org/x/crypto/cryptobyte can lead to a panic.
 > The malformed certificate can be delivered via a crypto/tls connection to a
 > client, or to a server that accepts client certificates.  net/http clients
 > can be made to crash by an HTTPS server, while net/http servers that accept
 > client certificates will recover the panic and are unaffected.  Thanks to
 > Project Wycheproof for providing the test cases that led to the discovery of
 > this issue.  The issue is CVE-2020-7919 and Go issue golang.org/issue/36837.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
