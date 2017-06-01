From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:40:46 +0200
Subject: [Buildroot] [PATCH] strongswan: add upstream security patches
In-Reply-To: <20170530130324.28875-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 30 May 2017 15:03:24 +0200")
References: <20170530130324.28875-1-peter@korsgaard.com>
Message-ID: <871sr3ixe9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > CVE-2017-9022 - RSA public keys passed to the gmp plugin aren't
 > validated sufficiently before attempting signature verification, so that
 > invalid input might lead to a floating point exception and crash of the
 > process.  A certificate with an appropriately prepared public key sent by a
 > peer could be used for a denial-of-service attack.

 > https://www.strongswan.org/blog/2017/05/30/strongswan-vulnerability-%28cve-2017-9022%29.html

 > CVE-2017-9023 - ASN.1 CHOICE types are not correctly handled by the ASN.1
 > parser when parsing X.509 certificates with extensions that use such types.
 > This could lead to infinite looping of the thread parsing a specifically
 > crafted certificate.

 > https://www.strongswan.org/blog/2017/05/30/strongswan-vulnerability-%28cve-2017-9023%29.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
