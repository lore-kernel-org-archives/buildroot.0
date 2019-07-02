From: Carlo Rajko <carlo.rajko@scen.it>
Date: Tue, 2 Jul 2019 12:37:02 +0200
Subject: [Buildroot] python-pycryptodomex-3.7.1 error to compile
Message-ID: <5db457dc-9b6e-9f64-3622-50c5af065c5d@scen.it>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hello,

I have a error to compile Python-pycryptodomex-3.7.1:
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc
-Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_
BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN
-DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/
-I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m
-c src/multiply_32.c -o build/temp.linux-i686-3.7/src/multiply_32.o -O3
src/multiply_32.c:39:10: fatal error: x86intrin.h: File o directory non
esistente
 #include <x86intrin.h>


At the beginning of the log is indicated:
Testing support for x86intrin.h header
Target does not support x86intrin.h header
Testing support for clang
Target does not support clang
Testing support for gcc
Target does support gcc


I use buildroot-2019.05.

This is my config:
BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
BR2_TARGET_GENERIC_ISSUE=""
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91"
BR2_PACKAGE_SOX=y
BR2_PACKAGE_MTD=y
BR2_PACKAGE_UBOOT_TOOLS=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PYEXPAT=y
BR2_PACKAGE_PYTHON_PYCRYPTODOMEX=y
# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
BR2_PACKAGE_SUDO=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
BR2_TARGET_ROOTFS_UBI=y
BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG=y
BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_DTC=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
BR2_PACKAGE_HOST_PYTHON_CYTHON=y
BR2_PACKAGE_HOST_SAM_BA=y

Can you help me ?

Best regards,
carlo
-------------- next part --------------
pycryptodomex-3.7.1.tar.gz: OK (md5: ae7083008139cf9372322dcd99e92db0)
pycryptodomex-3.7.1.tar.gz: OK (sha256: 4ba053bea752ddc89b94d1f9f87008ef296a644b8dec0201c021d9636c069322)
[7m>>> python-pycryptodomex 3.7.1 Extracting[27m
gzip -d -c /home/progetto/progetto/buildroot-2019.05/dl/python-pycryptodomex/pycryptodomex-3.7.1.tar.gz | tar --strip-components=1 -C /home/progetto/progetto/buildroot-2019.05/output/build/python-pycryptodomex-3.7.1   -xf -
[7m>>> python-pycryptodomex 3.7.1 Patching[27m
[7m>>> python-pycryptodomex 3.7.1 Configuring[27m
[7m>>> python-pycryptodomex 3.7.1 Building[27m
(cd /home/progetto/progetto/buildroot-2019.05/output/build/python-pycryptodomex-3.7.1//; _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata_m_linux_arm-linux-gnueabi" PATH="/home/progetto/progetto/buildroot-2019.05/output/host/bin:/home/progetto/progetto/buildroot-2019.05/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games" PYTHONPATH="/home/progetto/progetto/buildroot-2019.05/output/target/usr/lib/python3.7/" PYTHONNOUSERSITE=1 _python_sysroot=/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot _python_prefix=/usr _python_exec_prefix=/usr  /home/progetto/progetto/buildroot-2019.05/output/host/bin/python setup.py build  )
Testing support for x86intrin.h header
Target does not support x86intrin.h header
Testing support for clang
Target does not support clang
Testing support for gcc
Target does support gcc
running build
running build_py
creating build/lib.linux-i686-3.7
creating build/lib.linux-i686-3.7/Cryptodome
copying lib/Cryptodome/__init__.py -> build/lib.linux-i686-3.7/Cryptodome
creating build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/ChaCha20_Poly1305.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_ctr.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/AES.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/Blowfish.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/ARC4.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_eax.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_cfb.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_openpgp.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/PKCS1_v1_5.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_gcm.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/PKCS1_OAEP.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_ccm.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_ocb.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_siv.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/Salsa20.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_cbc.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/ChaCha20.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_ecb.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/DES3.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/CAST.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/DES.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_ofb.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/ARC2.py -> build/lib.linux-i686-3.7/Cryptodome/Cipher
creating build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA384.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/BLAKE2b.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA3_224.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/MD5.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHAKE128.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA3_256.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/HMAC.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA256.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA512.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA3_512.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/keccak.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/BLAKE2s.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/MD4.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/CMAC.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/Poly1305.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/MD2.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA1.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/RIPEMD.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA3_384.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHAKE256.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA224.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/RIPEMD160.py -> build/lib.linux-i686-3.7/Cryptodome/Hash
creating build/lib.linux-i686-3.7/Cryptodome/IO
copying lib/Cryptodome/IO/PKCS8.py -> build/lib.linux-i686-3.7/Cryptodome/IO
copying lib/Cryptodome/IO/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/IO
copying lib/Cryptodome/IO/_PBES.py -> build/lib.linux-i686-3.7/Cryptodome/IO
copying lib/Cryptodome/IO/PEM.py -> build/lib.linux-i686-3.7/Cryptodome/IO
creating build/lib.linux-i686-3.7/Cryptodome/PublicKey
copying lib/Cryptodome/PublicKey/ElGamal.py -> build/lib.linux-i686-3.7/Cryptodome/PublicKey
copying lib/Cryptodome/PublicKey/DSA.py -> build/lib.linux-i686-3.7/Cryptodome/PublicKey
copying lib/Cryptodome/PublicKey/ECC.py -> build/lib.linux-i686-3.7/Cryptodome/PublicKey
copying lib/Cryptodome/PublicKey/RSA.py -> build/lib.linux-i686-3.7/Cryptodome/PublicKey
copying lib/Cryptodome/PublicKey/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/PublicKey
creating build/lib.linux-i686-3.7/Cryptodome/Protocol
copying lib/Cryptodome/Protocol/KDF.py -> build/lib.linux-i686-3.7/Cryptodome/Protocol
copying lib/Cryptodome/Protocol/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/Protocol
copying lib/Cryptodome/Protocol/SecretSharing.py -> build/lib.linux-i686-3.7/Cryptodome/Protocol
creating build/lib.linux-i686-3.7/Cryptodome/Random
copying lib/Cryptodome/Random/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/Random
copying lib/Cryptodome/Random/random.py -> build/lib.linux-i686-3.7/Cryptodome/Random
creating build/lib.linux-i686-3.7/Cryptodome/Signature
copying lib/Cryptodome/Signature/PKCS1_PSS.py -> build/lib.linux-i686-3.7/Cryptodome/Signature
copying lib/Cryptodome/Signature/pkcs1_15.py -> build/lib.linux-i686-3.7/Cryptodome/Signature
copying lib/Cryptodome/Signature/DSS.py -> build/lib.linux-i686-3.7/Cryptodome/Signature
copying lib/Cryptodome/Signature/PKCS1_v1_5.py -> build/lib.linux-i686-3.7/Cryptodome/Signature
copying lib/Cryptodome/Signature/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/Signature
copying lib/Cryptodome/Signature/pss.py -> build/lib.linux-i686-3.7/Cryptodome/Signature
creating build/lib.linux-i686-3.7/Cryptodome/Util
copying lib/Cryptodome/Util/number.py -> build/lib.linux-i686-3.7/Cryptodome/Util
copying lib/Cryptodome/Util/strxor.py -> build/lib.linux-i686-3.7/Cryptodome/Util
copying lib/Cryptodome/Util/_file_system.py -> build/lib.linux-i686-3.7/Cryptodome/Util
copying lib/Cryptodome/Util/py3compat.py -> build/lib.linux-i686-3.7/Cryptodome/Util
copying lib/Cryptodome/Util/Padding.py -> build/lib.linux-i686-3.7/Cryptodome/Util
copying lib/Cryptodome/Util/_cpu_features.py -> build/lib.linux-i686-3.7/Cryptodome/Util
copying lib/Cryptodome/Util/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/Util
copying lib/Cryptodome/Util/_raw_api.py -> build/lib.linux-i686-3.7/Cryptodome/Util
copying lib/Cryptodome/Util/asn1.py -> build/lib.linux-i686-3.7/Cryptodome/Util
copying lib/Cryptodome/Util/RFC1751.py -> build/lib.linux-i686-3.7/Cryptodome/Util
copying lib/Cryptodome/Util/Counter.py -> build/lib.linux-i686-3.7/Cryptodome/Util
creating build/lib.linux-i686-3.7/Cryptodome/Math
copying lib/Cryptodome/Math/_IntegerBase.py -> build/lib.linux-i686-3.7/Cryptodome/Math
copying lib/Cryptodome/Math/Primality.py -> build/lib.linux-i686-3.7/Cryptodome/Math
copying lib/Cryptodome/Math/_IntegerNative.py -> build/lib.linux-i686-3.7/Cryptodome/Math
copying lib/Cryptodome/Math/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/Math
copying lib/Cryptodome/Math/_IntegerCustom.py -> build/lib.linux-i686-3.7/Cryptodome/Math
copying lib/Cryptodome/Math/Numbers.py -> build/lib.linux-i686-3.7/Cryptodome/Math
copying lib/Cryptodome/Math/_IntegerGMP.py -> build/lib.linux-i686-3.7/Cryptodome/Math
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest
copying lib/Cryptodome/SelfTest/st_common.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest
copying lib/Cryptodome/SelfTest/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest
copying lib/Cryptodome/SelfTest/loader.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest
copying lib/Cryptodome/SelfTest/__main__.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_CAST.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_GCM.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_pkcs1_oaep.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_ChaCha20.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_CFB.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_ARC2.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_OFB.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_ARC4.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_CTR.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/common.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_CCM.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_Blowfish.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_pkcs1_15.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_AES.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_DES.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_SIV.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_DES3.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_CBC.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_Salsa20.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_ChaCha20_Poly1305.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_OCB.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_OpenPGP.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
copying lib/Cryptodome/SelfTest/Cipher/test_EAX.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_RIPEMD160.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_SHA3_384.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_BLAKE2.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_SHA224.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_SHAKE.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_keccak.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_MD2.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_SHA256.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_SHA1.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_CMAC.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_MD5.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_HMAC.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/common.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_SHA3_256.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_SHA384.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_Poly1305.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_SHA3_224.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_SHA3_512.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_MD4.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
copying lib/Cryptodome/SelfTest/Hash/test_SHA512.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/IO
copying lib/Cryptodome/SelfTest/IO/test_PKCS8.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/IO
copying lib/Cryptodome/SelfTest/IO/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/IO
copying lib/Cryptodome/SelfTest/IO/test_PBES.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/IO
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Protocol
copying lib/Cryptodome/SelfTest/Protocol/test_KDF.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Protocol
copying lib/Cryptodome/SelfTest/Protocol/test_SecretSharing.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Protocol
copying lib/Cryptodome/SelfTest/Protocol/test_rfc1751.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Protocol
copying lib/Cryptodome/SelfTest/Protocol/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Protocol
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey
copying lib/Cryptodome/SelfTest/PublicKey/test_import_RSA.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey
copying lib/Cryptodome/SelfTest/PublicKey/test_import_ECC.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey
copying lib/Cryptodome/SelfTest/PublicKey/test_RSA.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey
copying lib/Cryptodome/SelfTest/PublicKey/test_import_DSA.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey
copying lib/Cryptodome/SelfTest/PublicKey/test_DSA.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey
copying lib/Cryptodome/SelfTest/PublicKey/test_ElGamal.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey
copying lib/Cryptodome/SelfTest/PublicKey/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey
copying lib/Cryptodome/SelfTest/PublicKey/test_ECC.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Random
copying lib/Cryptodome/SelfTest/Random/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Random
copying lib/Cryptodome/SelfTest/Random/test_random.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Random
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature
copying lib/Cryptodome/SelfTest/Signature/test_pss.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature
copying lib/Cryptodome/SelfTest/Signature/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature
copying lib/Cryptodome/SelfTest/Signature/test_dss.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature
copying lib/Cryptodome/SelfTest/Signature/test_pkcs1_15.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Util
copying lib/Cryptodome/SelfTest/Util/test_strxor.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Util
copying lib/Cryptodome/SelfTest/Util/test_number.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Util
copying lib/Cryptodome/SelfTest/Util/test_asn1.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Util
copying lib/Cryptodome/SelfTest/Util/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Util
copying lib/Cryptodome/SelfTest/Util/test_Counter.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Util
copying lib/Cryptodome/SelfTest/Util/test_Padding.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Util
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Math
copying lib/Cryptodome/SelfTest/Math/test_Primality.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Math
copying lib/Cryptodome/SelfTest/Math/test_Numbers.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Math
copying lib/Cryptodome/SelfTest/Math/test_modexp.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Math
copying lib/Cryptodome/SelfTest/Math/__init__.py -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Math
copying lib/Cryptodome/py.typed -> build/lib.linux-i686-3.7/Cryptodome
copying lib/Cryptodome/__init__.pyi -> build/lib.linux-i686-3.7/Cryptodome
copying lib/Cryptodome/Cipher/_mode_ofb.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/__init__.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/DES3.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/DES.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_ecb.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/Blowfish.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_ctr.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_cfb.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_siv.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_gcm.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/PKCS1_OAEP.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_ocb.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/PKCS1_v1_5.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_eax.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_ccm.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/ChaCha20_Poly1305.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_openpgp.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/AES.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/ARC2.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/CAST.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/ChaCha20.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/Salsa20.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/ARC4.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Cipher/_mode_cbc.pyi -> build/lib.linux-i686-3.7/Cryptodome/Cipher
copying lib/Cryptodome/Hash/SHAKE256.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/BLAKE2s.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/__init__.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/keccak.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA3_384.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/Poly1305.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA3_256.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA256.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA512.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/MD5.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/RIPEMD.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/HMAC.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA384.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA224.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/BLAKE2b.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/MD4.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/RIPEMD160.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA3_224.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA1.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/MD2.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHA3_512.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/SHAKE128.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/Hash/CMAC.pyi -> build/lib.linux-i686-3.7/Cryptodome/Hash
copying lib/Cryptodome/PublicKey/ElGamal.pyi -> build/lib.linux-i686-3.7/Cryptodome/PublicKey
copying lib/Cryptodome/PublicKey/__init__.pyi -> build/lib.linux-i686-3.7/Cryptodome/PublicKey
copying lib/Cryptodome/PublicKey/ECC.pyi -> build/lib.linux-i686-3.7/Cryptodome/PublicKey
copying lib/Cryptodome/PublicKey/DSA.pyi -> build/lib.linux-i686-3.7/Cryptodome/PublicKey
copying lib/Cryptodome/PublicKey/RSA.pyi -> build/lib.linux-i686-3.7/Cryptodome/PublicKey
copying lib/Cryptodome/Protocol/__init__.pyi -> build/lib.linux-i686-3.7/Cryptodome/Protocol
copying lib/Cryptodome/Protocol/KDF.pyi -> build/lib.linux-i686-3.7/Cryptodome/Protocol
copying lib/Cryptodome/Protocol/SecretSharing.pyi -> build/lib.linux-i686-3.7/Cryptodome/Protocol
copying lib/Cryptodome/Random/__init__.pyi -> build/lib.linux-i686-3.7/Cryptodome/Random
copying lib/Cryptodome/Random/random.pyi -> build/lib.linux-i686-3.7/Cryptodome/Random
copying lib/Cryptodome/Signature/pkcs1_15.pyi -> build/lib.linux-i686-3.7/Cryptodome/Signature
copying lib/Cryptodome/Signature/pss.pyi -> build/lib.linux-i686-3.7/Cryptodome/Signature
copying lib/Cryptodome/Signature/PKCS1_PSS.pyi -> build/lib.linux-i686-3.7/Cryptodome/Signature
copying lib/Cryptodome/Signature/DSS.pyi -> build/lib.linux-i686-3.7/Cryptodome/Signature
copying lib/Cryptodome/Signature/PKCS1_v1_5.pyi -> build/lib.linux-i686-3.7/Cryptodome/Signature
copying lib/Cryptodome/Math/_IntegerGMP.pyi -> build/lib.linux-i686-3.7/Cryptodome/Math
copying lib/Cryptodome/Math/Numbers.pyi -> build/lib.linux-i686-3.7/Cryptodome/Math
copying lib/Cryptodome/Math/_IntegerBase.pyi -> build/lib.linux-i686-3.7/Cryptodome/Math
copying lib/Cryptodome/Math/Primality.pyi -> build/lib.linux-i686-3.7/Cryptodome/Math
copying lib/Cryptodome/Math/_IntegerCustom.pyi -> build/lib.linux-i686-3.7/Cryptodome/Math
copying lib/Cryptodome/Math/_IntegerNative.pyi -> build/lib.linux-i686-3.7/Cryptodome/Math
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128VarTxt192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/gcmEncryptExtIV128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128GFSbox192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128MMT256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCVarTxt192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBGFSbox192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCMMT256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128MCT192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8GFSbox192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBMMT128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128GFSbox256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCGFSbox128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBMCT128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128VarKey256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCMMT128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128MMT128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCMCT128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBKeySbox128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8MMT256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBVarTxt128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8MCT192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBMMT256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8VarKey192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBMCT192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128KeySbox128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCVarTxt256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128MCT128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBGFSbox128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCGFSbox192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128VarKey128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCVarKey128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBMMT192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128MCT256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128VarTxt256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8MMT128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8VarKey256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128VarKey192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/gcmDecrypt128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8VarKey128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCMCT192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCKeySbox192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8VarTxt192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBVarKey128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8GFSbox128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBKeySbox256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBGFSbox256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128GFSbox128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128MMT192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCMMT192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8KeySbox256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8MCT256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8VarTxt256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8KeySbox128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8MMT192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128VarTxt128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBMCT256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCVarTxt128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCMCT256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBKeySbox192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8VarTxt128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8GFSbox256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCGFSbox256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBVarKey256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBVarTxt192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCKeySbox256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128KeySbox192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCVarKey192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBVarTxt256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8MCT128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCVarKey256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB8KeySbox192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/OFBVarKey192.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CFB128KeySbox256.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/AES/CBCKeySbox128.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/AES
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TOFBsubtab.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TOFBvarkey.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCFB8vartext.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCBCvartext.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCFB8invperm.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TOFBvartext.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCBCinvperm.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TOFBMMT3.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCFB8MMT2.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TOFBpermop.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCBCsubtab.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCBCMMT2.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TOFBMMT2.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCFB8subtab.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCFB8MMT3.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCFB64varkey.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCFB64MMT3.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCFB8varkey.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCFB64subtab.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TECBMMT3.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TOFBinvperm.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCBCpermop.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCFB64vartext.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCFB64MMT2.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TECBMMT2.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCFB64permop.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCFB8permop.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCFB64invperm.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCBCMMT3.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/TDES/TCBCvarkey.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/TDES
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/wycheproof
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/wycheproof/aes_eax_test.json -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/wycheproof
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/wycheproof/aes_siv_cmac_test.json -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/wycheproof
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/wycheproof/chacha20_poly1305_test.json -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/wycheproof
copying lib/Cryptodome/SelfTest/Cipher/test_vectors/wycheproof/aes_gcm_test.json -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Cipher/test_vectors/wycheproof
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/SHA1
copying lib/Cryptodome/SelfTest/Hash/test_vectors/SHA1/SHA1ShortMsg.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/SHA1
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/SHA2
copying lib/Cryptodome/SelfTest/Hash/test_vectors/SHA2/SHA512ShortMsg.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/SHA2
copying lib/Cryptodome/SelfTest/Hash/test_vectors/SHA2/SHA512_224ShortMsg.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/SHA2
copying lib/Cryptodome/SelfTest/Hash/test_vectors/SHA2/SHA512_256ShortMsg.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/SHA2
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/SHA3
copying lib/Cryptodome/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHAKE128.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/SHA3
copying lib/Cryptodome/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHA3-224.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/SHA3
copying lib/Cryptodome/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHA3-384.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/SHA3
copying lib/Cryptodome/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHA3-512.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/SHA3
copying lib/Cryptodome/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHAKE256.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/SHA3
copying lib/Cryptodome/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHA3-256.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/SHA3
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/keccak
copying lib/Cryptodome/SelfTest/Hash/test_vectors/keccak/ShortMsgKAT_256.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/keccak
copying lib/Cryptodome/SelfTest/Hash/test_vectors/keccak/ShortMsgKAT_384.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/keccak
copying lib/Cryptodome/SelfTest/Hash/test_vectors/keccak/ExtremelyLongMsgKAT_384.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/keccak
copying lib/Cryptodome/SelfTest/Hash/test_vectors/keccak/LongMsgKAT_384.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/keccak
copying lib/Cryptodome/SelfTest/Hash/test_vectors/keccak/ShortMsgKAT_512.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/keccak
copying lib/Cryptodome/SelfTest/Hash/test_vectors/keccak/readme.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/keccak
copying lib/Cryptodome/SelfTest/Hash/test_vectors/keccak/ExtremelyLongMsgKAT_224.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/keccak
copying lib/Cryptodome/SelfTest/Hash/test_vectors/keccak/LongMsgKAT_256.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/keccak
copying lib/Cryptodome/SelfTest/Hash/test_vectors/keccak/ExtremelyLongMsgKAT_256.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/keccak
copying lib/Cryptodome/SelfTest/Hash/test_vectors/keccak/ExtremelyLongMsgKAT_512.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/keccak
copying lib/Cryptodome/SelfTest/Hash/test_vectors/keccak/ShortMsgKAT_224.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/keccak
copying lib/Cryptodome/SelfTest/Hash/test_vectors/keccak/LongMsgKAT_512.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/keccak
copying lib/Cryptodome/SelfTest/Hash/test_vectors/keccak/LongMsgKAT_224.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/keccak
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/BLAKE2s
copying lib/Cryptodome/SelfTest/Hash/test_vectors/BLAKE2s/blake2s-test.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/BLAKE2s
copying lib/Cryptodome/SelfTest/Hash/test_vectors/BLAKE2s/tv2.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/BLAKE2s
copying lib/Cryptodome/SelfTest/Hash/test_vectors/BLAKE2s/tv1.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/BLAKE2s
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/BLAKE2b
copying lib/Cryptodome/SelfTest/Hash/test_vectors/BLAKE2b/tv2.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/BLAKE2b
copying lib/Cryptodome/SelfTest/Hash/test_vectors/BLAKE2b/tv1.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/BLAKE2b
copying lib/Cryptodome/SelfTest/Hash/test_vectors/BLAKE2b/blake2b-test.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/BLAKE2b
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/wycheproof
copying lib/Cryptodome/SelfTest/Hash/test_vectors/wycheproof/aes_cmac_test.json -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Hash/test_vectors/wycheproof
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_public_compressed.pem -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_enc_aes256_gcm.pem -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_enc_aes192.pem -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_enc_des3.pem -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_public_openssh.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_public_compressed.der -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/gen_ecc_p256.sh -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_enc_aes128.pem -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_p8.pem -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_p8.der -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/point-at-infinity.org-P256.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_p8_clear.der -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private.der -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_p8_clear.pem -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/openssl_version.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_x509.pem -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private.pem -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_x509.der -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_public.der -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
copying lib/Cryptodome/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_public.pem -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/PublicKey/test_vectors/ECC
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/DSA
copying lib/Cryptodome/SelfTest/Signature/test_vectors/DSA/FIPS_186_3_SigVer.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/DSA
copying lib/Cryptodome/SelfTest/Signature/test_vectors/DSA/FIPS_186_3_SigGen.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/DSA
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/ECDSA
copying lib/Cryptodome/SelfTest/Signature/test_vectors/ECDSA/README.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/ECDSA
copying lib/Cryptodome/SelfTest/Signature/test_vectors/ECDSA/SigGen.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/ECDSA
copying lib/Cryptodome/SelfTest/Signature/test_vectors/ECDSA/SigVer.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/ECDSA
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/PKCS1-v1.5
copying lib/Cryptodome/SelfTest/Signature/test_vectors/PKCS1-v1.5/SigGen15_186-2.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/PKCS1-v1.5
copying lib/Cryptodome/SelfTest/Signature/test_vectors/PKCS1-v1.5/SigGen15_186-3.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/PKCS1-v1.5
copying lib/Cryptodome/SelfTest/Signature/test_vectors/PKCS1-v1.5/SigVer15_186-3.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/PKCS1-v1.5
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/PKCS1-PSS
copying lib/Cryptodome/SelfTest/Signature/test_vectors/PKCS1-PSS/SigGenPSS_186-2.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/PKCS1-PSS
copying lib/Cryptodome/SelfTest/Signature/test_vectors/PKCS1-PSS/SigGenPSS_186-3.txt -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/PKCS1-PSS
copying lib/Cryptodome/SelfTest/Signature/test_vectors/PKCS1-PSS/SigVerPSS_186-3.rsp -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/PKCS1-PSS
creating build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/wycheproof
copying lib/Cryptodome/SelfTest/Signature/test_vectors/wycheproof/ecdsa_test.json -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/wycheproof
copying lib/Cryptodome/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp256r1_sha256_test.json -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/wycheproof
copying lib/Cryptodome/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_test.json -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/wycheproof
copying lib/Cryptodome/SelfTest/Signature/test_vectors/wycheproof/dsa_test.json -> build/lib.linux-i686-3.7/Cryptodome/SelfTest/Signature/test_vectors/wycheproof
running build_ext
Target does support posix_memalign
Warning: compiler does not support AESNI instructions
Warning: compiler does not support CLMUL instructions
building 'Cryptodome.Hash._MD2' extension
creating build/temp.linux-i686-3.7
creating build/temp.linux-i686-3.7/src
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/MD2.c -o build/temp.linux-i686-3.7/src/MD2.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/MD2.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Hash/_MD2.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Hash._MD4' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/MD4.c -o build/temp.linux-i686-3.7/src/MD4.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/MD4.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Hash/_MD4.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Hash._MD5' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/MD5.c -o build/temp.linux-i686-3.7/src/MD5.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/MD5.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Hash/_MD5.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Hash._SHA1' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/SHA1.c -o build/temp.linux-i686-3.7/src/SHA1.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/SHA1.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Hash/_SHA1.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Hash._SHA256' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/SHA256.c -o build/temp.linux-i686-3.7/src/SHA256.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/SHA256.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Hash/_SHA256.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Hash._SHA224' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/SHA224.c -o build/temp.linux-i686-3.7/src/SHA224.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/SHA224.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Hash/_SHA224.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Hash._SHA384' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/SHA384.c -o build/temp.linux-i686-3.7/src/SHA384.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/SHA384.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Hash/_SHA384.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Hash._SHA512' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/SHA512.c -o build/temp.linux-i686-3.7/src/SHA512.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/SHA512.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Hash/_SHA512.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Hash._RIPEMD160' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/RIPEMD160.c -o build/temp.linux-i686-3.7/src/RIPEMD160.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/RIPEMD160.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Hash/_RIPEMD160.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Hash._keccak' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/keccak.c -o build/temp.linux-i686-3.7/src/keccak.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/keccak.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Hash/_keccak.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Hash._BLAKE2b' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/blake2b.c -o build/temp.linux-i686-3.7/src/blake2b.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/blake2b.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Hash/_BLAKE2b.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Hash._BLAKE2s' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/blake2s.c -o build/temp.linux-i686-3.7/src/blake2s.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/blake2s.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Hash/_BLAKE2s.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Hash._ghash_portable' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/ghash_portable.c -o build/temp.linux-i686-3.7/src/ghash_portable.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/ghash_portable.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Hash/_ghash_portable.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Hash._poly1305' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/poly1305.c -o build/temp.linux-i686-3.7/src/poly1305.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/poly1305.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Hash/_poly1305.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Cipher._raw_aes' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/AES.c -o build/temp.linux-i686-3.7/src/AES.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/AES.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Cipher/_raw_aes.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Cipher._raw_arc2' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/ARC2.c -o build/temp.linux-i686-3.7/src/ARC2.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/ARC2.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Cipher/_raw_arc2.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Cipher._raw_blowfish' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/Blowfish.c -o build/temp.linux-i686-3.7/src/Blowfish.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/Blowfish.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Cipher/_raw_blowfish.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Cipher._raw_cast' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/CAST.c -o build/temp.linux-i686-3.7/src/CAST.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/CAST.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Cipher/_raw_cast.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Cipher._raw_des' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -Isrc/libtom/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/DES.c -o build/temp.linux-i686-3.7/src/DES.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/DES.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Cipher/_raw_des.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Cipher._raw_des3' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -Isrc/libtom/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/DES3.c -o build/temp.linux-i686-3.7/src/DES3.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/DES3.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Cipher/_raw_des3.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Util._cpuid_c' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/cpuid.c -o build/temp.linux-i686-3.7/src/cpuid.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/cpuid.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Util/_cpuid_c.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Cipher._raw_ecb' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/raw_ecb.c -o build/temp.linux-i686-3.7/src/raw_ecb.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/raw_ecb.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Cipher/_raw_ecb.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Cipher._raw_cbc' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/raw_cbc.c -o build/temp.linux-i686-3.7/src/raw_cbc.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/raw_cbc.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Cipher/_raw_cbc.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Cipher._raw_cfb' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/raw_cfb.c -o build/temp.linux-i686-3.7/src/raw_cfb.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/raw_cfb.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Cipher/_raw_cfb.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Cipher._raw_ofb' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/raw_ofb.c -o build/temp.linux-i686-3.7/src/raw_ofb.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/raw_ofb.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Cipher/_raw_ofb.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Cipher._raw_ctr' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/raw_ctr.c -o build/temp.linux-i686-3.7/src/raw_ctr.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/raw_ctr.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Cipher/_raw_ctr.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Cipher._raw_ocb' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/raw_ocb.c -o build/temp.linux-i686-3.7/src/raw_ocb.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/raw_ocb.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Cipher/_raw_ocb.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Cipher._ARC4' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/ARC4.c -o build/temp.linux-i686-3.7/src/ARC4.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/ARC4.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Cipher/_ARC4.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Cipher._Salsa20' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -Isrc/libtom/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/Salsa20.c -o build/temp.linux-i686-3.7/src/Salsa20.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/Salsa20.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Cipher/_Salsa20.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Cipher._chacha20' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/chacha20.c -o build/temp.linux-i686-3.7/src/chacha20.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/chacha20.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Cipher/_chacha20.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Protocol._scrypt' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/scrypt.c -o build/temp.linux-i686-3.7/src/scrypt.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/scrypt.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Protocol/_scrypt.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Util._strxor' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/strxor.c -o build/temp.linux-i686-3.7/src/strxor.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -shared build/temp.linux-i686-3.7/src/strxor.o -L/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib -o build/lib.linux-i686-3.7/Cryptodome/Util/_strxor.cpython-37m-arm-linux-gnueabi.so
building 'Cryptodome.Math._montgomery' extension
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/montgomery.c -o build/temp.linux-i686-3.7/src/montgomery.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/siphash.c -o build/temp.linux-i686-3.7/src/siphash.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/montgomery_utils.c -o build/temp.linux-i686-3.7/src/montgomery_utils.o -O3
/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_X86INTRIN_H -DPYCRYPTO_LITTLE_ENDIAN -DLTC_NO_ASM -DHAVE_POSIX_MEMALIGN -Isrc/ -I/home/progetto/progetto/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/python3.7m -c src/multiply_32.c -o build/temp.linux-i686-3.7/src/multiply_32.o -O3
src/multiply_32.c:39:10: fatal error: x86intrin.h: File o directory non esistente
 #include <x86intrin.h>
          ^~~~~~~~~~~~~
compilation terminated.
error: command '/home/progetto/progetto/buildroot-2019.05/output/host/bin/arm-buildroot-linux-gnueabi-gcc' failed with exit status 1
package/pkg-generic.mk:238: set di istruzioni per l'obiettivo "/home/progetto/progetto/buildroot-2019.05/output/build/python-pycryptodomex-3.7.1/.stamp_built" non riuscito
make: *** [/home/progetto/progetto/buildroot-2019.05/output/build/python-pycryptodomex-3.7.1/.stamp_built] Errore 1
