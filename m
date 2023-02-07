Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E48C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2168E700DA;
	Tue, 21 Feb 2023 01:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2168E700DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xAg7LugwOILb; Tue, 21 Feb 2023 01:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25443700D5;
	Tue, 21 Feb 2023 01:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25443700D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2E271BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 457FA6106E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 457FA6106E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMbbSKwGp9kb for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42E496FC18
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42E496FC18
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 314C086495; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 16:48:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 26dd70e954a7c9142b078837ab1bbfad54d0e5cb
X-Git-Newrev: b635bda5bc5ea9db15cb83390d8e3908b85c2629
X-Patchwork-Hint: ignore
Message-Id: <20230220205253.314C086495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python3: use pure
 python UUID backend for host variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3281274144038981459=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3281274144038981459==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b635bda5bc5ea9db15cb83390d8e3908b85c2629
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

host-python3 currently does not build if util-linux-uuid option is not
enabled, failing with the following error messages:
"""
/usr/lib64/ccache/gcc -fPIC -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -O2 -I/home/qschulz/work/upstream/buildroot/output/host/include -std=c11 -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wstrict-prototypes -Werror=implicit-function-declaration -fvisibility=hidden -I./Include/internal -I./Include -I. -I/home/qschulz/work/upstream/buildroot/output/host/include -I/usr/local/include -I/home/qschulz/work/upstream/buildroot/output/build/host-python3-3.11.1/Include -I/home/qschulz/work/upstream/buildroot/output/build/host-python3-3.11.1 -c /home/qschulz/work/upstream/buildroot/output/build/host-python3-3.11.1/Modules/_uuidmodule.c -o build/temp.linux-x86_64-3.11/home/qschulz/work/upstream/buildroot/output/build/host-python3-3.11.1/Modules/_uuidmodule.o
/home/qschulz/work/upstream/buildroot/output/build/host-python3-3.11.1/Modules/_uuidmodule.c: In function ‘py_uuid_generate_time_safe’:
/home/qschulz/work/upstream/buildroot/output/build/host-python3-3.11.1/Modules/_uuidmodule.c:27:12: error: storage size of ‘uui ’ isn’t known
   27 |     uuid_t uuid;
      |            ^~~~
/home/qschulz/work/upstream/buildroot/output/build/host-python3-3.11.1/Modules/_uuidmodule.c:31:11: error: implicit declaration of function ‘uuid_generate_time_safe’; did you mean ‘py_uuid_generate_time_safe’? [-Werror=implicit-function-declaration]
   31 |     res = uuid_generate_time_safe(uuid);
      |           ^~~~~~~~~~~~~~~~~~~~~~~
      |           py_uuid_generate_time_safe
/home/qschulz/work/upstream/buildroot/output/build/host-python3-3.11.1/Modules/_uuidmodule.c:27:12: warning: unused variable ‘uuid’ [-Wunused-variable]
   27 |     uuid_t uuid;
      |            ^~~~
/home/qschulz/work/upstream/buildroot/output/build/host-python3-3.11.1/Modules/_uuidmodule.c:47:1: warning: control reaches end of non-void function [-Wreturn-type]
   47 | }
      | ^
cc1: some warnings being treated as errors

The necessary bits to build these optional modules were not found:
_dbm                 _gdbm                _tkinter
nis                  readline
To find the necessary bits, look in setup.py in detect_modules() for the module's name.

The following modules found by detect_modules() in setup.py have not
been built, they are *disabled* by configure:
_ctypes_test         _sqlite3             _testbuffer
_testcapi            _testimportmultiple   _testinternalcapi
_testmultiphase      _xxtestfuzz

Failed to build these modules:
_uuid
"""

Therefore, let's disable building the _uuid extension the same way it's
done for the target package since commit 0b68713aae28 ("python3: use
pure python UUID backend").

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python3/python3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 219d135b3f..fb6dbf2e64 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -31,6 +31,7 @@ HOST_PYTHON3_CONF_OPTS += \
 	--enable-unicodedata \
 	--disable-test-modules \
 	--disable-idle3 \
+	--disable-uuid \
 	--disable-ossaudiodev
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.

--===============3281274144038981459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3281274144038981459==--
