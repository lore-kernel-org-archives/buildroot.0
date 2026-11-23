Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F230606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 18:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sYtfrcdB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aIGhpMQE
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1121640732;
	Mon, 23 Nov 2026 18:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4LyS1SS4QM0; Mon, 23 Nov 2026 18:23:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 418D54071C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795458207;
	b=I0rhZxuokEr1pQtNwYq5pvPOhx1CxIyA8VP50c3dElsPJSH8FQtMEsjXltAnr3PJZKOq
	 l7aeGNu61jzuGWrKPnG4kTgK8A8SxX/jyYiP4hdYCRqyVGm/eRsL+mjJlzG/Cq9WblHct
	 jHZy0uKebRVRNWMFc5C/COsjB7EnL2604lx1hrRY8xZddhigniysc/NXtCT8aHwf0ZzZy
	 OCOuc4uN3k9UrXsiiucXxOredEX6vd+IGXBh1zpzLJuVMVKnlOrQys7khKuZWTuydepvU
	 /U21lKi7kdr4mUyc8/vW/e+3Uulwg0mDtLDsR6MckISgW4mlmYKyP9F/ohDjfweFZ0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795458207;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=mXn+UIXoWOm34xThi4teoXErKV8CazIA/I1hOCDYsr0=;
	b=LS3U2w90paPQ7BIQ5+61O8vY8KT+trcexdLFQbtG1JCgjDVNNjd0+9pxyh23G81sjlJk
	 YXRxZMuo76HVj/sZF/lF+W30AJ85C+a2imx/yfX9vvDBvnMKyiucTaCJrfPwWrKOl/cQd
	 fHWmQkXJAkklFHKr5npFDtHUCs0unMaay11+0uC6SfB7eljnkiT5q70jHTpkJqOssCHRl
	 9y9ZA258Zznqsg5RObv47h95WKXoUJMsGx4IaeSGLOKyaLTDIOepiovfsVPAw7uqjG744
	 MHdDl5CjdkuAfxVFtcPb+Rvb+k1W8MkgX5geryEIE+P1UCuQ3z/fGTbk05fP2jMZEmw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795458207;
	bh=mXn+UIXoWOm34xThi4teoXErKV8CazIA/I1hOCDYsr0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sYtfrcdBNnSV5PhmiRB4LpcSsDn9gWaAcE2ub9X0euUmUne611iU/ijNRhFWetHvY
	 3/0Lf7FtEY4qWQocOi8dOmP6VWimABKFjMwDDQY0lFW+ocgeXM8mEdT9Nx0GxBDfSs
	 KuCwoRlNaCK+u5qXQgAkUeTWmL9LpZ4PdiaM9fHATBpsVUV0JbnF/VaPKcxu0SxbI+
	 j45tVqws2ckKlEbLlyNOxpuUxnVOzWkNUZS+eDrtDRemQYQOijo1iPMpvIyc/fHOHb
	 wFaAMwZT3mcTMNnAaJ2O0Mpo7NHsn8GBxEDmYn2ydrFKoQBGBJhw/29LD5TfMEuoJw
	 Z5yShhTNR5NGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 418D54071C;
	Mon, 23 Nov 2026 18:23:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA316371
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95586605F0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4vchtDfTlC3 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 18:23:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 828CF605EC
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=aIGhpMQE
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 828CF605EC
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:23:21 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-490d59c3f0aso1696199f8f.1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 10:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795458200; x=1796063000; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jjN1yoJ8WStOWuW8fo419dXGBVRxABxset7Xfp/gqT8=;
 b=aIGhpMQE6La/VfHQQ8jQGrU1H/U5k1LlYFR9SwaheWF0CZjG7NGGG8EYKyJWMDuHu4
 94a1v1VvWjySdrd+/RQsV1ujJbf9wE6Fs8HXC1FCmoNYprnsnth0PzdkU9SaMBb3x+LL
 lfVh6Q8S3hAj2UUZLKdFJph+3vdilBerBJRLGLfip0MJSnnqIpKwN0rd0wA24hKzwVCz
 bQpMsD/aypy3E8RXHcDoJEksaS+nt5DDm0m2N/7UCy3YbKnQTSbXBCFmnaE7GVLdX0NS
 juG/M7kopsHz7lUCjiYFywK4vAi3zuZ7XUsUcgorYT0J2BQTYRYGRWQjEj0GEfNHgPcs
 dVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795458200; x=1796063000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jjN1yoJ8WStOWuW8fo419dXGBVRxABxset7Xfp/gqT8=;
 b=oypsryYZ+wcNcuMZlgHnSdKl7SOZFYIm8DzCj9/id9rGpZ4DnYbWvJH/QaGqQw8xuc
 qCwjChZ6MjfkLQljZTU84X9XylPjcAiJ9pAaYA0VRv+wzpIxGecO0bgIXiBb2DX0YvzI
 zE6tm9A4OZKMlx7LjzKppcfEV5Py/5zBiosI3rix22GzUsepC+L/hrnAL1SK+Wz/CP3U
 fkaAcv67ltwGUgmZeu/p9dMHDauJqEiRddzzr/dKBuBvOOcv8MgFq1wpjKbKXOGTfBuK
 WR0rga9Bg36K5Wkkg7q6hOWe6RHSmty/4j1A2YzcJFUlIGwx1+5C6RWh0cYp9qW5bi1e
 n7WQ==
X-Gm-Message-State: APuU4Z9BqjNWF3cYT3vRVFcDQGjsvXXkoZg+h8iUvjgo0ru7WgWNpZl+
 UrWi1nX7hFs2fXGFLUEMW0TkwL+UTQA42jEOYJDXg4l9uDzhwo1jXOYhC8b8DiwK
X-Gm-Gg: AZFdTZcnPGCCMYDYboPjDsHwEfQKFGBAdFImCcm3u1Xio3JuAUjRB8+1eeKEauJ8ZKl
 ok9fzru7H5Znn82tRW/EhX+pr1vjTn83T3dMnzIz0vNzuMTHPiO9ZC2OawXrpPEBxxpWWT7iB9T
 cm2N14Yw+COQdxFNmMLXmEfclUmDNg5NtH38uqjPp3n1IK/spDO4gODiDbEkGMaTlmcbkq2mim0
 YuJOPzWST0BjvHJDjbPVGe0hs+5DCh8zDYqwHJQhq1/9dTobgxSiRJo0KId/QUdGlarVxvw+FVp
 8dfptuByBT4KbpkyPuTVwjwD5wHyT5Ro9sVaMoRjjuRlbFsobm1kthhPHvi4+Gz9TfO1/NrAmOS
 boSTTdPYUcjGeQRq/bCbjW6kGcB4cKYDQeTHzKZsd8HsYZAX8VtXBwSQpafNgxpEh+I+jfF8KxJ
 HehiogjQ+xz0u2JpjLjx0RYZb/Y6gFx/OL6oqpPvPjeJUOd43f7R78UoG5mLhHvr9exFh3m5euQ
 OsbW08rNNs8g+XlGB5F57zOZlMJ7hN3a2rc+5vuyPo0w9KFsCupG0GNkVFfzWwoqQFohoCQw4iQ
 /vO5VIHA6GVT7lvJsKgIjvnVYW009bebrMqFmB+f0XkScs+b17XboPWNJ3S13Iss60SCGkcM
X-Received: by 2002:a05:6000:200c:b0:490:411a:1eed with SMTP id
 ffacd0b85a97d-4abb5eac587mr23736977f8f.39.1795458199862; 
 Mon, 23 Nov 2026 10:23:19 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6c61f558sm23920975f8f.58.2026.11.23.10.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 10:23:18 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 19:23:17 +0100
Message-ID: <20261123182317.2826593-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87plsyhwx2.fsf@dell.be.48ers.dk>
References: <20240326042522.34109-1-ckhardin@gmail.com>
 <87plsyhwx2.fsf@dell.be.48ers.dk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gst1-plugins-good: add qt5tools
 as a dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Charles Hardin <ckhardin@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

This patch is still "New" on patchwork, but it is already applied:

- master: c107dd33e679 ("package/gstreamer1/gst1-plugins-good: add
  qt5tools as a dependency"), in 2024.05 and later releases;
- 2024.02.x: as Peter wrote above.

It is also in the 2025.02.x, 2025.11.x, 2026.02.x, 2026.05.x and
2026.08.x branches.

Accepted: https://patchwork.buildroot.org/project/buildroot/patch/20240326042522.34109-1-ckhardin@gmail.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
