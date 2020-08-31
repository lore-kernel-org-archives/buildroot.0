From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 15:20:29 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/rtty: fix build with mbedtls but without zlib
In-Reply-To: <20200830214042.1340329-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 30 Aug 2020 23:40:42 +0200")
References: <20200830214042.1340329-1-fontaine.fabrice@gmail.com>
Message-ID: <87blirc5pe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > zlib is not mandatory with mbedtls, only optional, however as mbedtls
 > does not provide a pkg-config file, we assume that if zlib is
 > available, we must link with it to avoid a build failure when linking
 > statically with a zlib-enabled mbedtls.

 > This change was pushed upstream with
 > https://github.com/zhaojh329/rtty/commit/7b8efe11dbafce97971dc130bf6cc1756f34ce07
 > and is in buildroot since the bump to version 7.1.4 with commit
 > 0c80245ddbe78c8e443f98b9bbccac56331cdb26.
 > However, this change will raise a build failure if ZLIB_LIBRARIES is
 > used when zlib is not found. This patch is fixing this build failure.

 > However, it should be noted that the compression support in mbedtls is
 > only enabled if BR2_PACKAGE_MBEDTLS_COMPRESSION=y. So we can have a
 > situation where mbedtls is enabled, zlib is enabled, but mbedtls is not
 > using zlib and as a result, since version 7.1.4, rttyt will needlessly
 > link with zlib in such a situation.

 > The only sane way to fix this is to use pkg-config, but as mbedtls
 > apparently doesn't provide any .pc file, we leave it as it is.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a0ebffe58bbf14cab74b7d2111d4d88a9c725273

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Extend commit message

Committed, thanks.

-- 
Bye, Peter Korsgaard
