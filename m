Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D97606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VOEmv81n;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QT/JAbHW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9699816FA;
	Wed, 21 Oct 2026 20:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyX5fv3xnUsF; Wed, 21 Oct 2026 20:34:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0A9C98188A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614866;
	b=dV24Zc7iYp5Y7mvnkeTuvpca9N7t+hMsVLX2XWUIC033midm3ZiLA9j+S0g1KrfRb4T1
	 FqQedecG6UY5D3F5YqyW2Nzg+lCZnQyV3WQprg6fe5yPcNhRLoE5jn1wdqc6tllpUqAMV
	 kseqWg6qbq77sRIIDMQOHrdl2fO/4KF3ljuoUwVvXKrGMZIckf4OG6e6x8J6/qlA16afK
	 zvBmXIugAn/CpkzW0COlSAiw3U/qR5ovloSeEeUrQhkD2DyYpJqsS9eWxtYbcDxUnKZpo
	 O4jMzhWUS98czMBKXZPHtjKrekSzgCXwgLHDo+1TxPGGb4FCsrr58Ltyd+FKObJwY+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614866;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=VZZmtHo+pNm7j5oT+komw7BzfAxtJAiAEWFoehuc/XM=;
	b=SdzSqxm/1JlGlcvQp8cGvPn7BtHPYcuHiiOVLhhTq2I7h8SMKkPksb4FqBnut95qYG3K
	 pcH38gDiBBmKCeBLZk456WEjxHPDF/9VCbDJ/STvNToLZtGG9jM5ggDKnt9cuCnGc9soG
	 IXaqCUs/g5KamK/vRnp+foc67fAYEn7HIYVwtlC9zKyLcGAorEBNCk7xKWeCveNqwTH8v
	 a0+Lw2k+M5Jc19ljrDt2+cNi3DEszoMRgBNljBMKOdhHR8rFUoVSBUJc5vsfDPFjOzKJJ
	 HXHDhQ4s5GhoGz3Wnd6Dk8e7FRAor6RjgSOaLFdOzYJ79nSS/owWO2Y+p92XnU0+E9Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614866;
	bh=VZZmtHo+pNm7j5oT+komw7BzfAxtJAiAEWFoehuc/XM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VOEmv81nqLdTqf5o+vk/jWzLBBA0J1bzMfZp+M7ZsxHjhf8+8npF5m8w/tAai3W69
	 KCAWAdRL9ZYqsZMUMTa00rzq15gbSBQ6UEcsWBo7e1iXfbpACRyTsU9Qi3E4Yur77+
	 ChTmuWfAR8HW7DlaSZAKwVPFcK5CmRRdOY2dMbAiduWWBpm7E/+65g5btWzKm9MMfY
	 yennbFF1pv1zwW5gbQS1OX+x2ffW0ymrPBgtinGaYd0Wn06Scw4CtqH14BlkpHwHee
	 vRghXrKWoPVv0GG8F356VRzehAStdTNBcByIgagoRXqZy5Nea5G+Tsn2PsXpWyTVZP
	 OE2YwTvRHf2vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A9C98188A;
	Wed, 21 Oct 2026 20:34:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73C4F769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59AB761614
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7BbgriBtNLi for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7612661611
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614858;
 b=HCmaJdmfXPOZD1QHmt3Imi6eAbWureWyL2DYqsKZe5HI4SGbcI9LvQz9wCyOxZatFBub
 OeoXPgPwbd9k+nLkErBMAgUJ1dE5RBAQo24LoMsZhGxvISXWkdO/ri637RrXwO6xxOvyI
 k5aBiLdJfLm2OSSQQ6vqjd2nP2HBGm8jMd11ONIZ7qXisx6p7anMTcQktrx7exlB8uXT8
 4W7PY11IxR5jmhEn/8mUX9FNF0VQXwvObMIwNiULkS3EkSoJz78OjrxaQV5n5Da7Av5v+
 B3qsxoFX7RPkp1h9EIt4/QBBdGjw5IWsObOPtPSH9RhzLfP3VzRBZz8OcRDS/PMa+Ug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614858;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=QQ42Bhvn/Ju1WJuGyxHw0HMn8YI3D8IRtD8Uarx9BJg=;
 b=R92DRylipXtA/ZS/vLl9h5cvd4Jj6xwIOZ2i+LNFqFSXZMyMR/J8a+LK5yJA+fEMz2Do
 zXSjwijQCCM4arqpgd2Ep34rBmeYQiLqgV1zCpjUEuXaYzPF1H6R2b9WvqukjQdZRcjvV
 Kgm9mmQVfStGx0DN76lE6jA692jAdttLuGEtwxW3SyK7hnmY+z2OPrpqai0UQ3HfSjlis
 EPpgx/KLwmCt473/S+7IZQM11xcuZgnzJ9Wb/5HZzOm7/pc5mY3kHLSVFyFqddno6B3WG
 GxTKrAmHAKDPrbVgaLdSI4m14GBr39H5Uql4Ee/4oY8+RVEp49ngxPEdd9IjerTj1vg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="QT/JAbHW"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=QT/JAbHW
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7612661611
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:18 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-845788309b4so550070a34.1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614857; x=1793219657; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QQ42Bhvn/Ju1WJuGyxHw0HMn8YI3D8IRtD8Uarx9BJg=;
 b=QT/JAbHWdW24TFUJosQyaGVWKaDkvuWq6w/gPUTV0xHDibsSfUbrIFSeDWp1BqoKlt
 5LMZ0qyZW9RtEHkwQbAnBFKAuZzgF+dF//yUiRA4YAJmig1dF7ZuwhNNoaaL9jxeXP2i
 +/sGwmrfP5UFtjSVy4tXAxl1IhohUsevDIXJBXdLUMv5RHX1DLhz5k18LhZCttLAZoAi
 Md1pEVyaIlNpuyX3OjdRR9V4rHJ3MAEdRS6caoH8Eyh20hL5SL2mEvj05jP+OMtmNEH9
 tnWev8+8o5baWpXSWiTgKVamjglj/mxppvTlqUx7Zovo4dT+ebn8Lub4Ms90us/vcF1I
 497w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614857; x=1793219657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QQ42Bhvn/Ju1WJuGyxHw0HMn8YI3D8IRtD8Uarx9BJg=;
 b=GoMWfvUwePwynZMQSfsTCR+vzVim+d9zMJmZVUAJUXOswsUucrgMRN/xewaLpt06L7
 7C2+UG4BkPoGhVyPIrpYO1Wyrye033mWL84WkMftrIQdpdqRz8O5ybZjQOyHigW4ZBEm
 2HAeNnNlTAVK3GBIsA/WuDDY9/BoO3/UEJAHtnoPGdnsrP2sHJ10fXeuwjc/LzrGSrwB
 40InOLoV7TwpvyNuZyUe1ra5q6aIO3rylgmqhokrtotdgD2RtKTaYQmwzny94//Wm6qA
 90UxB9xxAI8IfCoSFwPhNYbFRVbxC1r6SEODwlT0alRSHzo4R3JAaDO46+Lw799pswJw
 dcuQ==
X-Gm-Message-State: AFq9FYIij1NwNasrC40MpLbmL3cFy7xJ3ZHENH4FXbm3fkISycjtbiyj
 PpneQzEGFVZUrKxmZoBau3NkYDoXWnT4iI/TkIw/1ALerN3iWIwzEhflxOs85Q==
X-Gm-Gg: AYBFou2SDRj7pcpG2fWY8H/x5sNQ10PQfTgFMN/k/xx3GaSD9t573nPaa7/rHdpQ4B1
 hkASIJLi5D6PNXNVrNnd8d6BR96FIc4aE4SOAfj58UK369E9IHAjU6QbNRV07Ab8dnGbfqbjnwx
 O9n3wSyWFma5BiIFB5wMslyoUleJ+ligczHALYDnetmx3QvtzBRkmSTj61RMaxdylOdaLRSgXc9
 03I6CLTQ81Xx/G6bOXQohi6IwieZoSXi+mNPGAAGNU3QaTvk1MjlelXIFZGF1Yw/KoqoAxvkmjo
 3yMIkikqr7IqWoh80ynBc8HfnA/kTEpsWDCyW3EZyu/9qfv/YzrpqD+NGd8HwK2zbJirLsOOZ8v
 SXm2JY9Qo78UySKQVHUgFiKRzaGAJZDZY7GeJra+DNI8z0fybz8pcotpvig/I/x1CrLMoLc/gAm
 7od75d8T1O1ZWEG9mn1LSPtgcVkspBXuhZrZrpAFPi4F+En+Q6ypJ1cJRDIUCyguKHvqZjdZtFm
 Pj0dWV+QfSSQwr1/apPITZdkmW5kJoSnLfH2ds5dhTIkQabGGXRfyl/BSq1KwsviEhERfkigsC3
 J070XeieQyG4MucDoY3nxXAeSzhpkHMb4wOx6r5mUtGCHTtg+2tbG4zHEEHYf1x6exjHHLozt1l
 ysLrET9yNQ4UG3xgdje7wzp8+VTqI3ywKPuYVEdNCOwVyLQ5PxLthXoJxVpQ7hDSvT2QpZ/xjGZ
 lxIzfLTYVCrBR8HcnE+Na7nTY=
X-Received: by 2002:a05:6808:6f8d:b0:4d6:92b3:5c8d with SMTP id
 5614622812f47-5535d9b8571mr2344046b6e.67.1792614857068; 
 Wed, 21 Oct 2026 13:34:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:34:00 -0600
Message-ID: <20261021203410.3114473-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 06/16] package/python-markdown-it-py: add
 host variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Enable a host variant for host-python-rich and include its mdurl
runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-markdown-it-py/python-markdown-it-py.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-markdown-it-py/python-markdown-it-py.mk b/package/python-markdown-it-py/python-markdown-it-py.mk
index 35ea875ab3..b5dc1bd5d9 100644
--- a/package/python-markdown-it-py/python-markdown-it-py.mk
+++ b/package/python-markdown-it-py/python-markdown-it-py.mk
@@ -10,5 +10,7 @@ PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/06/ff/78412
 PYTHON_MARKDOWN_IT_PY_SETUP_TYPE = flit
 PYTHON_MARKDOWN_IT_PY_LICENSE = MIT
 PYTHON_MARKDOWN_IT_PY_LICENSE_FILES = LICENSE LICENSE.markdown-it
+HOST_PYTHON_MARKDOWN_IT_PY_DEPENDENCIES = host-python-mdurl
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
