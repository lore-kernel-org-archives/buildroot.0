Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD6DCD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D722160AC9;
	Wed,  3 Jun 2026 18:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3OJCDr-NZxi; Wed,  3 Jun 2026 18:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A73F61135
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512825;
	bh=/+WRr3Q582ti9vfRtsEfCCuL13yK39Tf/Er2uLI12ao=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ObO1k6014cXAoPuMd2rgfMsweScfKOd32ujYolLV3yEW0uqRvWS9k13qmmBgk+BJz
	 DPHBAnSVXDam87z5xaBfXBua5sJcKzwFXyNlhNJTTQYCS1k3+4M2tF9PmWYoYjrNu+
	 B6Js3wEyoAbjuyip8xjHK23J0pbAS5Yo5knLH3PsycCpf3JU0U+408spHXV2XT0lhb
	 Rb/2ZTh42gNQdYPKosgbODG91cZjCe4qMmsv5sSnZf2rDJjZGIfqoPZJD9qD8nLL6S
	 0/VG9D30BLWwWeP5T5AtaGvCjsAbH5bd9tgdkR7HVGvXduLExUZJaIqtZe+IGf/jcK
	 QWJjuh1VYhNlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A73F61135;
	Wed,  3 Jun 2026 18:53:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85878192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AADA8459C
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMPQ98naRiem for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:53:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6058883026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6058883026
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6058883026
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:53:42 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -851452374; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 18:53:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUqif-0000000Cgax-2L8L;
 Wed, 03 Jun 2026 20:53:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260602190048.2035264-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 2 Jun 2026 21:00:47 +0200")
References: <20260602190048.2035264-1-bernd@kuhls.net>
Date: Wed, 03 Jun 2026 20:53:37 +0200
Message-ID: <87ldcvmp5a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=C6HfZxMTzLY7HOJsdrlwjScNgKk2z0N+UnRYR+5ufO2sNEN9fR6LTnpLSjmAclS7wXxClDWfWEDqwTq/XcKAUv+0OKj8/DKb/xkYzE0xFR4EbreKgu7A24i/DpJvmXZqQiznfcwHri63wG4/fC0iPksismS0QD+7MbrmKisvAEKc/uk9Ify2qgbp5wbwLOZI+UMFDWq5c9bycPCkoyLAJZKD67Jt1l5rXqtjyQiwYNUE4RTmRlA1T7aJmhCHIdXtyhRasdntAeBEiu9+cverY8uf7uPtasnqs4HcpI4bkPayXaPidqD2UMmOSnkoXqTRZMIcLkvXIWxhIrc0KQPuTQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=PebEfEu6WGqz4VjwHF8LQc7cx9rgb0hTVqo1R3W6C4c=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=C6HfZxMT
Subject: Re: [Buildroot] [PATCH/next 1/2] package/intel-mediadriver: bump
 version to 26.2.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/intel/media-driver/releases/tag/intel-media-26.2.1
 > Rebased patch due to upstream commit:
 > https://github.com/intel/media-driver/commit/ec210a9255e9177b571da4a42c907bd36ab63744

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/5f1eee2b3125380a045021fee62a017c1881dbc0

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
