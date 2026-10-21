Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0DA606A31B
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AdHPFOKr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sMYJx792
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 892DF81F37;
	Wed, 21 Oct 2026 20:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcRq-UPgqQYu; Wed, 21 Oct 2026 20:34:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B790B81F08
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614875;
	b=DPRcQbWU47sxKVlZHTV2Z0tCUf/eABN/0wmsXOjQ2nB2sqP/dMr4fhXdTr76p4Rx7Uvb
	 UruLhPPIYcr1IDT2YOTNEJseprR/Q+V7O9ChwYQ9vCEIdTBqeE88gegxrc1G5Azouzqwx
	 bXf1dShqAlIZxicZXxIzIDct1/hnUCzmMurw5sctpg+j+uXeF44ULRwLY0YTS5EDt78VZ
	 8ZC4iZoZtI2tcXn/3I3kxDxSmQ4fNCtQ4SDd9CexkL+DMe/iXVkUex36V4L3qVWYdpvXw
	 yNGRSddcZdWP9ARmmnRWPeoJD2tu6VxwaRE+gomztHlIKMdqCt6BppS4q+nIy7h2icg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614875;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=+wX29zybH8xM+dP4zb6rB37qWWmPtQvoA2j7+rOo4Qc=;
	b=e27H7K7iHH5XNnLrMPLjXnJ9A2L7WLCM8NODXemzSVQ25aAleXGzPcgMsjtvZW5NmgO8
	 3BzM8ArC5QnO6f4iZBYTNElmo1Cx9JDHd4pvsKQSThdBxPl4b1PdGDvZnKnmq2h1lr+u4
	 TSi3kTFByahKtMSVOu7qZFVbKDPe6d7M/Er/JpyrgMIsFKyehFosK31xPG80wVgUiNlvI
	 fDESW6kamA/1yKtsMDLCv44k+uFXkBtYfBAgWbgaWEVAOToaF/yDN4aRZCVwdmP+oavmL
	 ygtSXeOuYPtbYlXSrmIECJLdWyQg9it+zVm0mUlMt1nL/Mu1vGmkjPRkDuw9Dh02urA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614875;
	bh=+wX29zybH8xM+dP4zb6rB37qWWmPtQvoA2j7+rOo4Qc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AdHPFOKrn+03EmynHhW9ppfWb0/rLFgDu+d+yRsagHCC3B8iqg5JY+ImvO6tMdzNS
	 nPb+r4/K10kpE/JGwp5IL3ZQlHqfft3tTUiqcCGnQa1KKepjsDDJF1lnT60Z2dRJSS
	 5hdbzoWuu/uvcuP8vh+7xBD7QX66mdT/li3IhuCDsOuZhdOZOCbbwv8T4zCvJFNuRX
	 VrkFJMNo+/e3+gALKwO/ccikKXUlzLq6fYbK981LC+7Xoa3VXfh2690+cVqZzpYi9a
	 XvYdt+AQfI2Rw8GxkOAVGXm+A8uR06tpbNNwdqxboIQm1uMZJ76yVd1TCDqARlooZV
	 CPfkkG2knREBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B790B81F08;
	Wed, 21 Oct 2026 20:34:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AEEDB769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 955BF61616
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s66H_7Uonscs for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F2DA861614
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614864;
 b=e51LV4+OV7qU1V79mXtlQSSk76BEtdQJxKXemXwzPTEdCQaUMnvi8Ni6J3SWu1ltCjd6
 SXQqZkIRvjZ078KXmiK+mnNZ14E+CQC7HJ9895IKZNAZeHFeed7kZmdA/LyAyP1nglHYX
 xFrjkhVnLw2V/13D7LdeTBo4ngiJUjfDGAzgbbYZcBOh8OKgRcEBpPU7Mc3C16VtSGLYb
 1x4WhCq39uz1CUmO+/5DIDQ9GTZiaRcEDVAhr2AP7hNrbHXcqWv9B3Z8e8blWWwlGo0Mp
 cIpEYIROxBuli1p39STS7keuVLbrKUG4U8BaXRLeChUrUZdK+hR6NylcZIixcdxY8Yw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614864;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=jjfNDWBDc/hW7+D1TMKG17vBqY1+qfr5lBXyQwT+9Yw=;
 b=nXvD7XBDJpK+CKlMq5C8U07SVknIV072PTXy9OP24x1COcXofFwS/KeYPuaFNN3BrjpX
 srX21e81Uy7MvHTJ3xGenLPHqQ5CN5Hm9I4JITK91wzhukKDZQabV7F0bQPvb2AGsfm/L
 1sW2JS76fMP6507CujEq5P6V8lpiv7304ZmAdSgkCsqX72yFQ3tA5GmJbQYHm801/Q5B9
 u1wQfhcSq5lo4xDv6KrMNobtawedWuaFBx0ARY307HkAZW3vwcEikKXcB8PGiiR4+Ejqr
 ttSlgO57spGAnMvHZEJ4t5jb+WIyPf4vGdZnUnHkodxxQJYGc9OshHFsShwBjIQFovg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=sMYJx792; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=sMYJx792
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2DA861614
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:23 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-8446af403b5so831181a34.2
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614863; x=1793219663; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jjfNDWBDc/hW7+D1TMKG17vBqY1+qfr5lBXyQwT+9Yw=;
 b=sMYJx7921CQ6nhz1+ATImUb/lk1vnEvqKdAbX2yL6y+UTV0qZ6iD/UtDohDdP+Z+wq
 lbupQJryucW3E4W9QJrsnamPiZwqveXqH/qby/nYhOv2yNVVYP9Nqm+GWCpv2weqye3T
 Ch8sVj5iL+oOM2pTK2PH/F31REQciX6mf5KTGgKWtkPHV0ZjLbLdbLLT1UPPFGoaAdQg
 mcaCB5QLtRrBKUQ6WUhpiAUzCL9Qi3/xxZdb5cBzKb4QaajKHGBPuDAYlLLxEaKc9UxR
 7eM1Jj2Gk4YYMjOXZ3vgQRXnHwWKwtKsUDD1gfmy9CMIJx/Dbu6bklVEQVTsfRW5i6b2
 A7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614863; x=1793219663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jjfNDWBDc/hW7+D1TMKG17vBqY1+qfr5lBXyQwT+9Yw=;
 b=dk08km9JU6decuWu2LQd+A4+oXMZyL9Div6GgIrtlSqJzPN7eGzQ2qm5wCusO3q4X6
 Pv+WafsCVq+rYaju16q3qP1jfpG95mUDplswepdRqZ5iTBeO+pbKni1M8/Wqu+l1gz6d
 wH46oK4B6oQSDPm+IuqVemc69oG17swEambHUUOGP9Z613AteocU1GUA5HJZinlpzQo+
 kE4fm6LIMKXCfxASx/MeGv14SHRIF/juPF3Mwfkp7rsXFi5LA5HcRPMVUrNev894EXxr
 +DHC5zisFJvbT20vIAFe2RDc9QoO7uM9wQTmeqB7OXes+tz6nLKeR/+qWV/YAoCF/gtT
 l+bA==
X-Gm-Message-State: AFq9FYKypLNaQEiGJJEJDKyMkkVe5xELwbifQxd3hbjiVLDFY44iby9y
 AEf8Z1UuBRL2F5jOdEN6Lg3hgVWZqvpIfYyCImw9fGeNVz03EhJnhyjPYgBN5g==
X-Gm-Gg: AYBFou3C+QjgXvkLJQlWQTcJ3vrBJj+1ceFgTl3E2IgZ6frbW+bkypWZDx/dJA83WNy
 bx5nPofmRSdwWrYaVBQ/bXYBSdHWEoMS0Ywsck7gHb2QuZuLlqAYjBPiwHooBSZrYNl8zLGvjZD
 XnseIkZJKg4q1zN9ATzFXuZoH0sv70SA9MLdAW3Ls1xiq8LkQj6FHudU6rjeuMiBHvklEJ4hHtS
 2g/PHXXrhSnbNbVvYJvct/wm0UuoUvdsGWLtP4efGxntX5QXWtNJPDqAAUeskNEriekrjt0mzGF
 nXgpPIlT90f4dngfhvpqoKQQLdX924v657dBhvwsjUed8Fa5WvUNk5FVsrCJ1kudYFbFXCSfw/z
 RIULah1L442vllYejVaetdDVx3uWGNo23IoII2116U1AsSiAgshegAJSRdCAwZ5V78HOqdIMZqz
 EPWQhCyrjaCRBhQobsZrC5pmn71/PMggFj3nr/o/tTNdPO8g6dMF2hjjTnEtLD/bFFA2o9UemcM
 eXaS7NO10TKocNNX3UCj8Pyzwr/aJVv4Jxwrog21ozMo9aAmhP7wK4YG2PEQ+u0FOxXzdOW3H0k
 pdbudY2qQSFqdChxRVlJfobLTFDQ/xTmXmpZ6Ia8s2BvAyjJDiRjk6+C0bbaVNdXDxkWJ8h30oo
 /Q4/OGbH5UdLlX++1u7PterUa4FmcIKNZuyUtHcGDvSY8Z6TZrcLEqHHKS9SsX8V7gtsoEZh/mO
 OAsxG6cuLX/KrgMO8ZlMpfW78=
X-Received: by 2002:a05:6808:4f4e:b0:531:3bcd:41a with SMTP id
 5614622812f47-553604643e6mr2620110b6e.59.1792614862787; 
 Wed, 21 Oct 2026 13:34:22 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:34:06 -0600
Message-ID: <20261021203410.3114473-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 12/16] package/python-typer-slim: add host
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable a host variant for host-python-jaraco-text, which now uses
Typer instead of autocommand. Include the typer runtime dependency
and the pdm-backend build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-typer-slim/python-typer-slim.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-typer-slim/python-typer-slim.mk b/package/python-typer-slim/python-typer-slim.mk
index 0be49b20e8..e6114b09bf 100644
--- a/package/python-typer-slim/python-typer-slim.mk
+++ b/package/python-typer-slim/python-typer-slim.mk
@@ -11,5 +11,7 @@ PYTHON_TYPER_SLIM_SETUP_TYPE = pep517
 PYTHON_TYPER_SLIM_LICENSE = MIT
 PYTHON_TYPER_SLIM_LICENSE_FILES = LICENSE
 PYTHON_TYPER_SLIM_DEPENDENCIES = host-python-pdm-backend
+HOST_PYTHON_TYPER_SLIM_DEPENDENCIES = host-python-pdm-backend host-python-typer
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
