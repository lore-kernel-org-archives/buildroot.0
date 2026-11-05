Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCE4606A335
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f7icbEKv
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4455181701;
	Fri,  6 Nov 2026 16:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3WdTjO8_cJU; Fri,  6 Nov 2026 16:09:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2A8E181700
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981354;
	b=DwpWzx+nwYNf6LTHzYhmPj78z5K/iKbiDODhepyfkWVEX74oXkovzrVe8yq5UdZ0jy5o
	 OTPuiZR6XLP9mqumkXIvWsV8jhZqbLP+gtozBcAcphvvf+m81x17NTyLtYA/f2JjDe7nu
	 ysFSFysshEHrTObi4itT2gZEF4kfc+cMqaAF4WEu5ul5zbhdlVE7hAWPinMHkmqfSnIzW
	 roRvHNyMG6yd29Ke8L0q1rsr4dzDMAYIHUl9CNJwF4H2zDcQ4rPpkLbdw3VPDjPnOYSKm
	 lwO0S256rBLlliYF6uxnwf4SAzoi78YhoK0LByjHQswcD31cgMA0g1EgmHN+Mc5V+sA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981354;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=X9qhUWnU5MfTVHWhB4c3ZhWezR2LVuL/6BcWStTZs7c=;
	b=XTn8rxNTuz678JD9HF/0LURRJymLtG/OFa2kghu3uXJuQXr/ci4IBzYWNVX/n803TeZa
	 diiowOMgbd97HHER6v39FDoGS7ikDGcCDVmPgNy4pBIpsdH+TpHyOHk8S9sK7ZnluZUL7
	 wdiBN4FRSUCMbSGDfEnAK9hSOj01xAxthgLRIaj6gJuCJ16m/vrLtwVWg/pt/L0oncdtc
	 SDMYSvJPg4/GsYmjwTQ0JH22cvdtpRXsczvsIdUrokYtK1Xe3BxRLh2zIxSqNY44V62si
	 4b25qhIZbC7gM3ilxIy2VP6T5DW99oWrfpzwQS+ZRt22GflCWB9rSDnqPgEi7srVnGQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981354;
	bh=X9qhUWnU5MfTVHWhB4c3ZhWezR2LVuL/6BcWStTZs7c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f7icbEKvpSwjx8JWNnOdbDoCq85BJ3oKMa9NDuVQKeMngxfunFaXvHwVH85gBhZFU
	 TdHSmOHrc1IgxirxxxKrlQsO/0LI7qrXA89YV6x0iKBpGu7HfOBZ3jzHwDxPpCM1bS
	 hVjfOsTbAHs/dDBM/1JZ7ZjgyxuZcRxBY/KhtpkvCn564x5A6KjFEJbZfBduFK1yZ4
	 83/aUyQqRvfT7vzmeeXV+scZiaIZRi1Muz2euwz1QhqQqgSRd7XS/LOIcPvJpqEgzu
	 GvEhDCObdmYVHhu0jUDC88oztEPmil1RK0W721iimw7NzCNSljrrAoYeAM08+85laq
	 +40o+r35VVD5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A8E181700;
	Fri,  6 Nov 2026 16:09:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51AE47AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 370CC608F6
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k329t2WQ0ROw for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7C489608F5
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C489608F5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A58989E09B; Fri,  6 Nov 2026 16:07:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 372a320424c5ae74aae568c030dc6d6a0a956632
X-Git-Newrev: eb40246f82e9b9dcea9eb79d8c6241ddcf5d532a
X-Patchwork-Hint: ignore
Message-Id: <20261106160709.A58989E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/python-platformdirs: add host variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8334785815706309223=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8334785815706309223==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eb40246f82e9b9dcea9eb79d8c6241ddcf5d532a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Enable a host variant for the standalone pkg_resources package and
include the hatch-vcs build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 85554b2b51098d27d13059a862ff13612b0b3e75)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-platformdirs/python-platformdirs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index 55aae1e1af..0aebffb6a9 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -11,5 +11,7 @@ PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
 PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
+HOST_PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
+$(eval $(host-python-package))

--===============8334785815706309223==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8334785815706309223==--
