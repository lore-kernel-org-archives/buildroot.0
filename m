Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B35D7494C
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 23:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C774F403AF;
	Tue, 29 Oct 2024 23:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6qA_4RmlUqY; Tue, 29 Oct 2024 23:20:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA41D4039A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA41D4039A;
	Tue, 29 Oct 2024 23:20:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65DF64969
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 23:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5023C40398
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 23:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkPyWTu5py_p for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 23:20:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4950B40354
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4950B40354
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4950B40354
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 23:20:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4315ce4d250so7265485e9.2
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730244019; x=1730848819;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+uQI5mFJquStgvbgONTQ8jTzMOUl9k1VBZAQaHvy1vw=;
 b=nE1ryRslU0WF50zq13akDynoPRc99zhr9VBM26939DYGxkE5xMtekAMJBupgAU7Jg7
 7pw3q+l8IXyqTK99NKmtj4I7VfU+toDQJFnu+BOFr606O3nrEFIhtWBSox86bLyHcyWN
 J6VEbIp4iWAehle3/rowoxLe04wp9Tlk2GzN8K9GlwlyAvf8+PKkf9HVwRX1NxERvHY9
 hQ23Fv5D0xgCAHBO8eT8HouLzJzR1Ys0ZiBP7vkMjBQLDkOBQ2KWM29GbpEyi5u5gXk1
 5wUdVSKDh4bxKnr+2P0oex5hkFVr/Z0odUhU8QBSES/IYGbXJxdvAZMncDfOnwpta4Zy
 I5+w==
X-Gm-Message-State: AOJu0YxjiZ/fw8ZLMxvjfgfiv5yQqauP7GoayUoctMIwhipJ5cNjAXBC
 H36xwK5hkduYY2qQ1R2xYTPiOqimHCXg/9ZbfEB5OzDDPyR1m40zcoux0jbP
X-Google-Smtp-Source: AGHT+IGqcodQbNx/7KB+9VR5IxLCQBNjYzpkwfvAeqE9yG44LZTSeQPQsEXRCXwJiMwquBw6QH+KOg==
X-Received: by 2002:a05:600c:4f0c:b0:431:4983:e8fe with SMTP id
 5b1f17b1804b1-4319ad41c64mr48796085e9.9.1730244018577; 
 Tue, 29 Oct 2024 16:20:18 -0700 (PDT)
Received: from skbuf.lan ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9ca8eesm3212305e9.43.2024.10.29.16.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 16:20:18 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 30 Oct 2024 01:19:36 +0200
Message-ID: <20241029231936.3712769-1-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730244019; x=1730848819; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+uQI5mFJquStgvbgONTQ8jTzMOUl9k1VBZAQaHvy1vw=;
 b=NTKe5vQTdEbgXXYGtylQ9H2s70biB/SbqengHJK0fF3V62mGMYQCL6sXZKTLmsmIif
 MlROT8mtQGG0IjyXiQO6xE2uAVPLGFFN14Lgu3MgQ10m1TdNWERvJqte5/6U/bww6lgC
 j/PgxEc0pbLHj/NaIgL50/T2hmPM1BDAY7KhTIDFBxt8ciyxIa9ktXA/Q6Pjeyj63KFs
 Oz3jZPWMhwJ/bGFk0c7zgFrGJjU+dK4x+znDEhDn5NDaWXCTL8fPkk+o1oOmyStfMXOV
 X0U7lYpGefL5CB/f7l31T1cd3gNm8OfPuOcgN8WPfdNN6X6vBA34B5STtlwGPYuUg+Cd
 BdwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NTKe5vQT
Subject: [Buildroot] [PATCH] package/sshguard: patch
 /usr/local/sbin/sshguard path in systemd service
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

The systemd service deployed to the target is derived from an example
hardcoded for the /usr/local/sbin/ path, but we install sshguard at
/usr/sbin/. Thus, by default we get this error message:

$ journalctl -b -u sshguard.service -f
systemd[1]: Started SSHGuard - blocks brute-force login attempts.
(sshguard)[612]: sshguard.service: Unable to locate executable '/usr/local/sbin/sshguard': No such file or directory
(sshguard)[612]: sshguard.service: Failed at step EXEC spawning /usr/local/sbin/sshguard: No such file or directory
systemd[1]: sshguard.service: Main process exited, code=exited, status=203/EXEC
systemd[1]: sshguard.service: Failed with result 'exit-code'.
systemd[1]: sshguard.service: Scheduled restart job, restart counter is at 5.
systemd[1]: sshguard.service: Start request repeated too quickly.
systemd[1]: sshguard.service: Failed with result 'exit-code'.
systemd[1]: Failed to start SSHGuard - blocks brute-force login attempts.

Fix up the path in the service after the $(INSTALL) command has run.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
 package/sshguard/sshguard.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sshguard/sshguard.mk b/package/sshguard/sshguard.mk
index 8d036357438d..97cbbb2bdd3a 100644
--- a/package/sshguard/sshguard.mk
+++ b/package/sshguard/sshguard.mk
@@ -25,6 +25,8 @@ endef
 define SSHGUARD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/examples/sshguard.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/sshguard.service
+	$(SED) 's:/usr/local/sbin/sshguard:/usr/sbin/sshguard:g' \
+		$(TARGET_DIR)/usr/lib/systemd/system/sshguard.service
 endef
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
