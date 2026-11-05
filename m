Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2799606A33A
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 10:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RvrzBJD0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WHK+MCvI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A08EE8096A;
	Thu,  5 Nov 2026 10:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDgrf5PhsBSs; Thu,  5 Nov 2026 10:17:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CAFB1810F7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793873832;
	b=RFe7MItw3UxXus0ytiVj1oE59Yl/mFMgvfIUf6Jfz6+IfSTdxj0S33pCty/xg/AqVmQZ
	 jJcjfLu4dC3yx9mRFtv62hUVvGpomdbEe7ZC4UYxk9vIBIlHCBteNfGWEkZftgLf5lblD
	 iZgDs7mzmEEkQsGqFQijVwwqm/GwJx7J70Dn+gM5xkOyEhwOw3658IGt0V+0eJHs3FFsO
	 zskj8ytHDTr2T9++U7QZZVb5BP2tOj3EpSf/3Q0t/jWrBQqF4JUDg8Z852Vq05odhDvcn
	 Fg/VP0AymB1ylJQMcsLhfpbILoPDI4DVBwLGeZtSy+foV1et8V4wAk/bO/ufXTqZtYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793873832;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=u096jaUUnqVI36ieV5+64DE6vRz8UcwXBf+ahxr5yQk=;
	b=F5WGJK1iQsDM19JfCgTOpVQjcDFjwpf5nwJ+cetkb/pidpfGVgk6vR7jqxjKvEpL3hXV
	 59yZO6kv+U+Kfvs6ds2aumPetlIsJuWJB14Iv54WevDbfkEEsnAV1rPsCejppLbDLGVu2
	 KKa86J6zaGhsAtBJDBxduUXSZEYSZSMIRcjgxC+VDqxA2cMCv2K4dP2r+QzFvFONQhBYw
	 ln9IiNoZKTwkSyX9ZozOlencj8pDoeWmf63MJPDIhnbm5Ibcn15fD9duE0iDUWkjXqwqC
	 M1FsYQQ/Y5iMp3TY9S7wnCed4lRo+WuI5l4uF/fnramIdE95Pvvmj83SJdE7TDuUNKA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WHK+MCvI;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793873832;
	bh=u096jaUUnqVI36ieV5+64DE6vRz8UcwXBf+ahxr5yQk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RvrzBJD0reEhKOKIqErOV3lCaxuXs75KfLuEsrVKq+EhP59icgdZjStJOONKJeKd7
	 irijX1ljAdZQtRNlbq0NNLaYlCay1GsbJrmzAOuVqRd0/tYjPZecjPcsP6UAcrIi42
	 MdF3CxWSFsEoR3FF34XcmEfsFXT+ko6bzHaOpzcBwgbkFbn2BSiPAgvyeisCHayjFT
	 eb4UZSruwLTM7plwBfYoMW7+PzzJhmCX/frzp0UDIsOpxoEv+Ekl4q02nWD/pIEPYO
	 ivzZ6hETjwKJ+i9tQ1tWgBwbrnErC0IGgY/psXYuNc9XdKoIbXC2NKrucucEkymPG6
	 LAsv8LVisH9aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAFB1810F7;
	Thu,  5 Nov 2026 10:17:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6D3352B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE21F81137
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IqDo_3wBJSoz for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 10:17:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6A22481083
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=WHK+MCvI
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A22481083
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:17:08 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4919a880834so210429f8f.0
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 02:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793873827; x=1794478627; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7zlcwFo0VooHau/gApMA0BRAcwxmb+DoMRx1VbFPF1I=;
 b=WHK+MCvIwBMIPS5V673D4eCJB9rdUBtXi5FXgOXoS1XDLvdKF0RJGPonpZ+DbhKHeX
 2uL90DLkw5qHALo/DJlqLS51HelQHakCmpKWxYJXc3iDEH4+EV583Hoth2ygobc0lvt4
 RgIVYdOhPLncv/2mRmCC/ls4h5w+RHBmD+8OF31jRg2nGkZFcIjewyqLo2OFKf/r42LV
 aW+qo2y6GlcMQFWcY7FG4+bwm/sl5OZ7AngFpgZUcm5G5nbG7MBWemtQ7pVjLNUgxJ7G
 xI87Rf60NSJnQjVq76AAw+XrMlSNfwJu6ymO12ZUt1PIVFzy5fr0Se5dclm2l4tl//4G
 44Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793873827; x=1794478627;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7zlcwFo0VooHau/gApMA0BRAcwxmb+DoMRx1VbFPF1I=;
 b=tduof9bLNv5owZX4m/agUa8HOH2HGygXvvQgAqsJ92qA5QKTvsCd5I1/5IT0vXmmuw
 EoANtFOR1/qaC4twmCHq0df747ih9zBQFnotJcvaecqebybNF5KZ1IwCBD7qfgm0DHy4
 2v3wd9bqikTi4Ktbjwz+TEJ7QY1rAiPq6UtecwX5XfU+KXqU/TYq1vWjDhbVP0ufkK61
 PRIpabOmYpGvuJj7wgX8cjkWWalKL/RkF5HluZhM3Yi+7cMPvF5bJWZcKkKLO2TnWotR
 vJWyYflLBmeCQDaY+5FwiPpxWADsD6cz0ebt559NPTRZlkzOuPUfBZG8GTECv6GtmfrO
 Howg==
X-Gm-Message-State: APuU4Z/fcgJyOL/hZIB1eis+95WJEMaGedpIeMXfspBJPAqYZlwVfV+x
 kTGl7xk5Q6gs8/t6q6aN/UWa4MsYq7vRar2dgBaFanVV0tj8xt4PCMEPUb7VrA==
X-Gm-Gg: AYBFou2zgq4C8S8GMYT4jr54tCV9Ln6vo1ODQWapHLvWX4Dd55XOSh7c06B7DnEJ2Q3
 4k6LKNqKKINrk+p1JVrfbgPuysTgX9Z0pEmCELKjlmykgWuxuCB2efapWofUir/elp68iUtXafT
 amZ3dCGwki5ym0mCC1xPK1El099EfjJxfrpQbwyARdRK0oKKzWBYqvFkCpK76z4BObhpBKGOIZW
 gicfS25z4S2FMJmj8o84V/heVXD0mcD1ATPuRqpMIYOVWeQKYtI5YiuYdF9yEhaf7luCUQInlj+
 NQYfPFTXOnWa/+4yf1d+MPakSOz99zySvIJvcClbS1/CQl7WD9q6Z9PtuzLvlWEc5tjUHTdzWh4
 HAbhGfSFg6KgT55nLuzaKNS2uLXdqL3BlHeaFpm89cxCHRpmMGJgZcKbqjCJGb3dCuOGznto3Ch
 pxYK2YhAZYQS5wcX0OKRJro5z1IgwFj4XZl3H7BrtpzBwHu2bx7O2Ph9CKJFVv9v9AWWmUzscRs
 prSJixWmeL3Q/1u28jsa2ld/sKydlFHcWkO9otQpeNea6T5mUXWyDtdNL9+I0ZK2KkmPOS+uySs
 vYQ3CRbcxEPwxjja8xKF9GUAq8j0oVy8IoLzs/WcU52ZlaVbcG3ZcsHTGQm+baAbvLQ3ATGRNU4
 =
X-Received: by 2002:a05:6000:4b0b:b0:48e:1b11:7ed0 with SMTP id
 ffacd0b85a97d-48e6e2ff15bmr37136757f8f.33.1793873826677; 
 Thu, 05 Nov 2026 02:17:06 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48feda207d8sm8631777f8f.52.2026.11.05.02.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 02:17:06 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  5 Nov 2026 11:17:02 +0100
Message-Id: <20261105101704.1627207-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] website/download: complete the git clone box
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The copy button has rounded corners on its outer side only, as the
end of a box, but the git clone command next to it has no background
and no border: the box looks cut where the command starts.

Give the command a gray background and rounded corners on its outer
side, so that it closes the box together with the button, and some
padding so that the text does not touch the edge. Move the shadow from
the button to the whole box, so that the two parts share one outline.

Without its own shadow the button looks small next to the command, so
make it wider and its icon bigger.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/download.html | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 2482c0a26a..0928982e8e 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -140,11 +140,11 @@
 
       <p>To grab a copy of the repository use</p>
 
-      <div class="input-group">
-	<span class="form-control text-truncate" id="giturl">git clone https://gitlab.com/buildroot.org/buildroot.git</span>
-	<button class="btn btn-secondary" type="button" data-clipboard-target="#giturl"
+      <div class="input-group rounded shadow-sm">
+	<span class="form-control text-truncate bg-body-secondary rounded-start ps-3" id="giturl">git clone https://gitlab.com/buildroot.org/buildroot.git</span>
+	<button class="btn btn-secondary shadow-none px-4" type="button" data-clipboard-target="#giturl"
 		data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-trigger="manual" data-bs-title="Copied!">
-	  <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
+	  <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="20">
 	</button>
       </div><br>
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
