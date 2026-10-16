Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A6DCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 12:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4411F607E8;
	Fri, 16 Oct 2026 12:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbroGjaDg7cw; Fri, 16 Oct 2026 12:33:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 62B51607E7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792154017;
	b=PbrJcovd0Y782yXTasq6hymkpS6WRBZbQePSruq/poiwDWXgyyKLW8gjReTnorBX5ONa
	 pYKAuJU4BjZ3kY82ZIgFsfU/902v+KIuszuklIY51VaYA8y4qKiMIDErXBuggstNYbfDB
	 ePX6s0BXiZu2mH6r3zbdB3cGyRWFopmrN7mS1wWpQQrrMyTO8Tn8BfVZ/XF1SMMLBMGr9
	 prp8n0tRrt47/VjqLkAUp7Ka+GBI5aTKdSEsbe+AejK/FzL5RCiSovWbZ2wKnndgDHdaQ
	 EoVy1PQMzkk55lV+aYwchHeRUWby9arF6J57BBGr5yX/CV4JoB7RatnXDbII//DR4MA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792154017;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=9rsAfZKB9kX2jtpH7FubCGuApc3Xh5JpbZJX3ovZgJc=;
	b=mP6cOlE9AYOs8TMB2/aGvQVMETPj2zQkkKdyRHVluMQrZe837ephy3LV8od+3kTd3uph
	 p0qCSACfyUvn/Kttk81U20IQru0FymOt/804seUtDCCyvWRF6FMGVjoQHGwS9zB8wgtHk
	 PgWta41nuV+b3ylm77l0Er03hm8qXfwi0pXCHdC/UvTrgrS45zHgy+vZ6LK0nthT7lsPJ
	 BJNcrLMd3Er4MthW9ofi72hrXhWLeK09qnpihQklUHfsJTrN+2qc9+J6oMDtJgISsJNDs
	 5QkblwEvWS+yiEUee2fVZH4Sl7KYwAXp1Tf/TTvriqZQeX82Ov0M/eLl/5Cs3HUQY3A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792154017;
	bh=9rsAfZKB9kX2jtpH7FubCGuApc3Xh5JpbZJX3ovZgJc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eBVFoN9D+b2Ol9t4bihti568yQXSgKL005UXVdff91DAl4mHxUddyMEPwaHJE9I1x
	 A7UH3uKw3yCW+lgxH896qPCM73RKmKXYGt1Ri3qPMGNUb9bXiT7Vm/mB5DsRLMu7fm
	 U/ltSzN3y2QFd8la3f4qXWfqQR1GoW6kxFuJLRhykQN6yOeiYTNqDCa+LCag4FMUMt
	 wDKhALHOAVn+J0cXWS2i3SlD8TZ4oL9kJQ8H7vSmhrkpxUkRv4yJ5F6Kp9O4cY3eE0
	 5bbOt+RNoKihy7B6NDdUnXbjwuZ3ID6ZtN12mdAnjxpON7AniTg0uSd05frybhyjh0
	 BAiOVHNeNwV4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62B51607E7;
	Fri, 16 Oct 2026 12:33:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68CFB109
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4ECCF4016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXHzcZQW-3_M for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 12:33:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 34D864016B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792154014;
 b=sXt6upEboVJoU8NKJjwvla3SZU1Q+IjfOlBreY52Pl7UjhwpMVsK9PHpMTuJfWrbDfjC
 CZHN8d+JJtyUGP+ESBtzyWj3V31yN5NaPE4xMEV/XeihUbSGfPTnzDJgCSBycruuHSyR5
 0RkUqzl7uGnf9dzYIh+KduMAo2H6c8UgZZUpHNb8Kq0OA81EUsM3QP5i5a/GQ2EWJsPkh
 44344+hzQg3Vw3QvSUyc4FW5h1b+rmr/LtCsQD+XhbajR1wt4dCvbM57Q865Pbu+45m1I
 DpmIT7QgE7Sm4DVLLNBUfpu0/kVRYSsaMEZihR3HROFA5SGSPK/yeO+Hzct+y9kEbHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792154014;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=DXX2yfQanJa1NIyAyQJITGALGfKN6nlVeoR1ev7OtXA=;
 b=bZqn/KmsBTDots/oth4ZDyPqabxc/hxWBBorqXXWHweaFFwYCX+JrKqLLOlBmO9ZyWbJ
 vsg9f6OeSvBeJYW6KP8WBXapZrqYLgbSftOt1jFWibgRs8yTfGfGbkTIaXVvR2HsAqwT3
 UY78h/ZbcVipFBV7EccfCXOKMGFCWR6hAJL8sNAwutBIQXyD3RSxk3CcJiA3jd2PS+Bd2
 2/UR2BmznMNpKG4DU20Qzu0RlIXabX/RLggxXB61cY95UJYwf9qKIu/e4HsUdbq6jSvfg
 14Py9IGkneThypG23ZOFXbyRQXw2kt1dFLxmCIGoHimTVM7/SkG92W1nFFhimdv3iIw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dsyEz69D; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=dsyEz69D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34D864016B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:33:33 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a19cba5c14so58274125e9.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 05:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792154012; x=1792758812; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=DXX2yfQanJa1NIyAyQJITGALGfKN6nlVeoR1ev7OtXA=;
 b=dsyEz69Dx/xKiMZN4QiZdLZ2+JprGRxsAs5x1MUHQM3QEFzKaYrt1OuNAshWEBBiPa
 F4c15C4ydb5nDkx3CBA+9ssa/xaCyE3NVoWLYXwpuG6oLF0dMnrpZhnMgm6QG+YewYP+
 YIib6supX9Yqtt3qpqaNQBjl+0q3vHRrkVcETVEoSRWiL1mpOFy0Hgo7v2HnMFKq7t4d
 y5Jodr6P4KMwUoXl7tT6+ed/8wqdYsbPjovQbS23aPQF9w3NXbqdn5/75ckRmb5hj2EI
 KkLrPB/NAlgU58PuWYYKWmJ+BcoZ4NIJo0QMrM2PWcYGT6KEII+UYV0FMgKLNMpsYlRZ
 KbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792154012; x=1792758812;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DXX2yfQanJa1NIyAyQJITGALGfKN6nlVeoR1ev7OtXA=;
 b=ZOy869KbX2/Bkc9Ai6hX3RyHuO6Nm7j22/3FXNsu6GDMV5rIsBVSyY+MBvVVwO9Nl2
 2mL1sqXoE2V/M1WwoBUC4MA1fmQc0CoU1vAF1EOe7GOiqfN0kKvy8O3rBpyA0pWWpycJ
 yfozBOYtqwb6c6U2TCSmUxr0cR5L15K5ZwiQQER5uAPqKsRtmoh37rXmmrpI60Ui7DGb
 4Uz3fqZbkZWKbaDUGwPM1L4W/Ii+DLst9EWifB/MmEhkxuorfjiIgX2JOxKaE1clS5DE
 BDYJpKRcU0RDDIuKm0vHuRYw3RwM6KMdEMESTmV+sPvei5Vt8Ki2EY/0YMvB/3S84cj5
 jdsg==
X-Gm-Message-State: AFq9FYL/oeV2GPhPBcjOqeBQkSUG/7x2cml8ZwSF229JHzcnWNUWOm6k
 6anBQOD2v/0XbvpOK48hST3bldpyyOjdQJaVsVCwm9el8nYVZwOnu5ATEc4/MmrY
X-Gm-Gg: AYBFou3Z95Popuj1nRub1eo8nkRf1842iQbRNXMB/ewlKfGuyle2AoEmeSRK2xy7QPL
 i4y2RPaPMYhTW7P/DpP+JJdT30ciIytXFOgTa2EyBN/6SilGxfloHtyqTqvr2EHI1fsR+ms/8Y1
 opqKobxJVzJyjf+POkHILoLseDlNGIi0XAvAnF2mgDRn4+NjtVGwzXfWXxwR7A5j1slDmG9uWis
 84ZQQJ3THChv3hrVYTGR8kh0W4TJXn0rJf0tQRnr1AOmOyFaq7dTd3iAsjVFcIE+9nXIKK7Nl98
 PH8GWrIX5LZ6uCgVwIPF7MEACSv1yXNugh/tMs2obojze7N4H2FGwa70KtGmLrsJeH8WyO206tn
 UJFcgoThe4Xlqb8vRiGF6ydYh9QofGcR7rVyEh95PCCdlQfFkjIJzAyO/hfDPnW/lQmN3gDrF+f
 aNz1dR2YILAqInGBx5NrAx0uq+RcZ0fHUm52n0Wuu5MTDTWNsKgjXT+jjc4d5yR+IMJ3p4f7E+c
 0lGQAjMy/KBSObTRP4IR91xhH4ymeR6MajtNdLi86k9DB/7jnih
X-Received: by 2002:a05:600c:3111:b0:4a0:1e87:910 with SMTP id
 5b1f17b1804b1-4a18e4cb7a9mr444753395e9.20.1792154011697; 
 Fri, 16 Oct 2026 05:33:31 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1ce325107sm38161785e9.3.2026.10.16.05.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 05:33:31 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:32:59 +0300
Message-ID: <20261016123321.7165-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016123321.7165-1-flaviu.nistor@gmail.com>
References: <20261016123321.7165-1-flaviu.nistor@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 2/2] support/testing: add snappy test
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>, Julien Olivain <ju.o@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgc2ltcGxlIHRlc3QgY2FzZSB0aGF0IGltcG9ydHMgdGhlIG1vZHVsZSBhbmQgZG9lcyBh
IHNpbXBsZSBjb21wcmVzcwpkZWNvbXByZXNzIHJvdXRpbmUuCgpTaWduZWQtb2ZmLWJ5OiBGbGF2
aXUgTmlzdG9yIDxmbGF2aXUubmlzdG9yQGdtYWlsLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjU6Ci0g
VXNlIGRlZmF1bHQgYXJtdjUgZm9yIHRoZSB0ZXN0IHNpbmNlIGNyYW1qYW0gZG9lcyBub3QgZmFp
bCB0byBydW4gb24gMzItYml0CmFyY2hpdGVjdHVyZXMgb24gdmVyc2lvbiAyLjE0LjAgb24gd2hp
Y2ggcHl0aG9uLXNuYXBweSBkZXBlbmRzIG9uLiAKLSBMaW5rIHRvIHY0OiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNjEwMDIxMDMxNDQuMTM5MTQtMy1mbGF2aXUubmlzdG9yQGdtYWls
LmNvbS8KCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArKwogLi4uL3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3NuYXBw
eS5weSAgIHwgIDUgKysrKysKIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0
aG9uX3NuYXBweS5weSB8IDEzICsrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3NhbXBsZV9weXRob25fc25hcHB5LnB5CiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fc25hcHB5LnB5CgpkaWZmIC0tZ2l0IGEv
REVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggMjc3M2YwNzc2YS4uOTk5NDYzMGM2ZiAxMDA2
NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xMTQ3LDYgKzExNDcsOCBA
QCBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9weXJvdXRlMi5w
eQogTjoJRmxhdml1IE5pc3RvciA8Zmxhdml1Lm5pc3RvckBnbWFpbC5jb20+CiBGOglwYWNrYWdl
L3B5dGhvbi1jcmFtamFtLwogRjoJcGFja2FnZS9weXRob24tc25hcHB5LworRjoJc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fc25hcHB5LnB5CitGOglzdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3NuYXBweS5weQogCiBOOglGbMOhdmlv
IFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KIEY6CWNvbmZpZ3MvYXN1
c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3NuYXBweS5weSBiL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc25hcHB5LnB5Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLjg0MmE0ZTk4ZTUKLS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3NuYXBweS5weQpAQCAtMCwwICsx
LDUgQEAKK2ltcG9ydCBzbmFwcHkKKworcGF5bG9hZCA9IGIiQnVpbGRyb290IHB5dGhvbi1zbmFw
cHkgcnVudGltZSB0ZXN0XG4iCitjb21wcmVzc2VkID0gc25hcHB5LmNvbXByZXNzKHBheWxvYWQp
CitkZWNvbXByZXNzZWQgPSBzbmFwcHkudW5jb21wcmVzcyhjb21wcmVzc2VkKQpkaWZmIC0tZ2l0
IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fc25hcHB5LnB5IGIv
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fc25hcHB5LnB5Cm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjFjMDdkZGMxZTgKLS0tIC9kZXYvbnVs
bAorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zbmFwcHku
cHkKQEAgLTAsMCArMSwxMyBAQAoraW1wb3J0IG9zCisKK2Zyb20gdGVzdHMucGFja2FnZS50ZXN0
X3B5dGhvbiBpbXBvcnQgVGVzdFB5dGhvblBhY2thZ2VCYXNlCisKKworY2xhc3MgVGVzdFB5dGhv
blB5M1NuYXBweShUZXN0UHl0aG9uUGFja2FnZUJhc2UpOgorICAgIF9fdGVzdF9fID0gVHJ1ZQor
ICAgIGNvbmZpZyA9IFRlc3RQeXRob25QYWNrYWdlQmFzZS5jb25maWcgKyBcCisgICAgICAgICIi
IgorICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT04zPXkKKyAgICAgICAgQlIyX1BBQ0tBR0VfUFlU
SE9OX1NOQVBQWT15CisgICAgICAgICIiIgorICAgIHNhbXBsZV9zY3JpcHRzID0gWyJ0ZXN0cy9w
YWNrYWdlL3NhbXBsZV9weXRob25fc25hcHB5LnB5Il0KLS0gCjIuMzQuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
