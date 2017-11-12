From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Nov 2017 10:13:05 +0100
Subject: [Buildroot] [PATCH] wpa_supplicant: mesh support needs openssl
In-Reply-To: <20171111221823.9546-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 11 Nov 2017 23:18:23 +0100")
References: <20171111221823.9546-1-thomas.petazzoni@free-electrons.com>
Message-ID: <87k1yvuafy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > When BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING is enabeld,
 > wpa_supplicant currently fails to build with:

 > ../src/common/sae.o: In function `sae_cn_confirm.isra.2':
 > sae.c:(.text+0x168): undefined reference to `crypto_bignum_to_bin'
 > sae.c:(.text+0x198): undefined reference to `crypto_bignum_to_bin'
 > ../src/common/sae.o: In function `sae_cn_confirm_ffc':
 > sae.c:(.text+0x214): undefined reference to `crypto_bignum_to_bin'
 > sae.c:(.text+0x22c): undefined reference to `crypto_bignum_to_bin'
 > ../src/common/sae.o: In function `sae_cn_confirm_ecc':
 > sae.c:(.text+0x2a4): undefined reference to `crypto_ec_point_to_bin'
 > sae.c:(.text+0x2c0): undefined reference to `crypto_ec_point_to_bin'

 > [...]

 > This is due to the fact that the SAE code, used for the mesh network
 > support, needs OpenSSL support. Therefore, we ensure that
 > BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING selects OpenSSL. Only
 > OpenSSL is supported, which is why
 > BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL is selected as well.

 > No changes to the .mk files are needed, because we were already
 > handling OpenSSL as an optional dependency.

 > This problem was not yet caught by the autobuilders.

 > Reported-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 > Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
