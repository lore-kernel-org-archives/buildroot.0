Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6173C433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 11:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3247183145;
	Tue, 31 May 2022 11:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XnYM7xhQCCJ6; Tue, 31 May 2022 11:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 556F3840C3;
	Tue, 31 May 2022 11:00:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28AF41BF276
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 10:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1800083147
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 10:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6n6G6nRUcB3a for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 10:59:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7306583145
 for <buildroot@buildroot.org>; Tue, 31 May 2022 10:59:51 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b8so9014920edf.11
 for <buildroot@buildroot.org>; Tue, 31 May 2022 03:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cJ/UzkdZRN5+kcutLfmX9tjrlminMf/cVrYQG7GlNh8=;
 b=McUhn7EJRJk6OF9CeYS1knn3C9aDKyCVIiIL3OC9WJNPlnUJiPejinsRtBY26RFRal
 iGXIlfiPZV1IZId8pnstgpfuDSnrMPYJZQX+Ng47SLRyVkvjD7lTS1YqoymuDroIQha6
 dHXDbALwNje5wxOPULqHG155kDq3Ubce6Si/OUxlXqfDkXB8nAmRlte61X11oZcBmc8e
 KnQy7ECt9oba5JEos/YNoroiVdJwSzMU4/0mYADQ4Ms4HCiwCIr5McKsIfhZOuN/lEYc
 k7pyYjPrQOei4OjSfscJrV8xoNxZFvrTuhaZ9IEjrqYY0Dpso5vaIvZBoswSR2WNosr+
 WKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cJ/UzkdZRN5+kcutLfmX9tjrlminMf/cVrYQG7GlNh8=;
 b=j7J0eZplJJKm76+AnFHhfFD8cN35QIVwFFhV7BBH2pLMRaqqjR51gPR/7TzrP0nPkL
 uL6OXyfW2hIPdfIBHWYnsPPUMA9Y6RujsUjMY8CZ5yFYIAFhzxnqbQvcvMQJ0SA8iVI7
 /5ScxV6pCXWS98tDYa8mCk/Of/mfbLWwPDZogXAolFWWGHqyUhu3T7W/GifmaoTKj1EM
 3mUYlDMdBcQEQ8QxmaOLkXnH2EU6bYHn0Q9PnXWTiwd7wSQoUCxnxuLkXOUuHPr5hl5Z
 cjZba2rfG36v/uJE8klaFVPSHth0JHMaINgIL6628srPOoKxdAEL5HxM8IibXvzoKolr
 UmMw==
X-Gm-Message-State: AOAM532Uf9PpziU1D2YWxYg9Wjh1otTkTc4YaL0WuZWXe1tvdIoc7bTv
 7QczZcQBp8aKz4BZvW6j9UQBU4FnLO22kg==
X-Google-Smtp-Source: ABdhPJzEB2otVUERmwK2h7x7nPrzxSmRskR5T3E2BmjFQXdGmdwvFvo6fjS/IBQydn4iyfrRVYWICA==
X-Received: by 2002:a05:6402:48c:b0:42a:e585:103 with SMTP id
 k12-20020a056402048c00b0042ae5850103mr63587118edv.375.1653994789271; 
 Tue, 31 May 2022 03:59:49 -0700 (PDT)
Received: from hthiery.fritz.box ([2a02:810b:5a40:2a43:8e16:45ff:fe22:ad85])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a50c44e000000b0042bdb6a3602sm8188793edf.69.2022.05.31.03.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:59:48 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 12:59:01 +0200
Message-Id: <20220531105902.204022-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220531105902.204022-1-heiko.thiery@gmail.com>
References: <20220531105902.204022-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/4] package/libtasn1: add build support for
 host
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v2: no change

 package/libtasn1/libtasn1.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index ba86081df9..11ab223962 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -29,3 +29,4 @@ endef
 LIBTASN1_POST_INSTALL_TARGET_HOOKS += LIBTASN1_REMOVE_PROGS
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
