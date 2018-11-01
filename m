From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 14:32:16 +0100
Subject: [Buildroot] [PATCH v2,1/1] pppd: fix build with glibc 2.28
In-Reply-To: <20181031102825.30422-1-fontaine.fabrice@gmail.com>
References: <20181031102825.30422-1-fontaine.fabrice@gmail.com>
Message-ID: <20181101143216.7099e6e8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Oct 2018 11:28:25 +0100, Fabrice Fontaine wrote:
> Since glibc 2.28
> (https://savannah.gnu.org/forum/forum.php?forum_id=9205), the obsolete
> functions encrypt, encrypt_r, setkey, setkey_r, cbc_crypt, ecb_crypt,
> and des_setparity are no longer available to newly linked binaries, and
> the headers <rpc/des_crypt.h> and <rpc/rpc_des.h> are no longer
> installed. These functions encrypted and decrypted data with the DES
> block cipher, which is no longer considered secure. Software that still
> uses these functions should switch to a modern cryptography library,
> such as libgcrypt.
> 
> So retrieve an upstream patch to use openssl instead of these functions
> and a new patch to remove the unsafe header/library path
> '-I/usr/include/openssl'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c13ca8b8afa8de700caf8cd2fa1812b8552b3f4a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Add Signed-off-by and upstream link for upstream patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
