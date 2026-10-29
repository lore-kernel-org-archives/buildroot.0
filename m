Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7793D606A31C
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 16:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=S1evwy8E;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=F9f20VV8
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 521E480DD2;
	Thu, 29 Oct 2026 16:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dd4aUSc7kWb2; Thu, 29 Oct 2026 16:42:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 663CA80BF7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793292164;
	b=kTLK+EFk8YR1LySwxR4RKk4AfBLzrsg3SFYbQ7vlosbf34VZdIadG+URLGOjB4rMkW7k
	 Wb7WYYqUFQxNdnIj8+SgcU7BBFkY0PCQA9MLx2FIdejjDBMj07y4YQS9xCbmVkEssQrTP
	 2DxAbaqGyQWU1gRnB39e8YC3ER6wRp48C6u5GvhCjLHOh1lidWE7lMi7M/UtT5PPvHN8c
	 QsdY+GZALpoAf8j4JQ1eMqK4vlfURCVBSlJ8eIVNQLPR0fEr6SxoN0LmUGrSjmhuJzjB8
	 XgTkT2fMS/d7v+pskHa8rIn2Nrej4gs5sDmvLIF/n9ySZI1+RdlGZP3F4MSq15aW3Og==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793292164;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6VWjaE4543NtW0Vbrp2e0S3CyOWGLMZlKh9VgfZQAws=;
	b=MKncHG/nnosKrL4Ij2BDKaLKP4M/rD0R7wuIt3sSTjgfaqzxADZIYWV/s+DXcYQIdx8D
	 C6vOUF3z7Ed05leuISvaTniB930GqYyX/LcsKB8nzfv6fjfwXANO1k6Mn1BJ+EihQEQuN
	 x/VXh9UTqEE7Jl+OmobRkjMjdukdNr5GghSarUprq6dAZXRZmUHt/GXpwtHc3XXUfnS86
	 XGUwBxvOEZeiR/Z2lDzZBqT1vsQtKmvfa8oviVPJ7DEnHJl5AVJ1VnRpNohejVpBJJKhb
	 KC5SMZsPweTnZmY4hyzHbHTcptf6w6ATa+Uc9+k6UxNyjal7SqREgdI/u8V5lLTmJsg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=F9f20VV8;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793292164;
	bh=6VWjaE4543NtW0Vbrp2e0S3CyOWGLMZlKh9VgfZQAws=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S1evwy8EHec4VNZ3UNqGiVjMZlk1m96ywsFPot96PfeeydGpYqczqnExpxBy6CISP
	 5EstkJ2b+Ul9RbCqi3ZJ+IWzUSMFLQwohaaDdBxU7sdWORCVDpKZVejdblXKHAIPwc
	 RD85YxPhaF8l7pjSClHiWJ0Kc2DI/A4VPHPeLAfz89MhSR4hlMXN2z9KzlohV31O98
	 r7b7y4d9FZWGMljJwG+5B94ukp7kMgqfhBS+keTZv9Qn3/YJyIn3rXLfz9g9eQcchC
	 xcaTbvgepfMLaUpakL7eBkNRclslw1Otuhk2mfZSSf6yoJ5XAFsHEtuXZCnOqE8NNV
	 F940hTW/6kltg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 663CA80BF7;
	Thu, 29 Oct 2026 16:42:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E1C0380
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 16:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6394280BF7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 16:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Rgr6HHp0cEM for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 16:42:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5E00680BD7
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793292161;
 b=Xxty0u36lmMnRCIcRo8znsw1sLchtdPAeATv3CvP96r0qaVtuTQnTd7+J+XiBXMk03tY
 1XZdZpIxLrRUFDFNGZPF6skOaiicbC4YlxWgP3NA549NjovY0RREUh6lnLro2BLV5L3/W
 Rr7ax4Vqn/MIgRNPCX8Cc6V5KGKRFkZqiy87lF/Nf8KdLqJjts3CQWrmImHtd0JLsr5Wh
 HBUCWaazzGeDUGgSHeb+ppVuN7NXlKFvGmZLxgNBKVWRiYuDpqQJJNUWG9/uZVDVjZLuP
 W3SKXcIwTeWjiFN71ipltEWhbnjjYCQe7p30lRawVshawHk9UXhA3QlYp47LYTiEiSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793292161;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=L1dSnrH0epWPRWnwjc9gWyOgNH/PkPTdIM28rxuUBOw=;
 b=pmgnb4lttRFpXTWYQ9ga0VCNgrTsmiZXD2ir6mvowtsUd93dGzGt2/eNlxWHJzPJujHG
 7VexXTkcaKBjM5/HosdAkAZ3Mre8QqXZKEsVHa7JZW2RONY57wv+YRH4nddvJreLtBtF1
 SpcQvxp1cQ9Q6fIaD9aQzr0ya5JJDDn/Fduq4OLrQWvE1iLuzGzUNfcBqbeYys8zHAeeg
 GyDv06DG7aLeqRyIbNeuFP7BU0buhGpmsB+u4QrmS4YuLFW1kc4ypEfHCsHCqlmHc/lx/
 JDdisv1kcJiqKrGgWuklTEH3QbbSd3l3ix+px94ZELyOzprtCkZG5aZppY7A2fphttw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=F9f20VV8; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=F9f20VV8
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E00680BD7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 16:42:40 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso1314602f8f.2
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 09:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793292159; x=1793896959;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=L1dSnrH0epWPRWnwjc9gWyOgNH/PkPTdIM28rxuUBOw=;
 b=F9f20VV87w9enVqoKNIbrAHFtLA7TRa5z/kEhzbNgeHdhGtTej+61xcDzTh7cjSrx1
 aSaxTViCpWzJIO2KQ9hmToERreVoI/0y7uyvc3rHgnrCCHdxvFaC2GiTcgWAZh7HCrkZ
 R1O5TirVB2c+GQZ8wnjVO8WXEomyqytq3sErc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793292159; x=1793896959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L1dSnrH0epWPRWnwjc9gWyOgNH/PkPTdIM28rxuUBOw=;
 b=dfGjdDbwQWODAWbpvX2EeIfBkPhDAMSdFRYUA5cU69ade3FQEDczSa21ZhvWlA5Tjk
 oC4OtUA45lNH1wLfp2Sh4bT7WsQmNpqMYR5ZSvhGOIdDeTP16LfvfPzB3bzszYRl1iXS
 KDNSd8ueggALCP1gd6rY2JJCwR9PoEE54Mofhm5lxPMbfx56TAeY4FlGTfFoX1hTgDea
 VuyEvxOTr3izLJ2xMEZYnTWQHHhxChM+a88bhLZ/C3iUqzAg1Ny/gFs0tBSLwZqyCGkM
 tT4flLpDqs8bKavqFn5ERVuKTgRlbYdxUalLE+N0SmJAv2px68piWH3ZfvmK2k18xOC9
 Scug==
X-Gm-Message-State: AFq9FYJC7VYBo/WwKlUlwsidbWoz/r7Sw2ZF8n9Arl3H9hmZEORp1sPZ
 mXMrsH3Ga0DyTs33lz7AnrOf0jN8Ae8Et5srj+xdxkKTucX/QHgrJfWTnjzmausyW6RR3sSPMBQ
 tE8LE
X-Gm-Gg: AYBFou0OluJuwM7z+Sf5UF5cuZiqQ7BNgqYtK06+gC6HZgvDW5XSAxVKADMO9Hx/fDi
 Sduyryb9o+vEzX1YqGUxlxxMfMMls00uzgXKhT2A8PGtBnhkllAyOAKbz69wpUml+8Rwogy+O6B
 dbOPaN2WLSrytwWnxX38dWcPA3zDU1qNEHLTELUmDhfVb4ANmmQ1JxVnBoEnF1pxqRa7MqOMju/
 ANTa7O24CCuwyiVpcDrDv0bZ2v2vvY/Jh04kKWu4Cjt6GJpu3mE0wycRXdA7xV7y19UaF3E+K+f
 eDrZQq7uiOzut2xwOIk/gGDrFovwwyDN1hegC83qrnxiXEhx7SFGtfLhFz7X40E6tZ8JF1xq6sk
 +MOjPr0D0JubExMMmUBayQaZqngILRfkic1YdaBlF+NBSMZh+vneMdR0ELIe6C+PGWC6uqx7JMl
 o1gYadEoYQj52LYkI1sPSQJ4BDbe6i3edhm2z3nPbAJvDqqeS44KRePO1BXlk/ZYbnjSJYnigJA
 yKSUeC3/UHhNRerY96dvWaaFF7fHH5DpiQ7eG1Ehft3OSMvS3YqhaICh5mN5QWEkq5mFxBdMfTy
 ILvWDr6rz1BW0jnRcYz5GRjsQJTsmINT5pV3msPwvvHL8gvMDQGjACuMqwMGns910CZi4AXl8w/
 9VRXea1NowoY14V6qw3l9HoXowaKmRavkC1rOTBJMOdoI3lodyNll5TKB5vPwbVK3PguyGtfcjG
 liZRBYY6QDBzR1rxiIMKskIYRHMA==
X-Received: by 2002:a05:6000:29d7:b0:48b:68:594a with SMTP id
 ffacd0b85a97d-48e5d590992mr9343951f8f.12.1793292158853; 
 Thu, 29 Oct 2026 09:42:38 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e6dfa0610sm269009f8f.31.2026.10.29.09.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 09:42:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 29 Oct 2026 17:42:12 +0100
Message-ID: <20261029164212.672884-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/eudev: S10udevd: wait for udevd
 before triggering events
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

start-stop-daemon starts udevd in the background and returns before
udevd listens to kernel events. The coldplug events generated right
after by "udevadm trigger" may then get lost, so that no module is
loaded at boot:

  Starting network: Waiting for interface eth0 to appear............... timeout!

Wait until udevd answers on its control socket before triggering the
events.

Fixes: 41258a81948fddfa7fc8ac06b69d77fa051b744d ("package/eudev: refactor init script and rename it to S10udevd")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/eudev/S10udevd | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/eudev/S10udevd b/package/eudev/S10udevd
index 8bb8f6eb3a01..6602e92c2c86 100644
--- a/package/eudev/S10udevd
+++ b/package/eudev/S10udevd
@@ -35,6 +35,14 @@ start() {
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
+		# start-stop-daemon returns before udevd listens to kernel events:
+		# wait for it, or the events triggered below may get lost
+		i=0
+		while ! udevadm control --start-exec-queue 2>/dev/null; do
+			i=$((i + 1))
+			[ "$i" -ge 50 ] && break
+			sleep 0.1
+		done
 	else
 		echo "FAIL"
 	fi
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
