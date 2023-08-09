Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556AEEB64DD
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 13:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF45B40CBE;
	Wed,  9 Aug 2023 13:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF45B40CBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5e9EYaC0F3Cn; Wed,  9 Aug 2023 13:26:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFBA040BCB;
	Wed,  9 Aug 2023 13:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFBA040BCB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D25981BF842
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 13:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC40B611B5
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 13:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC40B611B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8l7LH7Sz37Nv for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 13:26:27 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE73760FCA
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 13:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE73760FCA
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3178fa77b27so5568345f8f.2
 for <buildroot@buildroot.org>; Wed, 09 Aug 2023 06:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691587585; x=1692192385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X388PNqJx5nFrCtm8QONpLpyHxAGQRjI4s+kn5W6DXE=;
 b=HYv6FyP5ERwh2uEna/5dmygnMUbB8GWXXSAmC761Dj1OVyk6XYnhcbhVJhh00NiOry
 ndLHJ4ocnXz8UGl5ubv8UpS6EJq+zsLs9HMXqtQiLOWT3M8LN7LOVUkAm7qrEWZh+kUq
 sE8d89Pru7nXNt1PheJPonUaaNLKB9k/os325O4HhQlWsJf0FwqIX/yhUjp34dt/UQMd
 EXW3vVho3BDr2HnFlPacfHQZdZzbdWVGZkh23RJ+2Mlvf7RDwyCvvFMmZ1e/ugEsPjWE
 TebPA3YcaQ1NJRxSUokJwyDpprvyEUAOFDkn4x4yj1lLvDco4sH3GQF74W7Icwbg3cJM
 DmmQ==
X-Gm-Message-State: AOJu0Yyb5jWipYQPTLA+tmIbKjEujBecsQG03lV80ufSQ0mcw4Zw21vU
 RPK5Ttn3wIfkKzRW5QjyoCVZ/iQ1E1ZgwtXrGK0=
X-Google-Smtp-Source: AGHT+IEpuecCFZ75pOqVMuh44gmgBfvsWwqk3pImml1HbjzWxjmG8hv8bJ/d3FpxFOc1NfYix7ftKg==
X-Received: by 2002:a5d:470e:0:b0:317:63d0:39b7 with SMTP id
 y14-20020a5d470e000000b0031763d039b7mr1872304wrq.59.1691587584997; 
 Wed, 09 Aug 2023 06:26:24 -0700 (PDT)
Received: from P-NTS-Evian.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 s8-20020adfea88000000b0031272fced4dsm16713591wrm.52.2023.08.09.06.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 06:26:24 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 15:26:22 +0200
Message-ID: <20230809132622.39045-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1691587585; x=1692192385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X388PNqJx5nFrCtm8QONpLpyHxAGQRjI4s+kn5W6DXE=;
 b=FBLDCwdAKKwp1MsZkJHRRZwXkaS9mCtSCB991EjbgxBE79OmsExZM20Kkw/Gro84YS
 MummNH1kTp66YDeHj8GxUYcPnJuNB9iORBPqYxOIaynjBRF3kdz/VUQDHIAeAGLuYIrX
 ZgVPPw0so2+BoL94XiDVj3MlGlfwbKj0Xhvr4IdNU1gZB1MiEYgUnYKf67t36Bn1NG5O
 bUIOk5bed4lN/b54qjSYTXMrFeXbMO77P2ZQNcSxYfsvjaFb6deMu7MsSYmKDYFH+xUc
 nIZ9bQt1vV4wPEWzamV6MxnSUFnONmL/YR2Cux1F5W46l+d3YjDmcdfoG4MshDroeAxm
 rQ2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=FBLDCwdA
Subject: [Buildroot] [PATCH] support/testing: TestPolkitSystemd: fix
 systemctl exit code check on failure
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported by [1] [2], the return code of systemctl command between
systemd 253 and 254 has changed when the polkit authentication is
refused:

/bin/systemctl restart systemd-timesyncd.service

The return code changed from 1 to 4. The Polkit test case
"TestPolkitSystemd" expected 1 as return code [3].

The service log is not the same either:

systemd v253:
Failed to restart systemd-timesyncd.service: Interactive authentication required.

systemd v254:
Failed to restart systemd-timesyncd.service: Access denied

git bisect report this commit:
https://github.com/systemd/systemd/commit/959301cf9f42418314abf027183dc25c08731b82

From the PR (to get more context):
https://github.com/systemd/systemd/pull/26365

Note: systemd doesn't recommend using systemctl exit code to check unit states:
"The mapping of LSB service states to systemd unit states is imperfect, so it is better to
not rely on those return values but to look for specific unit states and substates instead."

Since we only want to check if the command failed, update our test to
check if systemctl returned a non zero code whatever the reason of the
failure.

Thanks to Yann E. MORIN for the brainstorming!

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561464 (TestPolkitSystemd)

[1] http://lists.busybox.net/pipermail/buildroot/2023-August/671900.html
[2] https://lists.freedesktop.org/archives/systemd-devel/2023-August/049362.html
[3] https://git.buildroot.net/buildroot/tree/support/testing/tests/package/test_polkit.py?h=2023.08-rc1#n45
[4] https://github.com/systemd/systemd/blob/v254/man/systemctl.xml#L2612

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---

Checked that the TestPolkitSystemd pass:

 # su brtest -c '/bin/systemctl restart systemd-timesyncd.service'
 Failed to restart systemd-timesyncd.service: Access denied
 See system logs and 'systemctl status systemd-timesyncd.service' for details.
 # echo $?
 4
---
 support/testing/tests/package/test_polkit.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_polkit.py b/support/testing/tests/package/test_polkit.py
index 3da63c437b..3414fd5159 100644
--- a/support/testing/tests/package/test_polkit.py
+++ b/support/testing/tests/package/test_polkit.py
@@ -44,7 +44,7 @@ class TestPolkitSystemd(TestPolkitInfra):
         for rule_path in TestPolkitInfra.rule_paths:
             cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
             _, exit_code = self.emulator.run(cmd, 10)
-            self.assertEqual(exit_code, 1)
+            self.assertNotEqual(exit_code, 0)
 
             cmd = "cp /root/{file} {path}".format(file=rule_file, path=rule_path)
             _, exit_code = self.emulator.run(cmd, 10)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
