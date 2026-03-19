Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285C9F483EB
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F218960870;
	Mon, 23 Mar 2026 19:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02fsruQZaAJi; Mon, 23 Mar 2026 19:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F56A608B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295274;
	bh=Ii8s7Kj79olLUlJE+uLwgZeE7Pb8p8Trjl2Jc058HI4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hMMZfb0qYf83KKksc7+A7OpSQXzTmC2OGrtWh5Q6gJGII34atelGgnFNsv1QiY8cN
	 QxQfdU4iPV6CJ+Y0boz+08TlvuA8WxeBzTZDU01XDj2xDKA/4+xO8wG80zgddshyPk
	 7cenn+QKJi6GwQRx9XozBxbjJ4MPys7ePrYoWxQiaztFWY0DI66JFqWQ6WO7+hGHeX
	 ZJdU2fxZJgklVaPJVMib+XYgiaH5d04ZOWdDL5CC0G+vza7AnyU5jTayu7VnQFBN5P
	 hrw63dd73lZfbHQ1c2JOtOYvH1iF7MQtaJ7WmFC3ub+4/hnvh3oEKtN7ArrGQGJE7z
	 TBvEkoiaWJ6ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F56A608B0;
	Mon, 23 Mar 2026 19:47:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02488353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4464F821CA
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNrSQMMtvJvA for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45768821F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45768821F9
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72D7781275; Mon, 23 Mar 2026 19:47:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 11:55:57 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 47e01beb12d36f6af420ffad93e6c36d97d7efce
X-Git-Newrev: 8bdf79c09846af6062621aea772e347c61f841f5
X-Patchwork-Hint: ignore
Message-Id: <20260323194728.72D7781275@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] DEVELOPERS: remove Marcus
 Hoffmann from no longer used packages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8bdf79c09846af6062621aea772e347c61f841f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Remove myself from packages that I'm no longer personally interested in.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1210e4efeb88b4e6c298ce20fb8fc4f660fafc8d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 491f02ab73..ed48a4156f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2262,55 +2262,20 @@ F:	utils/diffconfig
 
 N:	Marcus Hoffmann <bubu@bubu1.eu>
 F:	package/nethogs/
-F:	package/pico-sdk/
-F:	package/picotool/
-F:	package/python-annotated-doc/
-F:	package/python-apscheduler/
-F:	package/python-crc/
-F:	package/python-diskcache/
 F:	package/python-django/
 F:	package/python-gpiod/
-F:	package/python-immutabledict/
 F:	package/python-jc/
-F:	package/python-log-rate-limit/
-F:	package/python-pydantic/
-F:	package/python-pydantic-core/
-F:	package/python-pydantic-settings/
-F:	package/python-ruamel-yaml-clib/
-F:	package/python-typing-inspection/
-F:	package/python-tzlocal/
-F:	package/python-sdbus-modemmanager/
-F:	package/python-sdbus-systemd/
 F:	package/python-varlink/
 F:	package/python-waitress/
 F:	package/python-whitenoise/
-F:	support/testing/tests/package/test_python_apscheduler.py
-F:	support/testing/tests/package/test_python_crc.py
-F:	support/testing/tests/package/test_python_diskcache.py
 F:	support/testing/tests/package/test_python_django.py
-F:	support/testing/tests/package/test_python_fastapi.py
-F:	support/testing/tests/package/test_python_pydantic.py
-F:	support/testing/tests/package/test_python_pydantic_settings.py
 F:	support/testing/tests/package/test_python_requests.py
-F:	support/testing/tests/package/test_python_ruamel_yaml.py
-F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
-F:	support/testing/tests/package/test_python_sdbus_systemd.py
-F:	support/testing/tests/package/test_python_tzlocal.py
 F:	support/testing/tests/package/test_python_varlink.py
 F:	support/testing/tests/package/test_python_varlink/
 F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/test_python_whitenoise.py
-F:	support/testing/tests/package/sample_python_apscheduler.py
-F:	support/testing/tests/package/sample_python_crc.py
-F:	support/testing/tests/package/sample_python_diskcache.py
 F:	support/testing/tests/package/sample_python_django.py
-F:	support/testing/tests/package/sample_python_fastapi.py
-F:	support/testing/tests/package/sample_python_pydantic.py
-F:	support/testing/tests/package/sample_python_pydantic_settings.py
 F:	support/testing/tests/package/sample_python_requests.py
-F:	support/testing/tests/package/sample_python_ruamel_yaml.py
-F:	support/testing/tests/package/sample_python_sdbus_modemmanager.py
-F:	support/testing/tests/package/sample_python_sdbus_systemd.py
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
 F:	package/libatasmart/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
