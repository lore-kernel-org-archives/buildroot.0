Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0354A606A322
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h5lW2Jgr
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4F4581886;
	Sat, 24 Oct 2026 15:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Snr6Wgc1ymwC; Sat, 24 Oct 2026 15:01:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AC65F81A2B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854077;
	b=NOPa8RERSvaazuzTY0/Gp2sQvqzlpe0z6pYc/lE4gPHOdfyvC4BcQMjm/YbWtSSr/WTJ
	 S8xZZfG09kOtlYRXa1wMWWGn99GhjaQlhgQKG+TlLlnWCqRSG2U4NGEMYRFzBsKZqkahV
	 Tu90JIsR3hquBRFM4QaERKEuFEta7EsLUOGB9O9nP+7UoRBJYKaWd/Ad5XiXEhLpeRLPy
	 mOgwyAcjI501HD+0dniEhcm1YyZxlZsZRk41jolO4PDvCk3JYRsFFIUQA57ZQJ6zeJ3u7
	 6xS30t/IyTLOVh3fSQ757eiNJ4XhgEj9HuKZphnv0DrO1qs7nqQFm1NVxRtHy/9IxBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854077;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2jJ/xCPYPhUjTy2IRCaCiB7Gak3rvSGD/N/9w/kMvZg=;
	b=oyWc2hWxLilgEqGxprowCdhnJ9yGQLRQz5mWyonbzhYTSWsZZ8AnOfqKw0vhlnL7py15
	 Vha5xDjVSpAAnE1X0Fzotme36wSocuXlkZbVVaUdRfLkgb86wVC+mIKLytZnKJSVoKHNK
	 O0pfam/YQBCcqNzYPg6XtmPjlpwhNQ3XSn8HoZn1+a6sglXgL8NM+p3hsrU0tEzZaH1zR
	 rVnWCrJA59HwMJChwXKytMHp8RRbe5O1uZuOXfhv3toTD7IPqGPh29qU5ywuNXPkNxhER
	 /RBHo4dP26fOx35xUxj5AB5i991YFzrr7iCj3rO1Kiy8Ks2jgaY4JFiL2lfzYl1drKQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854076;
	bh=2jJ/xCPYPhUjTy2IRCaCiB7Gak3rvSGD/N/9w/kMvZg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h5lW2Jgr73uPmFMONWY8zMXTHnvSIye1BqNCp88T8HUINHiijChYv7dGnHM7LzFjN
	 Ijovcy/nNVsnRy33pyKzxRK1biYI66toHta9FIOKscl02O3oOzDd3W3iVQYsdZ5hsv
	 C1mTMBP9ywBDdPm6UhucAayLQk6lUtNq2+sgAiB0c6wZ8iswq8qkq/IbM80RKeujmn
	 WuOAaO5bHEzJXm1vD7YP7ADIxU/iqRIoeUTwunZ0UHl8UPoBCgpvMLwunXka+c0p4v
	 2tRlUMy1oso1BvwZqLj8RmuGah3yKD7burJJ2ikklBBuHT2Wl+FFKdktDviPwYToCv
	 D2RniTWO2WpAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC65F81A2B;
	Sat, 24 Oct 2026 15:01:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A793AF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07E82409E7
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBBGtpECAnh2 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E633240A1B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854053;
 b=tD1A9wRXdR34sxIWqcZt38iPAw5jdXVuqQQhu5iyki6nVRpcfLCVVB+4bmZx2s3aeuzq
 Q07xBzR/lV4GcZhgL6bDFpVmNHRnfhHIAboUnCNaadBAXnV+5r925x/fchT4jMQc8JOR+
 ZZPQenEloTWYrZxg/TGABFZTlXyAzmHYiU51TyIN3RktIlbDxeQq+gEgDTLT3pflZ7NU5
 yScbJ4Spj/LanRncUpFGqgOLPV/7P1ebfjtXtqXngl/fLh+E3D6MfTZT0Fmflel+Lnw+v
 TZY6M2Y2K9lKrzpXQDto47x6SzHItRm0wdEOCe979y1fZK3P5vpFmNTQm154pA3qnqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854053;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=oc/rExwj7iiZoMOQusLPJSGXOLKj/hsE36dwMa1+kAM=;
 b=DWz0VsWUHCj5ifkycKltdVCA1ygnwL+4X1+CDmy1xGnx/xCNo8RAGMb3ZIW+DBf0N7GO
 2o9+icaGM3QLwm1jyq27PFgOFGGID1YOidmb81oUTV8JI0LJEKecCNnNs4LpqYgQzQjo7
 6/FyOtHb694GvRiM8CrJPkc8HXYWU5F0d9owaNbNCRigJbLoldrE944LZGm5yqL+CRq4l
 +ztANqZ4gGuBOR4Dm1zNVUhVCD0+WnmrnEXs7OEedvJhcg0IBu1C4q3su6xW3eXR7aWZA
 /H+1Ks29brgmKeVAgIeU2uKjFudUXsOteYd8euLCVtmyny7WcUziW0DH+9LTp3tCyQg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E633240A1B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEE239C7D5; Sat, 24 Oct 2026 14:59:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6684c8f9bd21a6dcb951d26617564014a9d7c9d
X-Git-Newrev: 6b74b954c084d41deb87bfacbd9cf98f976eb1a0
X-Patchwork-Hint: ignore
Message-Id: <20261024145928.DEE239C7D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-annotated-doc: add host
 variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b74b954c084d41deb87bfacbd9cf98f976eb1a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable a host variant for host-python-typer and carry over the
pdm-backend build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-annotated-doc/python-annotated-doc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-annotated-doc/python-annotated-doc.mk b/package/python-annotated-doc/python-annotated-doc.mk
index 6671db2f1a..192814a9cf 100644
--- a/package/python-annotated-doc/python-annotated-doc.mk
+++ b/package/python-annotated-doc/python-annotated-doc.mk
@@ -11,5 +11,7 @@ PYTHON_ANNOTATED_DOC_SETUP_TYPE = pep517
 PYTHON_ANNOTATED_DOC_LICENSE = MIT
 PYTHON_ANNOTATED_DOC_LICENSE_FILES = LICENSE
 PYTHON_ANNOTATED_DOC_DEPENDENCIES = host-python-pdm-backend
+HOST_PYTHON_ANNOTATED_DOC_DEPENDENCIES = host-python-pdm-backend
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
