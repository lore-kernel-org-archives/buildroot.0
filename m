Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEB1FD88C3
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43A5D811AD;
	Tue, 10 Mar 2026 22:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TInk4BQJ86H2; Tue, 10 Mar 2026 22:08:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66DFC811AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773180502;
	bh=AOGAi2konLALoVvy7lXPIjjRlZCvxYok5dDNuqE96vo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ifDRdy7+WfvjEMCL15dERYt1Ixne3OtvP69q8Tfv/6CZqj3BMeC4MJNKLZ7rZ1rWf
	 qZYap+wyqlTsN0GsqmTvela0ISEZpVwnz+dcsbI+iXgRZBWCVVkIM/gmHcTKP3kU55
	 Eh9glhOjapIXvt7Fs3PohVHgLRy3zNTwoPY1TaqmdjFBAncyItpzTZ5639OggI9WRa
	 0wZDYe+ExuV1LvJJnIq45OoqL3XJF1y3kt5TRpHroSIxZ2jgBzqtS1QcV8+pTVlPwm
	 xZnfRlx6SW2TtrNK2ls6NyqpWhgsmCtU0fjoLG6xrVQj3lZwG65ud0gbKeEGq3YCQ2
	 HxZK1nFOmJCRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66DFC811AF;
	Tue, 10 Mar 2026 22:08:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33F2A201
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23ED4811AF
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMsJtSyLaBg1 for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:08:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42B27811AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42B27811AD
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:08:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C80886940; Tue, 10 Mar 2026 22:08:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Mar 2026 23:07:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0428cb3c274afde135400877750c3d725b4ebce5
X-Git-Newrev: 1210e4efeb88b4e6c298ce20fb8fc4f660fafc8d
X-Patchwork-Hint: ignore
Message-Id: <20260310220819.5C80886940@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Marcus Hoffmann from no
 longer used packages
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1210e4efeb88b4e6c298ce20fb8fc4f660fafc8d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Remove myself from packages that I'm no longer personally interested in.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 106510ea84..b7d19bc299 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2266,55 +2266,20 @@ F:	utils/diffconfig
 
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
