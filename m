From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Apr 2020 23:03:29 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/python3: add optional
 dependency to gettext
In-Reply-To: <20200405142823.836514-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 5 Apr 2020 16:28:22 +0200")
References: <20200405142823.836514-1-bernd.kuhls@t-online.de>
Message-ID: <87mu6u80ny.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Tested using this defconfig:
 > BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 > BR2_SYSTEM_ENABLE_NLS=y
 > BR2_PACKAGE_PYTHON3=y

 > Without this patch:
 > $ readelf -a output/target/usr/lib/libpython3.8.so.1.0 | grep NEEDED
 >  0x00000001 (NEEDED)                     Shared library: [libc.so.0]

 > With this patch:
 > $ readelf -a output/target/usr/lib/libpython3.8.so.1.0 | grep NEEDED
 >  0x00000001 (NEEDED)                     Shared library: [libintl.so.8]
 >  0x00000001 (NEEDED)                     Shared library: [libc.so.0]

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: unchanged, added to series

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
