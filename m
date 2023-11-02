Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245C9C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 10:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89FF342E75;
	Thu,  2 Nov 2023 10:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89FF342E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TFFuB9CvMxYX; Thu,  2 Nov 2023 10:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B9F342E7C;
	Thu,  2 Nov 2023 10:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B9F342E7C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFF571BF275
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 10:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8900948765
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 10:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8900948765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZA0eiOiC_Crt for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 10:48:16 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 708E942E75
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 10:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 708E942E75
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-540c54944c4so1572177a12.1
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 03:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698922090; x=1699526890;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Vi2FJR9Czr4XCVA5z5IS+fCfMfuUtS6mGjgqK6qvVY=;
 b=RkVSs1H0fJw1JZc5SDZgiYr2xDCYsSFD7uSkibgdpGAzLLBrBoACbGIhKxOt0sWb+E
 lrI49c26c31aNY29eXdmVxW4tAQAU/5gXOFCGdNjankuvrGAerQvglb6YD/mVTz6OGxx
 gXye87MLNjgLijH/qg7OB31ZkooiX+Go+56Heu3dKOigbxy/vcyIgrUXfN8n2j0CKJjP
 DaeNhBHDZGksn9Zf4b2gEwAj7/tlYkPWxTDhQhmMooZ5VYJ7bZDHtgT5fwDjOZCOSkpV
 Szf3zHUNehfwDV+K5LOrjBOIqdKfeEH02Hcu/lUgyoilPiIvYmdH5wYBjDhJkMe4q3Bb
 j/Wg==
X-Gm-Message-State: AOJu0YzhjFDBwsPSRHCPMWMpOpFzjfdL2gOzj3ba7SgtyqucKIK8RicK
 bAb1P74aRXYsOJARZ497STMtAusR5L1K0q7+Oz8=
X-Google-Smtp-Source: AGHT+IGEb4KY3kCOdZJIGxensaf6GODHu72MW1MR9cL+KanPMoR/fIB6ynckNdVElMqXXPbaTqWe2+8aVTQ+mv3IXJY=
X-Received: by 2002:a50:e613:0:b0:541:1e0d:b56f with SMTP id
 y19-20020a50e613000000b005411e0db56fmr4720704edm.12.1698922090282; Thu, 02
 Nov 2023 03:48:10 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Cl=C3=A9ment_Ramirez?= <ramirez.clement3@gmail.com>
Date: Thu, 2 Nov 2023 11:47:34 +0100
Message-ID: <CADRKr2q8+XtMaupy+2VKUNVzRw04PvSHmmTQ3etUMyX1Sh5tJg@mail.gmail.com>
To: nvd@nist.gov
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698922090; x=1699526890; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8Vi2FJR9Czr4XCVA5z5IS+fCfMfuUtS6mGjgqK6qvVY=;
 b=ec6EQEe1WgysupGOZsWiIoRONgVSF4HZoKzq5I5pCPST6gHGe1cKOWyoAaCyqExG/i
 Y58Qmkyg3nWdI+nEMmQzfYwLTFTqjJx98l+0tI3zHHyEkHCnl/xU2HOhPLaAUSucx82Z
 uZ4rSo4UqVP8Rg5qiHllHoMKvc9JuMiw0O7fYOzqTrpUQys5wwjekjl7RFf2tYO0n23U
 Ucv+ylTCYk1Ju+pFSBFF4aPqwENfPBm7TjuvefqakOS8uxrngORhAigN/YogzWo2bFld
 5iI+GEFYrzEnqOyOBTL4y/m5wj1UPC6MShnMaMcISlz33x9+q5lNOzdnBeQZl8qfq7dP
 5jKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ec6EQEe1
Subject: [Buildroot] Multiple CVEs version range fix
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGVhciBOVkQgbWFpbnRhaW5lcnMsCgpUaGUgZm9sbG93aW5nIENWRXMgOgogLSBDVkUtMjAyMy00
MTM1CiAtIENWRS0yMDIzLTMzNTQKIC0gQ1ZFLTIwMjMtMzE4MAphcmUgbWFya2VkIGluIHRoZSBO
VkQgZGF0YWJhc2UgYXMgYWZmZWN0aW5nIGFsbCB2ZXJzaW9ucwpvZiBxZW11IHByb2plY3QgZHVl
IHRvIHRoZSBmb2xsb3dpbmcgIkNvbmZpZ3VyYXRpb24gMSI6CgpjcGU6Mi4zOmE6cWVtdTpxZW11
Oio6KjoqOio6KjoqOio6KgoKRm9yIENWRS0yMDIzLTQxMzUsIHRoZSBpc3N1ZSBoYXMgYmVlbgpm
aXhlZCBpbiB0aGUgdXBzdHJlYW0gcWVtdSBwcm9qZWN0IGFzIG9mIGNvbW1pdCA6Cmh0dHBzOi8v
Z2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2NvbW1pdC9lY2IxYjdiMDgyZDNiN2RjZWZm
MGU0ODZhMTE0NTAyZmM1MmMwZmRmCgpJbiB0dXJuLCB0aGlzIGNvbW1pdCBpcyBpbnRlZ3JhdGVk
IGluIHFlbXUgc2luY2UgdmVyc2lvbiA4LjEuMDoKCnFlbXUkIGdpdCB0YWcgLS1jb250YWlucyBl
Y2IxYjdiMDgyZDNiN2RjZWZmMGU0ODZhMTE0NTAyZmM1MmMwZmRmCnY4LjEuMAp2OC4xLjAtcmMz
CnY4LjEuMC1yYzQKdjguMS4xCnY4LjEuMgoKCkZvciBDVkUtMjAyMy0zMzU0LCB0aGUgaXNzdWUg
aGFzIGJlZW4KZml4ZWQgaW4gdGhlIHVwc3RyZWFtIHFlbXUgcHJvamVjdCBhcyBvZiBjb21taXQg
OgpodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9jb21taXQvMTBiZTYyN2Qy
YjVlYzJkNmIzZGNlMDQ1MTQ0YWE3MzllZWY2NzhiNAoKSW4gdHVybiwgdGhpcyBjb21taXQgaXMg
aW50ZWdyYXRlZCBpbiBxZW11IHNpbmNlIHZlcnNpb24gOC4xLjA6CgpxZW11JCBnaXQgdGFnIC0t
Y29udGFpbnMgMTBiZTYyN2QyYjVlYzJkNmIzZGNlMDQ1MTQ0YWE3MzllZWY2NzhiNAp2OC4xLjAK
djguMS4wLXJjMgp2OC4xLjAtcmMzCnY4LjEuMC1yYzQKdjguMS4xCnY4LjEuMgoKCkZvciBDVkUt
MjAyMy0zMTgwLCB0aGUgaXNzdWUgaGFzIGJlZW4KZml4ZWQgaW4gdGhlIHVwc3RyZWFtIHFlbXUg
cHJvamVjdCBhcyBvZiBjb21taXQgOgpodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3Fl
bXUvLS9jb21taXQvOWQzOGE4NDM0NzIxYTY0NzlmZTAzZmI1YWZiMTUwY2E3OTNkMzk4MAoKSW4g
dHVybiwgdGhpcyBjb21taXQgaXMgaW50ZWdyYXRlZCBpbiBxZW11IHNpbmNlIHZlcnNpb24gOC4x
LjA6CgpxZW11JCBnaXQgdGFnIC0tY29udGFpbnMgOWQzOGE4NDM0NzIxYTY0NzlmZTAzZmI1YWZi
MTUwY2E3OTNkMzk4MAp2OC4xLjAKdjguMS4wLXJjMwp2OC4xLjAtcmM0CnY4LjEuMQp2OC4xLjIK
ClNvIHRoZSAiQ29uZmlndXJhdGlvbiAxIiBzaG91bGQgYmUgZml4ZWQgdG8gaW5kaWNhdGUgdGhh
dCBvbmx5CnZlcnNpb25zIDwgOC4xLjAgYXJlIGFmZmVjdGVkIGZvciB0aGUgMyBDVkVzIGFib3Zl
LiBDb3VsZCB0aGlzIGJlIGFkZHJlc3NlZAppbiB5b3VyIE5WRCBkYXRhYmFzZSA/CgpCZXN0IHJl
Z2FyZHMsCgpDbMOpbWVudCBSYW1pcmV6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
