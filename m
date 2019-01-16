From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 16:38:39 +0100
Subject: [Buildroot] [PATCH] package/wolfssl: security bump to version
 3.5.17
In-Reply-To: <20190116124521.17109-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 16 Jan 2019 13:45:21 +0100")
References: <20190116124521.17109-1-peter@korsgaard.com>
Message-ID: <87bm4gd340.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the release notes:
 > This release of wolfSSL includes a fix for 1 security vulnerability.

 > Medium level fix for potential cache attack with a variant of
 > Bleichenbacher?s attack.  Earlier versions of wolfSSL leaked PKCS #1 v1.5
 > padding information during private key decryption that could lead to a
 > potential padding oracle attack.  It is recommended that users update to the
 > latest version of wolfSSL if they have RSA cipher suites enabled and have
 > the potential for malicious software to be ran on the same system that is
 > performing RSA operations.  Users that have only ECC cipher suites enabled
 > and are not performing RSA PKCS #1 v1.5 Decryption operations are not
 > vulnerable.  Also users with TLS 1.3 only connections are not vulnerable to
 > this attack.  Thanks to Eyal Ronen (Weizmann Institute), Robert Gillham
 > (University of Adelaide), Daniel Genkin (University of Michigan), Adi Shamir
 > (Weizmann Institute), David Wong (NCC Group), and Yuval Yarom (University of
 > Adelaide and Data61) for the report.

 > The paper for further reading on the attack details can be found at
 > http://cat.eyalro.net/cat.pdf

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  ...-with-the-creation-of-dummy-fips.h-header.patch | 33 ----------------------
 >  package/wolfssl/wolfssl.hash                       |  2 +-
 >  package/wolfssl/wolfssl.mk                         |  2 +-
 >  3 files changed, 2 insertions(+), 35 deletions(-)
 >  delete mode 100644 package/wolfssl/0001-Fix-issue-with-the-creation-of-dummy-fips.h-header.patch

Committed after adding a comment that this patch is now upstream, thanks.

-- 
Bye, Peter Korsgaard
