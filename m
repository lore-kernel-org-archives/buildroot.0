Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE54606A321
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lIe//7ll
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6F74816D4;
	Sat, 24 Oct 2026 15:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tlD5AISaiDuY; Sat, 24 Oct 2026 15:00:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0EA2C8165F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854056;
	b=qBJZlfcHbtLHy0HN/iwysbcOpC8LsLza/Ouk+ywjuLT+AI+fNiGo63EJ6tlw1AiTfUiA
	 gP+cNEDZ4zh9f50Nl407RijT2YDs9IB/WIYELoowj5nL/K5+Qs4/mXjRjK627PELeRf7P
	 EtdHNiGQw++IQ99DrdM2QIXj+ahwFGB4u+u9RLgxw/gzP7p2pcIhkUENnvegJmbngr6UN
	 0EfhmvUHS8rWdUr0volNlLuOICue6S9U09Fpl5FhCXWNO+EjG8YN7N2PxWzNbl9lMjanZ
	 M4P5eJUqWjTYB+HJ3NnP0/M2teAJ2w+EGk2XS+B+tDMNKowClFn86ufl2HB9ngHH1LA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854056;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=m46Py6PnqUNraMVGpxVuEticiCpQPyoiNNI76qBm85g=;
	b=nQibNByLm02UdPnHmH3TCvhwgIn3aglOqqHOb1k5PVTdkHq5XgyWGvqJJtQsNCpf7w0v
	 jR6ca2nN8Ma1Zntyc9RuHzx5BSq/xjFzoycoBJFdjdZLZ21j/u7lbUCshr6knj/tMm0qu
	 HDlOaTvGyP81pHXllALAOi4NXcfrYvySyqkWfmB801vQboPBaqLvMXU1qyRfglnBaVltm
	 r4CIWa1sHGUklGJixNjuQU9CTjnFunGawiOFRLAbbxCLsPLfq2GIqQh2L641v0KXX3scP
	 aPchsy5dR7aWw03zSk97xGf9z9Mf7kHiu5OX+KhcJ04geWB8UKcY09aeIaaJ6hSJjKA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854056;
	bh=m46Py6PnqUNraMVGpxVuEticiCpQPyoiNNI76qBm85g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lIe//7llU9yGdpCi73YTlQx5u/C8oeN+0OFyrQAe6w6oCEymaxMMz7XLIBTW50hB9
	 nFsGzMuv9vJB9XKhR13876p+SvNRodESGGVzbBbN2R3zea5aA2qQHrbxFGBzFIGD5d
	 +6Ae88xl7ibQAd1DTSy30d1VbqpJ/MMo5oq+XM0frZD58xa8eRkZ+qNUX37TpRrtlK
	 6DJmE+y+lUz+LjvEluhtpVTIJH/RQsGZN/9FGJjMx68bTlAWu9JfjOGJv6u630VSbV
	 Rv23kdLjdFXDi5dXqHDZCIwvsgFTBsxplf5cD4Ke/rFQd4BXRNQVrVKYLrajLa2Fvt
	 83yMwhFpoRfpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA2C8165F;
	Sat, 24 Oct 2026 15:00:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C5FF3AF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A3AA40A36
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bt77I7PDxo1Z for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9051240978
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854053;
 b=gSWnaxm6zUQSF2ZY2jG0jdALdGOOdDSuRsvhvv5AAneYeUrHXQKrbDesjhraRqEqt+ms
 MNJuTm0jAfo1zi20JpDQhM/bCHuL9Z+HJLPSTQ62cGHlvsApFXkbDWaTcclalJMMx8U2m
 V0U/bC4C4tIbt3nKhraty4gR9Hu+zaZaqgKfx3cXQGKQ50GItCfX2REtCbzc2BQI2nlTR
 lCGOoY9o8XV5cUuzGZC1/mvtXy0CePd+Tf9/FOV3sCIPqSHDC4XGixax5UdiVmDksqpn8
 8jo6CHq53ck9kxv1edpYvwDljSx711mrCBGdDDcbl17iwia3xlTQ9r9nByzwfQyLe2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854053;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WwTugl4tzOiKFYxz03nBQ5tdyzWnUpaL961ioGslOlc=;
 b=FKz7uEH3f8KCnSxettRRMvMcIhO4xakRY+atY1VS8KWO8LwA9veEO0h5yJ2dAB2Ho5hV
 KC/S5nI6MGdl8ujPS6Ni5FEgWrZaXwQdslWQLpAJUUFsBiKEYweQMhk6WTVL2/t+uobME
 IGmQ0Z98EAbDzuWJZv1qYQzUalxIy+wteId5EaU4we4lUk+da6e22wiwQChZLYOjXAVn+
 yV48EYIUsiOxroMusmGvl4y7l0MSzqQe+CUv0MnIpXYsNYpZfobzeFWbgc+00wqCEpZct
 OxDUIPvzml1RL13cgEwbBLZTw7gTAUGfACMwJcVGEH9vCQkAfpwJjLK8Hre1Z1ydEMQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9051240978
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 926D59C84B; Sat, 24 Oct 2026 14:59:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67e2a548813dfc857413a6c93ea5e4378552f9dc
X-Git-Newrev: c4f9121d62bc2210726bcac56b82cc3da4d9c0ba
X-Patchwork-Hint: ignore
Message-Id: <20261024145928.926D59C84B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-context: add host
 variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4f9121d62bc2210726bcac56b82cc3da4d9c0ba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable a host variant for host-python-jaraco-text and carry over its
build dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-jaraco-context/python-jaraco-context.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-jaraco-context/python-jaraco-context.mk b/package/python-jaraco-context/python-jaraco-context.mk
index f812cec8f1..dff0d21910 100644
--- a/package/python-jaraco-context/python-jaraco-context.mk
+++ b/package/python-jaraco-context/python-jaraco-context.mk
@@ -13,5 +13,9 @@ PYTHON_JARACO_CONTEXT_LICENSE_FILES = LICENSE
 PYTHON_JARACO_CONTEXT_DEPENDENCIES = \
 	host-python-coherent-licensed \
 	host-python-setuptools-scm
+HOST_PYTHON_JARACO_CONTEXT_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
