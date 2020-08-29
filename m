From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 11:58:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 4.5.0
In-Reply-To: <20200829075621.984037-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Aug 2020 09:56:21 +0200")
References: <20200829075621.984037-1-fontaine.fabrice@gmail.com>
Message-ID: <874kolkc3m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > wolfSSL version 4.5.0 contains 6 vulnerability fixes: 2 fixes for TLS 1.3,
 > 2 side channel attack mitigations, 1 fix for a potential private key leak
 > in a specific use case, 1 fix for DTLS including those 3 CVEs:

 > - Fix CVE-2020-12457: An issue was discovered in wolfSSL before 4.5.0.
 >   It mishandles the change_cipher_spec (CCS) message processing logic
 >   for TLS 1.3. If an attacker sends ChangeCipherSpec messages in a
 >   crafted way involving more than one in a row, the server becomes stuck
 >   in the ProcessReply() loop, i.e., a denial of service.
 > - Fix CVE-2020-15309: An issue was discovered in wolfSSL before 4.5.0,
 >   when single precision is not employed. Local attackers can conduct a
 >   cache-timing attack against public key operations. These attackers may
 >   already have obtained sensitive information if the affected system has
 >   been used for private key operations (e.g., signing with a private
 >   key).
 > - Fix CVE-2020-24585: An issue was discovered in the DTLS handshake
 >   implementation in wolfSSL before 4.5.0. Clear DTLS application_data
 >   messages in epoch 0 do not produce an out-of-order error. Instead,
 >   these messages are returned to the application.

 > Also update hash of LICENSING as well as WOLF_LICENSE due to later
 > verbage update with
 > https://github.com/wolfSSL/wolfssl/commit/970391319beb023680eccd0e447e76834dbb4808

 > https://www.wolfssl.com/docs/security-vulnerabilities/

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
