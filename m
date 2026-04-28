Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B6EFF8875
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 20:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BE16407C7;
	Tue, 28 Apr 2026 20:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDegHjMpVJxL; Tue, 28 Apr 2026 20:46:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BA77407CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777409160;
	bh=IF9SmP04a/2duYcB/KDFWMaUjwZgMODCJIcl+9PK4k0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dt3QZ0Aqtj9EHAIkJxa9X0DpvGUsRHKKmDXPdfIVSnYJL533rIvZ1VNJjO8Ubo3Sv
	 xbPysbEU32hsYyjn+kxjpSSV8G+rO2mbC+veqDd+aGxE09sdgYGBAISe79CrnzfOYf
	 P68TMKKl8GOCDczVnAGtoPSzYVy6EIP77G9pO44hjHRC6BLZFhFselh2dMBUOy4etx
	 Ff74Ok0CeJ78nLVe3oF+/sxoSZ5kAGkW1g+1iY+DrDe/9yVllzPNS+IW+L3BI1rumF
	 pRkQuSMXdmTf54ngRIYqDtRGhTWf1R4aHeyPoyXfbkySKMifTlumsnbmKm6F8rkWWk
	 xYjftqFcIxj3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BA77407CC;
	Tue, 28 Apr 2026 20:46:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D39941B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 20:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6117407D0
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 20:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4e4QhTlswYKS for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 20:45:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F3A26407C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3A26407C7
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3A26407C7
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 20:45:57 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-35da1af3e10so11006590a91.3
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 13:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777409157; x=1778013957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=29q/23TNCakapOev/P74W/TuonGTHowQb0ZBmYub22M=;
 b=Xkgn0+k9jqnfgtldOukzyy1ZD/OoP3/nwLqLmo6WgonZcy3ASpw2jGFtrroDQmw9yZ
 n3QFqXeUqJkzErwsOblZ4XQe/vci6+1DCTgKr6oe3+q2S441zOSii5U5W5yxMDjHXBaE
 8Uw4EZeke/FqJvPdYNErBYdzZEUZm1T5Jmfr0bTyfVX9seE903q/UNn22avSxzYjL8OT
 szSWSYUwE3opAQWrDMKs0JNZ6JItrf7aZZ9nvoo1nCYLa4qjOJAKBSr8CoyKcCw5ZuXb
 H33mIbcqxfmBru7PtdikJXOpXxWK8yYixZ+P+T8r1P9nc9LnYTjTQVlL+Oo5CRmbhviZ
 QkGg==
X-Gm-Message-State: AOJu0YzZeFxL4wcuFAS/sR9lLAP6hu/AXV++T5zyca4re/TmTFvYQy1J
 feHquiQGVN+DjO/c563En5WeMKMSjE/YnvTfWQpH5aOXO0Z54boC23BvKJN1boHu
X-Gm-Gg: AeBDiesUBmall4kE7NiVhidYZSPoKp6kKv/vlNtAuHtFjW2xOnnTOkW2csPPVoIVmmD
 DO81E7Bmvz7/bigK3WLraJizPL+lhoqLPW+CDxzdjDxsim/08JLmu6LZzxw0VdBcg4y1bnw8Mx9
 jJ8NjBARArrd0xjkzSCro5BmThVZ7YTnc3ARruV+uMMUXzpMsSxvxVIP0hVTWwzIhcbR+3iSmFG
 mmeDVAU9rvnvDyxaeGg5OlaGogEGtjlp6INxJOGEr4mKPTzxdTMCmrcRBDiqjdUUv46/Y1XN6vO
 KNx4beS2OitIiQlNb7jQZj+EUeCL/7LXRHy5ues2CCPm6bGadoZoPDUKGt+mOG0DMX+yD8fbL4y
 1aUsCZmFrzWlSEWdriVVzd+jMIkJXhRtF4oQzgl3gQP9kXxdExvZ4t+4u7q2G44dBvs1xY4AhVf
 9M/lbV4vKXTB2ccG/xo2MoLgfVb/0EAJkuaGwkT8rBRjyTQZA=
X-Received: by 2002:a17:90b:17ca:b0:35f:ccf6:69a5 with SMTP id
 98e67ed59e1d1-3649205a55emr5030281a91.20.1777409156823; 
 Tue, 28 Apr 2026 13:45:56 -0700 (PDT)
Received: from fedora ([2409:40e5:1178:d0d6:4db3:78fb:ce74:a637])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b988963ed0sm1056125ad.65.2026.04.28.13.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 13:45:56 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Wed, 29 Apr 2026 02:15:35 +0530
Message-ID: <20260428204536.2085875-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260418073313.37718-1-chakrabortyshubham66@gmail.com>
References: <20260418073313.37718-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777409157; x=1778013957; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29q/23TNCakapOev/P74W/TuonGTHowQb0ZBmYub22M=;
 b=B2H3pmFNVPzfH/8+PBmel1GE8OtXuDpMtneGGPz1jWZy2E6iwdabs8cRFleqzhZ/Q3
 +4ZAmMT4iRo1Qi6qCaa4wOLGtqvOuJ8rcfBZAnqGjj++k2O6yby+VuGMEgsmtS/6xxXA
 RlrMiXxFpIv05sZ1sNH8/CmgNltB0hmj7NyRw1nl9w/GIJMbC8PVyXTLMLydXZkUsLH1
 FiCD+t5AlPhrpU+PZJ2lsUuOopm53u3obtutF4KwlGbzLeZWzBcx4MvAOAEZW0S6mH9I
 HNx1ZKQjSJR50wyV7FPNtAhXKE9h+xAaVdwgVi3978jprygEFSJqE/cUizJscOGKW5Bq
 NH+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=B2H3pmFN
Subject: [Buildroot] [PATCH v2] package/psmisc: bump to version 23.7
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

- Fix --disable-statx build option
- fuser: Add stat() fallback, ignore EACCES errors
- pstree: Fix assumption about root PID
- killall: Output formatting fixes
- Update gettext to 0.21

https://gitlab.com/psmisc/psmisc/-/tags/v23.7

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/psmisc/psmisc.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/psmisc/psmisc.hash b/package/psmisc/psmisc.hash
index 646c01b3c6..f16b95eee3 100644
--- a/package/psmisc/psmisc.hash
+++ b/package/psmisc/psmisc.hash
@@ -1,3 +1,6 @@
 # From https://sourceforge.net/projects/psmisc/files/psmisc/
+md5  53eae841735189a896d614cba440eb10  psmisc-23.7.tar.xz
+sha1  89046d35a8919def79200115c9cc78e91b98ad53  psmisc-23.7.tar.xz
+# Locally computed:
 sha256  58c55d9c1402474065adae669511c191de374b0871eec781239ab400b907c327  psmisc-23.7.tar.xz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
