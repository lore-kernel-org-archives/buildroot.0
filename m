Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39751C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 15:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6000811F9;
	Tue,  7 Feb 2023 15:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6000811F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wP52DTTyeTf2; Tue,  7 Feb 2023 15:49:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1957812DB;
	Tue,  7 Feb 2023 15:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1957812DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CEE3F1BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA300404B0
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA300404B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bK_dBqNW_tBZ for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 15:49:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4AC540232
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 15:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4AC540232
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0ED584291; Tue,  7 Feb 2023 15:49:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 16:48:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26dd70e954a7c9142b078837ab1bbfad54d0e5cb
X-Git-Newrev: b635bda5bc5ea9db15cb83390d8e3908b85c2629
X-Patchwork-Hint: ignore
Message-Id: <20230207154903.D0ED584291@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: use pure python UUID
 backend for host variant
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
Content-Type: multipart/mixed; boundary="===============8146396621312472039=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8146396621312472039==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b635bda5bc5ea9db15cb83390d8e3908b85c2629
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============8146396621312472039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8146396621312472039==--
