Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF305C982FF
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 13:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1FD7607B5;
	Tue, 22 Sep 2026 13:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5AbAcqSpxsIK; Tue, 22 Sep 2026 13:26:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3AFCC6077D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790083617;
	b=ei8OML8pK97pPPtSMlJoV6JW5VbtUslL4//jtxHXpaTFagh6MtAebJzM+yIVHe6IdCB6
	 BZ4Po2NRNaAus2iqr2lgcRrPA2WTI8QQZOiHaNgyiCHS2oyuORWl8pyWJApngwZhkIkOn
	 xyFi7in2PsA2NRVmaf0jm+trapKB+2hvCpgXnOIanaFAeIOXfa+wo3bhcv5H8y7EVBom6
	 8AzDppGUrTBnojXPncsRdBsaVzyDCpfESS3hc+IbHpL68idUNLAjHay9JkMbc3aAzaR61
	 QwGHV+qJIzYjfJjMfGodtQd7WURaPqd073EIdHU0GqZTGUrjuKmCfHRt0TYh4UAJatg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790083617;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8cai1caIc6Er5lBPYwfbxK1k7QlzgQ5ceOlrHzKepJ4=;
	b=ESeVtyuXA2melTPkd7Q/TvqWAzD1KZtNSed19h46pP8dk/3Gtvk1nQaYmx9UuGTLAp7U
	 fDxk8Wxm0Da3Gp88viBzOJz9jbwCSG9MGFPLfKcoXwRqKH75fQgk+ezygNs5T9+4c0vR9
	 eTbgwZ79TUmVyuhUDM1yEJvFkshIOrymuTvOuybFno2K+BS+UP4JYq3fu5r7bX/0no0l7
	 Gk+H28VyaN4e1cpOtvPC1ronHhebS/JZuM6jJ/ggiYKkbT3mhqB93W07pjDHv8LuTucEo
	 +3xjestJk1emXSeJtWZYob4sUOSYf/ruBjIywtRKSQ8Bk/cBjTS2v1EwOvNsOFKrnYA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790083617;
	bh=8cai1caIc6Er5lBPYwfbxK1k7QlzgQ5ceOlrHzKepJ4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Dpihziauu00K9ITN5aminZsduL52F4XY0pYQ2v59ticNq/G0kn0jcAjI9C9PfHEmn
	 NDv4t1TTXRoqCiP9EXBGAhoth6w/ZtrT6AKbCBqx07V6CEVaoxPPs62poeWsmf7i4k
	 gmAOYN5Be/xSlilk1zcsC6ClGfIsxkejbtTpUpuU6LHl145IJ61DqDZCqPK8hVYPxE
	 symetGD0lQr0V5cC1Ld7FCbIEIPR07vFzb+hZYZ3yfL+LALEOVEqW65HnZVbUykx97
	 wjguqzQLNOUD9O0kpSsq8hzY2Rx7ET3T+7GdED3rIqm+m2Aql84WVVTJb5Z9f+m96S
	 fGsUpWjba6yIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AFCC6077D;
	Tue, 22 Sep 2026 13:26:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23FFB352
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 13:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09DF9400F1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 13:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id why441gQtfNm for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 13:26:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 194C74024D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790083613;
 b=kj9k6KO9kauSLaXjZUZEyy8+Ug8ZDjxl3qiEnI7JP2h3PL31TBMKMWOHYSrH/U18VVrs
 GKgkbrcd6Nf85k+U4zIlXHvPs+hv2iK7vJGIUgq7zJ3U/cvTxA803E1x4hF6tu9FaS8T4
 B/PcJgKh4tVhnbAQ9lfL2iVP4L5zfgx73ubzDhrAi1Z8911QCo2+/mGt5l3Ye2k9GOaZa
 5VHYwjUWJN05nwqKrwEj67a08nTwT3POLDOk7tX7V3+eR7h6FCYQxSGcyw5R5dZUTZXOX
 /m0RqKb+MAdt3rQKppgaVMlmci9EslubtoAdmTonOLAjqEzGODq9Hv3EPBJE5j9XD+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790083613;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=Ms/xw2NQHfrMdUUmVfhB4c9i4211fRvsg+o1HzCmgt0=;
 b=XslxCxWjHZTWE/LAN1z5fIvEtx8orAQB/UOq0FGOy9U4b3K4qAEmLqA9Xljslf+r1F8U
 ZtmjrOlz9Bg564eWv75Y5p8fnxEW1oFF3smtmuhTsUBS031vcFvLeLhLHgkNeRQrFL3ZO
 QHnqrGCWC3mVriAPYMucw5z29W7nAGVSHwpl1PNs48IKODyL4mxcavbHNN4wih7jdLAmp
 wy2q+yt50D0txFnKl8KWVB4rzhfUWVzmOPIbHvLrv1nb3+VnUmM8lySjNZMueeG3bcz++
 3P97fEWSaCPRBJGsZRyat6p4+hPE6jyRpSfQEGTtZ40TP/iojj4shpjhWZ6w/YVegnQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=WEjVMETW; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:34::f;
 helo=mail-ej2-x0f.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ej2-x0f.google.com (mail-ej2-x0f.google.com
 [IPv6:2a00:1450:4864:34::f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 194C74024D
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 13:26:52 +0000 (UTC)
Received: by mail-ej2-x0f.google.com with SMTP id
 a640c23a62f3a-c2a1a631f6aso490835466b.3
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790083610; x=1790688410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ms/xw2NQHfrMdUUmVfhB4c9i4211fRvsg+o1HzCmgt0=;
 b=kg6LytgHuFHLy4QJ8Ug5dktpSQ8eWH/VTxKTs61cJTzHkLyDQNzdFeDIeJ8R1cKAt3
 CGkBOtmS7XhKbXW/ebfh/3GzMNiFQ5fxNs2oihJ9iv9apDrlIj+/CwIC1rOLTQKcnBcj
 /z5WK6sFODP5ymqYItjR7Eopj12e4Sw7nnxqFgoW5FENJqTW9UPN72I7XiBa+AVZvJBv
 zCATDl+P+LMloRLxmNH/o0QQq+wBux2+rYVWIkPXntFgj8bSU8wvIinDfEc1EPNV/sAI
 dR4FxmZEP+TxNaGDvdqqxOmxRBG7Vc6NDJZZ5vdy6hso2EPgXxukX3qJBNgXGA0E5uFA
 30aw==
X-Gm-Message-State: AFuF++mnLEgT82w94eWP4CytHtpG9Bknu7GcEktWqFUHrFiOrnd1QdFC
 ElEJtPeb2qi26z8dehiZ7wDFKLbMa63ISV1uiI26LsB39/wXQoRAdmaT5OKWxg==
X-Gm-Gg: AYBFou1O7fvGF/WLvOeZqZ7+oBU1NDGzomqHfOWtW6zBxin2IzACjNwZZ4wxMInjE4v
 A//MhhPDqDQQmmnvxH3O0DlZtgvoI2885jBdnAu/poKokrhHkAOD+F+SKEyZubH90gsn7zUVbSp
 5/TZBEeHbCjFdqa+mPqWiJAQPmPE3kRFcdeljhQjuq9h6aE8+Y1ZYdtYa1yeTqeADLE1o+vweKF
 UZC/UX2enmkXEQ/SSgiPk9MB3erUMqNmPScp9evXymcw0CS296AyjTQVqANhNZcx+CrwFdD2P7f
 w3zYCdaxu8E7qTs3H83IrD5h7gh87DYTIDSLF5zPEkcTRr6ShIX5dqg9x3KGXK3FcHRWsiuYTPa
 RAV3KdvCDiRzCWn7CeY0i5TVAas4CPTr74YQBFb8EGGcSEt0Ww67ebgJrH1rUMWM/TwWlg0/oRv
 SUq9SF/oBLcQQEZri20lCKk4nwKpo52thDtIEV0fsZBqKDatFmLsPzF7KeA8WaMwPRV78M8cNQY
 6U1CAz+itgwyGzcjzXuVzYz40/GgZjLyeGi0XkqOCNzuo8r2LKfdZjrGg==
X-Received: by 2002:a17:906:6a16:b0:c29:f5d5:5aa6 with SMTP id
 a640c23a62f3a-c2a15aeace6mr1251899266b.48.1790083610343; 
 Tue, 22 Sep 2026 06:26:50 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2a9c5ee0b4sm85021066b.50.2026.09.22.06.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 06:26:49 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 15:26:47 +0200
Message-Id: <20260922132648.3229462-2-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922132648.3229462-1-yegorslists@gmail.com>
References: <20260922132648.3229462-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/iproute2: add optional dependency
 on libtirpc
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

iproute2's configure script probes for libtirpc through pkg-config and,
when found, enables HAVE_RPC and links ss against it. libtirpc was never
listed in IPROUTE2_DEPENDENCIES though, so whether the feature ends up
enabled depended on whether libtirpc happened to be built before
iproute2.

Add the missing optional dependency to make the build reproducible.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
 package/iproute2/iproute2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index fe7a6fc304..344a6fa8e4 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -25,6 +25,10 @@ ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 IPROUTE2_DEPENDENCIES += libselinux
 endif
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+IPROUTE2_DEPENDENCIES += libtirpc
+endif
+
 ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
 IPROUTE2_DEPENDENCIES += iptables
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
