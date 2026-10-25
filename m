Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBBC606A323
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UZdfTR5R;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=W2zYENm7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18C0780D91;
	Sun, 25 Oct 2026 22:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vd8N-uGESl2d; Sun, 25 Oct 2026 22:12:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 40CF780D74
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966338;
	b=CSY5iw/QXyd0c6PV79ccFTmIcFwQbXBOTo96JOVrzWf8L0ewiiTr8En/wtAFlWdGpKpb
	 0ty95MezJkqBhlXVPQTu0OWJ8D1GVV0gvtig0/t9++2TE794j2dciQpXU6oL0iXZ24Gy5
	 kGXi1cdQGWZcLDQ/v61lFymJGkT/w16wogfKA48KO1wfbiKdwOSP4yOOWiPwYyG7s6F1W
	 RKYTC3lMy6pJs5ZbO2lw1CjjneuMdhrambNxP800tKqeHp4N9cE44tfByVpWf07BUbVoM
	 ZkZFtcg7cMNYJaJQnYOgKnKMy3sPCXwSIadRiSC6CT4BqGrqTZnp3qJh6gC+NFgRnLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966338;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rMqgnIkIkIS30TJp3E0UCqQYvdI+xJM9KUIhwRineeo=;
	b=HW2AetPWdwTD9TQn21mSkgHSWxgi6yJNFjY0zASwMQrZ1gqtVC0WVha4em7ENJ3RYHaB
	 nMckB7SWHKOq0XG+Ot/N+5psa3Vb5DzByE5KL8ytOu2mUF9v9+gV07D1p7S8dqRV9VRkw
	 JObQWkPwNpp1sKzZQoOUaXluLpyL0oInTi0R7xQgYByi9sIS9P3TvpjgcDV3bECttV5DW
	 cjBiYci1hctOsr6vC/MpOW8oaCCS34NDYU1SdXw3vtlnmQwLtOqEt8bsqw+25tZtdf6VL
	 kEIdj2QY11Gw4GVnjVbCFsZIwaEL52s/JZ5gq7rbBk++nL6ztmrf14MEp9OAGoIounw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966338;
	bh=rMqgnIkIkIS30TJp3E0UCqQYvdI+xJM9KUIhwRineeo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UZdfTR5RcQjlAU7HFIebrDCXRn5i3VH2U5gs0FqLfXn94yF1y+jhUa30cvzZ08VpQ
	 lhdygByqhv0GTI/rJdcBlxASS50bdPgjBxkJ6CFMvPN6ssauswbyjI/P5KCgffHruP
	 EH/VCkykjI8f1Sn5o00yyW9EjOqRBr3hCqvGhflhXw0psw3Muucv9JYGN/lynVKXjh
	 w3vYIlppT4Xve2tWWxlOVu7uw2c4mwclA+DhgBKKKQtJrfvYtEMOpFtyBaByJWxGCU
	 SzGFMTFC1TFwTKGDpObAUaJ0o3gUbU5j0gfNndF0X04B8YFxD+cZCnRRaPnD35jz8I
	 BJWUnGOLUFQDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40CF780D74;
	Sun, 25 Oct 2026 22:12:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 190D9334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AAD860645
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Omc22_HG9AMB for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:12:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1830260626
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966336;
 b=dVxzsAp+9FQ7GuXFzS6TfuR+F2QthWF4dRBx5NCxJNq0Q/4UOxNBh2t5XP+j8Ils1+lu
 Qoo1mHgqizHti8jjB7Fp/wCumAzlQtPvutmHlvqJjnpgUogDevSU6Bn6Pjr20fb0bldhZ
 +evI9gHunxCbBgaHRShMrelskZQhpC4apkQE13qSWx5AIaNCIdGK3q3kTXm/fVH71CfXB
 iXtAh4wxzxusi55PNuuL3WnMUFmm9DUiH7+M1bLPaeANkDnos/Kxoy6SHKaKydcbRsEFm
 Fg1ZNHZR/EY+Yr6txXPVFm/QMH0UsDKtFr52c6/GsGvnSAcRzBXi/hJzw/oYNCCZMRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966336;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TAXWqYg1JQsPLN2ry8lIXwQShJYAjETVLF15GQVesKs=;
 b=X/39RNpEH/ff0KjrhSD5soGGEo4yKvhZ0Re5x0px8gVu3Ppzn2RZFguRrxnGgg1BXalA
 V3Wa69WNqPYf8d4D12nfKoB9fXvx5SVrUD4aKRG8nvyLV4kLhx9nLA5MavEO2KNwJXre9
 OECkzi/thii8lxAnCjyjK4HOX5ve9Y2B9si0/QSJT7afa+wGcpXK8u21W1nb126ec9z6G
 Bg53swVS3+tDrC0o2fVUU6JToIs7LPF6BO/bmQmMR8IBnc08Urq41hZD3coEHOMtLDrI/
 n9h0yzjpDz80jhVNdv2Nu1PQoG3Kb9Pp3IfjfZsn04CgOrXIj38jAcsvPmHtt61aQ9g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=W2zYENm7; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=W2zYENm7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1830260626
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966085;
 bh=TAXWqYg1JQsPLN2ry8lIXwQShJYAjETVLF15GQVesKs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=W2zYENm7M+RV1msIzFmiwc2UHOAWHfIM0RKhv6GdElPzVk9NWMgr8jCRu7Z1kDCYs
 vhIOPXshG7ry4PFnCFzDxIu9maoJS8fuU6DCxltw+5/qJlsO2e9lSc9vKgMxVBP4m3
 lZdJSGKO2B4anQngHa89cALAUeDOx9QJ1VKCoW6+TvYuubALUUtkEAkhkC3XxxJBt/
 0vnUyX0UOsIA3HgyL++v3Z+ygW2YQ6ZRW//YO9ouVljuQuMIkX4MM44zBxNw14YKCD
 q7MF7uUsr8v+CTJA/YBZWAk2ikQpbLoNsCBBCf3FadGl3dGw4oh6HPnVZ4Qwj18NY+
 6s9JGb2ZUHtCA==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 3v5wyZg2xGuezrAOD2V3P1pqIbJndu1Mx6B06IOYgQrYpjy4Z8j608TgePZBjSYLDnvSByX2R93
 MK8Pt8GmiVWYZRvkjKozZV60MLVXsNsJ6jZnEXGfKXeujdYV1SRMm6EI7D/dsDRRc3TtVfMEfAf
 RK0AMqBW+M3JzpcW0b2bQAb1IEA8jtFeco4UvIxnqMr1Ar4Dq1JgIPr01km/Ve1jqzbZE+qGMae
 sUxN8SAbB3MOEF5XL44b65bR4IUK/XUVHUXYMU6LFVWkPatTY1QmHeyONTVBDTRRfhmamVbnQX3
 KnyfyDXeMCvMSrj3ByORIP30QYtF05/EK2QQ7WH6yyFugI0sMa1j2w7O9BPV1W6jf4EuTUozqWu
 vUJtGAMTTB2qN0YBPBzU2+7z00DPqhfKv/5/rAAUtzANBFhE24poE5GRHzg7aB8AXgcuhlxNyCK
 rNYKBudURlJrUCBqpEjt961gRKSdhllmdYP4+FO/fW0Rp2MxvsQJep4RyHtK/6fnDwlyJ+t9LRI
 lPi4d2L/p4EqxgyC8GU3t2rJvQxEfHcwxM0gyBZbVAeooWkMdR+TLX9v7M2sMrLz+QZrmUm0QOT
 f0wyBQ3/IBNJzjAE0AQIcRBXQVpDSw==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D19F5A4C6A9E;
 Sun, 25 Oct 2026 23:08:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NE-000000001fP-1vIm;
 Sun, 25 Oct 2026 22:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, Stefan Agner <stefan@agner.ch>,
 Stefan Agner <stefan.agner@openhomefoundation.org>
Date: Sun, 25 Oct 2026 23:07:12 +0100
Message-ID: <20261025220723.1332924-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 23/34] package/docker-cli: bump version to
 v29.6.2
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Stefan Agner <stefan@agner.ch>

Release notes:
* https://docs.docker.com/engine/release-notes/29/#2962

Signed-off-by: Stefan Agner <stefan.agner@openhomefoundation.org>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 4865c6c1c4..850caef45d 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7608d82f33ce0ebbbed5bf8f6997319375c30a46d325496f3e8974c9a0c8ce6b  docker-cli-29.5.3-go2.tar.gz
+sha256  11aef3484c38d39d291a54a73a4d9dd2bb3c000d9a3fc3862bd03fe899594f2c  docker-cli-29.6.2-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 22364f1672..6296502259 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 29.5.3
+DOCKER_CLI_VERSION = 29.6.2
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
