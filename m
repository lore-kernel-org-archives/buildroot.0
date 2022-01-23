Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCCFC4332F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 16:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A14781A1C;
	Sun, 23 Jan 2022 16:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gmkkCgoWmgcJ; Sun, 23 Jan 2022 16:09:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8B18819F5;
	Sun, 23 Jan 2022 16:09:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 641111BF3F0
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 16:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52935819F5
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 16:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Gfv5u_dYuWZ for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 16:09:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D5F4819C8
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 16:09:21 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 z25-20020a0568301db900b005946f536d85so18864774oti.9
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 08:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cNWpYJaEUb4++wiSR7HvBPXldgJ0SXsGYZik2GUpO9M=;
 b=ZF1djxUuS+MdMfZkaUzRco/B6GTQqP1RJB29YchHvA9zbtUqystPp8DlherywEA+bI
 Q9KjsShVoypaMNvtFBEwpjIqaavHtzTa1hfzpsYfa43Q3nyhrOUmcSwN13CKWUWSKCVQ
 Do+0PuNsE3KqmZW8kXZqlEgFqZnVUS3u3WLui3jkODM59PujK/XIRFRUtcE0F5JQiBIt
 hdvk8+4NKtz86Voq+sOAXIATdoUhsZwaM70exZLOgHwxUjv7axs+1Hi5EJJOvpTjl/Jb
 SGH9E3X3BKbOWbcYwDOmoCRa8ovJz3sq5B+9AlwGAZzznLoQxYSkoMIIGA/mAxds5RzU
 PiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cNWpYJaEUb4++wiSR7HvBPXldgJ0SXsGYZik2GUpO9M=;
 b=Elc6a5n7b05WW4Q8qt2ldtO4XJdlyie3MRznmDmOzIbzouN8OcFz5Af6XQm9pdYGxs
 Kw3f27HZktVPMU1Hd8KYa5w3k/yiXzCPj1X3cK8eyGd1mUqE6kOlAiYkx70dbvRdNX6N
 Go8mtTgOMQnc2/BmwhJq4v8ux4U1Ahcb5BcE/TVQJ33Fqu5awt8wK9/yhqDs2ruyLPHI
 /OEnKojAfthFSy00x0o+vknHiO1E96HM+FcMWW9+tkrXYA5A8iOfXvQOp7lQkNJEBMJB
 sgzDPIW4zhPx+TY16I5FnaHrWpn8su4Oz2JuGXnHrh9VYI23gEmlPoeaSAf2R2rOw+Dk
 Ma6Q==
X-Gm-Message-State: AOAM533bd4iKlOEf9RYZ/ioPE7Uc5aXc9R4Ae4Ykc2FJd73QKwRbyq6M
 XVf8NuI8evOGeTk0nmsNLWRFdVhQPzU=
X-Google-Smtp-Source: ABdhPJx45mPJ8RYGKsGVAWHTXsFD9nerHy8IenuPRQ2c7xdQxskQTiUao95ATvI4lBfI2PYJfTqqOA==
X-Received: by 2002:a9d:4719:: with SMTP id a25mr9191972otf.35.1642954160280; 
 Sun, 23 Jan 2022 08:09:20 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id f2sm4282763oiw.50.2022.01.23.08.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 08:09:19 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 13:08:44 -0300
Message-Id: <20220123160847.2653086-2-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220123160847.2653086-1-ricardo.martincoski@gmail.com>
References: <20220123160847.2653086-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/4] support/docker: add python3-pytest
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

... so the unit tests for check-package can run in the GitLab CI.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Acked-by: Romain Naour <romain.naour@smile.fr>
---
Changes v1 -> v2:
  - none
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 5ca087546e..120e301b7c 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -41,6 +41,7 @@ RUN apt-get install -y --no-install-recommends \
         python3-flake8 \
         python3-nose2 \
         python3-pexpect \
+        python3-pytest \
         qemu-system-arm \
         qemu-system-x86 \
         rsync \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
