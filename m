Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA38E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 11:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C057D80E76;
	Tue, 31 Dec 2024 11:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMyFT08yZKmp; Tue, 31 Dec 2024 11:08:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0D7F80F0D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0D7F80F0D;
	Tue, 31 Dec 2024 11:08:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8017CE0F
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 11:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52A2B403EA
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 11:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDg-o6Ro5wjj for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 11:08:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3C47402C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3C47402C7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3C47402C7
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 11:08:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13BFB60003;
 Tue, 31 Dec 2024 11:07:59 +0000 (UTC)
Date: Tue, 31 Dec 2024 12:07:58 +0100
To: nvd <nvd@nist.gov>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20241231120758.3e2858c5@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735643280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f64XNzvInLg+d7ogcOwcvGYR7WjeA7AxQaSi4JhY+a4=;
 b=ofd1968QyVqnGN38KkcD12Lu3oquKXsSb8cDId3uFSKyqOiliFEaWwxFjJlfC1W+Kgxhud
 232PBR1y+Rk/HS36qeaev3qVzxceiGrZls1X1F7d82zTqPMwaCFD3ZZg+qy4Z2FznnLdcM
 PZlIYCxWXmb+Yg68qdLFAQxNcvs/KmVo9Rm04rsP3ONUVCPhoD7hjnFZaLFwfhZKpRz90s
 d49jNV/jJ0t33VKcyaxn796vmTyQ195QDhbrNdS8EGvxxJ9gJsifUJYA8eeAfVWpEsSbME
 cck7QgfpwIhzrwYAdRNDXPJEIGhsX+ZCjHgyEivd4LxpeTfI+C0g5E6EDQYiwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ofd1968Q
Subject: [Buildroot] CVE-2024-7592 version range fix
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dear NVD maintainers,

CVE-2024-7592 reported against Python is documented at
https://nvd.nist.gov/vuln/detail/CVE-2024-7592 as affecting
all versions of Python prior to 3.12.5.

First of all, the entry is incorrect because the fix was merged for
3.12.6 and not 3.12.5, so in the 3.12.x branch, only >= 3.12.6 have the
fix. The fix is commit
https://github.com/python/cpython/commit/dcc3eaef98cd94d6cb6cb0f44bd1c903d04f33b1,
which git clearly states was only merged in 3.12.6:

$ git tag --contains dcc3eaef98cd94d6cb6cb0f44bd1c903d04f33b1
v3.12.6
v3.12.7
v3.12.8

In addition to that, the fix has been backported to the 3.9.x, 3.10.x
and 3.11.x maintenance branches, so some versions numerically lower
than 3.12.6 have the fix.

Namely:

* https://github.com/python/cpython/commit/d4ac921a4b081f7f996a5d2b101684b67ba0ed7f
  was merged in 3.11.10, so all 3.11.x versions >= 3.11.10 are not affected

* https://github.com/python/cpython/commit/b2f11ca7667e4d57c71c1c88b255115f16042d9a
  was merged in 3.10.15, so all 3.10.x versions >= 3.10.15 are not affected

* https://github.com/python/cpython/commit/d662e2db2605515a767f88ad48096b8ac623c774
  was merged in 3.9.20, so all 3.9.x versions >= 3.9.20 are not affected

See also
https://security-tracker.debian.org/tracker/CVE-2024-7592 for a good recap
on this.

Would it be possible to fix the NVD entry for CVE-2024-7592 to take
into account those extra details?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
