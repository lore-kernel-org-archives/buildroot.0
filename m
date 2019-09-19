From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Sep 2019 22:43:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
 version 2.16.3
In-Reply-To: <20190918171451.3294-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 18 Sep 2019 19:14:51 +0200")
References: <20190918171451.3294-1-fontaine.fabrice@gmail.com>
Message-ID: <875zlo10gw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Remove second patch (already in version)
 > - Fix a missing error detection in ECJPAKE. This could have caused a
 >   predictable shared secret if a hardware accelerator failed and the
 >   other side of the key exchange had a similar bug.
 > - When writing a private EC key, use a constant size for the private
 >   value, as specified in RFC 5915. Previously, the value was written as
 >   an ASN.1 INTEGER, which caused the size of the key to leak about 1 bit
 >   of information on average and could cause the value to be 1 byte too
 >   large for the output buffer.
 > - The deterministic ECDSA calculation reused the scheme's HMAC-DRBG to
 >   implement blinding. Because of this for the same key and message the
 >   same blinding value was generated. This reduced the effectiveness of
 >   the countermeasure and leaked information about the private key
 >   through side channels. Reported by Jack Lloyd.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
