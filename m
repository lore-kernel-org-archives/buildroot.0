Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5AB606A330
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZbT+zKAa
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E415F6086D;
	Thu,  5 Nov 2026 11:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gm290qm2LY67; Thu,  5 Nov 2026 11:27:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 93C186083D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793878067;
	b=Zts3+HXZaV1DSRYSLxnK2QCRa3z11Kmxo8+2OCemkwmSlZFuQvrLFkk7VUZc/C4K8mvm
	 16xKwz7GtMPKSAGf3R9HbWD8FPEjlGTmVgmxM1f6/Nt2ZQUk+Um+KOWRrx8vQfcJjGuuC
	 x5R9E2iHo+kmBE1EJWXVbF0DCKGdbNn7lOeiGO2gEfrpvK5f4eyGjXnAOcZmFDIeQFwLY
	 kye1zsK23UWhWSacyBCL5Qpu1lJJ8WoWW46EpGDVc3zuzzGK53C4S9HFK6z6/rsnnboof
	 AF08EWpyjvYvEouv2eHEH4HKtAplSLtWkzWTS6fCC1fq/BNkKWKlkGk3+YgJ9JXRN6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793878067;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WNcL4BlCDXm6LqnT9rOeV0RgPTZjywoiomY4APc4WhU=;
	b=Gvz0c1N5fe1B16IO2oE89NkZqK1EIDyosxIfRzzvcwn1kqHOF5U5IVgEwVQ+CbiDv/C2
	 H6YC6YaO6Pf6f65CenIy+rFzYVbLSAkPBMJgXZo2rUDDoq0YclIHifBehfHP0fbwz2U5i
	 E6KBe7xwotMHiQtVh0ghC+rUIw7ryKlmd+Q90ey4kJfZSOYlmI3ahDUu6k4rt5c4MnbDw
	 W+0Ur4RrRhGRC+YEaB7cCViln8wOUrtyp3wfW9B7MZkZb+eMEowSvCaX3rq5jXMc9BR3N
	 BZ7A9nWGjkL9ZGsojKBE9hJpRib2d7t+awFLvvN/ZUaFAaEKKLF70iQWoqEF3TXVwEA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793878067;
	bh=WNcL4BlCDXm6LqnT9rOeV0RgPTZjywoiomY4APc4WhU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZbT+zKAauHxw0EfHmiDvX5FGwVnzztznJ8lffAAzx6mJYOc1ZErGCj1uTYCtHN0wK
	 T8c6mV5nHDrBxGc3GmLE9aIWw8Mrc9aZ5yjqKrJjE3/4HPlqvFZpa6MKo28fMqas9W
	 fVgbNt9ST9uLSIOYbBsoka6tKTk+SymXaVFzy4bjCLjDdwxB2z/aVbk0AInkafvZ+W
	 ZMjmYt9KqgX0g/9jmDmjfl72Z+Yoc53GBz2/XeVfgKl8WD2G7GnBItS3yLp2mpJUxj
	 oL+EIEnCA0Hh3Q0LledJ1MadYPABI+h599odUfYgn3q7fBRpzApUANldhKqtQvRNyd
	 +BtrCr7h7rPow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93C186083D;
	Thu,  5 Nov 2026 11:27:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B447A2AC
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 11:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A614C6083D
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 11:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PEFdFPnth2U for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 11:27:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 81C5860728
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81C5860728
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 11:27:43 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6b2237b596cso3570292a12.0
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 03:27:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793878061; x=1794482861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9Em04nqLmHovWmeL7pNJbis+ZvVB9OhboT0sifFW1bU=;
 b=Giy03b5mk1It+QcyM4wE7jdudUsDTjTj3dM5IoZ5Jq6FFcTOSyBjUaNIqC8BpvbnG9
 aM7wRSu6sFFZOUAakO8zWBhO82hsjY+rpmovMfMLwWjdqqS6TCqe9cmo3Y1w1uCPMUXz
 ldgkZz9ZMrYlkVrsnk5yxTtEDVZsCpmrgGt2wsPzl95CGWrgZ7+jQ6J5z1ZhctOtbaDX
 17rBQmTs5zygn/w87DoXbSVOrkoS61uPoQZ/HFtjK/oDttTtXAZI86JlNx7Me3JLsQFZ
 e2qfEx6y9Zfen0I6rzfHKoM6YJ6SUZ7p7ryILT/xzTvb3Rx/dY2bjfYv+PuD7AoQQGG8
 28Bg==
X-Gm-Message-State: APuU4Z99/WXI9y3Lh5UUC8tYD3gUnDh7OC4j304I4NZQGJp3D60CQSXK
 VkPF9lzVn6tqqHGPNf0n4RTjeLErnRwNhplyVY57Zie8MI3d/PyZw/xcaMfwag==
X-Gm-Gg: AYBFou3A4Aszs37uu8+6d23zSgobTj9m40lnzyFqApdEgmMi/DJyjJx9sB/ctBCQv1m
 LAHtALqARTUU9zMpM7qS9IuSb+OJoqEhDa37Bd8gRl0OSN+eYwgl4MC3w9FxC+0sUrPs/2cs573
 slri5LRD5Q+3J9iBtp50mF84BEC8rzlfLK/N40Xkde/O+et3C5FWHJQfe+MIKeLfZPVucX0Yw2g
 t36ihGC4sU4xbAVJsg5uw9KyvJM4g1oDRiZMAArXrQx0iK+/0vpkF7Wvdop4QP9Fsg3TTBgBSls
 m0sNnezETzowzyQr6Boj9QdMPdvgNOJpORWGKAmZ4UNDyWQPY3MrxCazj5xclJwuIR39KnE6GnL
 6SJ/akh6SjcMnGWPk7sAirUfNEU+z6LJ6sME/xMwKlvB8iRPOXHG9GWqZLK+FCoo8axOoL+TmXK
 Uh6yAmrKVGbxbD5NGRLdkHZAUStIWaXb+ad3R+Mc/39h8Iommz4me3haFucMU4W6aJkQRyLq3UD
 89w86qqd0XlG4gRgs/Gxfgw4SS/JPGr3e7+l3/wVIXb26x7durNMbOqp5b8iq7ImVjB26dxucWe
 S6i4twe3B0aMaQcLD2PSWFldSE+94fUB5s0kJhUBKAMDMOiomO5CbkZJp3Zn9t+hTmpbcnFZgwo
 AJQEWwG1p
X-Received: by 2002:a05:6402:5020:b0:6b3:d0a0:3a2d with SMTP id
 4fb4d7f45d1cf-6b4d3370d36mr14348589a12.1.1793878061214; 
 Thu, 05 Nov 2026 03:27:41 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b55ac44f48sm1722805a12.12.2026.11.05.03.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 03:27:40 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 12:27:40 +0100
Message-Id: <20261105112740.86502-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/file: update Upstream: tags of the
 seccomp patches
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The two seccomp build fixes are now in the file@astron.com mailing
list archive, so point the Upstream: tags to them instead of the
Message-Ids.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../0002-seccomp-undef-pread64-to-fix-the-build-with-musl.patch | 2 +-
 ...3-seccomp-fix-the-build-with-kernel-headers-older-than.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/file/0002-seccomp-undef-pread64-to-fix-the-build-with-musl.patch b/package/file/0002-seccomp-undef-pread64-to-fix-the-build-with-musl.patch
index ebb4637c54..18e354def9 100644
--- a/package/file/0002-seccomp-undef-pread64-to-fix-the-build-with-musl.patch
+++ b/package/file/0002-seccomp-undef-pread64-to-fix-the-build-with-musl.patch
@@ -17,7 +17,7 @@ Undefine the macro before using it. The same musl issue affects
 fstatat64 (bug 473).
 
 Assisted-by: Claude:claude-opus-5-5
-Upstream: sent to file@astron.com on 2026-11-03, Message-Id <20261103050039.3844049-1-yegorslists@googlemail.com>
+Upstream: https://mailman.astron.com/pipermail/file/2026-November/001737.html
 Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 ---
  src/seccomp.c | 1 +
diff --git a/package/file/0003-seccomp-fix-the-build-with-kernel-headers-older-than.patch b/package/file/0003-seccomp-fix-the-build-with-kernel-headers-older-than.patch
index e302c8d844..c1cf7376b1 100644
--- a/package/file/0003-seccomp-fix-the-build-with-kernel-headers-older-than.patch
+++ b/package/file/0003-seccomp-fix-the-build-with-kernel-headers-older-than.patch
@@ -13,7 +13,7 @@ Only add the ENOSYS rules when the syscall numbers are defined, like
 it is already done for other syscalls.
 
 Assisted-by: Claude:claude-opus-5-5
-Upstream: sent to file@astron.com on 2026-11-03, Message-Id <20261103050039.3844049-2-yegorslists@googlemail.com>
+Upstream: https://mailman.astron.com/pipermail/file/2026-November/001736.html
 Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 ---
  src/seccomp.c | 6 ++++++
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
