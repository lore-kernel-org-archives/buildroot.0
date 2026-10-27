Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B7D606A31E
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=duzIG0bY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=kGcv8ICa
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF7036064A;
	Tue, 27 Oct 2026 14:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMBcV3dOuwjL; Tue, 27 Oct 2026 14:54:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9F5CA607B1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793112840;
	b=oWs9NhhjwSw/Zr5WqhdJ5crtjWZ2z8yAZNMUofctGmGpynvMYnRmoJLgOB9KmBIrXkJ+
	 6KQBu8dy0/MCk3XC8qpgPsBj24MB9rwYDs/RNVG7XEVROPLo4zlPCZKtV+dHoZ2yNPMvr
	 ZxJgKYcxBeJaD0AAulLl1IDo+A3Eayiwl/kJNFJ1rOOQm/opr6i01Uj52Z2IBt62a1pqq
	 SO/6+FMq1A2w2Qkml7kezZ4oi/+2EIoF1Can8ctNOmrXjui5ZORRXl9sl6+OGKeI01Kuf
	 ZrPkS35n2jXjemoZ8Xp3kqymSZB2NcCf9AnbrtHuMnbGNxYC2V1RfmqGomF0us3rO1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793112840;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EKHpgHMiPSluHquElmxUzDm8jDmWREbXtAlXAqNOXR0=;
	b=MEE2BoACs3IMRXmJJ28c555AeCYf3bu7HmOjFQ78qQJAdlfJjKAPHd3jw0vdDaPxQsk6
	 l4OqKyhFOpXEbGz1glFq8VEfaerGpF5GquoAyNJbm5G7lcznb1stwTeIOH4oSB9mPMugB
	 HJyisswhWM8mif8zBkScmafXgdMzw/JCvYWipFl0tulSV5Ld5/WqYXI5F24bvzICgjwGT
	 7AQkKYP1vnJFjum1ZDB0rRCAjUcS9vNYLuu2HbeBp1qmXlZ+LQFxhLAeQOvimrTwmhR8/
	 D8M7ftkXc/C51R8dF03IlDGpVK6NIKz+3/ykw2lxx1OTFWcJmqEFBtTUcbn57gzIYtg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793112840;
	bh=EKHpgHMiPSluHquElmxUzDm8jDmWREbXtAlXAqNOXR0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=duzIG0bYkFYDG0LQOiGrK6ITwtECEct+JEuUscXxR5te/ecGSFyD7574l8sm7/89S
	 gpQ0rsiSx3SBWzBVEJPfKBUoJ0GHzw2oyWN0KDkwUj2Q0AYu/zT2FzjVzBKMTnYUo1
	 UiL0MPqP25olk6HE2GwBqgpO0swK07OQh0s0f/x0jg9P/w3UGoH1mRfrKyzCG5XRpN
	 /cTZA7DsG6alj32j5mqQHW1K5Y4YjFMC0REXLRwRnEnR+WrFQLHDLeziJfSTbu3YKB
	 s3q2YEoChuCxSlWem8mblNuKpcOqx92BlGDKhPD/pJ6/ScV+1tn6zV4USBEymHH1B9
	 juJPWaCsFdf8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F5CA607B1;
	Tue, 27 Oct 2026 14:54:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB2DDB91
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1CE9402AA
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMVEb20EOKiP for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 14:53:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E11BB400AE
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.131
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793112836;
 b=tLdRjf5/cWV7f7hHJoCQSMWL7G7ZwX9KiD9RtWph3Ja/g4ep54PAnZI4VtIDzVY9OWqz
 4/LlPiPNcY0cRHAWBAOvrsSff3AhJuSIzRXiDNojHuKXivNW02eFdX3z8RVl2Puhn5e+W
 5LprIhfekj3LcmUW3MW9fEGioRJVRKRklvfyAXGRWdoatPwRArJ4k0yqRdLSo+Ji34rYD
 n9770pUYs0q4BiLBgtuFf9aWFAYOaOnA4EnIxdVGeUqdKHlWonBx90iIgTzmDeFu+m1pC
 mjM3XGNoGBP9p40e4o/OIwoCVO+UZi7PPVbQx41VBp/ERZqloubCKRVl6NzwfNEYMrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793112836;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-CMAE-Envelope;
 bh=yjv0W/epymnZaH2O6a4Jyotmkg2ysa17QJtrLPh3pnI=;
 b=qDIMxyp3EK1rHEcRv+V/XPzYGzqJ+y9A5tWFYRbig6MHloOWNb3fZY19k2WE45VKRjX7
 GJOyDScoxmYRPdX7wP/N+dePRwZab/gY9o4DKpOoTVTWNtKHvq7AmJqrl8Lyzsg7SH1Id
 62oovDhJkhZQa8cgzJqG84YMwQVMt5lWj1QP8QfBHv2/4cQ1j9a6ZAhbSFdsfZeQGdvk/
 r3mqHS2wxF2B5d+BREH31KBR8bx54CTJq8kwtmGhrdvHHJkq3x6nxmNJ1z2FY6DkHh18X
 +ZKx8pamA/u3W0w3jemN0SNwEtaInitSw2N9VMoa550myyXZP5od0ZZLBwrd//YLCcw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=kGcv8ICa; 
 arc=none smtp.remote-ip=62.149.158.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=kGcv8ICa
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E11BB400AE
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:53:55 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id LiYhxeSyQtleFLiYixL1UT; Tue, 27 Oct 2026 15:53:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793112832; bh=IhbL0VtL9py8HRofYiImNJaxwBoj0y9Y31xlLlb3FXc=;
 h=From:To:Subject:Date:MIME-Version;
 b=kGcv8ICaOijUYYps7LbsEmIqQzXpWwNMUGYSYMWnmUhiTM3fX9zJiAfLmAfLBJTl3
 1Jo89fHSHk5nDfj+JBHPIGUJ4w5qhQ/G4ZD0KyRkOpNF2Nvk9MadsG/2v3KNCpIT45
 qwQQQxNkozVMq9sTKcdJD6p+yGzSFOtyM+tgH91GROzKl3yKcLAB4aphNPfNGmoK6B
 cSUyxhu5XTy4JuHYqFEkwjr8sIZGEEkWVhX44BsWWDxYMvNGbAO5zln2iEOlMjG77x
 hMoj5ghlSOjmZReJFtKZjLdfGbShU9LgsUv02RvF2lxCYKRDUdLVHfYwaTWvsDvCDW
 rc+t6bzEBf7mg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 27 Oct 2026 15:53:50 +0100
Message-ID: <20261027145351.1527631-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027145351.1527631-1-giulio.benetti@benettiengineering.com>
References: <20261027145351.1527631-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfD3exo0Q76gDKh8viJGcyPbKnpAQhfhtffwObzzTe3xKkXDRDKFhwccsQXkHKsE23t3wxJEI80neMEZQCqYJn/GkwJLBSHhY2Zo2NNIHCdtk5Whtn7Kw
 k0OEyvtgHoLhXDee2F2DIB0c7UaP8ItugF5qcrsPZ+/uLF6RwVDeTCS4q7XkW0S4c812ZNCE9RDoeOLRy0wrcUG/OJ4fX0JxRwRw7mWqDFRobQFl2kABp0Ld
 3IkKMrZKhOKs/1VtxHwmTXnczVqAexPZZIhuOGhLwE7e/HeGOF+Kq+sT/mGRFtzhEJpIqAMATxJBo8OqUkUXEg==
Subject: [Buildroot] [PATCH v2] package/rtl8188eu: fix build failure using
 gcc >= 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Starting with gcc 14, several C diagnostics which were previously warnings are
errors by default. In particular, -Wincompatible-pointer-types was
changed to a permanent error by GCC commit:
r14-6037-g9715c545d33b3a32ddc1ae817ba9356ade1fb9df
("c: Turn -Wincompatible-pointer-types into a permerror").
So let's workaround this by passing -Wno-error to USER_EXTRA_CFLAGS.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* rewritten commit log as pointed by Thomas Petazzoni
---
 package/rtl8188eu/rtl8188eu.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 5f378e0b6e..6ce398933a 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -8,7 +8,11 @@ RTL8188EU_VERSION = cca7c28087db740d7d745e81e4096c9eb9084f9a
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
+
+RTL8188EU_EXTRA_CFLAGS = -Wno-error
+
+RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m \
+			     USER_EXTRA_CFLAGS="$(RTL8188EU_EXTRA_CFLAGS)"
 
 define RTL8188EU_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
