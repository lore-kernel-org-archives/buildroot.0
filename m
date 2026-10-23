Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736EE606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W9ZtJ7w1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nVGDwAuy
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A5C28169B;
	Fri, 23 Oct 2026 18:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhSQ2U64vfD5; Fri, 23 Oct 2026 18:19:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3E7F581694
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779549;
	b=E0Qfb4ZMFxVuGksBRVNhFuJzYyGff0veENolynoHpViHIvXYFhHKPIOzKUEIn3P3hWH2
	 A9GQzw4TmEhQ7Vn2l9mqZvSmaeidGwRDqwKxREw1KgnynRyLJD/+fEgxCBHJPyaHAzzEL
	 ZPy8mFzOyzbdz0X9G+Uy8OLiZNlaxelJCIHIEgwCffd8zZmaAirGy8Sedotb9+KtEU65h
	 eMVPgEaTkbTqVVQFYJaU3f+Z9BWup9qEJJCPeNnlGtE78G509AbW1hoQhEiyLdhP7x9Ie
	 RyD+LBk01rHm6C90QY9sVPn+ZR8dGZGSbgHkRTKxqrGGkChEzM+yDkNvg1BDmxg1R3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779549;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xkWu31d/1Kuuh1MOqlrMBE8biezib/IAETxrphdf2JE=;
	b=C6W6xLXDVRVwylSigIRfszXgVeOXGRb8ej1sdkPNys4frpQwIlXNTKYZf0D+/MpuRxEc
	 jwL3aHp2E5aPdviKUorpSovYFe9TCjJ6oMcpzlZdQi9oV1NLkQfsjdZKz1d0zQL0YGVOI
	 wm2eQJLv8TwQl79jljLYjAPXWAFYoLsSX/JIGRRYZQXOrGGO6PoX7DW4nMTVL6fd3RlGf
	 LzkiMDwQEcEo5F1zxrAgO73WNefGOqR1Xf+WbntM3q+/hQNQbH7B72A8lRTKOCi2dI3E1
	 +xuY4sEQJLV5SCjc5GHrs+fYRtf8WnX0Uj+0MQLgXB0HdqwuPvjSajMo4RrjuDnD3Sg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779549;
	bh=xkWu31d/1Kuuh1MOqlrMBE8biezib/IAETxrphdf2JE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=W9ZtJ7w1qMEsddfyBDsQ6IOa7mWgc783rXVTfTSgabzZnw5mUfpJlhYeoFVQtbZxV
	 vCkMVZ8pxQprsqnTbkDlZVBd/EHEFb4yLXiH5WAZEgJnEreBAbNxqINYcredD5vIXu
	 mJ5500GHLa6mNqdp3uaaR6MWGDlI4rrBCW55RVfVtMTEv44eNwDveQlhEOo53mZue0
	 ddOMBtzdKaEtEXVzjH7pmjrdms2pcZBNJr94R7Okc1ijoECitBxkXiOENdVfp0GbfS
	 EEefXI91Xo5iPodT5iRc4WIUtImCKsKizk0S84SJKJC2MG7FrvwmuUR5tLmYqI6uEG
	 1uIOZB1Qu55Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E7F581694;
	Fri, 23 Oct 2026 18:19:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E309E235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4F3140061
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rE_ugRIQ73z6 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E69C740059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779539;
 b=qcctGDMVINn+hc0Ohfl6T+T0c6uMC/f826LyDmuAWAExLXe3AWPV/lk6ILLoffMGUyjK
 om9XPtpPYm2UBbZH72tJddUViRS8uYeM48dhqXulFrBL0TzSkFpxYAht/CmxxflV/HCzH
 TihyK3KErd7JWw0q/eSwlwa3Zc1KC3gpKrcbxRShTKYCNDcUZSMlLT368CfNpGlwiNhQL
 y+Aq+kXp1euID340wF4nvkmahREHAr+XWdXLzivyO0hwZqEydfF5u7NsLk7GN/sTyLsFw
 J75lIxRRrTR6XZAoItDae8/7hN5LJC5nxNiJ0UKBaH13Ygpx/cj9H9DIYd9BSi6dAxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779539;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=kG2riT2dydrY5nktE86SIqG63EmBSnonwMAg2UurI2Y=;
 b=JXONiWNhhTBFX6tSG5tnActnl84aj6duMdSgChrqMFtXg9gUpui4SyCJt7kS8ickas4X
 a90c0N3vi0AT0UQr5r1q2WI7KI4nuFH6Nc8R3rj1uqUEFHn+dBrM5eHN0I0mrWT1qs7ei
 Dyh2bOc8NcYJ0SjYVQ4B0cp/g7nx5sk4DfbcI46GweJ7k8MNfiZZuHyyyZosA2qdrLUbu
 0+e44v4o7A4yFJd5HUC+P37lbitGZgtvxHEj/MCSmCqhkaatwJhXz/iAIOsjatOMQRqxL
 VTLPTXp0RB3E1aHmxR3jMRlGiyQBJxmqrT8R5eZ6Mk9VFCWTI90vnpvt7wi19RWxHHw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=nVGDwAuy; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=nVGDwAuy
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E69C740059
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:58 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6dd4f3f696aso711544eaf.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779537; x=1793384337; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kG2riT2dydrY5nktE86SIqG63EmBSnonwMAg2UurI2Y=;
 b=nVGDwAuyZWQcAZ6i5Zq54Sms6S+4v+BIgEIyK2kN4j7wEKOaEmmQfZfFBFBfpIwjUV
 +/PaWeZCQ3GuEBWYD8I+Nzi/q5ipsF39ydGbauelq7m7qZdrNH9Mb/W4ZP6mSBZSNLGW
 zF+ZY/LI86R0/3oQWg4C3t6hoPM6tBCpN5Cu+y0aIlyi8unWgItyqt+0bgAEzxSpO8qP
 weGG1Oca8Px5baM1RWJXu6HsfqQOWaYZcgHiQefBDiSw03czUb6nADrz5DjiiQTfh6qH
 E0HZ7CIFRpqB6b7Wd2ACMYVRzxl6rAqw2cgGx+CrAnDRozYBEZjyOv5482KQ9GA8wB5R
 6iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779537; x=1793384337;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kG2riT2dydrY5nktE86SIqG63EmBSnonwMAg2UurI2Y=;
 b=xb3aYTKSZYWsY4fi/ZLbSlm+2OvsVOjKYRqIfsjRB0shMxGWZdsLHpn2TFiIi2m5Ai
 RQhBhveXyoYyDtY0p3x75nHutu3ODUdB76GOOijk9zC6BRTkUXTC1XlVEgSF3GtslcY7
 idZFxCByQkWFCBRbG9cVQ1RRbxnhhgyLDzRjcGQ91ZJ/KAcKlcg8FgwLAFG+x6MdctyH
 LyWOM7xX30jq+UuiEjm8SeY5dFlpPYYpI/c8nXjbfKLRJOB3lHdPWbY0utwvw+SZ2lNr
 TjiU8oCeYdFPPpLdG7yF1hn7PknwsEml2koZgWhP3AhWiY81Go/oiZU2APzIacaqF613
 FcSw==
X-Gm-Message-State: AFq9FYIdPxXsejjG67ukIWnQkxH9rguha/x2Rb6ALUVfEjgGQc7jJmxs
 GpKIANacV2Ge29YuS4+N8TrKs8CEBG0MzZFhj57BfKBHJeK/LDtKRdXML4nQ8D4k
X-Gm-Gg: AYBFou0C3Orw9rW6T5gepMU5LfMo2WjzZTudM+pJWDcw0AXLp2nh+yZ6EYqEwtclHmY
 cVHTcQYceqM6/OzSb3J/U4CPUF9SPYZkvrM9SExdyrcpUdfpimbdA8HU1nYgiITUQ32WSmYV7VV
 WU3nVSt/+Lfn7ICPVVvOUUgrI9dOelaMd0pPi99Lb559m0x3gqT05tD4HokKUmXrGVNoJW4MHfs
 kbqe4G5X/bEoG8fVS1janEBv7vLPO3YnnQ8GK1biYP1dN7GwGpKWs5MXe79cpja/4e/+wcN5Z79
 7WoW7/cV2gp7NxenvG3MyjXbr0gbfTVdi1OZaLy6C4Y40DRFOhUjFwFOTPBZADXs7LwaDnkJT0g
 0BuVe3DXaBJUAw+Z7qTsZYfYD8ROCh4tyy7fHu06FFKb3KAtHjsUHzmDr30UsF1OotCzpAtsMyS
 rOSSufiu0bZbLHNzcTaEde39IeER1zsnB7r0ywbhbGGxg+gKgfuVPoV34HKnO8DoYfOSJpE8wqV
 LtqQUt592PlK21n57r+zYAgGkWrfc/2y0K2OF5Aahmm/IOSmSHabZU7fGTUJTaR7DX9JdoAuvS2
 HxFXkt66lOrJH6V9p7a95g7pyECDhG/rJVcVeEwBU/ECv1vKbHmK57cl8OCQGjyBOKRUGsPzCpj
 0A10qCz7/MA/FyE9/TQ2GkEZOsxQxgyTXTlgCubgaMAU056xdXeiwQkubLyPj8jmW/boIpBBpZ1
 AQROQGi3KWJT3MmENfDGvHBIM=
X-Received: by 2002:a05:6820:825:b0:6de:5f38:780 with SMTP id
 006d021491bc7-70b88a61903mr2044514eaf.63.1792779537397; 
 Fri, 23 Oct 2026 11:18:57 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:41 -0600
Message-ID: <20261023181818.920329-24-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-soupsieve: bump to version 3.0.4
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
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-soupsieve/python-soupsieve.hash | 4 ++--
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index 443885b389..24c412bd20 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  85e7244b0b5d685ccff8ae034bdb6909  soupsieve-3.0.3.tar.gz
-sha256  7dcf6022eed0399eb9934a75e020148f7a2024c37b7dfcd3cf2c5505d69c364e  soupsieve-3.0.3.tar.gz
+md5  af3ecc3a57f935be504f942c52d6040b  soupsieve-3.0.4.tar.gz
+sha256  924fab84ae21604c19e175e1f39815eb6fa83ba23836e09e9de180925e5bc4c0  soupsieve-3.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  76a0acdb98c3a63681e20b6f096699ef8cad5fb35d56eef8387e0fa71d797a9a  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index c29fb74c52..e99770925d 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 3.0.3
+PYTHON_SOUPSIEVE_VERSION = 3.0.4
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/5e/77/2dcfa996b01702ab8fd0763d84098f6a640d6162a328f1c04c2697579a1a
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/19/63/0b6bae54546aed98d72f12d09df57b19a287f01c84d22047fa2e23772ab9
 PYTHON_SOUPSIEVE_SETUP_TYPE = hatch
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
