Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03279C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 16:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99E5E809A4;
	Sun,  6 Sep 2026 16:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruFfvjGW5q-l; Sun,  6 Sep 2026 16:51:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 673EA80A89
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788713516;
	b=YArOI608IEd2y43cBM+EGyCycsJFcIrQtS1yEA25G9f5t9QFfX3l8iVoxEN4jqmCDCBD
	 vaek8BlIr8nFJX7Kobc3d7o58b49K5BjG2+UOLU/IZLDMo9ToIX3/4TPAfVx0REtzEXYr
	 1fCfa163HkP1aKtqazqDb/ZzLUoX+SOBLBAL+Mwy8tc8umd8nJU1MvsKi1dJGyde/LghY
	 Tp5YVoiVDPyCWjkm0jopKE68vwLKCja5U7g4CMGISi5H6T7wC7nRAKWt03+srOxVFhL27
	 aTWBhXtGiD10iokICh77hnRVLKp7jD8pto6Uln3THQCJcE3kVmsse9dzBPm9147qsJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788713516;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=vOocsNzub36agJAyS3KHNnJxrQB/ecf0CosLm6MsecQ=;
	b=OAE9rWp5i4NYamRo0Ki8d/rXN3UAW1w7MlgmOfOCY8Uo024aZCIO7BVHwWRf7f0phi4t
	 gFlhFotB+ajSekAmvHbOw6nZvgswV4hzkw0vzPZ84v1LKyHt/A4S9OCdMf9/j+IzYIAzC
	 riKgO4jcogLAjjEvo7utZapCnxp+AeuIObDq8oTtrpU4rkMSNlRW3vgaF7cW89TSezZGf
	 EElx47f2XqYWx1W7PIvJJOinJ/9KUxcX5odE3R4/+EkixwyaIQrsSm0RoqJywstbHNGWl
	 heflGzAEsROIK4MKIj0gHBb8VZGdihDUfqPPJtPtxIO2xA8kgozZkDuefKmMHv7SDDw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788713516;
	bh=vOocsNzub36agJAyS3KHNnJxrQB/ecf0CosLm6MsecQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DAwOTgGe8uOj64pZeh9ttZQOyzgS4IdaVrhq+3O7oR5JjLOiK4wjRo8YvhEAQETrV
	 nYDlukTD73JCVsxzax9A58tvNIwZjOK7y2xyP8qoBVYctyuwHmo9jX6CVsTXxfQ1xf
	 KOTbTTfyPDOqQGcEuJPy1UZfS6FrIc+xBNLnTvG6iysinuNTJX6lnaMtstMz94Qx24
	 x0R6qBQF9fAVJIkL7QrvgN6CQKrGJhzCeHhJ4R4t5dmmfpsMA0ytxF+fqCMozakiJq
	 xIMDU4b6Viq9hrTFDUt2SaYy3KuXtbra6heAUmD3vFKX9iAwzpE+CFyNVyJYMJCxO6
	 cmexKAI69dMGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 673EA80A89;
	Sun,  6 Sep 2026 16:51:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 874BC2C7
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CE91605EA
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ke5CRREw10Yt for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 16:51:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E50B2605D3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788713513;
 b=OnNtKQhcxRQOLmCESDHxBuPMM3I8EsFVXhHqz90Ahl/5hLxtWrSBoCgavpZA6I9bXesP
 Ti6tw4vg9vez8njp9fpIUihJSPx2tWb1+GaEozYOLUtNnBrl9UkzZu0KhpSb28o75YB7t
 VBnxuQ1lvelnbFLwN+3zfuNzYiNOQeKuHnJSBs+ATVgBOnoVN15SBzVnXajIe+SSnKPhG
 Pjny2ad1GnjTizlevVu6ZcztOOeKMQI7uwzw/O2d/maJkZp1X2i8DeFCJf28myEncXXsc
 TtQMY4pd20wbPnE4LWfF19rgxSIziP6fN17d81SQ6Ve4/N520+Wx62PLYaXqGBirMOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788713513;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=9A7RK2Y+kqWM16CgBdnZJUl+rhkX/I42oNuuLkxGfh8=;
 b=kXA79h3OCFy3LTGfvoN21JVBh7gEuy0gqtYbqUYgK8Uj4fRGrU0kqtLNZJ3i/TrnOztd
 u+/uY17DtGIqOp1OpwNYnenpAEn3KZ8TLE09313C+wJoQkngJcA5c4roFgs0dQtEtPO4V
 Om+qu+7znp60UJg7vHIDrvcZmN161sSwTkfKfgCGuSrVIDKrbZNBWKCU6aDn2OMu6b5Md
 oBkf3GPz4VbobwQvZHM0aj/X6/ExRBV1jwBS2CkE3gAADpSCqoS4Yy1uw5iq/Wm+aa0g+
 QJtcJOYM2gpu/Uyv+Z4cYzFtKKrXCiZstgyP7ojRDuaZ8a6wlpDg/DD+hdqwB6IdfJA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cdTErAya; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cdTErAya
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E50B2605D3
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788713510;
 bh=9A7RK2Y+kqWM16CgBdnZJUl+rhkX/I42oNuuLkxGfh8=;
 h=From:To:Cc:Subject:Date:From;
 b=cdTErAyaMzIfcsjI26+qe8Dl5/sw3NgToxyPQtKEhUJqwAN4nD7H1oX/ckDak5Oeu
 4z/Yy3P1NsLDaTf+/ZY6XZ5SpxQGkePq3irCflgyl4Hqt6kFL2J8QIT5GkAfZv8yLr
 knPBYljUPp92t3/GegwZ/3fO7DYrMIFaAiQX6aah7A0xoHYrwQQgJHMou2c/Mma/Gt
 gp4k+3fuxde8VhR4uZsJZyy8GV8T2BfzCQSnTeUEHBFhdrokPUl9G3hSESkol4f43y
 fHJ0CUSe4YAvXvrtNRQfpuyX23bTRpo7VK/H5zIuJv6D6aI6s6aQ34LkIg8weNmjXj
 cPv+OqYGXnKyg==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 65306A4C346D;
 Sun,  6 Sep 2026 18:51:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44048)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3G5u-000000003tT-0o4z;
 Sun, 06 Sep 2026 16:51:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 Sep 2026 18:51:48 +0200
Message-ID: <20260906165149.1035063-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/2] package/boinc: fix build error with
 uClibc-ng
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://autobuild.buildroot.net/results/f10/f1015559e37d73403c396ee883d9a73fd167b9dd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/6f246f65bc89cd9e146a606c60b3c9ccf19f8ec4

 ...ched.h-to-fix-build-error-with-uClib.patch | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 package/boinc/0001-client-include-sched.h-to-fix-build-error-with-uClib.patch

diff --git a/package/boinc/0001-client-include-sched.h-to-fix-build-error-with-uClib.patch b/package/boinc/0001-client-include-sched.h-to-fix-build-error-with-uClib.patch
new file mode 100644
index 0000000000..c4f0c1f87e
--- /dev/null
+++ b/package/boinc/0001-client-include-sched.h-to-fix-build-error-with-uClib.patch
@@ -0,0 +1,69 @@
+From f06b730ad648607e1a2ace0c364f6dd4a13fd159 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 6 Sep 2026 17:49:47 +0200
+Subject: [PATCH] client: include sched.h to fix build error with uClibc-ng
+
+Detected by buildroot autobuilders:
+https://autobuild.buildroot.net/results/f10/f1015559e37d73403c396ee883d9a73fd167b9dd/build-end.log
+
+In file included from /home/autobuild/autobuild/instance-6/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/include/pthread.h:20,
+                 from thread.h:23,
+                 from client_state.h:37,
+                 from cpu_sched.cpp:76:
+cpu_sched.cpp: In member function 'void PROC_RESOURCES::schedule(RESULT*, ACTIVE_TASK*, bool)':
+cpu_sched.cpp:247:30: error: 'struct PROJECT' has no member named '__sched_priority'; did you mean 'sched_priority'?
+  247 |                 rp->project->sched_priority
+      |                              ^~~~~~~~~~~~~~
+cpu_sched.cpp: In member function 'RESULT* CLIENT_STATE::highest_prio_project_best_result()':
+cpu_sched.cpp:438:25: error: 'struct PROJECT' has no member named '__sched_priority'; did you mean 'sched_priority'?
+  438 |         if (first || p->sched_priority > best_prio) {
+      |                         ^~~~~~~~~~~~~~
+cpu_sched.cpp:441:28: error: 'struct PROJECT' has no member named '__sched_priority'; did you mean 'sched_priority'?
+  441 |             best_prio = p->sched_priority;
+      |                            ^~~~~~~~~~~~~~
+cpu_sched.cpp: In function 'RESULT* first_coproc_result(int)':
+cpu_sched.cpp:474:29: error: 'struct PROJECT' has no member named '__sched_priority'; did you mean 'sched_priority'?
+  474 |         prio = rp->project->sched_priority;
+      |                             ^~~~~~~~~~~~~~
+cpu_sched.cpp: In function 'void project_priority_init(bool)':
+cpu_sched.cpp:684:16: error: 'struct PROJECT' has no member named '__sched_priority'; did you mean 'sched_priority'?
+  684 |             p->sched_priority = 0;
+      |                ^~~~~~~~~~~~~~
+cpu_sched.cpp:690:24: error: 'struct PROJECT' has no member named '__sched_priority'; did you mean 'sched_priority'?
+  690 |                     p->sched_priority, p->resource_share_frac,
+      |                        ^~~~~~~~~~~~~~
+cpu_sched.cpp: In member function 'void PROJECT::compute_sched_priority()':
+cpu_sched.cpp:705:9: error: '__sched_priority' was not declared in this scope; did you mean 'sched_priority'?
+  705 |         sched_priority = -1e3 - rec_frac;
+      |         ^~~~~~~~~~~~~~
+cpu_sched.cpp:708:13: error: '__sched_priority' was not declared in this scope; did you mean 'sched_priority'?
+  708 |             sched_priority = - rec_frac/resource_share_frac;
+      |             ^~~~~~~~~~~~~~
+cpu_sched.cpp:710:13: error: '__sched_priority' was not declared in this scope; did you mean 'sched_priority'?
+  710 |             sched_priority = - rec_frac;
+      |             ^~~~~~~~~~~~~~
+
+Upstream: https://github.com/BOINC/boinc/pull/7282
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ client/cpu_sched.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/client/cpu_sched.cpp b/client/cpu_sched.cpp
+index f50b1b1785..f093c48e2c 100644
+--- a/client/cpu_sched.cpp
++++ b/client/cpu_sched.cpp
+@@ -56,6 +56,9 @@
+ #include <list>
+ #endif
+ 
++#if HAVE_SCHED_SETSCHEDULER && defined (__linux__)
++#include <sched.h>
++#endif
+ 
+ #include "coproc.h"
+ #include "error_numbers.h"
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
