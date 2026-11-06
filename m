Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89DE606EE98
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KeltjxkD
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F5256061F;
	Fri,  6 Nov 2026 16:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 459t-xgRADrT; Fri,  6 Nov 2026 16:33:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8E59B6069B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793982786;
	b=I3v5fZ6ThlqdZEU3YiH3SkqI0viAwoC93fZS+7Zz5PA/zlUs0NwnHGPzoiqPubVMPBJ+
	 r/P2ZJU64bW7fp7rPUO8yp5qo3SrtjG/R5uve4aNHyFUzLrQN6E8xtldf0fUEOdlAYhVg
	 VJSBTOouvi/OhxNgwP/TiJvIvYUnpuiFYli18mTogRxt1rrK6fTULhGvurtR0pzaQnIW3
	 nAc/DSq6GWqDGYMljXiQBMSxV231yPtWO6+AAYQmNrOiEzPqGxZ5w7mMW5hn/h+pnTilE
	 SLYlwveoS2Xx5WdPuft6RuHvvseeJ3UdY+y35QwRc3ao5GL3NbQv7oIqk9iLVjVgkzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793982786;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wDdCv4dCcDrZ0B2xb+NyueqsHSLvMvILn86JBIkTsd8=;
	b=Bz+eRuOwZspIObdGTcVBWM/F1E8YWffDA1EgE1+2QMDdwU8mXX8NQkyK6o0ok2b9ghJq
	 p7qjI143iAgaP40Fmg3/Xg5F8mZ1q/c6WuE5r5mfo3ELkSjmTdr/ElkZhsVYlWeKyyp9h
	 7V9rthCmTYqS9n5wRc2Mf945JHOsDViKyJsa8gFGtl68tB/rUrIFrRAHSXcvmr1+fuzEL
	 kLs3aotTeb1apQ2RgTg/f+xg6jkH7Q5O2sTLTaD3IsepDOej3tkVr6No4Uqy8aBvPFji+
	 ZMky22UIEHKoh0kFr/k1gT69Xjbp0FCRrbliBv+oFfsdDaVuJt26XjWmbOJ2b+3jevQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793982786;
	bh=wDdCv4dCcDrZ0B2xb+NyueqsHSLvMvILn86JBIkTsd8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KeltjxkDJDXPjHZl027NRqB2vQMweIn0E2nEAkj6XIYdfcHVX9ew6q17UsqmEW8RX
	 NchffNyPfqhE8os2kEPbouFirMVjEjMj7eOIvH+lk8BpVWP8uQknwV64wexFxn8ssy
	 Gn6AVrl1noDhAQ2B50vvdxlSOoeaH5mU4DXyq4K6ZSK4LncOFVuUWSpMU8Z4v/Th0P
	 YxcWCEI5icB958B1bTy4MMgXRTTkthhw8MCOol66xDcnmlYhdg4Og5Gt5VpALvh6Vg
	 EhS3Th9rZNOxaeIFwnkkOf7ntN5jd1eNZ8+yi28FE41oTgRkEJDyi6bB7K2jnNZ8Sz
	 sB71Fum8LB7Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E59B6069B;
	Fri,  6 Nov 2026 16:33:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 47D92362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 394A66061F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXc1SLEaEDFU for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:33:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 19A8B6069B
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19A8B6069B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:33:02 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so8671815e9.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:33:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793982780; x=1794587580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=umYQYzRflVWnxgHkbMVCZdZRTaobLd47YXBBcGfaLYk=;
 b=zSEpK2mQNhiJz5Nze4bu8Yxz9rGk48kKoI3MGOI9iXm/zKDS0i8wWZ0uqbfoEUlLJZ
 yknQ+sP2SIJfjQGrppZKR9ldOGk6drX+Rfsbed7mJiddDjrhRJoAkKLnBzVSZoxNPA7c
 V99kgj2EKnye5pX61LMiTvL39fIg4vxKWQVjaHooRpiBd5S02GQdoNdwhJ0yTkraPLme
 klC/uOQ0jUXt7TAXRUYB4FtKdCp0Aac7bojzFJVQXQsfylt11/zmU/VUp1zuwA4293lm
 wHOwsI/PuY85DrtXz3VEDlE4eyU+5gkmC9spBpWZxR+W1ZqWImgelOCq669r5E3nnh4D
 tL3Q==
X-Gm-Message-State: APuU4Z/G99Q9ebOsp2zY2mrlyVjhpjaD3+yaoioNKwt32iQj+5RIIj6T
 KzBuuWpwMkbykqFuQ0BVte4d9NrRz3Hq5tSIlzST+MvGbxVvfJ8DM9umhUdloWcztJIdh/oz0ty
 tXwof
X-Gm-Gg: AYBFou0wUP0/p0ZBkzqKnt88AEb+n54udtM/HY/9oryXFMd8fZ8OSOEIB0gwKs5OmIl
 Xpx7PCNzo4tQGcDPTEEL+w89dODwOL5rVLcM3e57ZgAkeBg0kgM/WwKEyJq5Iq2Yh2Q4rN0rf4j
 zWmD2oMUmKwwf5shFviIOAYMqY9EGECWcwm6Hma0oeqJw0512wkPVS1QBWnmgdG4cg1mlw/oTOg
 BuVTvxgxUtGTemF2pnmD7xWXmqpoJ/xF6PrTL5g6/vxGWKbiCwhtlsfKOClfU9cjrTL1SJwtpdi
 t/bEZGr6/W0yvxai5D0YIiVCSiQzocB6Lc4unLIw0VDl6Aa/zoVkfANQK6FdGsOvt22QYhrDVUS
 4isZOO8i1hwUOhxHGgrzRQd/SfyW0C6vH554QT/OTVOcCatQvhiacBbBJXl/DD/Zjnc8qTWnjL9
 F/19PUujf3NDI9DBUBtEUp2WKsNPJk3fztu/1OY4Cw9C0ikuOVlSnIdyD4hj7OwKzYMmxv1JGmj
 fA6vF7cE7/dSkJ2XcOpEK64dt2gEcEs0HO+UizopZl5likiSJOO0gbaJQUikL/3NmXZG7JgmPsx
 CRhjpC3rDN3W87tY4i9HLBHZgY2JwEoetWvakFa9IkX5WjNVnJN3qwqPgFjI1ooKKw==
X-Received: by 2002:a05:600c:c085:b0:4a1:dade:f049 with SMTP id
 5b1f17b1804b1-4b6e5ab81bemr40089375e9.15.1793982780305; 
 Fri, 06 Nov 2026 08:33:00 -0800 (PST)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d3d60e78sm4500638f8f.1.2026.11.06.08.32.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:33:00 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 17:32:59 +0100
Message-ID: <20261106163259.832314-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/resiprocate: fix build without sox
 on the host
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Building resiprocate without sox on the host result in the following
CMake error:

```
CMake Error at media/samples/CMakeLists.txt:9 (message):
  The sox utility cannot be found.
Call Stack (most recent call first):
  media/samples/CMakeLists.txt:23 (wav_to_header)
```

Since upstream commit [1] part of resiprocate v1.14.0 (buildroot commit
[2]). The `BUILD_RECON` config flag is splitted in two by adding a
`BUILD_MEDIA` flag.
This flag is enabled by default. Since `BUILD_RECON` is disabled on
Buildroot carry the same logic to this new flag.

This as a result fix the build without sox installed.

[1] https://github.com/resiprocate/resiprocate/commit/c76b5b4247fbf33d958e20864a4ad16db0f453ef
[2] 4a6801a365 package/resiprocate: security bump version to 1.14.0

Fixes: 4a6801a365 package/resiprocate: security bump version to 1.14.0
Fixes: https://autobuild.buildroot.org/results/463/4633255545d91790be32a393995e5440067463d7/
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/resiprocate/resiprocate.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/resiprocate/resiprocate.mk b/package/resiprocate/resiprocate.mk
index 4af7bb7e76..24c805bbe7 100644
--- a/package/resiprocate/resiprocate.mk
+++ b/package/resiprocate/resiprocate.mk
@@ -15,6 +15,7 @@ RESIPROCATE_CONF_OPTS = -DWITH_C_ARES=ON
 RESIPROCATE_DEPENDENCIES = c-ares
 
 RESIPROCATE_CONF_OPTS += \
+	-DBUILD_MEDIA=OFF \
 	-DBUILD_QPID_PROTON=OFF \
 	-DBUILD_RECON=OFF \
 	-DBUILD_REFLOW=OFF \
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
