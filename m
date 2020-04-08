From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Apr 2020 14:50:01 +0200
Subject: [Buildroot] [git commit] package/libopenssl: security bump to
 version 1.1.1f
In-Reply-To: <20200402214407.728A587F43@busybox.osuosl.org> (Peter Korsgaard's
 message of "Thu, 2 Apr 2020 23:53:31 +0200")
References: <20200402214407.728A587F43@busybox.osuosl.org>
Message-ID: <871roykupy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=d397b231b7c7f02f9c52d13ac9d3d82b39f4f4c5
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes the following security issues (1.1.1e):

 > CVE-2019-1551 [Low severity]: There is an overflow bug in the x64_64
 > Montgomery squaring procedure used in exponentiation with 512-bit moduli.
 > No EC algorithms are affected.  Analysis suggests that attacks against
 > 2-prime RSA1024, 3-prime RSA1536, and DSA1024 as a result of this defect
 > would be very difficult to perform and are not believed likely.  Attacks
 > against DH512 are considered just feasible.  However, for an attack the
 > target would have to re-use the DH512 private key, which is not recommended
 > anyway.  Also applications directly using the low level API BN_mod_exp may
 > be affected if they use BN_FLG_CONSTTIME.  Reported by OSS-Fuzz and Guido
 > Vranken.

 > https://www.openssl.org/news/secadv/20191206.txt

 > CVE-2019-1563 [Low severity]: In situations where an attacker receives
 > automated notification of the success or failure of a decryption attempt an
 > attacker, after sending a very large number of messages to be decrypted, can
 > recover a CMS/PKCS7 transported encryption key or decrypt any RSA encrypted
 > message that was encrypted with the public RSA key, using a Bleichenbacher
 > padding oracle attack.  Applications are not affected if they use a
 > certificate together with the private RSA key to the CMS_decrypt or
 > PKCS7_decrypt functions to select the correct recipient info to decrypt.
 > Reported by Bernd Edlinger.

 > https://www.openssl.org/news/secadv/20190910.txt

 > Signed-off-by: Sbastien Szymanski <sebastien.szymanski@armadeus.com>
 > [Peter: mention security impact]
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
