Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106EAC54E49
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 23:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C9F060A67;
	Sat,  9 Mar 2024 23:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uXt_ybOiW9n4; Sat,  9 Mar 2024 23:44:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A1D260AB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A1D260AB3;
	Sat,  9 Mar 2024 23:44:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09EFB1BF2A2
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 23:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68D3D81EB5
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 23:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDgc24jPZjC1 for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 23:44:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DC47817FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DC47817FD
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DC47817FD
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 23:44:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-413216e601eso4237395e9.1
 for <buildroot@buildroot.org>; Sat, 09 Mar 2024 15:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710027870; x=1710632670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z3oMYyYwvReRf8/NiGRdnOx1bB5jrias09Zpz/MnN7E=;
 b=idGbZv+9m6Hff/oRNpO9TkVyA5Tj9JqWHZpOR7MEOvLyqZ8EFHrCTgNvobwomnWFeB
 K5oLSljic++8HTobqW7f6U08H/DjQEn2agAiEX3OXVX5BsxLLeyPGfmIRjPeTdr/3nL4
 R3cWjdJ0lwp2BstKERbAlv0Lpt78oqQaHXBi3K+PzZOlMVntI97elol4wae18nEQX9Bp
 ahcIv1k2wXYGAQAQr5DGD66QyqIUV+SH/3hzImAD5olHFtHGeSFhb1kwmJyZxldT62Jw
 LHTqkxBgOf8g37EUIC9CWUqwJmIvacQPgRqyXk+zCmLN9BEjjUXnvAtEKBW/sCAJxu+W
 +ylA==
X-Gm-Message-State: AOJu0YwmpHZqg0BTLogufUVgmvHmUkdtzGmB61it4zDuuDTB1jbcLGw+
 OBKfZ3F++deBH3w/yN144zGdz1AhyzfW9yt1XUssey3NIEZan2ASpvr/CRT+
X-Google-Smtp-Source: AGHT+IFHYHeyDvUyifCl9fMLnU8aJCzlHQLzupt81TavpR/TSFpK+Qsbv8KIHRou19JYGEtX2bwjFQ==
X-Received: by 2002:a05:600c:4e55:b0:412:6101:915c with SMTP id
 e21-20020a05600c4e5500b004126101915cmr1958106wmq.19.1710027870135; 
 Sat, 09 Mar 2024 15:44:30 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b0041312855081sm4005123wmb.5.2024.03.09.15.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 15:44:29 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 00:44:25 +0100
Message-ID: <30e2f6585aa887573547941c00bd61c02c9142db.1710027863.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710027863.git.yann.morin.1998@free.fr>
References: <cover.1710027863.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710027870; x=1710632670; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z3oMYyYwvReRf8/NiGRdnOx1bB5jrias09Zpz/MnN7E=;
 b=gJDaUSXjKnKnzGc4peHIid9oy4gRnopidW2zt81gfNxgRS5bCTPWsHvfSFL3Aqoyxq
 DMsfcRWe1CBjk9rYVToAWEOR5Pj9xnymyP8XophQ/PwZyV1bbvJcGs+uzQJmJy5swdEd
 /2mNA0N7WN94vpxlnzy5BFaX1OySh59TuywPc61PGj85+XJAqLJr4dJQvuIJNb0t4gJH
 awy0s+woNRnyZVshh4vMNsFkHqeaxqjrbqoW79Ca3Umba53vYLGKzr7wtGC74kG9VMkf
 OQCMVlPGNmd+ZlJXyouBbUaPV89Yk6wAw4MCQc20o8yfM5GeJLQ9rZuyyYvsNSQcp304
 Pgaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gJDaUSXj
Subject: [Buildroot] [PATCH 1/5] support/scripts/mkusers: fix UID/GID
 confusion
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 41ea61d59c3e (support/scripts/mkusers: allow option for system
uid/gid) confused GID and UID variables: the GID limits were used to
create UIDs.

Fix that.

Note that this fixes a shellcheck error; although there are many more
shellcheck errors, these fixes are semantically a bug that need to be
fixed separately from the coding style issues reported by shellcheck.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/mkusers | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index 4fc06f8fdf..d786943cf8 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -324,9 +324,9 @@ add_one_user() {
 
     # Generate a new UID if needed
     if [ ${uid} -eq ${AUTO_USER_ID} ]; then
-        uid="$( generate_uid "${username}" $FIRST_USER_GID $LAST_USER_GID )"
+        uid="$( generate_uid "${username}" $FIRST_USER_UID $LAST_USER_UID )"
     elif [ ${uid} -eq ${AUTO_SYSTEM_ID} ]; then
-        uid="$( generate_uid "${username}" $FIRST_SYSTEM_GID $LAST_SYSTEM_GID )"
+        uid="$( generate_uid "${username}" $FIRST_SYSTEM_UID $LAST_SYSTEM_UID )"
     fi
 
     # Remove any previous instance of this user
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
