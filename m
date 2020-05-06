From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 07:13:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
 version 2.16.6
In-Reply-To: <20200414164448.2233648-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 14 Apr 2020 18:44:48 +0200")
References: <20200414164448.2233648-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1vxfxwx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-10932: fix side channel in ECC code that allowed an
 >   adversary with access to precise enough timing and memory access
 >   information (typically an untrusted operating system attacking a
 >   secure enclave) to fully recover an ECDSA private key.
 > - Fix a potentially remotely exploitable buffer overread in a DTLS
 >   client when parsing the Hello Verify Request message.
 > - Fix bug in DTLS handling of new associations with the same parameters
 >   (RFC 6347 section 4.2.8): after sending its HelloVerifyRequest, the
 >   server would end up with corrupted state and only send invalid records
 >   to the client. An attacker able to send forged UDP packets to the
 >   server could use that to obtain a Denial of Service. This could only
 >   happen when MBEDTLS_SSL_DTLS_CLIENT_PORT_REUSE was enabled in
 >   config.h (which it is by default).

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
