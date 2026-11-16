Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADCF606A322
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Vn5ygKlt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKreuXJd
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1264D4084F;
	Mon, 16 Nov 2026 15:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIo9-pAX-epp; Mon, 16 Nov 2026 15:57:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 363B240838
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794844621;
	b=jUvIx3jxjd0AaJZRwnql3/ZQ4pKcZHrpWPE8+xBM4zD8UMHz+GlIW0R2Kza0VFST9Y/D
	 g9NdwPOJMi8IA1YdFMAKFv5jjsVyNSkbCtncm8zJuE7hvtiVafAae0Io9EyyTWzsgEjFO
	 eXdYCd+/mq+rwY7Z3EZk1f4onDs8SKyRwS8c3kwLN78x3Cl5Tlh2IfwTOdhKCDlwOAJln
	 5C118co2i9kWAqlf4rm3kRP0y7WS8Yg9PwqQvetVtDiC0pq3ekcItW//SHHeL5nejpCiQ
	 747VdiqjRKeBSMS6t4XuM7UCIyjgLQzZo3MG8Z2LqxbyenkCMYmTZ0EyI9HVoCS4WuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794844621;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=LCFiHNCMMtavRCI1sHxNxXZgu1f+G2105gOkhpDrpRQ=;
	b=tINEoiUfn9brYAG80/bQ4cbDyMaYy6fTDAZStcgfCKmMTFvZQOvGMM8FGxIcJiNK0Cq8
	 h0rw9sX2tlk/mZyHHhgNCif2h9nzZBQYBIcxn7PlGcHqWQyC5O/4RKVvJeY3IiN1qyrny
	 dtxVtg6vYPXNKIvTfuULzOF2sQJLehPQH1RNNxTDbucnaEF2CJ6UwXcoIWkiHktyi3Huk
	 3+X7jm5Iv/spJGo+7I3bnsYhm51pXg1fhKp3duKnEHLdKg+k+V2h6rGvljwEdYVPjSbzS
	 eGF80QYFjkDLMMQnLtDjJ+DM7h5uH5qpEeQF/pppRsur6UgEdFlRQ3LdBwo8m+snzoQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794844621;
	bh=LCFiHNCMMtavRCI1sHxNxXZgu1f+G2105gOkhpDrpRQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vn5ygKlts6vk5fj/e5Fn+guzT7Qf6QkEZfsQ508xZ5AV2/B1+rbmYvJg7CssY0JjX
	 LDrxr60bnlVa4FPj11ZSCF1YFdrtWu7NJGktX66DsZZ1RqUbZCB/RFQUWFosEoo0Xt
	 QD3knIqSb2QMi/S3DMxv1r5IymrtVMsl9x+RDjRhw8nPvrgKmhFELjwGqCbH1wO1yG
	 HxLcAMu3LIwYBvpQLexhH2jnLU+ZaU0qkZC3omIJOhhHcAy9dzvBtwPEI7mykttrWu
	 Jvlp/Q4lNIRpCNHqkFy1xPtHoKFPKO2lOqli1+jFvQ31AgnjfIF6UPbOk/mNMC5YhQ
	 HaF9dKjXsrIMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 363B240838;
	Mon, 16 Nov 2026 15:57:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A09B6169
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A02880F83
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqnZKsrDLXIT for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:56:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4CDED80F82
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=aKreuXJd
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CDED80F82
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:56:57 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so1807880f8f.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794844616; x=1795449416; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=64XD4ZfimA+dpm4dE7sv+hTiQkTcLLR2pzBENEdOxiU=;
 b=aKreuXJdgpK8iCPtb0mwpP6pKivHTpGdHp7qYGhPxetJgKR90WqjKhe6pMk0sFGlTW
 emzB9c1MPoOteFSLQXkHq+a/AgTsE4Qp39d32vg2Br7NTqRmBoei2CAms69AzsOTuaHq
 WsZ4nfi3g706At7y9YRrB/k+itlnmd8hnCyfNV1DDp6YLbT0ohiyOc503lttJJdYi59R
 wiGeX0SCuIs1BLqDYxxRvUdHC3QMIo3EPspW8DTKHUJ4TnhfYatvufPiQUPlufA1VucA
 gHJf/46nFru4oxBpVMIeH5tFoS1t7n/JUDCDu5neu3KJXg4G0mbYTCzjoMfDQp3GCPru
 RPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794844616; x=1795449416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=64XD4ZfimA+dpm4dE7sv+hTiQkTcLLR2pzBENEdOxiU=;
 b=uW9nMa8qSrupTJjT0O7HEJdCdq172asXcM3ETmTrJQJpU5KJGk2d43XO/9gq9Ouw7b
 Q84505Z7SSGX6PZpMX14Bhn1hliiNbyPFKzALxmu/ur5+riMw+r0EfdUI+T9JhPfVtE9
 ZVTiXNeQhIb+1xQv8IEyZGmgcmMetwcIm0jgy01ThYx5gBlwFPvXFrcsuxg/Dk24uEw9
 j855HvSuE4ly3nLwFlneyAgTNrF3FU2j+1hDzhyPcvvgPm6dTK75nbu96H0tyOXIEmEE
 Jj7OpQ71hfFP45QbYmexikubS1dnDLPSX0sCDYpstiFkGz6BKuoe0eqEe/8PFsDiMYJs
 f0zA==
X-Gm-Message-State: APuU4Z+Z2+A7zO7iufLmNe9jlT+kDD064Kfr+2BRbL0Y/TQXl8oy6MWu
 RoUa2L9pfA3qcydWDiUvrYU/5zunWMwrsc4ynDZTMdzibGR9b9u3E5XrE0SbasDS
X-Gm-Gg: AZFdTZf6apFmKdTmYoA7OOMimQl69wRQbC/HEKoCf1aRZ8YnLVa/vx9bWQitvN++jcO
 O3oi2h1Bc++6G7Pj5NnbN6c2U4hkPjOONye6G9F1QSFlswDKOv0c6cq9dp+vTT5/0IJy2qfaS3h
 zYKYjpgchDAjVP9Sif8Fuuf/rhtKzBqG4Nkgg9mfXwXY21WzSCbmEfhyI1PbEPAox0xf8BJ/RJx
 u0fpBjtuqUDaOMr1vCCNa15IOJ3BO2OrM6ZMhkXRv4uG7hvVo7ra7qVVu20rSRG+ALpUoMWNX9B
 rFRnfRDuRVfquWK/3B1PGhrFpyyj0sAewEw0MrW7mfAuMz75d3iQzrOUZG9uhn7H77OiUC8MEJ0
 +WEtQ+x6ay9qExc74UjPwrdfQWJrQLfIVJzBX5ZkvEb68PzOMzIPvY8kIniS/p4vyCT6tHD7Dmg
 vP/RDQgrmvQuHeLfIqfFV2Go3P+H+rO9UakJMfo3lg7PzWfwWIpldsBIwizrKQc1FEO0Q7TzVDg
 u8MsjSnZtTxjXrfyFPcmgwXb8Zqg9vP9iXKCFvLISn9XXYf78DJW7H7vfAs14yER203D5nsMyVD
 pZ2uMs9N/TQMXiE2MAyJdFXpEh/w+y6f27GYYNPTzeWiu0XPXmZQ
X-Received: by 2002:a05:6000:2c03:b0:48d:f4ea:49c9 with SMTP id
 ffacd0b85a97d-49c73ecf935mr24146154f8f.54.1794844615907; 
 Mon, 16 Nov 2026 07:56:55 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c1968sm23357063f8f.10.2026.11.16.07.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:56:54 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Dylan Bespalko <dylan.bespalko@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 16 Nov 2026 16:56:49 +0100
Message-ID: <20261116155652.4181839-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20240812080307.553359-1-dylan.bespalko@gmail.com>
References: <20240812080307.553359-1-dylan.bespalko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 0/3] package/python-pyside6: new package
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

this series updates an older one: "added package/python-{shiboken6,
pyside6}: new packages" by Dylan Bespalko. Its last version was v3, sent
in August 2024 [1].

It adds PySide6, the Python bindings of Qt6, and Shiboken6, the
generator that builds them.

Dylan is still the author of the patches. I brought them up to date
with the current Buildroot and Qt6, and I added myself as co-author.

The main changes since v3:

- The single patch is now three: python-shiboken6, python-pyside6 and
  the runtime test.
- The version goes from 6.7.2 to 6.11.3, the Qt6 version of Buildroot.
  Qt for Python must have the same version as Qt6, so the packages move
  to package/qt6/ and follow QT6_VERSION.
- The source is the release tarball, not the git repository.
- pyside-tools is not packaged. As Dylan proposed in his reply to v3,
  the Qt tools "uic -g python" and "rcc -g python" do the same job.

v3 added a DEVELOPERS entry for Dylan. v4 does not: the packages are
now in package/qt6/, which already has maintainers, and the test files
are in my entry. Dylan, tell me if you want to be listed too.

Each patch lists its own changes below the "---" line.

This series replaces the v3 patch on patchwork [1], which can be marked
as superseded.

[1] https://patchwork.buildroot.org/project/buildroot/patch/20240812080307.553359-1-dylan.bespalko@gmail.com/

Best regards,
Angelo

Dylan Bespalko (3):
  package/python-shiboken6: new package
  package/python-pyside6: new package
  support/testing: add python-pyside6 runtime test

 DEVELOPERS                                    |   2 +
 package/qt6/Config.in                         |   2 +
 package/qt6/python-pyside6/Config.in          |  32 ++++
 .../qt6/python-pyside6/python-pyside6.hash    |   9 +
 package/qt6/python-pyside6/python-pyside6.mk  |  86 +++++++++
 package/qt6/python-shiboken6/Config.in        |  12 ++
 .../python-shiboken6/python-shiboken6.hash    |   9 +
 .../qt6/python-shiboken6/python-shiboken6.mk  |  57 ++++++
 .../tests/package/sample_python_pyside6.py    | 165 ++++++++++++++++++
 .../tests/package/test_python_pyside6.py      |  63 +++++++
 10 files changed, 437 insertions(+)
 create mode 100644 package/qt6/python-pyside6/Config.in
 create mode 100644 package/qt6/python-pyside6/python-pyside6.hash
 create mode 100644 package/qt6/python-pyside6/python-pyside6.mk
 create mode 100644 package/qt6/python-shiboken6/Config.in
 create mode 100644 package/qt6/python-shiboken6/python-shiboken6.hash
 create mode 100644 package/qt6/python-shiboken6/python-shiboken6.mk
 create mode 100644 support/testing/tests/package/sample_python_pyside6.py
 create mode 100644 support/testing/tests/package/test_python_pyside6.py

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
