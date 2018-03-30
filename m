From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 08:27:28 +0200
Subject: [Buildroot] [PATCH] libopenssl: security bump to version 1.0.2o
In-Reply-To: <20180329145209.7878-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 29 Mar 2018 16:52:09 +0200")
References: <20180329145209.7878-1-peter@korsgaard.com>
Message-ID: <87605e84dr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > Constructed ASN.1 types with a recursive definition could exceed the stack
 > (CVE-2018-0739)

 > Constructed ASN.1 types with a recursive definition (such as can be found in
 > PKCS7) could eventually exceed the stack given malicious input with
 > excessive recursion.  This could result in a Denial Of Service attack.
 > There are no such structures used within SSL/TLS that come from untrusted
 > sources so this is considered safe.

 > Incorrect CRYPTO_memcmp on HP-UX PA-RISC (CVE-2018-0733)

 > Because of an implementation bug the PA-RISC CRYPTO_memcmp function is
 > effectively reduced to only comparing the least significant bit of each
 > byte.  This allows an attacker to forge messages that would be considered as
 > authenticated in an amount of tries lower than that guaranteed by the
 > security claims of the scheme.  The module can only be compiled by the HP-UX
 > assembler, so that only HP-UX PA-RISC targets are affected.

 > rsaz_1024_mul_avx2 overflow bug on x86_64 (CVE-2017-3738)

 > This issue has been reported in a previous OpenSSL security advisory and a
 > fix was provided for OpenSSL 1.0.2.  Due to the low severity no fix was
 > released at that time for OpenSSL 1.1.0.  The fix is now available in
 > OpenSSL 1.1.0h.

 > There is an overflow bug in the AVX2 Montgomery multiplication procedure
 > used in exponentiation with 1024-bit moduli.  No EC algorithms are affected.
 > Analysis suggests that attacks against RSA and DSA as a result of this
 > defect would be very difficult to perform and are not believed likely.
 > Attacks against DH1024 are considered just feasible, because most of the
 > work necessary to deduce information about a private key may be performed
 > offline.  The amount of resources required for such an attack would be
 > significant.  However, for an attack on TLS to be meaningful, the server
 > would have to share the DH1024 private key among multiple clients, which is
 > no longer an option since CVE-2016-0701.

 > This only affects processors that support the AVX2 but not ADX extensions
 > like Intel Haswell (4th generation).

 > For more details, see https://www.openssl.org/news/secadv/20180327.txt

 > The copyright year changed in LICENSE, so adjust the hash to match.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
