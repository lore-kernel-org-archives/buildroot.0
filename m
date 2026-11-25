Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2019606A32A
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nU+Xijwf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t8yRR7OO
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 720266065C;
	Wed, 25 Nov 2026 09:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wqB4Ck5cbYI; Wed, 25 Nov 2026 09:04:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 70FA1606A3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795597488;
	b=IMH7i0oPmQez+bA7+yU7Irh86RL/Zcvg5xLDCMfUefc7huBR2V0MMI724ZqmXisUH7VM
	 udACgXlp174uco3Ot5Cb+KAIza3r4QxE8QBtQ214MD85zb7L7QlMDw9owzZ0n6dND7WcC
	 JogpKv2+nQPEuZhLNLpXrbaFSSw/cDh5lT6zQWkyj1NWRD5VHaRv/sIe/fMTYuLzSO/le
	 57XkG4TGLvc/KGY+dQEI/gaVThtk9LS9uqf8EoWVzawxp7JXvuI+pf8CgwpJWoqQoB2GW
	 XZeY+0LYKKIbjaqVRRcSqRyWYmLMAN5pVCN8xF91K8heqaAMV5WtF2arxnHx2/JxSmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795597488;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=onA55FyWl4CEyQSKu++l/wt8h5ZJTtDDkk5u7wPuN1w=;
	b=C3+g0GDQt0RENWldbyvbzf0KpvWHDFgLAT2WkpbETxT5OIc6CIbnwCnr6zio5n3tB09/
	 shauL8H0qSZ3k8rnYAiianSwPkZMN6nvNZ6PuKSqoMKGZqTP51Kov1eNZLaTe3oVmC8iZ
	 Io7AVt4/v+Yt32DNQZpV7wSkbyoTyiqLWde9mo+L7oIdrdCSf1vLFJG1WqmIGeZPxvDOZ
	 TZ8UzU+3eItALo1E40nioYYHHm6XuX4EDbpLAdSP2YGNFIOdoEGiWDlywcpDhmzd7lEYl
	 7GOP7JHCanzJxebVX3LnpDXX81YWTVrbhxncEZWd+eIRdQB+mvRk+teUY6qk352NEnw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795597488;
	bh=onA55FyWl4CEyQSKu++l/wt8h5ZJTtDDkk5u7wPuN1w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nU+XijwfGzYLA1+XDyB6B2Y6NxjM9dH7bzT70/5aRQiRTD5g4w2lHLUvfjAT0KtpW
	 TYAIpfflBBf2OwqsXNtsLwcKw1tmsL1/qFcc/MlDYxPpsiOzBwuluIOAvSSgycMSj1
	 4uh27AzUnOKtn0ClZRHVqYtywOgXBTwigb4abR0MqrxdtOKmwrWuy7T4ED0tihQ9T3
	 +3eZHxkmWjfNXtZmIZ0mIpZY+5dH2MKJElIv1zoY1bIJac/6MS3EZ8c1k/HqfHmCVB
	 6v8mMPXdI53YgVlTj9UPf1VBfM29Zmtg0YLuyangbY0NhKirlgiZVDdSrKhHoECPga
	 B2KheTMQYpiTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70FA1606A3;
	Wed, 25 Nov 2026 09:04:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7B7B311
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 09:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DEA640533
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 09:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51JvUDeBwDAj for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 09:04:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 94E5740462
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=t8yRR7OO
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94E5740462
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 09:04:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-492fcbfaa88so3550040f8f.3
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 01:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795597483; x=1796202283; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tNe8sV1mPEZxPIYA+twHB4GfcmbeVSC76ZbQTPqKqbs=;
 b=t8yRR7OOUk3mBSK4XbjAewLRYGUV6XYC6DRJ20faCd7DX3KLbzS26QYEsV4JSQ/nBc
 FifYFeGf3TwmPRXb+XaOCas9eK0k5dP/upFXeAsHCNgKypNOinkWqS0v5Kcpd5FY7SMq
 wTEJ8IWFRGE2Ke42r1YU0HxYmT2VDadcs1hLAaZXpeNOYMT4RH8xWtFGiGeu6z46yXSY
 JtbaZkUBeggyk908g4KwRCLWkWaqF9/+7NHH0OFX+ndrd930+Ifv3IKmCeYz64fyv3ZX
 PotUEm0Klh4PWWY3FQpvPhpfqJGiLSN74RBYm+qqQN+sUdCV8B5xLqSww1LvsfVYEe6D
 SEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795597483; x=1796202283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tNe8sV1mPEZxPIYA+twHB4GfcmbeVSC76ZbQTPqKqbs=;
 b=D2dLyk/UDOw+gBjZS1yYQRC9hsLutxfrIDjtsOtWMBoJC2VRxzTHTDFwUmL3+A/VS4
 qiqGEl4QsTsY4QTQWOsnWyny/LbX2d11k79hYeLZ9QSQCkNuuofi4xoIO883DZ62OwPY
 TjALPaGk2vgX/tFVjDVFXl7K5n6+1CRF6nUBxLwuVY5abQmXC4D9J9hL+Ai0XeYrWIBO
 K14FENZFY2qhPZ9QVyh0wiu3NqZ/2o6dW3gjKqmKHTVctXaL8Bztp9P+EreraT6ePjJg
 HzLlPT9tuG6ONae8gxaCIs5R6SAOT7/VSKh8ZcKWw39qNouif05NXhHuk4erAji70vlZ
 dSxg==
X-Gm-Message-State: APuU4Z8Uheq1yF6v3nXbPVBpTpp/ZS8cCqg+UP8VW5ylhLWmP8wC/ZBZ
 vZy2bW0hqSZXGhaqVf8J40P9wl7pU4JPTcefIEhqwNmKIMpgq+OM6GSBQgimAw==
X-Gm-Gg: AZFdTZd/3gSgF5t4cbe+GsZ/GcqGMXTNxWsLfqBC6+VHpBY5wGw+5Wdj0RXYob31hCT
 9K+VABx89/ZOr5J8CRCBYjcZVjQ19slC6s39QFVK2V2RQazMMrNjnMOZdBT3D8AmmgSrwZVRLk4
 Ey/GsJcgVOZlxhZbIFgbCdQt5L2VPJzvwQou9W5SNqr9MOhLC7gBqD7z6FemRLhGX2Qp2QH+02j
 bYq88PV0GulQIB0at0KWd0EZksTSN9LkmFzC5ve3gqGYdS2qibgd6n3gKSwmdm5BzI4qdcaEZDw
 kPZv+BNyX6FFGYC6bztrGbu3+fmPJvkEr8m7+D0iDoAYV1rhrTg8pWQzsRS6geregUAU0rSQUS4
 mmdldYM7XJRXdmfT26gJjyd58pGgx+OeIShsX9YGYAHENQo98h3ZVPj7MXbR7cC41gyxLPynuGZ
 lliK32IVSWjNJ1OaZrCjrLtQUl6uP+GB9l+PZrUlAEJOC06D1qXKBt9FGynGoOxo72L1OW6rqMp
 apYaR0MIyt0X4ZVLzykVURoYrN7itUdJBvitESAgQQbZOOcMDiWuTbXmzdcpACUbRFREaA1g9uS
 Ad6ZbA0plVj24AZDsghNjrWBV/v4tB3L/3kywFHT0uNXqQYZa6ZqWVHVaA==
X-Received: by 2002:a05:6000:178f:b0:4a3:d77e:4659 with SMTP id
 ffacd0b85a97d-4ac37756993mr33450319f8f.6.1795597482927; 
 Wed, 25 Nov 2026 01:04:42 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6c61e53asm34571031f8f.59.2026.11.25.01.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 01:04:42 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Andreas Ziegler <br025@umbiko.net>
Date: Wed, 25 Nov 2026 10:04:10 +0100
Message-ID: <20261125090424.4176559-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261125090424.4176559-1-alexander.sverdlin@gmail.com>
References: <20261125090424.4176559-1-alexander.sverdlin@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 2/2] DEVELOPERS: Alexander Sverdlin and
 Andreas Ziegler take care of syslinux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Let Alexander Sverdlin and Andreas Ziegler take care of syslinux.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- rebased onto "next" as of c3f7bbdd69 (as opposed to v3 being based on
  some local revision)
v3:
- new patch
- https://lore.kernel.org/all/20261122004653.3725606-2-alexander.sverdlin@gmail.com/

 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e297c6cb79..73c006346a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -133,7 +133,9 @@ N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/libest/
 
 N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
+F:	boot/syslinux/
 F:	package/mini-snmpd/
+F:	support/testing/tests/boot/test_syslinux.py
 
 N:	Alexander Varnin <fenixk19@mail.ru>
 F:	package/liblog4c-localtime/
@@ -206,7 +208,9 @@ F:	package/qt5/qt5opcua/
 F:	package/qt6/qt6opcua/
 
 N:	Andreas Ziegler <br025@umbiko.net>
+F:	boot/syslinux/
 F:	package/mpd/
+F:	support/testing/tests/boot/test_syslinux.py
 
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-decorator/
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
