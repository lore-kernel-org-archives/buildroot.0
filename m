From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 22:48:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
 version 2.16.7
In-Reply-To: <20200713101242.250717-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 13 Jul 2020 12:12:42 +0200")
References: <20200713101242.250717-1-fontaine.fabrice@gmail.com>
Message-ID: <878sfcmw5o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix a side channel vulnerability in modular exponentiation that could
 >   reveal an RSA private key used in a secure enclave.
 > - Fix side channel in mbedtls_ecp_check_pub_priv() and
 >   mbedtls_pk_parse_key() / mbedtls_pk_parse_keyfile() (when loading a
 >   private key that didn't include the uncompressed public key), as well
 >   as mbedtls_ecp_mul() / mbedtls_ecp_mul_restartable() when called with
 >   a NULL f_rng argument. An attacker with access to precise enough
 >   timing and memory access information (typically an untrusted operating
 >   system attacking a secure enclave) could fully recover the ECC private
 >   key.
 > - Fix issue in Lucky 13 counter-measure that could make it ineffective
 >   when hardware accelerators were used (using one of the
 >   MBEDTLS_SHAxxx_ALT macros). This would cause the original Lucky 13
 >   attack to be possible in those configurations, allowing an active
 >   network attacker to recover plaintext after repeated timing
 >   measurements under some conditions.

 > https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2020-07

 > Switch to github to get latest release

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
