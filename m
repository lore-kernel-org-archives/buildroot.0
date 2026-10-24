Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E828606A322
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XMg3ZzZA
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BE2E80F79;
	Sat, 24 Oct 2026 15:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQWRjrwAWzzg; Sat, 24 Oct 2026 15:01:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8BD5081770
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854061;
	b=LhwzCSl04uKhrkKTMsgPw86lIEeW7ijEyzsY/43ANWM9hrt0X/P12REXHYpCRWFAUlHk
	 98mc2R/Fob+R/rJY7my83nSS5vEDwpZw2ctWBTuR4mn5SH0CQnU1+g+SoTp/0bLADYezc
	 agtqlZGKmuJQyzQJRHFbaQR7c6CqXdHesVKAc8q2TwaFmdjLocRk+3pm2zF2Z8oJjiRo5
	 lPd9BN+utuiir5Cf0Tq1gVHlYbvwjo+4IMNZ0/bEApmCgJ2rv+DQfv7qXzLp9D9gLHxQL
	 Y6gxlgRjklAgIc+M51wUn+JhcNHzr1+m5sdnskMBbOeNGeYzwryLRlpeSvheiWqn21Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854061;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K29tnAfIdIQjy+lpg2gtTIm9PlJ0HD/74RxQn82hve4=;
	b=DxyU9UPvrgQ9SkUznJ7X6vEVPbgX2EdAHq7zZM7tm48VTGVpGR4O4jqCEJppNbaqUsRH
	 enLHXNAqHQzNcDE0LUt4i3778xEruN3o3piAj84V5V5kHCLLBhdYAU77XkzmVbuiBAmxA
	 lra+RpQbiBH1DVXe7OfruvD9Q6oNzsAGCwL/hHSKvee/SE5fW8jKuWXz94bgx5hCsLchS
	 +L9t4JFXMdHufak3Nlfsvmo4Nh2AZwvEsBaOwrlDUE3MY4byDBc4qPZD63A1DX7EPum7z
	 kDMZknlSYj3xNuyF1gZllTK07iEclrzoUftjVs2JA5nRlLa6P1XDJc1ph+B3WVoJTmQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854061;
	bh=K29tnAfIdIQjy+lpg2gtTIm9PlJ0HD/74RxQn82hve4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XMg3ZzZAiHFNLKNwQNewbNLVX2l32DjPQnbSLQ63eaEbHOgw6TodZPK7DSBUWBrJ+
	 VniIGplk1fHJdiLuhw1Q2eF+pTjPQJXGvD3sB1fxFr93l98REtKIoPDvzfneKD1hmK
	 IpYtW60lWixKcO0hxrIedNu3omKTThK3lTGWAPU29/kJfyndjZQqxmX0UwO5IdjNCc
	 mVYrFsk/stI/6TZQSSWk2g5rseXaCJTtUAOAhJqaYvCKz2zi4nS5FyAsQq+xh3BmOL
	 wFi8OVJdmPuGW5CksuR5aRDC6xs7AmyMV98wwCvc6Rp20RskU6e+qaa2MbrFYLc77z
	 DMzKKB1MdONvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BD5081770;
	Sat, 24 Oct 2026 15:01:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72724D35
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 576DB40978
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QckR3qxkTIqY for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B5B1B40A0C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854053;
 b=h+6oupEdEKG6le+dOdtLqI0HPcpUQn+QwlBI5HnBZWcd2lyE79981n1KXFrZZig5QZSF
 Mk9THCC/9xbftEpwoR0UtJ78DeXP464jMGghX2YBs2rDgKkfRd+J1m4glL4dDkdyuyTv1
 uAoA9IGKe+elxDLAeQYPtuvjrgRhiMrtpLmGb0Tk76Xg4v4+1qJ/+xOdMZUqokbVjKxRT
 yn0PCmIKNWbyqfj1h9ch9ABQ9gpeQIjRMr/bGPkRA+E0c3HXYCLRb4tHxGJIu3F4SRxI2
 uABZNgkfYoDiyG1iAqnDOebsq89dcSnu3Guc9lHVUPwZSy1RS1HTkNDppJlulYaiwBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854053;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5wHLJ3PsAcG6KuvXAXRv4ue4lN5N6b+5xn5jkhaoeik=;
 b=Co1Xgzw9B6ufbmXcTKXhhoCOVqD28VBeWIBG/gLG2TDQK8O55471pXk7yYPMKc3+Q5ku
 Os4l4Nf3FKHdqqcloUL1vyYM9IkYxffkh0PeTXRg/DrjAg90Ba/syY3Eh9xbD7pfJHts+
 t4GJmytaDdJH1HKj4/AI5A9ufEMOnlZdIQw/FVkCeEwEz6HVsf7c1O5Glsb+K0G+1Aein
 egFWFH0de0FFZ4EXtb8WFs0NKJdDuRYPJmdwQuzvvnuFSZR51X2fDJ6ee/Dfqiirv0KCw
 nV+s0v6JcnxuxyQCz78P+/UQ2Pclf81IGnA0WJlfWMO1m8Tu1pqencUW2ffacIvvRnw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5B1B40A0C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB4A59C84B; Sat, 24 Oct 2026 14:59:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22989f4fd1529e4d343d66f111d19b2a93091ef6
X-Git-Newrev: 7ff6cbfe4bed6639a1826c6b8ce83e7f4b89e58b
X-Patchwork-Hint: ignore
Message-Id: <20261024145928.BB4A59C84B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-markdown-it-py: add host
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7ff6cbfe4bed6639a1826c6b8ce83e7f4b89e58b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable a host variant for host-python-rich and include its mdurl
runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-markdown-it-py/python-markdown-it-py.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-markdown-it-py/python-markdown-it-py.mk b/package/python-markdown-it-py/python-markdown-it-py.mk
index 35ea875ab3..b5dc1bd5d9 100644
--- a/package/python-markdown-it-py/python-markdown-it-py.mk
+++ b/package/python-markdown-it-py/python-markdown-it-py.mk
@@ -10,5 +10,7 @@ PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/06/ff/78412
 PYTHON_MARKDOWN_IT_PY_SETUP_TYPE = flit
 PYTHON_MARKDOWN_IT_PY_LICENSE = MIT
 PYTHON_MARKDOWN_IT_PY_LICENSE_FILES = LICENSE LICENSE.markdown-it
+HOST_PYTHON_MARKDOWN_IT_PY_DEPENDENCIES = host-python-mdurl
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
