Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E4E606A33C
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 18:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GPGgtLM6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D6DZAbCV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D01DE405AD;
	Mon,  2 Nov 2026 18:14:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5PFPjZMLSdS; Mon,  2 Nov 2026 18:14:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7F85F407D3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793643242;
	b=Xarx+nMuQw93qLEVneiClWcvmsLiw53cygO8K30HOwtDYeDvAsYLnHXo+oEwwtuUKROB
	 6FByohqVZwPWvxkuNvSrsPdYRGV8E7mzASIXACX4IKOOmLlM2++nzxAFB7TQCdQcBTTMn
	 n9KvsqBBQwcoF6H1jTb+WvBCOSuWK7Jp81HytTzhr9KfpID7+jUN7iXm/ba2D/D9ZskGP
	 2GA0bLlwt8F9tOlC7L3ofqfhiD7NL34rWfQgH81suFx+L/kzawQ4oV8f/80tsnOWCH9MW
	 2jd3rCftilqqg38SlzlDLm38mWRpp9FiXC7xEbdlaWVcPXfuJkSz45WJy8LbTRGA+VQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793643242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=T3qtWNLuBfE/ZVo6Gjc3Tk4hWq62N2ng7NMxmO8NJw4=;
	b=G3CbnQYeBRIEbo3s8q6M8zySgRIMZIfaFlpUGAWOHJ5CIWUuga33ePY3Tgs9Wxy12KeY
	 76eUavI73ikSlGG/lMExkI9GBzgcnfxV7pcqIMHVAjcRfNc7pc0zb9JNV3ulb54tXjPVS
	 7iM8jIgI8thNtmDmhpQHBoQBjdjfGzoabMT68zweRcQcVrknZ30oL/9SfH3RRsKZ2C77Y
	 up/wjVbLtrgsa8nnjpAPj+iokpScjrM3G1fReFqXfuJ7b4QShyd0nffzK2P23MHKdDaGM
	 /WPyciYSzXL+AIB1Oiq6bDJbVjXuxpp0/QwxfDri2z9L4lyF5MyCo2z17qPQzkli7fA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793643242;
	bh=T3qtWNLuBfE/ZVo6Gjc3Tk4hWq62N2ng7NMxmO8NJw4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GPGgtLM6wmM2/4LEi6JgVZZhjuKB7axGEt32Pt8clN3rrf4jLLTLV6zur1pAA6H5q
	 A7uLxp7fhAfxu0qkAEudqj87tggPaBa2IHdHw901DA6eMvbdKnHOG6LFAvquo3/6HQ
	 QeT1LuhVi1XSLGo73xICQ9YlHIcoUgySOircJ9OH41kSeWn4Aqs4KAAPCBGs/aTPJb
	 j07gZRdO7hUKf56gmieBNTbfffM+23UFVVIhZE2O3qS1E8FpzOkbZNebagy25vUihQ
	 e5rR5iMNJqbPN1AvksbLHlI4EJnxcFh7bW0v/IMQgf5AnA45hgQm4SQwF0jEJwI3U/
	 kvrw/W8vUyFvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F85F407D3;
	Mon,  2 Nov 2026 18:14:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 997BD4BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A0734007E
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejfqYpQR7LVh for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 18:13:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 743FB400C8
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::231"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793643236;
 b=OdCl9p8BbAXlCW6g3UDeKARo6Y1Gb0bpowUmn1KXX2VgtXznW9VSyWpNQwQ4kh4rr5rM
 aNDP5ofeHhscQ7Bzaiwczs+UUp+7h8bO46EgLQ5R3wioABzOn6G0jQ1DdUmGGyArEk0bc
 XCvl4DPZxa5CKPXqC0SfkZGape+LHKT/xRrWvsAbZIMtQePbFEmAzp5h/W/z6ND3EQVWt
 PONLfmdkuLeinj8Up/fd5fuEQuggoEihpL/CZzgKLCQXci3YlNubtBjaAGkKxlZKXTpvl
 Mdj8sjiEhZb/2ANcQOSA5cV33lzqmK9I1FT3lpzgBU5XVNtqGVjBgP5CKRdeuNuDjCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793643236;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=4mskPok6oiYjPZ4MSa3FPXPTeDgKLHdYwWyfzxeXt0o=;
 b=BnJ5RMI3AN4KoddA659fgFkGiYB8GxB6qYAhl9tOLHzhka1c/56SkpXa+hhhR8DPKniH
 AMUJ9i0DycfpqJEjjhS9VZ5u2pRHHMT69FyKDGDU2SB+h/Z9zJSOlq8UPATcTTli5oUE2
 fDjCU9ymxU3+AtdOrNjqhPyvuSf5Sn7SfL9pmU3k/YwHW7WAiYN/k/DDzuSd2Jfa4kKuk
 FR36ERSwOtm4mXGRQgujSeb/9rJjp3fDM97yjnWPGkrmOxS/y4GW4CbUAPRsgHW2Gerh2
 GoeCvGVG1QoOk0ejHyKoISDWQtljUftj/TtkNsZ8evrbGVH1ttxPKCNth56ebfy09Hg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=D6DZAbCV; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::231"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=D6DZAbCV
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 743FB400C8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:56 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-53aa0802881so1686943b6e.0
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 10:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793643235; x=1794248035; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4mskPok6oiYjPZ4MSa3FPXPTeDgKLHdYwWyfzxeXt0o=;
 b=D6DZAbCVGfCGN4ESfghQsmbkfgXx/cKeL8xcgZtDFmFaqthpfYjC8rimmYmNuUgzmv
 Vm90sQwBBjnzn7yGMOJKKpqal/MU7CxquDs3sOPrvMqn9aiA3ym7Kao9PRhcbhAUrYRI
 oenOyUMeoiAZvEvNcvZWxNB0Z2p43pR1c0haaIZRV5Zk+v+aK8BPERVe2TAY9mhp0vUB
 cFAecwxi4w4h8r+N3HIjfCjnlauJiZ+NMM6u7NtPyzOha/qPl31eyP9FryyWUqZ2sMMp
 1Iy5yTjxtxQrfuCsGmfmqN9bUxcamy7RBLkVEVXOi7XwDUx5yQS3Q4+xuGX9+byyaDsK
 rJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793643235; x=1794248035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4mskPok6oiYjPZ4MSa3FPXPTeDgKLHdYwWyfzxeXt0o=;
 b=Uxw6ngPAKCHmInMmVg9BJbAZeeojHHTYiQaEsKZGVMw5C2d2Zv52ipvcpbLMpz3PTj
 AOn2aoZ4KmvCRgjm4vASMBCOxYAY8UP1iUlNQ5Eos/y51SA3tKjulho8lO1bHCDy+ex2
 FggddgUyGl34U//igEPhFURiMQUMDbAXnyCgjtCUmRs5/sOp+B6JvNbGwfrIa2BP78Ob
 qAhdrh69RY5yaoZXCmQ5GzF+OZC/mIRXMeUjIIUlefyl6np8EDH7lQLNnVB1ZgjejjKV
 bAMh6i32j2ZORFbafqelL+wW7Gz1ge91MUGeF6//F4sgqAo2k7LYArmTl9LeDm1EDH05
 YLBA==
X-Gm-Message-State: AFq9FYKtk7WBVTykzGCYaLMDjsiOEe3mcjs8vAQh4vKWcLlM+icXYrH5
 CAfcqfF4vl46C2eIp05ZR2RgBhMYmSp3bjLFOMKZQLSkqVBahy1whnvhaeE/WQ==
X-Gm-Gg: AYBFou3tZHmTAlvaXRy4Q1qXRSQZCsJAP03smzKzeWnkPO6xuYzArH9/fANj1WcSOr4
 Fu46TkUrBhXtia80ANP+7DbOFiwGGlQSeiu2QbtxT7i9Psm8TC/QlMNwzh7C7VPtyqQSLoedpuN
 Wjfa5Pd/5/DXLOpVxc49dH7U5BZ8SGLLlv6WNc6itZjHW9PSVE6FFF47EH3zsyvursz8Zp/Bh9b
 voeVWdSEu03IX+02zJ4RKv072ggHMqeX5KslfxSLK0OyfwFhsyxVCJEQd/0RuX9QsC5wEUf1xZm
 VhpvpMA93NQUV8I6S1Qb7vfKPM5lob/+P6R6bN1Je+t+o3pntVfqyunkwimHCBw915ewBvFaXyN
 azV7KrygrhDUP+6TSRsHfK65cl4Prq/Vvok8ZL6VVKHDfG/otJ/ThWI/IAXw9MOicR1xQUqpBKK
 XKBiml8+A1xyXf7zOcbAeS3q3DO9/jprbMXWBIz9Ud/QGrVnE8kyzDE+aAmSBdo4pIC4y4su7S9
 G+HjhZa8gcWEvWYwTWqXh20qAmUyk65rIp9CWtex0bhck4MI9aR960zfJ3Dikxk1J6AWoeSxfyu
 myBu5DQWozYH5ZCFQV3T9ruKTM2uua1PXvA0I+W7vWCO8iTYvbjCwTh+BX5X/ooSsbBRG/k9XF7
 /S7VjMP5K7gYJK27ZL7zJUyFi94xSQ6+0ornMJY9nCqDDoMbnCxiUm/Vu1m8E0wdn6HwLjfvvBW
 os4AsIjxGzqD2RfypyAVWkSwXQ5DGVO9FBSUvwrMLTb0rvQUjf0Q2Q/3MW+9xfS6DPfOBe8pTEf
 Q==
X-Received: by 2002:a05:6808:30a1:b0:55c:844:98ff with SMTP id
 5614622812f47-5640dccb4b3mr8240499b6e.34.1793643235008; 
 Mon, 02 Nov 2026 10:13:55 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5640fd95562sm8445016b6e.4.2026.11.02.10.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 10:13:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Nov 2026 11:13:37 -0700
Message-ID: <20261102181345.3238554-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-trio: bump to version 0.35.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-trio/python-trio.hash | 4 ++--
 package/python-trio/python-trio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trio/python-trio.hash b/package/python-trio/python-trio.hash
index a6ef3cbceb..e0fd5e6725 100644
--- a/package/python-trio/python-trio.hash
+++ b/package/python-trio/python-trio.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/trio/json
-md5  19217ef09ab5a871de7b6165da677e34  trio-0.34.0.tar.gz
-sha256  63b9485408bdfdde544fced107045a8c0086cdc4bd0ef2f797b9e0dd111b964b  trio-0.34.0.tar.gz
+md5  9cc8a72143b8610deacafc5121f8f12c  trio-0.35.0.tar.gz
+sha256  7efb295c78a0ecd1235c5759e620b5da564ca80d2efcb0055423588547248b96  trio-0.35.0.tar.gz
 # Locally computed sha256 checksums
 sha256  418d025e1284311f2690263e6efa6bf51585e5741818ece63e5862487e505bb9  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
index 05f288642e..4dcb4ce614 100644
--- a/package/python-trio/python-trio.mk
+++ b/package/python-trio/python-trio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRIO_VERSION = 0.34.0
+PYTHON_TRIO_VERSION = 0.35.0
 PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
-PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/92/dc/a2d25ed73ad49cfd79bf18d262577c3731c98e382284e28d522f49a0df35
+PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/9c/e2/1db4e79abb730bbf048c1024a622b0e1e895f5b0e18c59f3f6b3e4b296ef
 PYTHON_TRIO_SETUP_TYPE = setuptools
 PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
 PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
