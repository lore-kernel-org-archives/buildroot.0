Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F643C4332F
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 14:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFFBF402F6;
	Thu, 10 Nov 2022 14:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFFBF402F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03fz5204Bw8r; Thu, 10 Nov 2022 14:01:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 011B5403C4;
	Thu, 10 Nov 2022 14:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 011B5403C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 116BF1BF393
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 14:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0FCC813C4
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 14:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0FCC813C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S7fs307Hcfa1 for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 14:01:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFF74813A1
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFF74813A1
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 14:01:24 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id j4so3489362lfk.0
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 06:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q013YnmWzDxaP6TloOqKmz08PA7uVBy1hqQH0qGHr9c=;
 b=FIlaOszPQmpGJdX9+kFp1UQsSCfmt0lPlfScpfLDtdT/VMp9G3/0hNl36yNl+GUZFx
 6B358oeDn0T0knHs249Nm4v3sHMOhPpwIKj2oGuc2+XFjQzRfTCWvzekGsWfnVs7sMQE
 Fs5GaBi1r5IH3Ia5wzokHZ2piS/79rxzDhGzUtPbjng43sz/eqwNowYhlBbHj1xDFSF/
 J84r+pY6JlSmOozXMi/71PbsMTVcLNK8pGZnLth9W9Hq5Fv0xqzZM60JYoFXdilmX9BO
 661PsQJOHIs3LTHdYzstzl/y2zBIuk98zo9g8+LOwAHMSGq5+LKZ8SSHux+NLCTmW8QR
 4enA==
X-Gm-Message-State: ACrzQf2zJNAg49qc36OjF8RW24Q5uNEMPRdIEaOF9rp2jMVYN7XwOAG5
 5Q7ZOvwUzJB7TUVJ2E4cxnBudh5pq7anYYU0
X-Google-Smtp-Source: AMsMyM5Mgys0RWMD6Xcrh3wKK9pxazfvKeQgItvcFF5GP9dP54gRiiTOnnUZl7/PDlr2WWqahNujZw==
X-Received: by 2002:ac2:489a:0:b0:4b1:7c15:e8bc with SMTP id
 x26-20020ac2489a000000b004b17c15e8bcmr11990466lfc.347.1668088882244; 
 Thu, 10 Nov 2022 06:01:22 -0800 (PST)
Received: from localhost.localdomain (dsl-129-78.bl27.telepac.pt.
 [176.79.129.78]) by smtp.googlemail.com with ESMTPSA id
 f27-20020a19381b000000b0049a6a9bc0dcsm2758603lfa.134.2022.11.10.06.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 06:01:21 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 10 Nov 2022 14:00:54 +0000
Message-Id: <20221110140054.252389-2-nunog@fr24.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110140054.252389-1-nunog@fr24.com>
References: <20221110140054.252389-1-nunog@fr24.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fr24.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q013YnmWzDxaP6TloOqKmz08PA7uVBy1hqQH0qGHr9c=;
 b=G91w54t7XdjmVokgJFiB7Sb2NFcQpTWmZfYrDnjvnyQ/4s3dnsUru6UWVfi0ZYNyKu
 yxzuUHyxROIRty9/qJkylDoxYtcdHSuuxLdxiSnTsn22Sgjq6TAUOr4ASgm7SrxvX2Mz
 PfUYwpi3tTg+5PkTwF5vdxmKHZ8YRcF77brDZ10MBm5b5yewuvErCHOkdgh/ZXKMe2AI
 IMS+fCSx/p4qHAo31dFDf8qpEQDaGEMHChBXjhW5H+Qt7ZU05QZaNJ5BlafIMFh67CUA
 uPhvVxg/6gK3UtyX+dKfLQkP70fGr+1DPxbZxUQIfKYP1yAgJ8k5YbLOFUqF0kvSX7+S
 dXQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=fr24.com header.i=@fr24.com
 header.a=rsa-sha256 header.s=google header.b=G91w54t7
Subject: [Buildroot] [PATCH 2/2] packages/sudo: explicitly set
 enable-tmpfiles.d
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
From: =?utf-8?q?Nuno_Gon=C3=A7alves_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Cc: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SWYgc3lzdGVtZCBpcyB0aGUgaW5pdCBzeXN0ZW0gdGhlIGRpciBpcyBhbHdheXMgL3Vzci9saWIv
dG1wZmlsZXMuZC4KCk90aGVyd2lzZSBleHBsaWNpdGx5IGRpc2FibGUgcGF0aCBsb29rdXAgdG8g
YXZvaWQgaW5jbHVkaW5nIHRoZQpob3N0IHBhdGguCgpTaWduZWQtb2ZmLWJ5OiBOdW5vIEdvbsOn
YWx2ZXMgPG51bm9nQGZyMjQuY29tPgotLS0KIHBhY2thZ2Uvc3Vkby9zdWRvLm1rIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N1ZG8v
c3Vkby5tayBiL3BhY2thZ2Uvc3Vkby9zdWRvLm1rCmluZGV4IDI4Y2ZjYmIxZTIuLjhlMjM3YmQz
NmEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc3Vkby9zdWRvLm1rCisrKyBiL3BhY2thZ2Uvc3Vkby9z
dWRvLm1rCkBAIC0xNyw2ICsxNyw3IEBAIFNVRE9fU0VMSU5VWF9NT0RVTEVTID0gc3VkbwogU1VE
T19JTlNUQUxMX1RBUkdFVF9PUFRTID0gSU5TVEFMTF9PV05FUj0iIiBERVNURElSPSIkKFRBUkdF
VF9ESVIpIiBpbnN0YWxsCiBTVURPX0NPTkZfT1BUUyA9IFwKIAktLXdpdGgtdHpkaXI9JChpZiAk
KEJSMl9QQUNLQUdFX1RaREFUQSksL3Vzci9zaGFyZS96b25laW5mbyxubykgXAorCS0tZW5hYmxl
LXRtcGZpbGVzLmQ9JChpZiAkKEJSMl9QQUNLQUdFX1NZU1RFTUQpLC91c3IvbGliL3RtcGZpbGVz
LmQsbm8pIFwKIAktLXdpdGhvdXQtbGVjdHVyZSBcCiAJLS13aXRob3V0LXNlbmRtYWlsIFwKIAkt
LXdpdGhvdXQtdW1hc2sgXAotLSAKMi4zOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
