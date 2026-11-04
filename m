Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0739F6095292
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 19:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lpoHFRI6
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89BB440942;
	Wed,  4 Nov 2026 19:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsfkIK0oEIEC; Wed,  4 Nov 2026 19:52:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E76C740934
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793821938;
	b=M3TjmFrqzUYkzF4MglobkZp00Zi0BCyOi4cYnRzy0R6sE+LhWyvUeX1IV0ElX43zzG6B
	 01yxWV4b0vXknUVlmX2MX+TX61SeCsUQXj2mwiyNSuaD7HTKfJp6gHvHwP0WREOHzWfwY
	 /mYYtjqAKQ5f0yZlGqwgxdNKBGVc+qjtqkVLo55ISdVd2PyZbO8Eu+VyxNT0jP9sbxpKU
	 6MwzKvkw74tVSPtVdH4rLaE3+x8KZDnI6rzscFCyWGWG51Iy9w42rlezX/+XX203bRghU
	 4XUw2G0u+7yPnAO32n4p60EfpAGb64sIrxzF4rqJw2dDT+2ZHAEKKlZjzFo/VMGVzxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793821938;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=73qwNUZYe6KtPxt0cf64PpTyY4x2H1CeIZ8dmyMCQyg=;
	b=ET2JEGE53evQ55pmbEq254gc8+PopzNyWp9T05QONv/G5AhngGFL85zPP9me7WsXXakL
	 lGvfUuTLe8AZeUnNC1Y1gp1AcDkua/FxqUZzIWK8RkErX/GkYAo7VqsQgQjKFyltFp7AQ
	 YV/mNNa5uHdkW6ojAHGghruidYxtMotqH0AHALb6eStptdrCR1j/EGcc5pSG2+q5nX2gb
	 DX5Zy8nWezTHgvl4IvYEDqiEpbA8naiBeJVZVK2YnVjy3ediF1zeJ4E1to7eCs0XH1dc3
	 6y4pqCVFQ6igckCnUD4xyq+yF6gVuscJJpvCHercpwo07f+wmn0dDnWkFpDQO750O5g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793821938;
	bh=73qwNUZYe6KtPxt0cf64PpTyY4x2H1CeIZ8dmyMCQyg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lpoHFRI6euFN5DRzfryAeO8DgeookTWaqAANNIrgmAT5FGRPBacrta5qlDk4JcYEA
	 e+Mu+5YCVNfmoCgqws9bxOIF6eyK5JnTRlkuhpNi6BIqImVdK6G1D8K5AT8dvyfGgW
	 W7rn2v3LmUfbG6rU40+kx0bjsQ/IqzHqCj7Yfe8DEyM0bS8JJLjTDpQ81Vwvn86YSn
	 Z4buhBDQh+ARsaUT3Y67+ePs+5NpVO6iB6u1k2TSrhBSaG7QROeOQMAfmhZSh9dqM7
	 HT2Vi3soQMefODKtKc62G8cPw+ugAY1Iss6A9XGYtvxkKPhihpmKzjKlolVMvQJ9hM
	 vyywyRD9nI1yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E76C740934;
	Wed,  4 Nov 2026 19:52:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DB5C9C4
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F460607AC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id be1TICgabZwo for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4ED1360728
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4ED1360728
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79B5C9DD96; Wed,  4 Nov 2026 19:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 20:44:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea3075c74bb4f196ebcc02807439a97eaee9f6cc
X-Git-Newrev: 06ad1e5012a857b059c8997bbee13b0834209557
X-Patchwork-Hint: ignore
Message-Id: <20261104195044.79B5C9DD96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website: remove unused LTS page fonts
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/06ad1e5012a857b059c8997bbee13b0834209557
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The Compagnon Light and Terminal Grotesque fonts were only used by the
LTS page, which now uses the website style and fonts.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/fonts/compagnon-light.woff | Bin 44788 -> 0 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/docs/website/fonts/compagnon-light.woff b/docs/website/fonts/compagnon-light.woff
deleted file mode 100644
index b0c6e87649..0000000000
Binary files a/docs/website/fonts/compagnon-light.woff and /dev/null differ
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
