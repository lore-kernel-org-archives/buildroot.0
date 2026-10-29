Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B6C606A31C
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XgwH8RB5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pscw6GO7
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A593840638;
	Thu, 29 Oct 2026 14:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USuMMawYwOwT; Thu, 29 Oct 2026 14:44:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 10793407F8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793285073;
	b=EZAwXxprpY9BXCfeNoIGuzVfZJ62tTu7WzQ6tgZDw8oKHOcPUb2UuHX907k28Xtl29lj
	 5AtHDA0nAe60lLBdrEogoNEF1zBSs0L2ghunNQ+8UAMC6GmNSLyF861xUZRZLLSMMV+l1
	 +fA2ZTKmz/Wrvl0O9KeJ5awxwOFYEDbwTcRu3aG9ChsJIbWgHXx8P37VPAN984WcrIdcB
	 jq8gzscO3w2KumajgstzmcjZ9YhtmOnvTcUdmT/AIqf/XKdA8oQwvHRsQU+/qtJnVt9mh
	 4/FoiJZKVOB2isilt7poVhjFO9D0xtsMm1erJVj0rp5B6w5OEH51yXPjlpZcULAMA6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793285073;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=3L3QSYQUjxDYup94ZnYbnFR3herIoJPwRr5gyYz2+1g=;
	b=f7NYyPl/NyLhwRBB3UQKS4cq4y/guV15kDB68D5UntsYtiNWOPf/p1QoqqOlBks407wc
	 rg3Z2x5afKQ8ARGL8siF8Te2zk7+DSRvx15DlHLtDILuPU5ZRoGUsxZDOjz9dr7PX7CCI
	 VWIDSF/TiClXk42+7BKlzobqUkh/OjbwtSaevseKQ3U3/0MGjP1lj7y00+poutHyZPzb7
	 N2MxIrNqerQOFQ2QNQ0wTPsKv0kAkX+0x2XDtfwaYpcSGGVQQfrHjyJhYbh0STdHPI1R4
	 CvL99DZnZV6oWz/mtV6dGgDMlxttFb/5vAL5zhPkvOoUSjVvqC80lHDPSclLRixoL8A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793285073;
	bh=3L3QSYQUjxDYup94ZnYbnFR3herIoJPwRr5gyYz2+1g=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XgwH8RB5HahhxyrS/37za4mlA1/Wj1wPEbjab4Wwg4vWvrQg36XRwLFHiFTlG0XBP
	 YPTcH9H0Xtxfu+Vgq5lwqjgeDIEbI2duBgB7H+bNmzfrU0wSKL5UCVqWkkThdiupNg
	 t/25CoNDgEUADFxX7jZYD0piTR//QfJ8J8HvHSdz3f8ASIh58vT2qO3vzJ62IdQmBd
	 KZEkSKp052QH1OggM6y1sESzKdwvNIvhY/Mm3USnr6p34lsvTA/58uIPJh3eLaen1R
	 oGKcOD5YEPfWqOXYLg+9WJST59mziKQ5pDqDES0K3ZmoIZ28VPbdqbYk1J7iCiSDA/
	 VSKc6oEuqXosw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10793407F8;
	Thu, 29 Oct 2026 14:44:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4722D362
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3929380F7B
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eYdS1VmOZS3 for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 14:44:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4ECC780F4A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793285067;
 b=chxbZyWoTnaxJLrGVmG+EjIy4eSb+UEmP+FwztTV1vAqv8cScrE2yW9T6s8ITPyaVxuD
 Co4qghvqyiBgHNo90TA2A46xNqnBi4qnJHM34ITvGmMPsXlQWKujqQsrEYS897b3YQqDa
 G+21b3B6gLRD3rz7rByBhZTwmrgECKFcmCZ95dLv0OQNS8e6PpVb47MKmbSVIp4vDdFh2
 8Rybt3NnxD4i4nj5AQPiKhSyuzEgL6zb3ordMu92GuWLdfiyR0D2nwDSgJLMpLzWM9JUE
 +tn6HwB1W0TJ8j7cy2RKpTop88pIt5yE1oB44/Aq8ovGpCMCvpZ3sEI6z8Zt8019fsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793285067;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=c2HopZgVLilsM4DZ0JDYwbHoP1Daboc4cNW0WEGki+c=;
 b=S5T4lsxPd4FQDOTfM2QHNgIsTK2Q8cdp29FbPp4/R5Z8NeVs3WOpSBxdy6g9oOYq8KGq
 fH/cfZslfAEkubG3asTE4uQTf/ALHqw7+pLONncyL6rQMgLSzFr6Jxd6Mgl69qhNzKj/y
 memjnnsczz+W8CV36xwNL5kOzzi+lUXLybloNZIQ1FeKDHnAmKi09T1ToS+NmdDz9ip86
 Hxl4gpcbYCC8N8uciexoAjlYiuv3olu3yX5P4y3w+MjJyRg0SZV0JyXwM8w5IMMJ5ImXs
 rUaDQ9cPYflw8K727zD+GBqn7b+ZydCCen/grSL9y6w/XyU8IG6ZCHeF5QVTMpxLH9g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Pscw6GO7; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Pscw6GO7
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4ECC780F4A
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:25 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so18439695e9.2
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793285064; x=1793889864; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c2HopZgVLilsM4DZ0JDYwbHoP1Daboc4cNW0WEGki+c=;
 b=Pscw6GO70IOMGUxq5L686OlMaCU897NAmndXXBvLP27OLYbYWyYAU50tde0Ihn5A43
 giYojzgbJJ5SY0K7oCd3rz1jDEhjMZhdEFuuostxyEkcWrHMVz7/i6U+f4KMNz/wERNP
 eCUg+lxGZK3YwdgI7Exyi9MARGVRBWsS0ekPGNfkqtE+Phzi8KYpT3IAOSHQ7YMh3rkH
 ddqpH3jL1I1zR3kMIPVbmM2IxgP/A1iNYfJ/S9uDgSWwRICx7mSedOtQCYG9ftS4keWo
 Xu8z95h3YTmL0jqm5mkPldD7MycOPoLMCAzmkOaqSp9AcefezCu7PPOtCdpQOI0cp4QZ
 xv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793285064; x=1793889864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=c2HopZgVLilsM4DZ0JDYwbHoP1Daboc4cNW0WEGki+c=;
 b=qn1pjfeUf/NL+NSC1oBsA4cNROm7XBxNqbu4QGjIsTZogHbx2bm5zvxRt8ht5ZmH4m
 2lLNlcuNDiSek3ERbw1dA3KmRWppQgmR243s9wotRUXDMqrcwFeNdqZhMYEy2DfyWw/a
 v64eYgtzZKvMiuVbRWfkGerbWp45KmQkg8Bsw2EXMmAtL/Kgr0DdN+wVwhfRIM5iX7yW
 +zfbmUTWwH7l4rRgaqEkIQRAxUcbpSe8oatfxCcmtrBHyGdIeL3u6tZ3iqt/6ZiXFFdA
 rWiWL349y4+SxPY7sHL+ug/zl95lgABG4v7U/BylcclxjI2ixXnL2HR1Sk0upVk8NAKB
 Vg0A==
X-Gm-Message-State: AFq9FYJMz4RbuH4k3JjuXDwCp2K1X8veS6Yr22ZvSY2E8b3BCTQr8ZW7
 GFsTwmWCwRi7dSpneugwtmoMNj11zgIl6AWhwTVVbbvJFvCVdzJRaEiDKDvV0Q==
X-Gm-Gg: AYBFou0yoDVmdED4wVsrFWuy13cv3l4T8i10FBdRjdDBFZwffk9dYVgvgKDwqH8Yl0w
 CtNUXNczW5srNUOmKkW1COPoTl4kNAiN8r78Poa0hHUXv8y1er/0RqPEi5QDrOnqjJomK8KJdL5
 h6y7rRoOg7VU0C/J2lb1cMEzfVWsFHRW9Rp+pXWzvaIEuIAy0DYdsiPvifQMlIr2LMI++5v8bJq
 LFK57X26cEBKUSph2bSXu3cE/WCmYkhwuidfqOIpghkafyTRIgrCFS2NHvP8BEmjt5D+eF0fMbV
 ZqB31E5FD3pHhl+nO41pnorjdFRQl3aK10utOwxWlfRQWA1+qZltEHAlzrUpOoELrNAKxECJRIg
 8QR1lb4x0/kA6KhXRC0QEY2fNfzHtb3EtqWW9GXvG4tcWEhaBlJoBKltyk0GGwVZuapgR1PpmZj
 iZNAyCLSP9F2P/EMaUEl9bPqlX3wtFPZ/9tXk7C8sGeqLfxyM6izvvpDIVgVR3ggHph0IEx/Kcw
 X/MAKALQwJNTx+i3ZCOF2fxbuo1vrBOxxN0rfO5M49uOF7ww21CC0ZA+XiRrK/1nhyvewqznBKw
 H3v5JI2W4rl4g7jrt5ZhXx5m1mrACK0e1VNYfTtJsZPWvbKYQQNqpw==
X-Received: by 2002:a05:600c:a103:b0:4a8:b8b4:6226 with SMTP id
 5b1f17b1804b1-4a9672f8581mr102064485e9.28.1793285063881; 
 Thu, 29 Oct 2026 07:44:23 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3eb8f387sm34699011f8f.4.2026.10.29.07.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 07:44:23 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 29 Oct 2026 15:43:58 +0100
Message-Id: <20261029144400.2972217-7-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
References: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 7/9] website: fix the copy tooltip and anchor
 scrolling in buildroot.js
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Show the "Copied!" tooltip of the git URL copy button using the
Bootstrap 5 API and hide it after a while, as it otherwise stays
displayed.

Also take the sticky navigation bar into account when scrolling to an
anchor, so that the target is not hidden below it.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/js/buildroot.js | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index e115ca4810..3eb83d7bbf 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -69,20 +69,13 @@ function google_analytics() {
     s.parentNode.insertBefore(ga, s);
 }
 
-function showTooltip(elem, msg) {
-    elem.setAttribute('class', 'btn tooltipped tooltipped-s');
-    elem.setAttribute('aria-label', msg);
-}
-
 let clipboard = new Clipboard('.btn');
 
-$(function () {
-  $('[data-bs-toggle="tooltip"]').tooltip()
-});
-
 clipboard.on('success', function(e) {
     e.clearSelection();
-    $(e.trigger).tooltip('show');
+    let tooltip = bootstrap.Tooltip.getOrCreateInstance(e.trigger);
+    tooltip.show();
+    setTimeout(function() { tooltip.hide(); }, 1500);
 });
 
 $(function() {
@@ -92,7 +85,7 @@ $(function() {
       target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
       if (target.length) {
         $('html,body').animate({
-          scrollTop: target.offset().top
+          scrollTop: target.offset().top - $('.navbar').outerHeight()
         }, 1000);
         return false;
       }
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
