Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63D5CA5FCE
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 09:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E5A44062B;
	Mon,  5 Oct 2026 09:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xkpUEO20ah9; Mon,  5 Oct 2026 09:21:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9D15D405EE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791192110;
	b=nai0fx+4+tMXBkcQfB00u972JkFN/h1GE47pmLESdlrorq6BRZhJ+K9/eyl1vFeiQRe2
	 QmjBr90xQZ1c/GeLDQZiA0g61mPsY+aox/HD+bnW+9Gf/GpXD/sODYiA/MvT19lb40I7a
	 5iyR1n4ijguuuTOPSumngCTR1zglzJgD/uN249neiGXICr7D+GHQIIRWVr0XBJYOi0vDw
	 jrlvZ5KYs0tNhxUMzj1pi7QJERnzTQoiLX+wAOFUXfjgJQTrv+ZLpi5ftWlkQLQPVuyJo
	 +TtCfveYf03vnC6Te56OPB0roP8iBWK74ShI9smn1LzUYX7cLNmDN8yJbAxOeH4dCDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791192110;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YLrGTaOU2yBfqQPAflkVA8wK1pcKNcKWkfoKbLQnh7Y=;
	b=A7N5+p2JZJQz1Xd/bmRKCxSzcmraAR5kF+HXxmaUmmbR43/JihFNdyz5zgYkdAUG87U1
	 dwOcqngpqCdpnna7w7GSwM5bNacqtqVGVxxPYrgXqJ3G5C+NQmtvXKspKApBl3WcfxooG
	 8yHYaLG/QJVKo0uBLdYZOnNgt0WWSUVvxrJqYJa20Ib7h2gz02PYJqGiF6zWsbJOJOhFF
	 1DeOULRXhV4opyG31JK3RvGt9ANH/VaPSbXXBzcq3V4YVaxA8E5QAahYOthrkes1G+wzC
	 M+DwBFOZGcL/sMnjKxQXsrN/oxYMT0zZUPm3x5+KIM9NRqxgZZ0RGfmibzJ24lUI4zg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791192110;
	bh=YLrGTaOU2yBfqQPAflkVA8wK1pcKNcKWkfoKbLQnh7Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ax5hKKOx809l8JmGfZDMNkHValZKn2bROVQwAUMWYy3H6gKCcFyeU7qptARgP1hlm
	 gFfmswKOKMPe+3jgFeMJUUJWCzak6Q6+kyB1vZlseFFZ1TWrGnZLBRYdR2kE8eRgWd
	 iubQNkTIlTXiYnSkwb4IFrxcqdd3PgifDYBMtLpblMrMYbMbTLpU9ZF3HebI5vyvlV
	 i1N1pbAXjxk8R9zYfv6ZqJEnoPalhcvwRZa2MOzu7D6v1EfegNVUoRIHwfYumwck+Q
	 BCk76Zqjalf26Icm/gfoP599dGa/YqIyAvV/MKfGxRxHX5LWWuVXh8h07bSiznrykU
	 LgnuIrE+FtzyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D15D405EE;
	Mon,  5 Oct 2026 09:21:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD3DD34D
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 09:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B340280C4E
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 09:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIwrKm0HJgcQ for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 09:20:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C8E338085A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791192053;
 b=on1WbTuBouc/q5kSsMcz+mrVnstf/KwgyBj1MswKpabwn5milxFmE2aGvMLjnK+E8rs7
 dVvyB4gO0qgRcd3h6fJvcSC/eJaVNLObgWkhU58HUI/IaSgG7oudd1YKbZkk+dSRYpVB6
 I9Oyq5t66tc6egkxxP7cT+pmcanFZBiCve82TwPM+wtW1LQBjCFgmVxPfjGetv08uzwaT
 Yk+e2PzhiAtBjgKKBBWX3XLdGgAbZLvt0agAWqxOXfp+uNwr6pS2kQenx/Kbp/aohALm9
 1kwUtVjnOvd/TsDy/81c5WpkWKmIE1i7EgNjoT9ACpkmVrZBBAZcNEP15NedN2de3Ag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791192053;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=3NDdwkqQQSN3BJtHiJ8Pb39WbzwCMHVVeoTHI84DqF0=;
 b=RGRdZ4pqSZ2C2mW9ighZPZN592vrqPT7UCYV3YrPj977JKGowaiEEr9lYiFyoOvt+hMN
 qobb5VrNxfq2NAckkMCY7+AjX10BH04zNqEr40amAHyFuhGJiSFaJwqqOq11tB/hEhiXH
 suB4GIehjkqo4eGleTuv+ebOU5KudIwz9MKtvSr0Uttt2xXx8KP3/6F+SrItvdCQZIb5P
 muCBdY3QbMLiVv6dtzXBhqCI5kH8Y0SfTVgXX/b0gwQTzYOaPWci36SfMAxOjdRKHwM6E
 ChaxQPcpP6TtfDdQRdCM1WVXepb9RHX/U01XZX4/QmL2hjkqKbV93/65pzIhM1KJPTg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=dMWGtDTr; 
 arc=none smtp.remote-ip=195.201.24.99
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8E338085A
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 09:20:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EEC621814BB; Mon, 05 Oct 2026 11:20:47 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon,  5 Oct 2026 11:20:32 +0200
Message-ID: <20261005092033.925097-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/libabseil-cpp: require wchar
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

absl::StrFormat() unconditionally includes <cwchar>. So a toolchain
with wchar support is required.

Fixes:
https://autobuild.buildroot.org/results/948/948463b01ce52456179b06ae17d4ace9a823f92b//

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/libabseil-cpp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index feb4963042..739e6d279e 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	default y if BR2_sh
 	default y if BR2_sparc || BR2_sparc64
 	default y if BR2_x86_64
+	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
 	# absl/base/internal/direct_mmap.h only implements DirectMmap()
 	# with mmap2 for the o32 ABI on MIPS, and its 64-bit fallback
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
