Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C60DC77B7C
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 19:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 050C641B52;
	Sun, 28 May 2023 19:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 050C641B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIJlx9xhr0Om; Sun, 28 May 2023 19:02:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7820441B5E;
	Sun, 28 May 2023 19:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7820441B5E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCC821BF836
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 19:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A36CA40272
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 19:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A36CA40272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l8m2TtcYFPkl for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 19:01:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 959E440165
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 959E440165
 for <buildroot@buildroot.org>; Sun, 28 May 2023 19:01:20 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-30959c0dfd6so2489643f8f.3
 for <buildroot@buildroot.org>; Sun, 28 May 2023 12:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685300479; x=1687892479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXff1jME2Hj49QE24rKk5HqnWCf4VlekyiVEGM7Sbhg=;
 b=dOGq0rx/C5vRU8f7oIDc9ujkuAeCBuLHsNtVGibkb6t59iD0Zmotc7a2jp4C0dy6Qv
 XsGAnROYfw0v0GS6TiQqSrKx+aIGyR30BWvlgbV4vv7PM59WcKZSP2VbBXZ5Hm0q6+wk
 onoFR7NVAhLqdmESIQ0UiajwwlmiaFgbtSvpWPdTrtruYInyhAJATQ+/KAkFy1MTVE7/
 3C8+1axl/I26EgWMkQZ3uJ+QMMJncQyXy1UwZbwAedSMm5fuY4h1dl7Lpv1ZeCmXwqfn
 ukjfIGD0SyCQzK+tiKzO11vaLVCgnyHiDPQxEm/fOGdpPj3hCva9HHJNbgyAM1tFezSR
 lMMQ==
X-Gm-Message-State: AC+VfDznaCmFqgdrbmXRPm5kMET13QTVVrIHrq2NBZMMITEEPHeARtLU
 vqybW8wo3j8S3cKMD7ngTA0CrCKF6dc=
X-Google-Smtp-Source: ACHHUZ524rJbcBIW9skKmhYWHS0DFvxbzO5Qo3VsNkdUuQeNCy3MTFkiIn8YJCAGj1qze/yuDCRYJQ==
X-Received: by 2002:a5d:4143:0:b0:30a:ec3b:58d8 with SMTP id
 c3-20020a5d4143000000b0030aec3b58d8mr318666wrq.3.1685300478755; 
 Sun, 28 May 2023 12:01:18 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adff606000000b0030632833e74sm11440967wrp.11.2023.05.28.12.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 May 2023 12:01:18 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 May 2023 21:01:11 +0200
Message-Id: <20230528190111.2430580-5-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230528190111.2430580-1-romain.naour@gmail.com>
References: <20230528190111.2430580-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685300479; x=1687892479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXff1jME2Hj49QE24rKk5HqnWCf4VlekyiVEGM7Sbhg=;
 b=YN6+6i59CzI7wkjc2zX/0KNfiKs/zTdnoCUo48hwpEgS701RtA34UonETHnTl5Ocin
 pA04TU4enewZdfhSeW6ZBBlhBuE+rkRsMF1kRpIGcVcZhGJ0XK2xmLPUf8Pw+JSRJZUC
 5/FpNHNFogVGvZNMva3NBtd/tQ/O50WqYi/rpGQpfMMKBFTqdH58n2Z6APDToTdaK1Hw
 LfCm8F8/5CJsUlXsMsozXZucRlVhceoj3j9yinc3YqoobG1VudAnHCV5N4cbzZd3NFCz
 lIpha2RD/sqPaMPOgrj63nZYkMhixw4bAtb1TxVYz9LHjhMhtCGPVONSV51Fm5ri5H1f
 2IUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=YN6+6i59
Subject: [Buildroot] [PATCH 5/5] package/ipython: add missing dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported [1], the test TestIPythonPy3 fail since it was updated
to 8.6.0 release just after 2022.11.

  ModuleNotFoundError: No module named 'stack_data'

Indeed there is no such python3-stack-data in Buildroot.
For example, Fedora packaging added python3-stack-data while updating
to ipython 8.0.1.

With python-stack-data added, the test TestIPythonPy3 still fail
with:

  ModuleNotFoundError: No module named 'sqlite3'

Since ipython 8 sqlite3 fallback imports has been removed [2].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819089

[1] http://lists.busybox.net/pipermail/buildroot/2023-May/668086.html
[2] https://github.com/ipython/ipython/commit/7a0bdabecfa745b60c3a711e1da2df378687e746

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Due to the number of new packages required to fix ipython,
we may consider reverting to ipython 7.31.1 for 2023.05 and 2023.02.
---
 package/python-ipython/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index 3de49ae574..c217efcfd1 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_IPYTHON
 	bool "python-ipython"
+	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_BACKCALL # runtime
 	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	select BR2_PACKAGE_PYTHON_JEDI # runtime
@@ -7,6 +8,7 @@ config BR2_PACKAGE_PYTHON_IPYTHON
 	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS  # runtime
 	select BR2_PACKAGE_PYTHON_PEXPECT # runtime
+	select BR2_PACKAGE_PYTHON_STACK_DATA # runtime
 	select BR2_PACKAGE_PYTHON_TRAITLETS  # runtime
 	help
 	  IPython is a command shell for interactive computing in
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
