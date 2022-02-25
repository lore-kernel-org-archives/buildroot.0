Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208EEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 23:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3E1F612FE;
	Fri, 25 Feb 2022 23:06:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id admRmjDDkpgm; Fri, 25 Feb 2022 23:06:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A7B060F23;
	Fri, 25 Feb 2022 23:06:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE3461BF2A7
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 23:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD69141863
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 23:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mE8a2UHknD5Q for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 23:05:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 030BB4185E
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 23:05:49 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id s1so6525789wrg.10
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 15:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nlatPE8DExEtYf/QtYn/Vtg1CUgXeMIRtJo42DsSZ7U=;
 b=X/V8CT+YY/wSkb48jcwK85THrfX++VE9grtCuqyQ1xmUHbFxyA4P06NG0hFylXe516
 /X43sXv7+DR+fEjyGZNNn9a3VSCOy92doKMVzxO02llDr4ghmJvCZO6oBX3k2Mqj3SFv
 64gOTyAUIklNAlieD4yis6/PtRa5hm9fmsPbSTzmqe5RBxqnwILHjMHAu36aH5JAI6sO
 BJrdemDn407+9eUgoWf/v3BLXMC4LGpj38lUQXsJfqJHp2DApHd4w7uD+8gZ1+f24KHj
 sUwUIEawMfDiQzydxzALLf40PFr98k2gScMDg+LNgir+vJMOjszH2PJcviOs46WSP/QA
 dz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nlatPE8DExEtYf/QtYn/Vtg1CUgXeMIRtJo42DsSZ7U=;
 b=5kD4h8JXk45fR+ii4QzVJxfnYynwCLuc+Qqn2omp5Vu14upfsVvfa9b5p2PryNUQWm
 viwmzaNhsWjBLAyo+qjURRKNTv8GrMITB4GfWWqIdvMVWMm6je2aDokocTKXzdgidhNY
 6KIFUFHUa2+Y6ENyXh9vj0nFtpeuBxb82YyiDGwL8pw7Q3aoVCuyDZ5ym4o0ebiHztuG
 tCvcdiKZNfeGua/KWFqmB+2h03yEla009TW8AsvQ/pEhT7hDhJQ8r9UmEQ7wPhegDgHg
 izFCjdU3zENUKaqdv4A+LpBbXluYQ8nBi/4Cx5jL1fffi6JXzWqK9deGnHRPTDdl2PNY
 kLrQ==
X-Gm-Message-State: AOAM530onLDcMV/JujxpAqxFsHXYmKVGKkpAn6H2fsxy12xwHkDeJSrm
 RLrbAMSbdbdtPp06bF65iDBFE1tNli4=
X-Google-Smtp-Source: ABdhPJwZjRPsYfD1LsRVSw0qVLZiMy1/qZriGudIuFHutdgmKfnSadYhXwlwbhm1zXUDdVR7atnUJA==
X-Received: by 2002:a5d:6da7:0:b0:1ea:78a4:8e00 with SMTP id
 u7-20020a5d6da7000000b001ea78a48e00mr7590387wrs.129.1645830347907; 
 Fri, 25 Feb 2022 15:05:47 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a05600c3b0500b00380da3ac789sm4089329wms.1.2022.02.25.15.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 15:05:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Feb 2022 00:05:19 +0100
Message-Id: <20220225230519.1584174-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220225230519.1584174-1-fontaine.fabrice@gmail.com>
References: <20220225230519.1584174-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/zabbix: netsnmp needs mib
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bmV0c25tcCBzdXBwb3J0IG5lZWRzIG1pYiB0byBhdm9pZCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZh
aWx1cmUgcmFpc2VkCnNpbmNlIHRoZSBhZGRpdGlvbiBvZiB0aGUgcGFja2FnZSBpbiBjb21taXQK
NDIzODJhMTcxMjc3ZWFkNTllMzY1ZjU5MjBlNzU3ZjAxYzA0YWM3NzoKCmNoZWNrc19zbm1wLmM6
IEluIGZ1bmN0aW9uIOKAmHpieF9zbm1wX2dldF9vY3RldF9zdHJpbmfigJk6CmNoZWNrc19zbm1w
LmM6Njk0OjM1OiBlcnJvcjogaW52YWxpZCB1c2Ugb2YgdW5kZWZpbmVkIHR5cGUg4oCYc3RydWN0
IHRyZWXigJkKICA2OTQgfCAgaGludCA9IChOVUxMICE9IHN1YnRyZWUgPyBzdWJ0cmVlLT5oaW50
IDogTlVMTCk7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+CgpG
aXhlczoKIC0gTm8gYXV0b2J1aWxkZXIgZmFpbHVyZXMgKHlldCkKClNpZ25lZC1vZmYtYnk6IEZh
YnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgotLS0KIHBhY2thZ2Uv
emFiYml4L3phYmJpeC5tayB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvemFiYml4L3phYmJpeC5tayBiL3Bh
Y2thZ2UvemFiYml4L3phYmJpeC5tawppbmRleCBhOGVjYmI0MmRiLi5hZGM1NDAyOGFkIDEwMDY0
NAotLS0gYS9wYWNrYWdlL3phYmJpeC96YWJiaXgubWsKKysrIGIvcGFja2FnZS96YWJiaXgvemFi
Yml4Lm1rCkBAIC01NSw3ICs1NSw3IEBAIGVsc2UKIFpBQkJJWF9DT05GX09QVFMgKz0gLS13aXRo
b3V0LWxpYnhtbDIKIGVuZGlmCiAKLWlmZXEgKCQoQlIyX1BBQ0tBR0VfTkVUU05NUCkseSkKK2lm
ZXEgKCQoQlIyX1BBQ0tBR0VfTkVUU05NUF9FTkFCTEVfTUlCUykseSkKIFpBQkJJWF9DT05GX09Q
VFMgKz0gLS13aXRoLW5ldC1zbm1wPSQoU1RBR0lOR19ESVIpL3Vzci9iaW4vbmV0LXNubXAtY29u
ZmlnCiBaQUJCSVhfREVQRU5ERU5DSUVTICs9IG5ldHNubXAKIGVsc2UKLS0gCjIuMzQuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
