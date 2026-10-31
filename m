Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB28606A31D
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h4qU9Q1I;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAs2Se48
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C8C080DCB;
	Sat, 31 Oct 2026 14:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4SntDpNuVf2; Sat, 31 Oct 2026 14:36:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BE53E80FFA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793457384;
	b=ihBZNmc5UFhMR4kPGWrUEGCiQmBEXJl3BbCWiv9cAs75SdP0HG4t1ZpJSluoDe/G8S/5
	 I9w7Zr0pu4xD/8TQE3y5R0WPRy0aOQuDHy85yJTF6WyyE9sRiTMwN4wmOcIqft0m4JVAK
	 +uxcNRGuk8vFVmHuA+ATscvdQ6/UAJMSJY4aY7WT85kwLM8ZTSZqNKY1+SE/PJPjhsJJG
	 S7v0tWNf2k/RwliJ35mPKrOLjTqXzKD4IzHF2OEhmCAVDwLxmCzxROPMC8PObAd5aYpXs
	 DHmwqlhBcR3QG8z7fru/Sb/zNRVULrs/zqPkWItZvBkTlmmvMOOB3baUWfBGBYIjm1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793457384;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=jxWuM+xJqqJNkuX4n1fya8aWt8c2z5gmUDFe+3rc2ZU=;
	b=niIpOdgXYjVO2jMRcEpdW4TwQAQM6VnPK7uKp5C1Pc+Ij4nNLDR8W0+SIBSsA4tODslc
	 Fgv7CqlmgObRtCHDDYpC0kPMT0Sjj8dZRnmUCTZTnZMH5qHaLMKIhuQMDcDZieHRvevr4
	 nRFOp5bkB5e6+F8WYp8k3j1oDUTY3MXEYXIKQPkQyUjpfgWUwjAlo3hib6MCaLfVDiBgg
	 DpM1tspgHTnXOn81XfUCPqwD2u2dHYJjAOXeeGT05iD+qFW0DeimyL60QLrRXlgiajlhJ
	 6VadyVyX4TZcTzNrXHGFLBjD1jbeLFWfleOo1/LLqNjakxXgcmgAqqMeaG8CvNbzuWg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAs2Se48;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793457384;
	bh=jxWuM+xJqqJNkuX4n1fya8aWt8c2z5gmUDFe+3rc2ZU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h4qU9Q1IiQs4l7CCpz5r2U7XY6UbxvNsF25237faOZBKnTjT685NwilkfUxHsxy1q
	 1EYvXeVsBB6DRmGxk0c/40H/4MwDlSHcND2XMnLv4rz6RepWm7BEvWA2Rppuy7rE/H
	 Uv/lbeQ9GIj40k/oO4eKA1gaBcgZNlnPfbc0+iNkVQfkaiyRnelJx3Q3qDHIBdNqzb
	 kxXjHNaVLceDCqyVQikkqxPTWqCXLkjBP3G6A/LExvz9AqYBA1lfKgFODRAMgQZrI7
	 E0aoUCeL5PpMaW4gBkAVd5TWkAc/121qrf27kAIyaQuFci3R/52JTEkIy+JELD2k6Z
	 +rGaK/A4eq+3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE53E80FFA;
	Sat, 31 Oct 2026 14:36:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD1D5411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 14:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE1A081005
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 14:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-S2Y0bftjTu for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 14:36:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EC47080DCB
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793457383;
 b=OYUP5MQTXgunwa+1xukLlJ6ZcMlG1/MduQ9IYE1CrWDo6IeG7zteMQIyHDpIkY936L8O
 RPcDGLqEa5Z78a4s7xeMUiEcXdjbT+uM7Tvyke3/3aWHNudnXNSXg/u4jOUi+b3Rf12Ql
 HULaI8u3cyK9N9kQkZmb3ghiTNugsMJZKK0N1D4xCC+A22cIcy91cfvNK8IPkleqEc+iV
 /EKyMtrG7eyjE1KI1YOZFQD9+ODWpVlMazzD4clXJnkWfzS3NARzkktfiBxyo8ICH5V5E
 tvClexVVFUIQSprc2FNq6Lp5uqHV9tGDwm4+B8IRFFCi6aWt/0AAYlBuEG/XeRTEtsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793457383;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=PeuVFUFPNFqvoaadH9pUhl7L45M0MKKQTVAEOzQbDm4=;
 b=oHpNy4tpQz3SfUMr/e3UPc0IxC2HIwcqZIavguYHMxFoF4QWinOEN/8kTAXmT5PGyguP
 TdyucxzPg9yFZG5EAyTYV2Nr70FVgtowpkokv9xFUsgQxvm0VpSm6g2cTS5uLaKa78grn
 ccCVdpJBr7QP1j9QukyfTgZXU+kPLNdP6cyNNqVK6AOUrkk5Zv+fOGZfe9Lev6rqQOAl5
 qIytRp4MkOFRuLjt8/d71XNZhjuyQ/GCiGR0Ku+/IQbIT5DQapiM1HtHmhbmJKp9AtTwj
 WJukfcfYdaQJup13LIOV4b/gyrsETL75TUD2OMi5PsKlokjEzwnz6RmYoI7PyI5Q4EA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=yAs2Se48; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=yAs2Se48
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC47080DCB
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 14:36:21 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so1034085f8f.3
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793457380; x=1794062180; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PeuVFUFPNFqvoaadH9pUhl7L45M0MKKQTVAEOzQbDm4=;
 b=yAs2Se488fONQ0XGIVitGuToUkCGcsDDF9mNBxkL1hKhohWRdfZUUvEbjQtMXiLWjV
 UNfp+wPEZlJq36zfo9mtaOGwjl+D9jhusFWpXFnyD1yhHHKfOZ1/WTio1QFRquEwNJaX
 iFvnH+/cO++xxrEfNlRkSCVZZrML2aUamrddcve6EY5ORqFy2bo/J2sjIV5fBe0ErWbQ
 Xa7dOpDrHmYWdTGv7wFG6d/l9wlderVLS5NyVbdbnFv3PI/VePHhKURsASkTHhIPOsus
 eWKcKQNauIGtporuFhM/940R91Ux8PjzRFzrIq8wW0yD2j4nli2HLtyNV7scQXK8nFzB
 wiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793457380; x=1794062180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PeuVFUFPNFqvoaadH9pUhl7L45M0MKKQTVAEOzQbDm4=;
 b=toSmnvAYs1MNl5U37a6M/sk+bFTihG7sAQaqYZTyz4WOnEKdZ0MICGfDPeSMcVFMcb
 csxoT4F0AyO0z3+wYm7DbwcKlrLyg2HMbCZQmULo0/UTj20XRaNUehS5gt1C/Z2d+0Wv
 cCyOVrXc93hSJ1r02AcIUmPpu6zvXfp0LaAvkmdI1erbkFuVmwtdPd0fzb2BQdf6q1LM
 /wyhOJzIRwzT6UcelnWL9mLH/mNFKhXvdbcEtGaINi9XCqWTXV++skSbkN8uLG8xznDX
 jLRfzze9KmqQsHhp3AjyKZB8uumAqrszmQNUhuUYuHcSDgSQHSL7+p3C+9oXFqIQuHf2
 VYGw==
X-Gm-Message-State: AFq9FYJWrIs6yoYarcVQWbO02qCSBRJQJ9IVy8uHvmh9iYKlaSJdSeha
 j5WZwB/3PZymsI3GzXTBj3Yg3rfRQx1g+OWaFE+C8kZLoFC+E0UvPsbVo04jVw==
X-Gm-Gg: AYBFou0sxXwpGwsBL8ZyfMLweIdBCIvATWkUpPgIQt6AlFf0nQHnMjN+R0cwV5WjXX8
 MjLukbDCH0T0HqeqSBQCFAVMZWRIGE2C3cW7g2H+AvgEUqZLM482044q6X7M06CyPJ+bvuVoXGy
 MSRRGxRU/NEFB2oX/nbnVZg+S+cmlLAJDdb+WZ3COP04z/j0qKttgdKWOXrBcvCgKZYjFYFHmi7
 odWmsjx9eXnMK+za9i0tCxzt5cEsYyNXjZzHeH1zIs12WVuh4yPJgNghc6quQy02gYg4vMC5qBW
 IkD4pm/uI07B/yzK1zCjp+lyH2SkLe3yYcq1yv+3Ts0moxpH9D4wRo5RTln3+RdwoIqPsSUkJZ3
 WBMOpzXzanSIMdiPA9YiSxib/8N3yFcfFNqNseVLjzqU5iDp4Qu02l49J413/O93SiiwLOM2m6a
 dfSDSuRqpYHOmq0+9h1xcCyLMb9aRSBlr1HaoAjEOxMvAcMgBJhXolIPvkljWfFY7h6C5EOUfky
 P7kOSYyr9JxyWZxFJJgtJBN4Z5yCHrjbpHdXcK7ufvf7NSwCDu0C+4TVyFnNc4U4AYVl6sKYaoq
 FpelR3n65iU90demcvCB2ihBktjXiknQuIhtq8Ix9Hh2JsxeNtiEnGNrP5iqIEzk3w5JGiCZWII
 =
X-Received: by 2002:a05:6000:4b17:b0:48d:f7ef:cd1d with SMTP id
 ffacd0b85a97d-48e6e4f56f7mr12153109f8f.9.1793457379626; 
 Sat, 31 Oct 2026 07:36:19 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b789c6sm9794118f8f.26.2026.10.31.07.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 07:36:18 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 31 Oct 2026 15:36:15 +0100
Message-Id: <20261031143617.445438-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030115313.3112716-1-angelo.compagnucci@gmail.com>
References: <20261030115313.3112716-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/2] package/python-web2py: bump to version
 3.3.3
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

web2py 3.3.3 stores binaries/*.zip with Git LFS, so the archive
generated by the git download method depends on git-lfs being installed
on the build host. This is why the hash didn't match for Julien: without
git-lfs the archive contains the LFS pointers (68efbfdc...), with it the
actual zip files.

v2 downloads the release tag archive with the github helper, which is
the same on every host, and uses the python-pydal, python-yatl and new
python-rocket3 packages instead of the git submodules, which are not
part of that archive.

About the "module 'hashlib' has no attribute 'pbkdf2_hmac'" failure: I
couldn't reproduce it with a clean build, with the admin panel enabled
(the default), which selects BR2_PACKAGE_HOST_PYTHON3_SSL. It may come
from a host-python3 built before python-web2py was enabled, as changing
that option doesn't rebuild host-python3.

Changes v1 -> v2:
  - use the comparison between the tags as changelog [Julien]
  - download the release tag archive and add the python-rocket3
    package, as the git archive hash depended on git-lfs [Julien]
  - update the list of files not installed on the target

Angelo Compagnucci (2):
  package/python-rocket3: new package
  package/python-web2py: bump to version 3.3.3

 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-rocket3/Config.in           |  8 +++++
 package/python-rocket3/python-rocket3.hash |  5 +++
 package/python-rocket3/python-rocket3.mk   | 15 ++++++++
 package/python-web2py/Config.in            |  1 +
 package/python-web2py/python-web2py.hash   |  2 +-
 package/python-web2py/python-web2py.mk     | 40 ++++++++++++++++------
 8 files changed, 61 insertions(+), 12 deletions(-)
 create mode 100644 package/python-rocket3/Config.in
 create mode 100644 package/python-rocket3/python-rocket3.hash
 create mode 100644 package/python-rocket3/python-rocket3.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
