Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E997E606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ta7mkbmp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MiStBL3j
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C738C81338;
	Fri,  6 Nov 2026 19:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKGGE2FaSSl9; Fri,  6 Nov 2026 19:16:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DE1B7812FE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992568;
	b=Y5ze+BDaSzPxFdMf1pg9gvqBiI08Bl3hOxGXY3a7f3cGlQVPxifyVs8ierkSLTZsnkV+
	 0p+nUq04zAI9pLCoRLlcQuDRV5HVaLl9U/MWmtwbauUY7T/BDOo155jii9PHh0LZtulCY
	 lmjV99STRuPhh7fWtY/9Z+gQHcVbBwMNFqiDH1KAaeUtV0IA+W8AwmjTtHmYvNzxZhFLA
	 EalP4xtAGXAmE+imTsYE4pcE6JUndunPcafartAeNEdC7YXs68WAz/c6+Rc45xIL2KazW
	 0DmHVBJ0eif73kHWXvV23xquzzdVfKxWUeRB47cFgClEFZBSBy7ueNNN9So6o02rSTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992568;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BDjAecv2U3zXdGQEicLLXDVjLm24jcLBCe1zmuxyutc=;
	b=LY6gC0O5m0kfMXNA9rV7JcE4hQBWfc3Jmezf+9opwAlSD6odJSpIGhRFbHp+oxoE6jNo
	 IEDvmHSdTHgkdI39D0AkrzPbzhmQIlpvXpRerpodoOG7uWdlDJ6hAAZAXoFa2z1ta8xSB
	 uyis3WUaEb7ogyzpuskDyiBMnaM1mJiN4Nf4m5A5VBKNbEr2z8dMmXA7oEB/SAYJDFbXV
	 G8TgLldzfvzqWX2s9LnxXthJuhOzjWSJzSXddUbLD7oQxDY9NNRJlgG4vpSuzN23BK2WF
	 WInGlr31zs/+njxmKcdbCqG7FN43wYeTfYAtiHoKOF+DiN+hs7/ECVZwVO4Dg95XamA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992568;
	bh=BDjAecv2U3zXdGQEicLLXDVjLm24jcLBCe1zmuxyutc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Ta7mkbmpGD97iNXxTE9JY1RNSzrp5v7wiXiFcTNw173nlpc05bcJ6xmnAAVwA64co
	 wpmm8Fx/Sq4tiw3raovE66U6iSox4dQXiVJxLbjVceCSbNJZpjpKA7TqhJ0S4YpZ56
	 HvcMn88C8pzyVW0keq+IEqMH/ugEMgOQMItKoWpDONb5mQqquC9+hkHm8khhOBE2jz
	 SfCEw3LrQpvpxWgfsjiRv5khocQGQn/PvpQLqGGXk9CUhzLAlMHt2JwfSgPEG6xxkM
	 fqz9ZhYcbSFukoIB5E5d0ynUBeo2mxDjlLPKtx8fJD9AEsiOFlcJb5NSKDBui7t+0N
	 eVSVHRHVqU2nA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE1B7812FE;
	Fri,  6 Nov 2026 19:16:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0A35362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B202C403E8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gdIEEnvlbxo for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C443540994
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=MiStBL3j
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C443540994
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:03 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-6b19e291cc6so904546eaf.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992562; x=1794597362; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IpRzlGTcZJGwU2X1n7AowjPlFyQXcEyzVd4A+kesq84=;
 b=MiStBL3jpniqSsvowydPx72ExppbF1TcBufJdWIo74X3amC4ePml0Ajdz04svHI7eS
 3e7cTW0fMUvC7ggjKiZUninFHSJLvDKfxARPQPqrj6ZiZxLcR+6NzVsngh3Zi/+Wt6ob
 Q9DB7BjDN3v1JJZ1/QGdbtgDp3ZZOOYZRpwDwRAKO5ySWjrfbYgS9afkMitlKQHrPtmd
 ZOq7Xmsxq2+uAUSvPGREZffsvtE/rTET5SklrBcnktf38/4MxceWMpUnM1rhsML0UU4o
 qGCPUX9imieTHNjWhvmFdYYVtClfAbrk/3vwGzhVhj8ARzb8p3WGBwLqKFXd21Es3tIS
 LGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992562; x=1794597362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IpRzlGTcZJGwU2X1n7AowjPlFyQXcEyzVd4A+kesq84=;
 b=lP3D2GtbfWkip3Mop4kSOeB4i3RnNa9hhtDhVqVM/5HzIjkk0k3MzSdbIgEgktjVVf
 RFlvQYyT2IO18dwwer0nZhI7qE1Q7RTR4kDrFftysnCZIK8zO/zlj9VaQ4JXmgA6tR61
 eS1Zh+JzGP9DGjWPJlKmxpinuuCtT5bxz222d0zTWZIrqomijAeBBlM54iUy6H2DgSyg
 jOVtv67s3J0NeXi5JB8xC4Smk91ltVtrdZOEoCGQQg/QiNU62+mTbciHMjFmT5hRNKKt
 sfQR01ufNGPYtlJUk3UyrUJFLSy5gK/nmdQ5mTdZlU5O8xRrJUMyVPmSU5uYgRf9peMH
 aqtQ==
X-Gm-Message-State: APuU4Z/ZULW0IIfqK+2OQifj+PajG3qH6YUYUTMHt+hX1wpyjQwK1fjY
 P3C6AR1izqzcrOOg7OStd+iTcszTrBxehZcJkHnwcNxtGJkGkG1wTaFX6K2d/g==
X-Gm-Gg: AYBFou3s89NSZZZ+SMowDh32Wq4VQ7HN9Y7vqIrxqdnRXSia3c2jwZJSTGMap9/HHab
 uhktFtKqgq+Mr8kT5xZsnKlSlSPJcGxFkL9930XBKzTNZo2bGHDLlxSH6BTt75qw+repENg/R7x
 1GUaPwF00KEr2kVWEzHtKmlmQfRUN4OLp+MGrFbwmrc8tHv6/0xzHv4gFWi4P2Dg+ZsmgPp4KWX
 62L4jYFGx2CSzEm7eapfDBHmGegUG9vnrb6shHopGjzJV+UudELrZrKAux64RxSUFi6t0c1wjOL
 Nhhy6jKsUKCnnaOUjv8BQTzfKiFpW1ewcYwAJx3g8MHf8hkkYiGZqWQ90uAEDftHI31d57VUfTq
 PmkTCqQL7ZOJmigKCsHW8LPZODR9RMQW6asIWdR7k5pZMXz48TPq6WsJCgfhCzRfL7aWO8PYwad
 9DX2vHMd4gQ6oM8t6Rqx7WJiF2FXrtthOyxSZlIImzLmyfRnTDig9+nq8Ol9jDFVUJMr0MBxMRy
 VCdCYu97nI2hdBmYNeRlVbIxU5du4QpNLkTjtLuYFkGm6gaIOeAyakZr6GEGUfvZ34g2wvKx5Dk
 A3ov12KidU3BC0gzsSeNgVTj7XTQSy791oQUxyMnOe1HEENx7yX0rvQPjL+WZki342CwZUjp5Oo
 xcZh8cIhBXPR6uzC6XF7rYuzkpEX/qfYAwC2OfsfIRIvy3vsyj3O+viH/bINRBhhlFwquMPhkzv
 UM7CBUm1b5Z2lxyxtQVtr2pwNE7mvbgWtIOOHiojhFiePjmnstZ34l7DTr1zY/BUvJR2oH8Nm/8
 w==
X-Received: by 2002:a05:6820:807:b0:6f7:6042:e7d4 with SMTP id
 006d021491bc7-716e78cdcf6mr2001824eaf.50.1793992562161; 
 Fri, 06 Nov 2026 11:16:02 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:36 -0700
Message-ID: <20261106191536.2120153-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-filelock: bump to version 4.2.9
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
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index d24358f7f1..41f9f69ce1 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  932426b5d85aa53ea727cae7238102ae  filelock-4.2.6.tar.gz
-sha256  ee7af8ede36dcaf12e1016d9f7c3a63ecd5497d46f85dab21b8c779b8f944e97  filelock-4.2.6.tar.gz
+md5  d97caf3371cc44f6047259ccb420317f  filelock-4.2.9.tar.gz
+sha256  96530b7c538d4ea08493ab067247aab7948c54d8cd622cce711c97cccc5d9896  filelock-4.2.9.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 69032ceb83..5a9ce8c709 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.2.6
+PYTHON_FILELOCK_VERSION = 4.2.9
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/35/6c/730b340182f1fd74d4ef8d3f35431ce84f8f97b1a1f2afd145174b7bb047
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/a3/1d/d730c664fcb4f1d264a722722a3134cf0881854f73c1fd58abf87572f232
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
