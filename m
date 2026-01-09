Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C57D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32D3683BE2;
	Tue, 13 Jan 2026 19:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YErRUy79FqV1; Tue, 13 Jan 2026 19:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DFA383B6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333025;
	bh=xvnS04QPMb4LPOlzdtQlxEN8jojyHztXZjmch2oxpuo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nDyo9wfL5QWEQgnJHBWT72JVyZp7/maQZ2c50At/tncLPbnfJ0Q7ReBUCZ3+pddKU
	 NSDlLp8evaXXADN5BsQqoSgC9yBAvIrl4ceoxvmrtq+Q7qlOg2DCCoKlJmXmeslNQU
	 CGjDuoYVCAQUa4N4HnG6jEMMdUz11ohjQFKU4ZG4mc/vGdABddJxgyLLz038jlhuz+
	 8hnXSNgwy5A39gpoHId+uivp3kwJ1aqSzM2mJjfkg6JucRxEonI9J65hIfgcvvBiXq
	 Bx7e62CgzlY1X4bAYopo+G7nNYjyONndNV+PeS0cfwnXbE4mebnphV8fDDfPC6mCTK
	 Ky+fmz0iIvBmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DFA383B6F;
	Tue, 13 Jan 2026 19:37:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01CEB1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6210482C8F
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQDut57KJNFs for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27C7982C38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27C7982C38
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25F8086E71; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:43:06 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c30b55858ae5d04651b56a429342d056a477acf6
X-Git-Newrev: 3dc3519eed97fa31f39bec8c86e56feaffd0e9e1
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.25F8086E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/softether: fix
 various build errors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5310110665742607512=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5310110665742607512==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3dc3519eed97fa31f39bec8c86e56feaffd0e9e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This patch add several upstream patches that fix build error we are
experiencing on the autobuilder related to host-gcc15 and gcc14.

- 0010-use-bool-from-stdbool.patch

Fix a host-gcc15 error with C23 bool reserved keyword when building
host-softether package. This appeared on the autobuilder.

```
                 from Cfg.c:116:
../../src/Mayaqua/MayaType.h:257:33: error: 'bool' cannot be defined via 'typedef'
  257 | typedef unsigned int            bool;
      |                                 ^~~~
../../src/Mayaqua/MayaType.h:257:33: note: 'bool' is a keyword with '-std=c23' onwards
../../src/Mayaqua/MayaType.h:257:1: warning: useless type name in empty declaration
  257 | typedef unsigned int            bool;
      | ^~~~~~~
```

- 0011-fix-implicit-declaration-of-function-getch.patch

Fix an implicit function declaration.

- 0012-vlanunix-fix-implicit-declaration-of-function-freetap.patch

Fix an implicit function declaration.

- 0013-fix-build-on-freebsd-version-140091.patch

Incompatible pointer type which appeared on the autobuilder as well:

```
Unix.c: In function 'UnixIgnoreSignalForThread':
Unix.c:324:25: error: assignment to 'void (*)(int,  siginfo_t *, void *)' from incompatible pointer type 'void * (*)(int,  siginfo_t *, void *)' [-Wincompatible-pointer-types]
  324 |         sa.sa_sigaction = signal_received_for_ignore;
      |                         ^
```

- 0014-cedar-hub-properly-set-value-for-hub-admin-options.patch

Fix an incompatible pointer type error.

- 0015-adjust-types-of-variables.patch

Fix an incompatible pointer type error which appeared on the autobuilder as
well.

```
Secure.c: In function 'OpenSec':
Secure.c:1829:56: error: passing argument 3 of 'sec->Api->C_GetSlotList' from incompatible pointer type [-Wincompatible-pointer-types]
 1829 |         if ((err = sec->Api->C_GetSlotList(true, NULL, &sec->NumSlot)) != CKR_OK || sec->NumSlot == 0)
      |                                                        ^~~~~~~~~~~~~
      |                                                        |
      |                                                        UINT * {aka unsigned int *}
```

- 0016-Cedar-Proto_IKE-fix-too-many-arguments-to-function-N.patch

Fix a function call.

Fixes: https://autobuild.buildroot.org/results/c43/c43a9a221896d37ee8a9d34c5b8e2725351c6eb5
Fixes: https://autobuild.buildroot.org/results/751/7517bb4d32c38d475d901769b0b2fd2c2f3dd543
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Acked-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5b5aebc085661c958488125fe1a794e5813d254e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/softether/0010-use-bool-from-stdbool.patch | 167 ++++++++++++++++++
 ...ix-implicit-declaration-of-function-getch.patch |  34 ++++
 ...-implicit-declaration-of-function-freetap.patch |  31 ++++
 .../0013-fix-build-on-freebsd-version-140091.patch |  55 ++++++
 ...-properly-set-value-for-hub-admin-options.patch | 193 +++++++++++++++++++++
 .../softether/0015-adjust-types-of-variables.patch |  93 ++++++++++
 ..._IKE-fix-too-many-arguments-to-function-N.patch |  54 ++++++
 7 files changed, 627 insertions(+)

diff --git a/package/softether/0010-use-bool-from-stdbool.patch b/package/softether/0010-use-bool-from-stdbool.patch
new file mode 100644
index 0000000000..cc52873724
--- /dev/null
+++ b/package/softether/0010-use-bool-from-stdbool.patch
@@ -0,0 +1,167 @@
+From 914bfe7d44f8e693d21178055f0b845c613dc777 Mon Sep 17 00:00:00 2001
+From: Davide Beatrici <git@davidebeatrici.dev>
+Date: Sun, 28 Feb 2021 06:04:11 +0100
+Subject: [PATCH] Use bool from stdbool.h, get rid of BOOL
+
+BOOL was just an alias for bool, this commit replaces all instances of it for consistency.
+
+For some reason bool was defined as a 4-byte integer instead of a 1-byte one, presumably to match WinAPI's definition: https://docs.microsoft.com/en-us/windows/win32/winprog/windows-data-types
+Nothing should break now that bool is 1-byte, as no protocol code appears to be relying on the size of the data type.
+PACK, for example, explicitly stores boolean values as 4-byte integers.
+
+This commit can be seen as a follow-up to 61ccaed4f6c1bba53202a6d10841fd78b8b6cf8.
+
+Upstream: https://github.com/SoftEtherVPN/SoftEtherVPN/commit/914bfe7d44f8e693d21178055f0b845c613dc777
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/Cedar/Cedar.h         | 4 ----
+ src/Cedar/Command.c       | 2 +-
+ src/Cedar/Connection.h    | 2 +-
+ src/Cedar/EtherLog.h      | 2 +-
+ src/Cedar/Radius.c        | 2 +-
+ src/Cedar/Win32Com.cpp    | 2 --
+ src/Cedar/Win32Com.h      | 6 ------
+ src/Cedar/WinJumpList.cpp | 3 ---
+ src/Mayaqua/MayaType.h    | 9 ++-------
+ 9 files changed, 6 insertions(+), 26 deletions(-)
+
+diff --git a/src/Cedar/Cedar.h b/src/Cedar/Cedar.h
+index cc32fc28..267b3957 100644
+--- a/src/Cedar/Cedar.h
++++ b/src/Cedar/Cedar.h
+@@ -121,10 +121,6 @@
+ 
+ #endif	// VPN_SPEED
+ 
+-#define	bool	UINT
+-#define	BOOL	UINT
+-
+-
+ // Version number
+ #define	CEDAR_VER					430
+ 
+diff --git a/src/Cedar/Command.c b/src/Cedar/Command.c
+index 5b2c67e8..7bd19799 100644
+--- a/src/Cedar/Command.c
++++ b/src/Cedar/Command.c
+@@ -22433,7 +22433,7 @@ void CtEscapeCsv(wchar_t *dst, UINT size, wchar_t *src){
+ 	UINT i;
+ 	UINT len = UniStrLen(src);
+ 	UINT idx;
+-	BOOL need_to_escape = false;
++	bool need_to_escape = false;
+ 	wchar_t tmp[2]=L"*";
+ 
+ 	// Check the input value
+diff --git a/src/Cedar/Connection.h b/src/Cedar/Connection.h
+index 2b1f8091..47b2e4aa 100644
+--- a/src/Cedar/Connection.h
++++ b/src/Cedar/Connection.h
+@@ -244,7 +244,7 @@ struct UDP
+ // Data block
+ struct BLOCK
+ {
+-	BOOL Compressed;				// Compression flag
++	bool Compressed;				// Compression flag
+ 	UINT Size;						// Block size
+ 	UINT SizeofData;				// Data size
+ 	UCHAR *Buf;						// Buffer
+diff --git a/src/Cedar/EtherLog.h b/src/Cedar/EtherLog.h
+index 3fdcf140..e3dda9da 100644
+--- a/src/Cedar/EtherLog.h
++++ b/src/Cedar/EtherLog.h
+@@ -148,7 +148,7 @@ struct RPC_ENUM_DEVICE
+ // License status of the service
+ struct RPC_EL_LICENSE_STATUS
+ {
+-	BOOL Valid;								// Enable flag
++	bool Valid;								// Enable flag
+ 	UINT64 SystemId;						// System ID
+ 	UINT64 SystemExpires;					// System expiration date
+ };
+diff --git a/src/Cedar/Radius.c b/src/Cedar/Radius.c
+index bcbac5d4..9dcfe05d 100644
+--- a/src/Cedar/Radius.c
++++ b/src/Cedar/Radius.c
+@@ -1889,7 +1889,7 @@ bool RadiusLogin(CONNECTION *c, char *server, UINT port, UCHAR *secret, UINT sec
+ 			SOCK *sock;
+ 			USHORT sz = 0;
+ 			UINT pos = 0;
+-			BOOL *finish = ZeroMallocEx(sizeof(BOOL) * LIST_NUM(ip_list), true);
++			bool *finish = ZeroMallocEx(sizeof(bool) * LIST_NUM(ip_list), true);
+ 
+ 			Zero(tmp, sizeof(tmp));
+ 
+diff --git a/src/Cedar/Win32Com.cpp b/src/Cedar/Win32Com.cpp
+index e567c557..65c21988 100644
+--- a/src/Cedar/Win32Com.cpp
++++ b/src/Cedar/Win32Com.cpp
+@@ -106,8 +106,6 @@
+ 
+ #ifdef	WIN32
+ 
+-#define	WIN32COM_CPP
+-
+ #define _WIN32_DCOM
+ 
+ //#define	_WIN32_WINNT		0x0502
+diff --git a/src/Cedar/Win32Com.h b/src/Cedar/Win32Com.h
+index 6191d7e0..eb4810e4 100644
+--- a/src/Cedar/Win32Com.h
++++ b/src/Cedar/Win32Com.h
+@@ -105,12 +105,6 @@
+ #ifndef	WIN32COM_H
+ #define	WIN32COM_H
+ 
+-#ifdef	WIN32COM_CPP
+-
+-// Internal function
+-
+-#endif	// WIN32COM_CPP
+-
+ // For external function
+ 
+ #pragma comment(lib,"htmlhelp.lib")
+diff --git a/src/Cedar/WinJumpList.cpp b/src/Cedar/WinJumpList.cpp
+index 7bd375a1..7b5fabe2 100644
+--- a/src/Cedar/WinJumpList.cpp
++++ b/src/Cedar/WinJumpList.cpp
+@@ -132,9 +132,6 @@
+ #undef StrCmp
+ #endif
+ 
+-
+-#define	WIN32COM_CPP
+-
+ //#define	_WIN32_WINNT		0x0502
+ //#define	WINVER				0x0502
+ #include <winsock2.h>
+diff --git a/src/Mayaqua/MayaType.h b/src/Mayaqua/MayaType.h
+index ae173617..9d5bc3c1 100644
+--- a/src/Mayaqua/MayaType.h
++++ b/src/Mayaqua/MayaType.h
+@@ -105,6 +105,8 @@
+ #ifndef	MAYATYPE_H
+ #define	MAYATYPE_H
+ 
++#include <stdbool.h>
++
+ // Check whether the windows.h header is included
+ #ifndef	WINDOWS_H
+ #ifdef	_WINDOWS_
+@@ -252,13 +254,6 @@ typedef	unsigned int		BOOL;
+ #define	FALSE				0
+ #endif	// WINDOWS_H
+ 
+-// bool type
+-#ifndef	WIN32COM_CPP
+-typedef	unsigned int		bool;
+-#define	true				1
+-#define	false				0
+-#endif	// WIN32COM_CPP
+-
+ // 32bit integer type
+ #ifndef	WINDOWS_H
+ typedef	unsigned int		UINT;
+-- 
+2.39.5
diff --git a/package/softether/0011-fix-implicit-declaration-of-function-getch.patch b/package/softether/0011-fix-implicit-declaration-of-function-getch.patch
new file mode 100644
index 0000000000..b10e9aae08
--- /dev/null
+++ b/package/softether/0011-fix-implicit-declaration-of-function-getch.patch
@@ -0,0 +1,34 @@
+From 84c44fbe243dabc91d4fa25f2ba878dcaca9856e Mon Sep 17 00:00:00 2001
+From: Davide Beatrici <davidebeatrici@gmail.com>
+Date: Fri, 10 Aug 2018 21:22:36 +0200
+Subject: [PATCH] Console.c: fix "implicit declaration of function 'getch'"
+ warning
+
+/builds/SoftEther/SoftEtherVPN/src/Cedar/Console.c: In function 'PasswordPrompt':
+/builds/SoftEther/SoftEtherVPN/src/Cedar/Console.c:2051:8: warning: implicit declaration of function 'getch'; did you mean 'getc'? [-Wimplicit-function-declaration]
+    c = getch();
+        ^~~~~
+        getc
+
+Upstream: https://github.com/SoftEtherVPN/SoftEtherVPN/commit/84c44fbe243dabc91d4fa25f2ba878dcaca9856e
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/Cedar/Console.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/Cedar/Console.c b/src/Cedar/Console.c
+index ec861a4ed..2c384facf 100644
+--- a/src/Cedar/Console.c
++++ b/src/Cedar/Console.c
+@@ -2048,7 +2048,11 @@ bool PasswordPrompt(char *password, UINT size)
+ 		else if (c == 0xE0)
+ 		{
+ 			// Read one more character
++#ifdef	OS_WIN32
+ 			c = getch();
++#else	// OS_WIN32
++			c = getc(stdin);
++#endif	// OS_WIN32
+ 			if (c == 0x4B || c == 0x53)
+ 			{
+ 				// Backspace
diff --git a/package/softether/0012-vlanunix-fix-implicit-declaration-of-function-freetap.patch b/package/softether/0012-vlanunix-fix-implicit-declaration-of-function-freetap.patch
new file mode 100644
index 0000000000..05fc1130ef
--- /dev/null
+++ b/package/softether/0012-vlanunix-fix-implicit-declaration-of-function-freetap.patch
@@ -0,0 +1,31 @@
+From 49ed8770b87af46d92091464ecf41ae9b5027cd7 Mon Sep 17 00:00:00 2001
+From: Davide Beatrici <davidebeatrici@gmail.com>
+Date: Fri, 10 Aug 2018 21:21:19 +0200
+Subject: [PATCH] VLanUnix: fix "implicit declaration of function 'FreeTap'"
+ warning
+
+In file included from /builds/SoftEther/SoftEtherVPN/src/Cedar/Bridge.c:130:0:
+/builds/SoftEther/SoftEtherVPN/src/Cedar/BridgeUnix.c: In function 'CloseEth':
+/builds/SoftEther/SoftEtherVPN/src/Cedar/BridgeUnix.c:1568:3: warning: implicit declaration of function 'FreeTap'; did you mean 'FreeCaps'? [-Wimplicit-function-declaration]
+   FreeTap(e->Tap);
+   ^~~~~~~
+   FreeCaps
+
+Upstream: https://github.com/SoftEtherVPN/SoftEtherVPN/commit/49ed8770b87af46d92091464ecf41ae9b5027cd7
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/Cedar/VLanUnix.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/Cedar/VLanUnix.h b/src/Cedar/VLanUnix.h
+index b628dcd4f..89ae9c2d8 100644
+--- a/src/Cedar/VLanUnix.h
++++ b/src/Cedar/VLanUnix.h
+@@ -122,6 +122,7 @@ struct VLAN
+ VLAN *NewVLan(char *instance_name, VLAN_PARAM *param);
+ VLAN *NewTap(char *name, char *mac_address);
+ void FreeVLan(VLAN *v);
++void FreeTap(VLAN *v);
+ CANCEL *VLanGetCancel(VLAN *v);
+ bool VLanGetNextPacket(VLAN *v, void **buf, UINT *size);
+ bool VLanPutPacket(VLAN *v, void *buf, UINT size);
diff --git a/package/softether/0013-fix-build-on-freebsd-version-140091.patch b/package/softether/0013-fix-build-on-freebsd-version-140091.patch
new file mode 100644
index 0000000000..1354b83355
--- /dev/null
+++ b/package/softether/0013-fix-build-on-freebsd-version-140091.patch
@@ -0,0 +1,55 @@
+From dcdbce63d51651d6d3d1d8a95c43d04258295621 Mon Sep 17 00:00:00 2001
+From: Koichiro Iwao <meta@vmeta.jp>
+Date: Mon, 3 Jul 2023 16:49:08 +0900
+Subject: [PATCH] Fix build on __FreeBSD_version >= 140091 (LLVM 16)
+
+Fails to build after:
+https://cgit.freebsd.org/src/commit/?id=a681cba16d8967651a2146385ce44a2bfeb1c4c3
+
+As the commit title is "Bump __FreeBSD_version for llvm 16.0.6 merge",
+I suppose LLVM 16 is stricter than LLVM 15. It was building successfully
+at least the previous week.
+
+Build log: https://pkg-status.freebsd.org/beefy18/data/main-amd64-default/p4785b313b958_se8efee297c/logs/softether5-5.02.5180.335,2.log
+
+```
+[ 32%] Building C object src/Mayaqua/CMakeFiles/mayaqua.dir/Unix.c.o
+cd /wrkdirs/usr/ports/security/softether5/work/.build/src/Mayaqua && /usr/bin/cc -DBRIDGE_BPF -DCPU_64 -DHAVE_SSL_CTX_SET_NUM_TICKETS -DNDEBUG -DOS_UNIX -DREENTRANT -DSE_DBDIR=\"/var/db/softether\" -DSE_LOGDIR=\"/var/log/softether\" -DSE_PIDDIR=\"/var/run/softether\" -DSE_TAGNAME=\"5.02.5180-335-g1c0bdb0c/freebsd\" -DTHREADSAFE -DTHREAD_SAFE -DUNIX -DUNIX_BSD -DVPN_SPEED -D_FILE_OFFSET_BITS=64 -D_REENTRANT -D_THREADSAFE -D_THREAD_SAFE -Dmayaqua_EXPORTS -I/wrkdirs/usr/ports/security/softether5/work/SoftEtherVPN-5.02.5180-335-g1c0bdb0c/src/. -I/wrkdirs/usr/ports/security/softether5/work/SoftEtherVPN-5.02.5180-335-g1c0bdb0c/src/Mayaqua/. -I/wrkdirs/usr/ports/security/softether5/work/SoftEtherVPN-5.02.5180-335-g1c0bdb0c/src/libhamcore/include -O2 -pipe  -I/usr/local/include/cpu_features -fstack-protector-strong -isystem /usr/local/include -fno-strict-aliasing -fsigned-char -O2 -pipe  -I/usr/local/include/cpu_features -fstack-protector-strong -isystem /usr/local/include -fno-strict-alias
 ing  -DNDEBUG -O2 -std=gnu99 -fPIC -pthread -MD -MT src/Mayaqua/CMakeFiles/mayaqua.dir/Unix.c.o -MF CMakeFiles/mayaqua.dir/Unix.c.o.d -o CMakeFiles/mayaqua.dir/Unix.c.o -c /wrkdirs/usr/ports/security/softether5/work/SoftEtherVPN-5.02.5180-335-g1c0bdb0c/src/Mayaqua/Unix.c
+/wrkdirs/usr/ports/security/softether5/work/SoftEtherVPN-5.02.5180-335-g1c0bdb0c/src/Mayaqua/Unix.c:259:18: error: incompatible function pointer types assigning to 'void (*)(int, struct __siginfo *, void *)' from 'void *(int, siginfo_t *, void *)' (aka 'void *(int, struct __siginfo *, void *)') [-Wincompatible-function-pointer-types]
+        sa.sa_sigaction = signal_received_for_ignore;
+                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
+```
+
+Upstream: https://github.com/SoftEtherVPN/SoftEtherVPN/commit/5633314981937671f2f2e6fefc4e8f9440888671
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/Mayaqua/Unix.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/src/Mayaqua/Unix.c b/src/Mayaqua/Unix.c
+index 0a3d33099..bd1263c96 100755
+--- a/src/Mayaqua/Unix.c
++++ b/src/Mayaqua/Unix.c
+@@ -244,9 +244,11 @@ OS_DISPATCH_TABLE *UnixGetDispatchTable()
+ 	return &t;
+ }
+ 
+-static void *signal_received_for_ignore(int sig, siginfo_t *info, void *ucontext) 
++static void signal_received_for_ignore(int sig, siginfo_t *info, void *ucontext)
+ {
+-	return NULL;
++	(void)sig;
++	(void)info;
++	(void)ucontext;
+ }
+ 
+ // Ignore the signal flew to the thread
+@@ -256,7 +258,7 @@ void UnixIgnoreSignalForThread(int sig)
+ 
+ 	Zero(&sa, sizeof(sa));
+ 	sa.sa_handler = NULL;
+-	sa.sa_sigaction = signal_received_for_ignore;
++	sa.sa_sigaction = &signal_received_for_ignore;
+ 	sa.sa_flags = SA_SIGINFO;
+ 
+ 	sigemptyset(&sa.sa_mask);
diff --git a/package/softether/0014-cedar-hub-properly-set-value-for-hub-admin-options.patch b/package/softether/0014-cedar-hub-properly-set-value-for-hub-admin-options.patch
new file mode 100644
index 0000000000..246e0f1561
--- /dev/null
+++ b/package/softether/0014-cedar-hub-properly-set-value-for-hub-admin-options.patch
@@ -0,0 +1,193 @@
+From 2078a069de12c05ed317a45d6bfe3a2dc7565802 Mon Sep 17 00:00:00 2001
+From: Davide Beatrici <git@davidebeatrici.dev>
+Date: Sun, 28 Feb 2021 07:19:41 +0100
+Subject: [PATCH] Cedar/Hub: Properly set value for hub admin options
+
+Same deal as with the previous commit: worked fine as long as bool was 4-bytes wide.
+
+Upstream: https://github.com/SoftEtherVPN/SoftEtherVPN/commit/2078a069de12c05ed317a45d6bfe3a2dc7565802
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/Cedar/Hub.c | 142 +++++++++++++++++++++++-------------------------
+ src/Cedar/Hub.h |   1 -
+ 2 files changed, 67 insertions(+), 76 deletions(-)
+
+diff --git a/src/Cedar/Hub.c b/src/Cedar/Hub.c
+index 184f33127..ac36052a1 100644
+--- a/src/Cedar/Hub.c
++++ b/src/Cedar/Hub.c
+@@ -7,6 +7,13 @@
+ 
+ #include "CedarPch.h"
+ 
++#define GetHubAdminOptionDataAndSet(ao, name, dest) \
++	value = GetHubAdminOptionData(ao, name);        \
++	if (value != INFINITE)                          \
++	{                                               \
++		dest = value;                               \
++	}
++
+ static UCHAR broadcast[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
+ static char vgs_ua_str[9] = {0};
+ static bool g_vgs_emb_tag = false;
+@@ -516,23 +523,6 @@ UINT GetHubAdminOptionData(RPC_ADMIN_OPTION *ao, char *name)
+ 
+ 	return INFINITE;
+ }
+-void GetHubAdminOptionDataAndSet(RPC_ADMIN_OPTION *ao, char *name, UINT *dest)
+-{
+-	UINT value;
+-	// Validate arguments
+-	if (ao == NULL || name == NULL || dest == NULL)
+-	{
+-		return;
+-	}
+-
+-	value = GetHubAdminOptionData(ao, name);
+-	if (value == INFINITE)
+-	{
+-		return;
+-	}
+-
+-	*dest = value;
+-}
+ 
+ // Set the contents of the HUB_OPTION based on the data
+ void DataToHubOptionStruct(HUB_OPTION *o, RPC_ADMIN_OPTION *ao)
+@@ -543,64 +533,66 @@ void DataToHubOptionStruct(HUB_OPTION *o, RPC_ADMIN_OPTION *ao)
+ 		return;
+ 	}
+ 
+-	GetHubAdminOptionDataAndSet(ao, "NoAddressPollingIPv4", &o->NoArpPolling);
+-	GetHubAdminOptionDataAndSet(ao, "NoAddressPollingIPv6", &o->NoIPv6AddrPolling);
+-	GetHubAdminOptionDataAndSet(ao, "NoIpTable", &o->NoIpTable);
+-	GetHubAdminOptionDataAndSet(ao, "NoMacAddressLog", &o->NoMacAddressLog);
+-	GetHubAdminOptionDataAndSet(ao, "ManageOnlyPrivateIP", &o->ManageOnlyPrivateIP);
+-	GetHubAdminOptionDataAndSet(ao, "ManageOnlyLocalUnicastIPv6", &o->ManageOnlyLocalUnicastIPv6);
+-	GetHubAdminOptionDataAndSet(ao, "DisableIPParsing", &o->DisableIPParsing);
+-	GetHubAdminOptionDataAndSet(ao, "YieldAfterStorePacket", &o->YieldAfterStorePacket);
+-	GetHubAdminOptionDataAndSet(ao, "NoSpinLockForPacketDelay", &o->NoSpinLockForPacketDelay);
+-	GetHubAdminOptionDataAndSet(ao, "BroadcastStormDetectionThreshold", &o->BroadcastStormDetectionThreshold);
+-	GetHubAdminOptionDataAndSet(ao, "ClientMinimumRequiredBuild", &o->ClientMinimumRequiredBuild);
+-	GetHubAdminOptionDataAndSet(ao, "FilterPPPoE", &o->FilterPPPoE);
+-	GetHubAdminOptionDataAndSet(ao, "FilterOSPF", &o->FilterOSPF);
+-	GetHubAdminOptionDataAndSet(ao, "FilterIPv4", &o->FilterIPv4);
+-	GetHubAdminOptionDataAndSet(ao, "FilterIPv6", &o->FilterIPv6);
+-	GetHubAdminOptionDataAndSet(ao, "FilterNonIP", &o->FilterNonIP);
+-	GetHubAdminOptionDataAndSet(ao, "NoIPv4PacketLog", &o->NoIPv4PacketLog);
+-	GetHubAdminOptionDataAndSet(ao, "NoIPv6PacketLog", &o->NoIPv6PacketLog);
+-	GetHubAdminOptionDataAndSet(ao, "FilterBPDU", &o->FilterBPDU);
+-	GetHubAdminOptionDataAndSet(ao, "NoIPv6DefaultRouterInRAWhenIPv6", &o->NoIPv6DefaultRouterInRAWhenIPv6);
+-	GetHubAdminOptionDataAndSet(ao, "NoLookBPDUBridgeId", &o->NoLookBPDUBridgeId);
+-	GetHubAdminOptionDataAndSet(ao, "NoManageVlanId", &o->NoManageVlanId);
+-	GetHubAdminOptionDataAndSet(ao, "VlanTypeId", &o->VlanTypeId);
+-	GetHubAdminOptionDataAndSet(ao, "FixForDLinkBPDU", &o->FixForDLinkBPDU);
+-	GetHubAdminOptionDataAndSet(ao, "RequiredClientId", &o->RequiredClientId);
+-	GetHubAdminOptionDataAndSet(ao, "AdjustTcpMssValue", &o->AdjustTcpMssValue);
+-	GetHubAdminOptionDataAndSet(ao, "DisableAdjustTcpMss", &o->DisableAdjustTcpMss);
+-	GetHubAdminOptionDataAndSet(ao, "NoDhcpPacketLogOutsideHub", &o->NoDhcpPacketLogOutsideHub);
+-	GetHubAdminOptionDataAndSet(ao, "DisableHttpParsing", &o->DisableHttpParsing);
+-	GetHubAdminOptionDataAndSet(ao, "DisableUdpAcceleration", &o->DisableUdpAcceleration);
+-	GetHubAdminOptionDataAndSet(ao, "DisableUdpFilterForLocalBridgeNic", &o->DisableUdpFilterForLocalBridgeNic);
+-	GetHubAdminOptionDataAndSet(ao, "ApplyIPv4AccessListOnArpPacket", &o->ApplyIPv4AccessListOnArpPacket);
+-	GetHubAdminOptionDataAndSet(ao, "RemoveDefGwOnDhcpForLocalhost", &o->RemoveDefGwOnDhcpForLocalhost);
+-	GetHubAdminOptionDataAndSet(ao, "SecureNAT_MaxTcpSessionsPerIp", &o->SecureNAT_MaxTcpSessionsPerIp);
+-	GetHubAdminOptionDataAndSet(ao, "SecureNAT_MaxTcpSynSentPerIp", &o->SecureNAT_MaxTcpSynSentPerIp);
+-	GetHubAdminOptionDataAndSet(ao, "SecureNAT_MaxUdpSessionsPerIp", &o->SecureNAT_MaxUdpSessionsPerIp);
+-	GetHubAdminOptionDataAndSet(ao, "SecureNAT_MaxDnsSessionsPerIp", &o->SecureNAT_MaxDnsSessionsPerIp);
+-	GetHubAdminOptionDataAndSet(ao, "SecureNAT_MaxIcmpSessionsPerIp", &o->SecureNAT_MaxIcmpSessionsPerIp);
+-	GetHubAdminOptionDataAndSet(ao, "AccessListIncludeFileCacheLifetime", &o->AccessListIncludeFileCacheLifetime);
+-	GetHubAdminOptionDataAndSet(ao, "DisableKernelModeSecureNAT", &o->DisableKernelModeSecureNAT);
+-	GetHubAdminOptionDataAndSet(ao, "DisableIpRawModeSecureNAT", &o->DisableIpRawModeSecureNAT);
+-	GetHubAdminOptionDataAndSet(ao, "DisableUserModeSecureNAT", &o->DisableUserModeSecureNAT);
+-	GetHubAdminOptionDataAndSet(ao, "DisableCheckMacOnLocalBridge", &o->DisableCheckMacOnLocalBridge);
+-	GetHubAdminOptionDataAndSet(ao, "DisableCorrectIpOffloadChecksum", &o->DisableCorrectIpOffloadChecksum);
+-	GetHubAdminOptionDataAndSet(ao, "BroadcastLimiterStrictMode", &o->BroadcastLimiterStrictMode);
+-	GetHubAdminOptionDataAndSet(ao, "MaxLoggedPacketsPerMinute", &o->MaxLoggedPacketsPerMinute);
+-	GetHubAdminOptionDataAndSet(ao, "DoNotSaveHeavySecurityLogs", &o->DoNotSaveHeavySecurityLogs);
+-	GetHubAdminOptionDataAndSet(ao, "DropBroadcastsInPrivacyFilterMode", &o->DropBroadcastsInPrivacyFilterMode);
+-	GetHubAdminOptionDataAndSet(ao, "DropArpInPrivacyFilterMode", &o->DropArpInPrivacyFilterMode);
+-	GetHubAdminOptionDataAndSet(ao, "SuppressClientUpdateNotification", &o->SuppressClientUpdateNotification);
+-	GetHubAdminOptionDataAndSet(ao, "FloodingSendQueueBufferQuota", &o->FloodingSendQueueBufferQuota);
+-	GetHubAdminOptionDataAndSet(ao, "AssignVLanIdByRadiusAttribute", &o->AssignVLanIdByRadiusAttribute);
+-	GetHubAdminOptionDataAndSet(ao, "DenyAllRadiusLoginWithNoVlanAssign", &o->DenyAllRadiusLoginWithNoVlanAssign);
+-	GetHubAdminOptionDataAndSet(ao, "SecureNAT_RandomizeAssignIp", &o->SecureNAT_RandomizeAssignIp);
+-	GetHubAdminOptionDataAndSet(ao, "DetectDormantSessionInterval", &o->DetectDormantSessionInterval);
+-	GetHubAdminOptionDataAndSet(ao, "NoPhysicalIPOnPacketLog", &o->NoPhysicalIPOnPacketLog);
+-	GetHubAdminOptionDataAndSet(ao, "UseHubNameAsDhcpUserClassOption", &o->UseHubNameAsDhcpUserClassOption);
+-	GetHubAdminOptionDataAndSet(ao, "UseHubNameAsRadiusNasId", &o->UseHubNameAsRadiusNasId);
++	UINT value;
++
++	GetHubAdminOptionDataAndSet(ao, "NoAddressPollingIPv4", o->NoArpPolling);
++	GetHubAdminOptionDataAndSet(ao, "NoAddressPollingIPv6", o->NoIPv6AddrPolling);
++	GetHubAdminOptionDataAndSet(ao, "NoIpTable", o->NoIpTable);
++	GetHubAdminOptionDataAndSet(ao, "NoMacAddressLog", o->NoMacAddressLog);
++	GetHubAdminOptionDataAndSet(ao, "ManageOnlyPrivateIP", o->ManageOnlyPrivateIP);
++	GetHubAdminOptionDataAndSet(ao, "ManageOnlyLocalUnicastIPv6", o->ManageOnlyLocalUnicastIPv6);
++	GetHubAdminOptionDataAndSet(ao, "DisableIPParsing", o->DisableIPParsing);
++	GetHubAdminOptionDataAndSet(ao, "YieldAfterStorePacket", o->YieldAfterStorePacket);
++	GetHubAdminOptionDataAndSet(ao, "NoSpinLockForPacketDelay", o->NoSpinLockForPacketDelay);
++	GetHubAdminOptionDataAndSet(ao, "BroadcastStormDetectionThreshold", o->BroadcastStormDetectionThreshold);
++	GetHubAdminOptionDataAndSet(ao, "ClientMinimumRequiredBuild", o->ClientMinimumRequiredBuild);
++	GetHubAdminOptionDataAndSet(ao, "FilterPPPoE", o->FilterPPPoE);
++	GetHubAdminOptionDataAndSet(ao, "FilterOSPF", o->FilterOSPF);
++	GetHubAdminOptionDataAndSet(ao, "FilterIPv4", o->FilterIPv4);
++	GetHubAdminOptionDataAndSet(ao, "FilterIPv6", o->FilterIPv6);
++	GetHubAdminOptionDataAndSet(ao, "FilterNonIP", o->FilterNonIP);
++	GetHubAdminOptionDataAndSet(ao, "NoIPv4PacketLog", o->NoIPv4PacketLog);
++	GetHubAdminOptionDataAndSet(ao, "NoIPv6PacketLog", o->NoIPv6PacketLog);
++	GetHubAdminOptionDataAndSet(ao, "FilterBPDU", o->FilterBPDU);
++	GetHubAdminOptionDataAndSet(ao, "NoIPv6DefaultRouterInRAWhenIPv6", o->NoIPv6DefaultRouterInRAWhenIPv6);
++	GetHubAdminOptionDataAndSet(ao, "NoLookBPDUBridgeId", o->NoLookBPDUBridgeId);
++	GetHubAdminOptionDataAndSet(ao, "NoManageVlanId", o->NoManageVlanId);
++	GetHubAdminOptionDataAndSet(ao, "VlanTypeId", o->VlanTypeId);
++	GetHubAdminOptionDataAndSet(ao, "FixForDLinkBPDU", o->FixForDLinkBPDU);
++	GetHubAdminOptionDataAndSet(ao, "RequiredClientId", o->RequiredClientId);
++	GetHubAdminOptionDataAndSet(ao, "AdjustTcpMssValue", o->AdjustTcpMssValue);
++	GetHubAdminOptionDataAndSet(ao, "DisableAdjustTcpMss", o->DisableAdjustTcpMss);
++	GetHubAdminOptionDataAndSet(ao, "NoDhcpPacketLogOutsideHub", o->NoDhcpPacketLogOutsideHub);
++	GetHubAdminOptionDataAndSet(ao, "DisableHttpParsing", o->DisableHttpParsing);
++	GetHubAdminOptionDataAndSet(ao, "DisableUdpAcceleration", o->DisableUdpAcceleration);
++	GetHubAdminOptionDataAndSet(ao, "DisableUdpFilterForLocalBridgeNic", o->DisableUdpFilterForLocalBridgeNic);
++	GetHubAdminOptionDataAndSet(ao, "ApplyIPv4AccessListOnArpPacket", o->ApplyIPv4AccessListOnArpPacket);
++	GetHubAdminOptionDataAndSet(ao, "RemoveDefGwOnDhcpForLocalhost", o->RemoveDefGwOnDhcpForLocalhost);
++	GetHubAdminOptionDataAndSet(ao, "SecureNAT_MaxTcpSessionsPerIp", o->SecureNAT_MaxTcpSessionsPerIp);
++	GetHubAdminOptionDataAndSet(ao, "SecureNAT_MaxTcpSynSentPerIp", o->SecureNAT_MaxTcpSynSentPerIp);
++	GetHubAdminOptionDataAndSet(ao, "SecureNAT_MaxUdpSessionsPerIp", o->SecureNAT_MaxUdpSessionsPerIp);
++	GetHubAdminOptionDataAndSet(ao, "SecureNAT_MaxDnsSessionsPerIp", o->SecureNAT_MaxDnsSessionsPerIp);
++	GetHubAdminOptionDataAndSet(ao, "SecureNAT_MaxIcmpSessionsPerIp", o->SecureNAT_MaxIcmpSessionsPerIp);
++	GetHubAdminOptionDataAndSet(ao, "AccessListIncludeFileCacheLifetime", o->AccessListIncludeFileCacheLifetime);
++	GetHubAdminOptionDataAndSet(ao, "DisableKernelModeSecureNAT", o->DisableKernelModeSecureNAT);
++	GetHubAdminOptionDataAndSet(ao, "DisableIpRawModeSecureNAT", o->DisableIpRawModeSecureNAT);
++	GetHubAdminOptionDataAndSet(ao, "DisableUserModeSecureNAT", o->DisableUserModeSecureNAT);
++	GetHubAdminOptionDataAndSet(ao, "DisableCheckMacOnLocalBridge", o->DisableCheckMacOnLocalBridge);
++	GetHubAdminOptionDataAndSet(ao, "DisableCorrectIpOffloadChecksum", o->DisableCorrectIpOffloadChecksum);
++	GetHubAdminOptionDataAndSet(ao, "BroadcastLimiterStrictMode", o->BroadcastLimiterStrictMode);
++	GetHubAdminOptionDataAndSet(ao, "MaxLoggedPacketsPerMinute", o->MaxLoggedPacketsPerMinute);
++	GetHubAdminOptionDataAndSet(ao, "DoNotSaveHeavySecurityLogs", o->DoNotSaveHeavySecurityLogs);
++	GetHubAdminOptionDataAndSet(ao, "DropBroadcastsInPrivacyFilterMode", o->DropBroadcastsInPrivacyFilterMode);
++	GetHubAdminOptionDataAndSet(ao, "DropArpInPrivacyFilterMode", o->DropArpInPrivacyFilterMode);
++	GetHubAdminOptionDataAndSet(ao, "SuppressClientUpdateNotification", o->SuppressClientUpdateNotification);
++	GetHubAdminOptionDataAndSet(ao, "FloodingSendQueueBufferQuota", o->FloodingSendQueueBufferQuota);
++	GetHubAdminOptionDataAndSet(ao, "AssignVLanIdByRadiusAttribute", o->AssignVLanIdByRadiusAttribute);
++	GetHubAdminOptionDataAndSet(ao, "DenyAllRadiusLoginWithNoVlanAssign", o->DenyAllRadiusLoginWithNoVlanAssign);
++	GetHubAdminOptionDataAndSet(ao, "SecureNAT_RandomizeAssignIp", o->SecureNAT_RandomizeAssignIp);
++	GetHubAdminOptionDataAndSet(ao, "DetectDormantSessionInterval", o->DetectDormantSessionInterval);
++	GetHubAdminOptionDataAndSet(ao, "NoPhysicalIPOnPacketLog", o->NoPhysicalIPOnPacketLog);
++	GetHubAdminOptionDataAndSet(ao, "UseHubNameAsDhcpUserClassOption", o->UseHubNameAsDhcpUserClassOption);
++	GetHubAdminOptionDataAndSet(ao, "UseHubNameAsRadiusNasId", o->UseHubNameAsRadiusNasId);
+ }
+ 
+ // Convert the contents of the HUB_OPTION to data
+diff --git a/src/Cedar/Hub.h b/src/Cedar/Hub.h
+index 2c2dc66a5..8d077f35e 100644
+--- a/src/Cedar/Hub.h
++++ b/src/Cedar/Hub.h
+@@ -519,7 +519,6 @@ void HubOptionStructToData(RPC_ADMIN_OPTION *ao, HUB_OPTION *o, char *hub_name);
+ ADMIN_OPTION *NewAdminOption(char *name, UINT value);
+ void DataToHubOptionStruct(HUB_OPTION *o, RPC_ADMIN_OPTION *ao);
+ UINT GetHubAdminOptionData(RPC_ADMIN_OPTION *ao, char *name);
+-void GetHubAdminOptionDataAndSet(RPC_ADMIN_OPTION *ao, char *name, UINT *dest);
+ bool IsURLMsg(wchar_t *str, char *url, UINT url_size);
+ LIST *NewUserList();
+ void DeleteAllUserListCache(LIST *o);
diff --git a/package/softether/0015-adjust-types-of-variables.patch b/package/softether/0015-adjust-types-of-variables.patch
new file mode 100644
index 0000000000..7d08a971e6
--- /dev/null
+++ b/package/softether/0015-adjust-types-of-variables.patch
@@ -0,0 +1,93 @@
+From 60ee4630442c4458896553060c795732fd4a04de Mon Sep 17 00:00:00 2001
+From: Ilya Shipitsin <chipitsine@gmail.com>
+Date: Fri, 23 Feb 2024 11:06:27 +0100
+Subject: [PATCH] adjust types of variables
+
+gcc14 is not happy on "error: passing argument .. from incompatible pointer type [-Wincompatible-pointer-types]"
+
+Upstream: https://github.com/SoftEtherVPN/SoftEtherVPN/commit/60ee4630442c4458896553060c795732fd4a04de
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/Mayaqua/pkcs11f.h | 6 +++---
+ src/Mayaqua/pkcs11t.h | 9 ++++++---
+ 2 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/src/Mayaqua/pkcs11f.h b/src/Mayaqua/pkcs11f.h
+index 300975352..33550c3dd 100644
+--- a/src/Mayaqua/pkcs11f.h
++++ b/src/Mayaqua/pkcs11f.h
+@@ -73,7 +73,7 @@ CK_PKCS11_FUNCTION_INFO(C_GetSlotList)
+ (
+   CK_BBOOL       tokenPresent,  /* only slots with tokens? */
+   CK_SLOT_ID_PTR pSlotList,     /* receives array of slot IDs */
+-  CK_ULONG_PTR   pulCount       /* receives number of slots */
++  CK_UINT_PTR   pulCount       /* receives number of slots */
+ );
+ #endif
+ 
+@@ -351,7 +351,7 @@ CK_PKCS11_FUNCTION_INFO(C_FindObjects)
+  CK_SESSION_HANDLE    hSession,          /* session's handle */
+  CK_OBJECT_HANDLE_PTR phObject,          /* gets obj. handles */
+  CK_ULONG             ulMaxObjectCount,  /* max handles to get */
+- CK_ULONG_PTR         pulObjectCount     /* actual # returned */
++ CK_UINT_PTR         pulObjectCount     /* actual # returned */
+ );
+ #endif
+ 
+@@ -558,7 +558,7 @@ CK_PKCS11_FUNCTION_INFO(C_Sign)
+   CK_BYTE_PTR       pData,           /* the data to sign */
+   CK_ULONG          ulDataLen,       /* count of bytes to sign */
+   CK_BYTE_PTR       pSignature,      /* gets the signature */
+-  CK_ULONG_PTR      pulSignatureLen  /* gets signature length */
++  CK_UINT_PTR      pulSignatureLen  /* gets signature length */
+ );
+ #endif
+ 
+diff --git a/src/Mayaqua/pkcs11t.h b/src/Mayaqua/pkcs11t.h
+index c04b57192..f157ce738 100644
+--- a/src/Mayaqua/pkcs11t.h
++++ b/src/Mayaqua/pkcs11t.h
+@@ -51,6 +51,8 @@ typedef CK_BYTE           CK_BBOOL;
+ /* an unsigned value, at least 32 bits long */
+ typedef unsigned long int CK_ULONG;
+ 
++typedef unsigned int CK_UINT;
++
+ /* a signed value, the same size as a CK_ULONG */
+ /* CK_LONG is new for v2.0 */
+ typedef long int          CK_LONG;
+@@ -68,6 +70,7 @@ typedef CK_BYTE     CK_PTR   CK_BYTE_PTR;
+ typedef CK_CHAR     CK_PTR   CK_CHAR_PTR;
+ typedef CK_UTF8CHAR CK_PTR   CK_UTF8CHAR_PTR;
+ typedef CK_ULONG    CK_PTR   CK_ULONG_PTR;
++typedef CK_UINT     CK_PTR   CK_UINT_PTR;
+ typedef void        CK_PTR   CK_VOID_PTR;
+ 
+ /* Pointer to a CK_VOID_PTR-- i.e., pointer to pointer to void */
+@@ -110,7 +113,7 @@ typedef CK_ULONG CK_NOTIFICATION;
+ #define CKN_SURRENDER       0
+ 
+ 
+-typedef CK_ULONG          CK_SLOT_ID;
++typedef CK_UINT          CK_SLOT_ID;
+ 
+ typedef CK_SLOT_ID CK_PTR CK_SLOT_ID_PTR;
+ 
+@@ -262,7 +265,7 @@ typedef CK_TOKEN_INFO CK_PTR CK_TOKEN_INFO_PTR;
+ 
+ /* CK_SESSION_HANDLE is a Cryptoki-assigned value that
+  * identifies a session */
+-typedef CK_ULONG          CK_SESSION_HANDLE;
++typedef CK_UINT          CK_SESSION_HANDLE;
+ 
+ typedef CK_SESSION_HANDLE CK_PTR CK_SESSION_HANDLE_PTR; 
+ 
+@@ -310,7 +313,7 @@ typedef CK_SESSION_INFO CK_PTR CK_SESSION_INFO_PTR;
+ 
+ /* CK_OBJECT_HANDLE is a token-specific identifier for an
+  * object  */
+-typedef CK_ULONG          CK_OBJECT_HANDLE;
++typedef CK_UINT          CK_OBJECT_HANDLE;
+ 
+ typedef CK_OBJECT_HANDLE CK_PTR CK_OBJECT_HANDLE_PTR;
+ 
diff --git a/package/softether/0016-Cedar-Proto_IKE-fix-too-many-arguments-to-function-N.patch b/package/softether/0016-Cedar-Proto_IKE-fix-too-many-arguments-to-function-N.patch
new file mode 100644
index 0000000000..f25a9df726
--- /dev/null
+++ b/package/softether/0016-Cedar-Proto_IKE-fix-too-many-arguments-to-function-N.patch
@@ -0,0 +1,54 @@
+From f37845f6ab06d68ea6c669f150eab71ff20f21ff Mon Sep 17 00:00:00 2001
+From: Thomas Perale <thomas.perale@mind.be>
+Date: Wed, 9 Jul 2025 18:17:21 +0200
+Subject: [PATCH] Cedar/Proto_IKE: fix too many arguments to function 'NewBuf'
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This commit fixes the following error:
+
+```
+Proto_IKE.c: In function ‘ProcIkeQuickModePacketRecv’:
+Proto_IKE.c:2362:146: error: too many arguments to function ‘NewBuf’; expected 0, have 2
+ 2362 |                                                                                                                         ipsec_sa_sc->SharedKey = NewBuf(shared_key, shared_key_size);
+      |                                                                                                                                                  ^~~~~~ ~~~~~~~~~~
+In file included from ../../src/Mayaqua/Mayaqua.h:338,
+                 from CedarPch.h:115,
+                 from IPsec_IKE.c:105:
+../../src/Mayaqua/Memory.h:303:6: note: declared here
+  303 | BUF *NewBuf();
+      |      ^~~~~~
+Proto_IKE.c:2363:146: error: too many arguments to function ‘NewBuf’; expected 0, have 2
+ 2363 |                                                                                                                         ipsec_sa_cs->SharedKey = NewBuf(shared_key, shared_key_size);
+      |                                                                                                                                                  ^~~~~~ ~~~~~~~~~~
+```
+
+The function `NewBuf` is defined without arguments. Replace it in favour
+of `NewBufFromMemory` that copy the content of the pointer into a new
+buffer.
+
+Upstream: https://github.com/SoftEtherVPN/SoftEtherVPN/pull/2135
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/Cedar/IPsec_IKE.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Cedar/IPsec_IKE.c b/src/Cedar/IPsec_IKE.c
+index 5d407494..8234f100 100644
+--- a/src/Cedar/IPsec_IKE.c
++++ b/src/Cedar/IPsec_IKE.c
+@@ -2359,8 +2359,8 @@ void ProcIkeQuickModePacketRecv(IKE_SERVER *ike, UDPPACKET *p, IKE_PACKET *heade
+ 														// Update the information of IPsec SA
+ 														if (shared_key != NULL)
+ 														{
+-															ipsec_sa_sc->SharedKey = NewBuf(shared_key, shared_key_size);
+-															ipsec_sa_cs->SharedKey = NewBuf(shared_key, shared_key_size);
++															ipsec_sa_sc->SharedKey = NewBufFromMemory(shared_key, shared_key_size);
++															ipsec_sa_cs->SharedKey = NewBufFromMemory(shared_key, shared_key_size);
+ 														}
+ 
+ 														ipsec_sa_sc->Spi = setting.SpiServerToClient;
+-- 
+2.50.0
+

--===============5310110665742607512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5310110665742607512==--
