Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9EDC001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 11:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E05AF410BA;
	Sun, 30 Jul 2023 11:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E05AF410BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJV9002MVEsI; Sun, 30 Jul 2023 11:11:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC6AD410BD;
	Sun, 30 Jul 2023 11:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC6AD410BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3171D1BF3DC
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 11:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 180CB81C6F
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 11:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 180CB81C6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vfEjwdkB10ZO for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 11:11:38 +0000 (UTC)
X-Greylist: delayed 538 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 30 Jul 2023 11:11:37 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ED0D81BA8
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6ED0D81BA8
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 11:11:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1690714775; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=pYqNkw9RvIoXt7yNTZ5qTdXV4/RsefFg6paMeURyWOH1Ya4KXQMM9AST6+pn3ZEqRt
 yM49NY6f9/BVg2KDHuhBaQFL3kDp2Ygz6m9v+KQxzAHWgQOvoPqBWdLB+O8CM/XGV+dt
 0w/8klgK4ftiUmyhz9/dJoNX0UYJsm7Imm1yNmvhXQnua+jdS24WxxCG5Ie5b7LJCxmX
 +V6f+COUfDCI73BBBhaJzKae8LyfJCJ/uNNDQTWyeMnaBwlxm1fKA9bVKeX6yruFLv/R
 XK7hI1jZZEl07/oO3flA0P74IKYvf36POsPXGThiBxQ/fGsOwyB3R+L9+xgFYGXEFaXS
 y/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1690714775;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=H8loC7Bf5jt28YoMDy3X7kI/MRd0DCnS9OCtNQNjtZs=;
 b=riJprxWH16KOvacNhcnZK2ltB5dNyX7obhr2b7VQQK6s35EaU730jIoU1CNWPfDy+V
 4HZrQzNqZXeMfp4YWDLjJYwZdJwaJx2iMfbtYIaj84LVN/v//VbaIwuFYPQU+muxxN2p
 Cy0rR0iORy/3mpkJ3pdOz/11plPiC3OPGSH4IV+REYK0okoYHhwfwyZ6jO9mnMtndaKO
 yKunrhm0UE/gD73zhCuliDr6p6cxyeseO4mcvTaY/0l7n2ZfNDK+HTkxvVB3JMqHd6M8
 2BhZviCMA6FQ29QZ8SW7aipMg03zECx/bGhPOQQKemU5d/B/2LXs+Xumf54kunWNg/os
 F44g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZGGjY6ptdusOK7nWzzuvt/yikxl/iaU"
Received: from tesla.fritz.box by smtp.strato.de (RZmta 49.6.6 DYNA|AUTH)
 with ESMTPSA id kba5faz6UAxYLUn
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Sun, 30 Jul 2023 12:59:34 +0200 (CEST)
From: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:59:29 +0200
Message-Id: <20230730105929.2296954-1-nerv@dawncrow.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1690714775; 
 s=strato-dkim-0002; d=dawncrow.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=H8loC7Bf5jt28YoMDy3X7kI/MRd0DCnS9OCtNQNjtZs=;
 b=ma2FhHC0eZE/srUh0n+KfklHZxoAr5CDPu1LZ0c0NcViwoeZeJEBpffCvwMk3giZeh
 2B8uXUCYf9qQ7n1Ap5QloHh7LW/cdYOtI8DRb4hAEi4VAh25REdT7Pa/s5xV3QI3sBFz
 kT+QqsLJOuMwFU8PEkYPbqgK7sPnV5D44hl8GHnHw6QpEDznRCA70RCMn7cqNlvdSaFe
 3mC0M87IKF0D6x0MXMj4oam16ts499dWZOua0bwQIvqTJopk9kzeDVkA9xO4Yflv7uIt
 GVjAchZUB2XnXvUhlv0nhhgEfza+1w6atx1zyu9XdfbS8vWffFuUqn8k1KlDqYGGMaE9
 0nYg==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1690714775; 
 s=strato-dkim-0003; d=dawncrow.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=H8loC7Bf5jt28YoMDy3X7kI/MRd0DCnS9OCtNQNjtZs=;
 b=UpOSlmU7VrPyi3vdsyvtgIoy9tOJbNr1HVyvlB2YQpGiY/m5Frxsui8vnoI5p1BzjD
 b41zQ724xl8oN8PoLhDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=dawncrow.de header.i=@dawncrow.de
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ma2FhHC0; 
 dkim=pass header.d=dawncrow.de header.i=@dawncrow.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=UpOSlmU7
Subject: [Buildroot] [PATCH] package/wine: bump to version 8.0.2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQW5kcsOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgotLS0KIHBhY2th
Z2Uvd2luZS93aW5lLmhhc2ggfCAyICstCiBwYWNrYWdlL3dpbmUvd2luZS5tayAgIHwgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS93aW5lL3dpbmUuaGFzaCBiL3BhY2thZ2Uvd2luZS93aW5lLmhhc2gKaW5k
ZXggNTgyNjFkM2IxOC4uNzU2ODU5Yzg0NCAxMDA2NDQKLS0tIGEvcGFja2FnZS93aW5lL3dpbmUu
aGFzaAorKysgYi9wYWNrYWdlL3dpbmUvd2luZS5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBMb2Nh
bGx5IGNhbGN1bGF0ZWQgYWZ0ZXIgY2hlY2tpbmcgcGdwIHNpZ25hdHVyZQotc2hhMjU2ICAyMjAz
NWYzODM2YjRmOWMzYjE5NDBhZDkwZjliOWUzYzFiZTA5MjM0MjM2ZDJhODBkODkzMTgwNTM1Yzc1
YjdkICB3aW5lLTguMC4xLnRhci54egorc2hhMjU2ICA2ZWM4ZmI2ZjJjNzJkNTc2Y2IxMWY1MmIy
ZjhkNTlhZjY0NDA0ODAyMTU0NjUxZDEyMmI5ODQ2NmQ5MWRjODQ3ICB3aW5lLTguMC4yLnRhci54
egogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKIHNoYTI1NiAgZTIzN2ZhNTY2NjgwMzBlOTI4NTUxZGRk
NjBmMDVkZjVmZTk1N2Y3NWVhYjg3NGJiZDAxN2UwODVlZDcyMmU3YyAgQ09QWUlORy5MSUIKIHNo
YTI1NiAgNzkzZDA0NTU0NjQ2N2M4ZjQ5ZTM1ZmJkNmUwMjg1OWU1N2U3OGY4YmI1MzU3MWU4MjAw
YmZmZDBlOTY2ZGZhOCAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS93aW5lL3dpbmUubWsg
Yi9wYWNrYWdlL3dpbmUvd2luZS5tawppbmRleCBjY2FlYWRmZjVlLi5mNDc5MjJkYzcwIDEwMDY0
NAotLS0gYS9wYWNrYWdlL3dpbmUvd2luZS5taworKysgYi9wYWNrYWdlL3dpbmUvd2luZS5tawpA
QCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVdJTkVfVkVSU0lP
TiA9IDguMC4xCitXSU5FX1ZFUlNJT04gPSA4LjAuMgogV0lORV9TT1VSQ0UgPSB3aW5lLSQoV0lO
RV9WRVJTSU9OKS50YXIueHoKIFdJTkVfU0lURSA9IGh0dHBzOi8vZGwud2luZWhxLm9yZy93aW5l
L3NvdXJjZS84LjAKIFdJTkVfTElDRU5TRSA9IExHUEwtMi4xKwotLSAKMi4zNC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
