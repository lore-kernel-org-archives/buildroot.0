Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C371E606A325
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rAKBAk9a
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93240408B3;
	Wed, 21 Oct 2026 14:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RV2zUOqncG3; Wed, 21 Oct 2026 14:36:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A5F6B408CC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792593376;
	b=FvvY7af4IMZABgvttNdcVpuCZKifouWkCE8EOubQn8GgsmHAuQeFcCH3o714X3SlSZWq
	 1QAeEJ8+aZQP4byP1fgmo4MwkU6DkWdyC7qiIqxlQJaKH7W1wjY+en/C3GkS09+2GvJPF
	 ImA76676Q8tVSiyvv2pqBbxJRmlG/2IoMrlDSCFdzD3eFV3jhOdEIZG87gKvNTk+bS6s2
	 4+nWC0XlgMCow86bEQuH8xHS3LulJtM/xHSXAfTNmAq4i4LFoht7/hm9HjpLfHGHWvXvq
	 yg5sSh/GL2CsDMahw2yxxG1KjKsCQ8btyI8gQ9pca0mDBrcuXkIyllIdrgKCCuht8YA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792593376;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FDCBLaxYjLPQvuOrAxR6oMV4drzLjHH6KwuG0bEU2s8=;
	b=P4j9G0WZ90NRcTIxCJ0hDk9/koeVS22EaSZLpDdO6q6P+6KxV5aWvnvz0IGLRPXTCfdo
	 s2iZeM0NkoVwGmu887x0QW3l5dlqh9ooCKErkOC9sb1zQpHtoyF0BT+16SsnOLbnkTwIo
	 wgToQY1Ucw4+vRwcYj+XTc1cwIa+SCOpSLwF+85dXmdoh5i6TJxw/oMMpRBkeSRxA8BJt
	 FOHr6TQaGRtDPOM8hWi+dj05F28iu3qeCi2CwbcGpVYuiUYL1LW0KbbnlJIwj2iyed2Iz
	 Y0TxQMxFNAIHhJn4yewJBYqPek84Gr7+g1xmtslTCCO2WC1jJCdx17UfXFFV8xS/SbA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792593376;
	bh=FDCBLaxYjLPQvuOrAxR6oMV4drzLjHH6KwuG0bEU2s8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rAKBAk9aC79TGh2v9x6jc7SR9jHhFPHVPOJArqxwt6HsXfdJnXUTK6fdn7UYV1YeP
	 eSZS8w3MDgEXSWil33l4p9zJBqMg530CuIoR/J0hwNP+ZxRRVj9F+mrp1hGYQt64Y9
	 PluRrrhY6joO1CWSFteDce7GGoNH9CnenxhW9buTXcUkgbQgmSflkP5waZdnjpUEHk
	 2mXI00RnWW2BagQ3LGFz3YxlK57vUS7tLIPNN+Di0MxtxjB5PJGcjMgNwgRU7aUUFH
	 +vFffA/a14SKEVJMmel0wA37uRt21ogx0KbDbDiYuG4mMPS3XmkLBRVDe5j8IfWiTL
	 JAXrTOHo2RpRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5F6B408CC;
	Wed, 21 Oct 2026 14:36:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB4C0765
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 14:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9154D4016B
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 14:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id piG9EsKlKlkU for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 14:36:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 816ED40077
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792593372;
 b=Npwpe8DT9gp+0wtp6bMlXazKtjqIPs4LggPO0DEdu7FcqYGPTBWmcpYo62iV9dwKDvGi
 eOtNaKd03C3lRMbigyidAGfTexqxrfAowVaIz5Eh1j5l3z+cuZ9qdj+dIl7N6l9rpm36Y
 OTxGnFnEM2rL669eQpqu5BNbW0NH6oD+BYX7jSII2qQdfX4nydGf2Ao8yukzJJKlfh4TA
 BY570xqYSgNiNZEEEg20iYlgGyXrKrRjRzrpevw+YHbH8IUUZSzoR1apyayk5FTKiRPOq
 sPm2RULIoNoOsGVjbL7BOozJitEbEM5FNxkRbPYUOWEZmRA6O0DgtENB2cjGK95mOIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792593372;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=xzRaioz42QwfVkuxo/KInPycDmqsYZefmdQ9djCuVLE=;
 b=QEL3xBEhkKJXwzeIn7Ciie5L+UfjchIjpGTyBYSUfwy3aAWHs+1Ge6EwEyKYQb32+OP7
 d1ZqJmlEu3KNaZvMB6Gw3I26yi+xUTZLuDh+8WL8q+icCUfDv/Hz6QzXbMdBM1GWsO/81
 gyRG01M0AX4pdE2pCEfxh+ddIr3BNVwk8QnfeInERHkoQtNYiDyeyJFbChZrd7YUPwX2W
 rwzmzBoBLpnjFvc8SIgnnQrKDLYFoDbH87GQ9WmSW5IZBeKTXoTavOkoWc04mYmGcjBxI
 nw2i8Lg/9IdhLrqfJxJnm/awgpk+gB4BuvqWNri99elYDh+OC7Vp/qMstI0hzmvzhLQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dMCkAxPl; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 816ED40077
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 14:36:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a018dc1f98so6856315e9.3
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 07:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792593368; x=1793198168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xzRaioz42QwfVkuxo/KInPycDmqsYZefmdQ9djCuVLE=;
 b=D78hzkaZLVuhO9q7JeEbGqQwt555uR5LtcQvfLEamMXQ7Q5reKBsyo98Z7SPrenHcU
 GAfgbWnUt0/tVg8RvKyRUD8cB7JCsNe16dhUcntByliHfUtpsdb1AGlN95NqzSw64OeE
 L3T/oaCLdL/8CudyqPXAIM/01zcc8cv7ZAbD1hmtmhWUnNiM3TIfC887biiREu+Au0LT
 OK6X1rlk6an5o4lOE+ych/jQMtNavyv0z0PgeYdTIM74dpUPv0J8hXLdK5oFWI1P1hYZ
 096V7eciu+lUjd7KUc7UGpaTjSsncDAld/8YccjefytAM7gf1YxE2oLX9uQrnhgY3n3J
 7fCg==
X-Gm-Message-State: AFq9FYIKsDNNNsHYkDMniMZ8bBmwT+2kehYNp1lnxAPDyTWfrfNQ/t1k
 TBXeG2kXG8YQAFi2331iYxFzkf4R1F5v9WkEbV3TcoiwvBRYOdk5Vop+kqkBZCTKuAjZTSQSkIF
 MGDxu
X-Gm-Gg: AYBFou33K0YIk3xl7VRF0/JQ4YwNoY6r/MrRr7UFzVc6xhfOzwoNMdUtHVWP9ZSJRBZ
 Tdn4WJo1mzeQV0jnVyOiGSujIW3iKf5lMDPTIwk+NW74s2PF2E2lwol9soKiiXZxV5biiQu5ovj
 k7PqrYm92gexVeZNxgKl/wXimklN23877oMUwHRdkH//wJlbMypqo/9bga+X3ZapFgSsMj0eOE5
 MvRFYS/s+ak7pln4s+FGW3I8zDu8cLqbyaZSvAEJ0O4Uhd2Za4fRusMZSf627rgZ4b2bsDaD+oF
 2tve+IgMilHZahbZJEB5iu8HR2H9zSAuXQVr6pqHK0FQ2SMM5k6pkaRYKdBr9dF6eLqHRmMCAFS
 SWJcwEPTzhZQjPUOBB6Woifs3b+BXrJ62cmgEIm1NF8NUwAI1iuiKtPNsnSsrlIi0+022wOU8RL
 kWY9qM9G4awpvTFbHFF5WgmvaedJldrmISdEU3vnrwuJSFMxnEDDwpSxbVFfO1RB57oZhUpsLrJ
 560F0Zd/CtvR8Ny67pNE1WkR5P6J3vx6j65mCQlC1exgHow
X-Received: by 2002:a05:600c:1c2a:b0:4a1:e57b:667c with SMTP id
 5b1f17b1804b1-4a1fdd4fe80mr58702495e9.26.1792593367350; 
 Wed, 21 Oct 2026 07:36:07 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25835247sm5697832f8f.41.2026.10.21.07.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 07:36:07 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Thomas Perale <thomas.perale@mind.be>
Date: Wed, 21 Oct 2026 16:36:06 +0200
Message-ID: <20261021143606.428870-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021143606.428870-1-thomas.perale@mind.be>
References: <20261021143606.428870-1-thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/php: security bump to v8.5.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This release include fixes for critical remote code execution
vulnerabilities:

- https://www.php.net/archive/2026.php#2026-10-21-5

See the release notes: https://www.php.net/ChangeLog-8.php#8.5.12

This fixes the following vulnerabilities:

- CVE-2026-109618: https://github.com/php/php-src/security/advisories/GHSA-w8hw-w9fx-j79w
- CVE-2026-109619: https://github.com/php/php-src/security/advisories/GHSA-6wmf-4rv5-p3rp

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 0f2b6785bf..e1e92781ea 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  d9be75c08e8c316f4c8f4194d8fbe1750a15f6a6d9d4e3fe72082abeeb800360  php-8.5.11.tar.xz
+sha256  08bc2eba2a588654ade1357174aa646b761556c862dda0678345ee29ed481209  php-8.5.12.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index cd1270be57..1bb25d0863 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.11
+PHP_VERSION = 8.5.12
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
