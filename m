From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 23:42:04 +0200
Subject: [Buildroot] [PATCH 1/1] libcurl: fix build with ssh2 and static
 mbedtls
In-Reply-To: <20180521114108.20916-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 21 May 2018 13:41:08 +0200")
References: <20180521114108.20916-1-fontaine.fabrice@gmail.com>
Message-ID: <87bmd0n5cj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > The ssh2 pkg-config file could contain the following lines when build
 > with a static version of mbedtls:
 >    Libs: -L${libdir} -lssh2 /xxx/libmbedcrypto.a
 >    Libs.private: /xxx/libmbedcrypto.a

 > This static mbedtls library must be used to correctly detect ssh2
 > support and this library must be copied in libcurl.pc otherwise
 > compilation of any application (such as upmpdcli) with libcurl will fail
 > when trying to found mbedtls functions included in libssh2.
 > So, replace pkg-config --libs-only-l by pkg-config --libs.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/43e24b22a77f616d6198c10435dcc23cc3b9088a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks. Please submit the patch upstream.

-- 
Bye, Peter Korsgaard
