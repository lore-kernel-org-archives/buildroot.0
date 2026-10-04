Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C70CCA5FF0
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 18:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B37706060E;
	Sun,  4 Oct 2026 18:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daRUJJWNnsVr; Sun,  4 Oct 2026 18:13:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 85F02606A3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791137612;
	b=pivDlLJW8xe9yAZuBcZWTRMHog1yMo9nPzl/IQpl9uFiQn9FLf67KjOWmQRLBC6AzdeY
	 x+ZWPv9eGoWVf8raP8Q5bAH5qEPBDmiDW5va+nDTzP4Tf0yc4ADee5AVGVTEhhP+pTM8t
	 p6kEU0gjY0NlH8Yj7b0iLC3vdCeyER5yMoAuAi2mNvX53ioMYwhV7+vFoTagO9hOY1Xl2
	 YY+J8mz0f3h/YF3Vc+ipr6u4Grr7KINsKdA5EBqKCbu20SmrYTjtejlZGkg9nxsXIpwBs
	 mkdoBNku1OgmiTAyjdP5n1XywsfcKvVSOehkyuLDz+qQhkU7AwePBS98qqxjmP453Sg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791137612;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=92D/LN1ybh4uJ518UNBMMw7OPppZkk+woHRzNPZ0r2M=;
	b=IjKjwBdHc6mNhxrtfjU+BmkS9aWcXbXAiTJhlgPX4dJlS9Y0vSUDUnxjFQ+dFMx+a8zI
	 RZKaAbidPu/RpZKcJU6IHvECboEbIeFDFhAIarMQFf+DAhKFGlg+QKyAbxSC/TMJQeZQ8
	 7RaKnEIBGL1owcTVVPqlvzR9msCIHZKicEyQlIkegm6dlcIqDqDiVIFSsBuIDed6YQGGL
	 D6fcNEZXJrmzQxD763ivlwWuzVqLcLZIN8d8EcxtnFnk0bM2foF4ZJemQ1Vjx5mUA7BHc
	 OwKK1nFOJpmzUO8yPjPKZKr8lLHn+sV0XMgtqtPrMN7fNe8nHCvZ41NH992nCwMda6w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791137612;
	bh=92D/LN1ybh4uJ518UNBMMw7OPppZkk+woHRzNPZ0r2M=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V8tiYJid+ogW+lbRFI7Pj5GRGhmi2x24KMwzVdlnggYOeJEh3YDQPy06posFhX/7N
	 cwftqIhvyFSvYr0YvxeROHpIjh2VvyU7YpE28iDebXQMNSdum+LdXpSppMcOuBZbEN
	 RdMlVlxzL15Oav56NzlPJ+yly6jfmCo4mZK+IUS2l5F9JGe8K7BVUq9F4ATy9LkNIm
	 qeDUv4ji/CBA95QFFD0TuA4XNs53298FEi2/T83beaGOumbfm3ZSvPo0nA4wxtO7A3
	 d+Oxp8sRYASHoPxu2SdgrD+IJqXs1nARGhHzv5zphVuFTXyFlBhrQCZSh3A0K9oMVN
	 UpiB22UsRABKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85F02606A3;
	Sun,  4 Oct 2026 18:13:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D28D91A6
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 18:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7F654046C
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 18:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6ro15-TLjBg for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 18:13:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0995840462
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791137609;
 b=teuOzoewBXS4Q/eHHhKyUon7geh0O1jEQlCWTZvgIk6wsyfZTp7o3r2bKG1sRmaqMPOV
 NAB9z5kFeEd0RxsgGPywSZfk4enqV8JWivZ5mr09i+cnTHYCUxdnNOJr1MUtD3CTzElv8
 jzZ8IVNt+MJw37JvB140HbPvNfS90YT9gYrayQSb5bSrxz3Gse/HXZ7LCqZnvtD3ZScCn
 R+496fWhHSKVzTY/L59xhqyZVHIfz+AqqbNXma1rIAlRfJ3jC9EKTBUhiGMOSkiL5xTyN
 6murruIoQfHgZr1ZPiqIuG5uXC9KX64fAX60GbubOg4pVwwgxPqVo7wEounikUMx4ZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791137609;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=bji6QNoI8dxf1H1qG8jlZXQzZkcOha6+ue+7BU3CcCo=;
 b=i9edU6wHmLAORGwVEO/MiY8715iYPpMvXL87ptt4HMzikSIoJXv0+ujRJ9MvFouduyd0
 Wz+J9VHaZDK9OAlmbNecRKGWZ4U75syWUdS5zJXcFAHjD2KzzctbAAQx1D+V9SMtEGJKR
 YLgqxAzSIxSBEM2VLYnrrVDURyMjIg5w3uLTTdpMG/evaYmTEhr+d46Wmqx2/IyZ7KpE9
 2APeaoxadgoBm5/xyt/BOgFKTAKBB1kJYXZ4RL94EpO2zEWod9nFv4zJsP+hxEQe761Gh
 O8Z7RX2IapaXYaDzkyo1L5iNrrcO/yEsFDNBvSyH+Pc0hOcKUdKwlpSTHYX2ILewmag==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dXfIPB8d; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dXfIPB8d
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0995840462
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791137606;
 bh=bji6QNoI8dxf1H1qG8jlZXQzZkcOha6+ue+7BU3CcCo=;
 h=From:To:Cc:Subject:Date:From;
 b=dXfIPB8drUhvz3WOZS2ZAFczt7EDqSZ17bDEnnGRK20kT+r+zlKToNvIF5axuBKvO
 GfKH8c09OOEsGjoSeTRZQMOTDrwiv5kgg1WlZHO2OBKYgQfzRdiKEocYuJtU5nPS8Q
 Fv1HUDuRGRP0FJglud6uAvZPCt3NXaG6DL7CjUS4OD83kanFqUvA8vVIxYhFGY8Xnv
 G37vQzeMM+b9ckulgTrgQRzzSxpEW//6IAIWx/BhC3SmFn1kq39eKnF6S/nDs9pgzx
 DP2Z6mMKmVPyjex7q3Efg4OlJeApEpy4DwtCcQR+Rc+CZ0YE1KNNvguYIcGRvhnf0t
 N5jbtozL8Gayw==
X-KAS-Sym: v3:f51bdf72230551df:dxTGizojgIed2MDhDeyVPu3lvN0OPaq3mu0ERmbBX3G2Z
 qjenJMai5o5Ep6I1VJ4rXR8wxL39TST/lMX2dlP6ucpYlZc5IXPUe7WbHfr/sb+GXepjr/stY3l
 dYHSIpjfw5q2XDfi0uoNfBppnKk7FxjzymXekgcbsFPqwYITS7NgXJ1GnZeodgQ6aWLjekhZ2lC
 m/k7drVXQl6MtPgr7l/nf/AtJb5QNMeRIIMrPekTV7G73YDCPajIKZmhfWqva8evk1JtBmxE28E
 iGmEGdC1FdSJtIY9E0UsBNPFJDKAulQY49gr67XhLwklO72MiELUT5CxwBJdu8qj93Fnca/g==:
 Do9r46/mxb0K5rSEQTXBdNI7WEjO6TrehdLLn5saUiLP9gRH+VXDFaCwrKlzcjWTO8W2ACTLy6N
 G4OSL03AbkPf6KwMsuEDFE+kQPjzkcZ4pVK1IfBL14r9yp6qSBvpfIdxWy/KKSMHxFVP1h4koL8
 /cR0lxOhNZGY0KHjyvUOZ3IgdukSPE4OovqQk9rLnGQ7m1ouxPwZsjxj5mpNztBU1+2H9uxs/95
 l6mjLxs9NY88JfBMudr9EAjmX+5xQsdMuygaKNuxrb6zG8bXECHOaqa26vODNeuje+IufwjuBE9
 lGRvuV4s/+bk9Li9wIO7cqzUwHLDj4m1l3n+YgFMbiTzmtFMjLRGRdwwOfZeuWmLhfsPs46dzWO
 MuPtVErspnNPLww3qsXGX+M67Cg4+odKZCOo/GKMqEltfkw9wwKEaVWRYY7q3KtcFDHH92cxtA6
 UrLVw3MmIl9gzD+qiD+wKTqFSjnVOgmX3MxSAT0HQaHgKPS0uX1PN92jjUqu63T7n/sbLTmnY1G
 XYRvmgnHK9yZIvnINRVja7eJMbS+/BGyYbbckpC9MvwYnl2U+igpLLU+Kd4LExxWq7Kzff87xUd
 4X9ytK8Hc1n/WnPSr18xV2VH/8X6djQH+/C3t8P8nhK+oLUQUwIrTPQBF2Sr
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 97D16A4C529E;
 Sun,  4 Oct 2026 20:13:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49906)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xDQiE-000000002BT-1TF1;
 Sun, 04 Oct 2026 18:13:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Oct 2026 20:13:26 +0200
Message-ID: <20261004181326.1944737-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/gerbera: bump version to 3.3.0
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

https://github.com/gerbera/gerbera/blob/v3.3.0/ReleaseNotes.md

Removed patches which are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ede0c461d02292eb82566b42f7fd5efb4f528a47

with the exception of an unrelated build error for target
bootlin-m68k-68040-uclibc/build/fmt-12.2.0/.stamp_built:
https://gitlab.com/bkuhls/buildroot/-/jobs/16922357150

 .../0001-Fix-the-following-errors.patch       | 148 ------------------
 .../0002-Fix-the-following-error.patch        |  47 ------
 package/gerbera/gerbera.hash                  |   2 +-
 package/gerbera/gerbera.mk                    |   2 +-
 4 files changed, 2 insertions(+), 197 deletions(-)
 delete mode 100644 package/gerbera/0001-Fix-the-following-errors.patch
 delete mode 100644 package/gerbera/0002-Fix-the-following-error.patch

diff --git a/package/gerbera/0001-Fix-the-following-errors.patch b/package/gerbera/0001-Fix-the-following-errors.patch
deleted file mode 100644
index c474d32aab..0000000000
--- a/package/gerbera/0001-Fix-the-following-errors.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From 7caa9ae9ebf5c4cded5a292701528ff1d5c4946e Mon Sep 17 00:00:00 2001
-From: Downtown Allday <downtownallday@gmail.com>
-Date: Fri, 3 Apr 2026 09:31:07 -0400
-Subject: [PATCH] Fix the following errors: error: no member named 'strerror'
- in namespace 'std' error: no member named 'memcpy' in namespace 'std' error:
- no member named 'strchr' in namespace 'std'
-
-all of these require <cstring>. see:
-https://en.cppreference.com/w/cpp/string/byte/strerror
-https://en.cppreference.com/w/cpp/string/byte/memcpy
-https://en.cppreference.com/w/cpp/string/byte/strchr
-
-Upstream: https://github.com/gerbera/gerbera/commit/7caa9ae9ebf5c4cded5a292701528ff1d5c4946e
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/config/setup/config_setup_path.cc | 1 +
- src/content/inotify/mt_inotify.cc     | 1 +
- src/iohandler/mem_io_handler.cc       | 1 +
- src/util/grb_fs.cc                    | 1 +
- src/util/grb_net.cc                   | 1 +
- src/util/string_converter.cc          | 1 +
- src/util/thread_executor.cc           | 1 +
- src/util/thread_runner.h              | 1 +
- src/util/tools.cc                     | 1 +
- src/util/url_utils.cc                 | 1 +
- 10 files changed, 10 insertions(+)
-
-diff --git a/src/config/setup/config_setup_path.cc b/src/config/setup/config_setup_path.cc
-index cdb7244e4..a10e3c9f2 100644
---- a/src/config/setup/config_setup_path.cc
-+++ b/src/config/setup/config_setup_path.cc
-@@ -31,6 +31,7 @@
- #include "util/logger.h"
- 
- #include <pugixml.hpp>
-+#include <cstring>
- 
- bool ConfigPathSetup::checkPathValue(std::string& optValue, std::string& pathValue) const
- {
-diff --git a/src/content/inotify/mt_inotify.cc b/src/content/inotify/mt_inotify.cc
-index e938e60a1..e140b5f4f 100644
---- a/src/content/inotify/mt_inotify.cc
-+++ b/src/content/inotify/mt_inotify.cc
-@@ -52,6 +52,7 @@
- #include <sys/select.h>
- #include <thread>
- #include <unistd.h>
-+#include <cstring>
- #ifdef SOLARIS
- #include <sys/filio.h> // FIONREAD
- #endif
-diff --git a/src/iohandler/mem_io_handler.cc b/src/iohandler/mem_io_handler.cc
-index 21e4a1960..ba16a10d7 100644
---- a/src/iohandler/mem_io_handler.cc
-+++ b/src/iohandler/mem_io_handler.cc
-@@ -35,6 +35,7 @@
- #include "mem_io_handler.h" // API
- 
- #include "exceptions.h"
-+#include <cstring>
- 
- MemIOHandler::MemIOHandler(const void* buffer, int length)
-     : buffer(new char[length])
-diff --git a/src/util/grb_fs.cc b/src/util/grb_fs.cc
-index cd3e612a7..09c892f2e 100644
---- a/src/util/grb_fs.cc
-+++ b/src/util/grb_fs.cc
-@@ -30,6 +30,7 @@ Gerbera - https://gerbera.io/
- #include <fcntl.h>
- #include <fstream>
- #include <sstream>
-+#include <cstring>
- #include <sys/stat.h>
- #include <unistd.h>
- 
-diff --git a/src/util/grb_net.cc b/src/util/grb_net.cc
-index 8986bfa4a..68395e001 100644
---- a/src/util/grb_net.cc
-+++ b/src/util/grb_net.cc
-@@ -30,6 +30,7 @@ Gerbera - https://gerbera.io/
- #include <ifaddrs.h>
- #include <netdb.h>
- #include <regex>
-+#include <cstring>
- 
- #ifdef SOLARIS
- #include <sys/sockio.h>
-diff --git a/src/util/string_converter.cc b/src/util/string_converter.cc
-index fa11e1de2..21e2760d9 100644
---- a/src/util/string_converter.cc
-+++ b/src/util/string_converter.cc
-@@ -42,6 +42,7 @@
- 
- #include <array>
- #include <vector>
-+#include <cstring>
- #if FMT_VERSION >= 100202
- #include <fmt/ranges.h>
- #endif
-diff --git a/src/util/thread_executor.cc b/src/util/thread_executor.cc
-index 669856272..ca0a1755c 100644
---- a/src/util/thread_executor.cc
-+++ b/src/util/thread_executor.cc
-@@ -34,6 +34,7 @@
- #include "thread_executor.h" // API
- 
- #include "util/logger.h"
-+#include <cstring>
- 
- ThreadExecutor::~ThreadExecutor()
- {
-diff --git a/src/util/thread_runner.h b/src/util/thread_runner.h
-index a2e55f8eb..08dbc8b9c 100644
---- a/src/util/thread_runner.h
-+++ b/src/util/thread_runner.h
-@@ -36,6 +36,7 @@
- #include <mutex>
- #include <pthread.h>
- #include <thread>
-+#include <cstring>
- 
- using ThreadProc = std::function<void(void* target)>;
- 
-diff --git a/src/util/tools.cc b/src/util/tools.cc
-index 2174ff352..cc1877286 100644
---- a/src/util/tools.cc
-+++ b/src/util/tools.cc
-@@ -43,6 +43,7 @@
- #include <queue>
- #include <regex>
- #include <sstream>
-+#include <cstring>
- 
- #ifdef __HAIKU__
- #define _DEFAULT_SOURCE
-diff --git a/src/util/url_utils.cc b/src/util/url_utils.cc
-index efb4099ec..3127d53fb 100644
---- a/src/util/url_utils.cc
-+++ b/src/util/url_utils.cc
-@@ -30,6 +30,7 @@ Gerbera - https://gerbera.io/
- #include <fmt/ranges.h>
- #endif
- #include <sstream>
-+#include <cstring>
- 
- // URL FORMATTING CONSTANTS
- #define URL_UI_PARAM_SEPARATOR '?'
diff --git a/package/gerbera/0002-Fix-the-following-error.patch b/package/gerbera/0002-Fix-the-following-error.patch
deleted file mode 100644
index 01f135bbed..0000000000
--- a/package/gerbera/0002-Fix-the-following-error.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 9507706136fde8c324d95d5c84c78bae1703bafc Mon Sep 17 00:00:00 2001
-From: Downtown Allday <downtownallday@gmail.com>
-Date: Fri, 3 Apr 2026 09:34:00 -0400
-Subject: [PATCH] fix the following error: error: no member named 'format' in
- namespace 'fmt'
-
-the comment in fmt/core.h says including 'format' via core is deprectated:
-// Using fmt::format via fmt/core.h has been deprecated since version 11
-// and now requires an explicit opt in.
-#ifdef FMT_DEPRECATED_HEAVY_CORE
-#  include "format.h"
-#endif
-
-Upstream: https://github.com/gerbera/gerbera/commit/9507706136fde8c324d95d5c84c78bae1703bafc
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/database/search_handler.h | 2 +-
- src/exceptions.h              | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/database/search_handler.h b/src/database/search_handler.h
-index ac5afb1b7..c1c99d00d 100644
---- a/src/database/search_handler.h
-+++ b/src/database/search_handler.h
-@@ -32,7 +32,7 @@
- #include "util/tools.h"
- 
- #include <algorithm>
--#include <fmt/core.h>
-+#include <fmt/format.h>
- #include <map>
- #include <memory>
- #include <tuple>
-diff --git a/src/exceptions.h b/src/exceptions.h
-index 180e63ad4..e5ed74f3d 100644
---- a/src/exceptions.h
-+++ b/src/exceptions.h
-@@ -34,7 +34,7 @@
- #ifndef __EXCEPTIONS_H__
- #define __EXCEPTIONS_H__
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- #include <stdexcept>
- #include <string>
- 
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index 42e2d13951..d292a5df5d 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6b89d0c416b6d98e34634e5b1121f340315d60b088e9e6b2fca423488760030f  gerbera-3.2.1.tar.gz
+sha256  79db1b4d9fcfafe5cb6a30eb29174f912f1b2c04a644bd5fe5075bccad10eb97  gerbera-3.3.0.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index bb00fc89e9..d50e59f591 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 3.2.1
+GERBERA_VERSION = 3.3.0
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
