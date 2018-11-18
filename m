From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 20:16:27 +0100
Subject: [Buildroot] [PATCH 1/1] uclibc-ng-test: fix build with glibc
 2.28
In-Reply-To: <20181114204224.27123-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 14 Nov 2018 21:42:24 +0100")
References: <20181114204224.27123-1-fontaine.fabrice@gmail.com>
Message-ID: <875zwunqlw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Since glibc 2.28
 > (https://savannah.gnu.org/forum/forum.php?forum_id=9205), the obsolete
 > functions encrypt, encrypt_r, setkey, setkey_r, cbc_crypt, ecb_crypt,
 > and des_setparity are no longer available to newly linked binaries, and
 > the headers <rpc/des_crypt.h> and <rpc/rpc_des.h> are no longer
 > installed. These functions encrypted and decrypted data with the DES
 > block cipher, which is no longer considered secure. Software that still
 > uses these functions should switch to a modern cryptography library,
 > such as libgcrypt.

 > So add a NO_CRYPT variable to disable test/crypt

 > Fixes:
 >  - http://autobuild.buildroot.org/results/158438debb0ce313b012b871e199bed42ba38294

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
