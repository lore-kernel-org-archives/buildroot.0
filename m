Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85D5C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 13:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B15E4149D;
	Thu, 30 Dec 2021 13:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zG29blPPIxvj; Thu, 30 Dec 2021 13:57:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5CB5414A2;
	Thu, 30 Dec 2021 13:57:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB5161BF408
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 13:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D98A240024
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 13:56:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61zOwHZf0WIl for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 13:56:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30438400EA
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 13:56:42 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j18so50622572wrd.2
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 05:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=peKqmjZI4KT4iKeqozCzgza4rGoe/IvqUWtEfvYSP8c=;
 b=LnXryM2QpaUZPtBwPdYbALu8LQJ3GtOp3jMYXabLs7g3RqmPREfqBzYnrEns5nRLXM
 bJUfQ+ThZ7GpA6/V/eOg2HM55mi74X+axX8orNvYTuaxL59u55m5CZaqkS9NK7SqEsww
 rsBt4021GwinO2bsSjLEdFdOr7c3Ke43tfhTWZkUPugd/UfQXpLOfPQVaDsrXQnqOnJz
 4yctasLgXytnkqUvZXxku+WuMV1XCbt9fcFMNjnEMrLrAZCkri9EyCNO+pEntJIimQk4
 6Y7453mj5hjeWD3k9s3ZsRzilR6s41Eubx/O2u/Lt14SJ8yl0V7qT0+2dRXMWENDf9bE
 b5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=peKqmjZI4KT4iKeqozCzgza4rGoe/IvqUWtEfvYSP8c=;
 b=quS54lWySSS0scFqahpgl9ksh7E8qc6vhktNsuiO75QZu2RssI6YFrpNSFiE+WIZxc
 95u+jXkt5ww61GsmHpMLK0TgwfnqPJ1m5et13bfI8PzPlA7lLGZgKaF/DlVx5nS6JFiV
 1t3z1bzKIrJPBVZxH5060KLLoDESdRKMfvDghd7VVpTKkj6PUIUJ4WhgEWynWk41Apo7
 KWXS3axrW5l3be2cVJb6kzaPZXwmY0ry9lw8KkC2hPXPAeaMp3iy3n3pthK+0kuLjw5C
 c5YfKe41QuAUKupdSHwcGQvz/iU/3V6HPIxOjjxa47etJWMYNA6JczfPN8JSozdVwbld
 W9+w==
X-Gm-Message-State: AOAM533WOb0WyZKCbhVuzrK6Q2ziQoTNcdHC2OnMPudX+AGNIvWWm6+D
 w8qol/MdwB5C/jQ2oX4HAaY8SUdBIKw=
X-Google-Smtp-Source: ABdhPJy99mINRKwE23g90nPHM9nhgDFSQLfAVEyI13nZlwB7AujtVn0JVzQZj1xAN4hkQzIdW8/RNg==
X-Received: by 2002:a5d:598a:: with SMTP id n10mr25417462wri.252.1640872600497; 
 Thu, 30 Dec 2021 05:56:40 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id l7sm24353765wms.1.2021.12.30.05.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 05:56:40 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 14:56:19 +0100
Message-Id: <20211230135621.2255847-5-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211230135621.2255847-1-romain.naour@gmail.com>
References: <20211230135621.2255847-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/7] package/minetest: add missing header
 "memory" required since gcc 11
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmFja3BvcnQgZnJvbSB1cHN0cmVhbS4KCkZpeGVzOgoKbWluZXRlc3QtNS40LjEvc3JjL2NsaWVu
dGlmYWNlLmg6NDQ0OjM2OiBlcnJvcjog4oCYc2hhcmVkX3B0cuKAmSBpbiBuYW1lc3BhY2Ug4oCY
c3Rk4oCZIGRvZXMgbm90IG5hbWUgYSB0ZW1wbGF0ZSB0eXBlCiAgNDQ0IHwgICAgICAgICBDbGll
bnRJbnRlcmZhY2UoY29uc3Qgc3RkOjpzaGFyZWRfcHRyPGNvbjo6Q29ubmVjdGlvbj4gJmNvbik7
CgpTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Ci0t
LQogLi4udWlsZC1mb3ItbmV3ZXItdmVyc2lvbnMtb2YtR0NDLTExMjQ2LnBhdGNoIHwgMzUgKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL21pbmV0ZXN0LzAwMDEtRml4LWJ1aWxkLWZvci1uZXdlci12
ZXJzaW9ucy1vZi1HQ0MtMTEyNDYucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL21pbmV0ZXN0
LzAwMDEtRml4LWJ1aWxkLWZvci1uZXdlci12ZXJzaW9ucy1vZi1HQ0MtMTEyNDYucGF0Y2ggYi9w
YWNrYWdlL21pbmV0ZXN0LzAwMDEtRml4LWJ1aWxkLWZvci1uZXdlci12ZXJzaW9ucy1vZi1HQ0Mt
MTEyNDYucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMzUxMDJh
MDc3YgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbWluZXRlc3QvMDAwMS1GaXgtYnVpbGQt
Zm9yLW5ld2VyLXZlcnNpb25zLW9mLUdDQy0xMTI0Ni5wYXRjaApAQCAtMCwwICsxLDM1IEBACitG
cm9tIGEzMjdjMDZmNWRlZTlmNDMyNjY2YjUwMzIwM2ZkMTVlNGNjYWZjMWIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tOiBsaG9maGFuc2wgPGxhcnNoQGFwYWNoZS5vcmc+CitEYXRlOiBU
aHUsIDYgTWF5IDIwMjEgMTA6MjQ6MzAgLTA3MDAKK1N1YmplY3Q6IFtQQVRDSF0gRml4IGJ1aWxk
IGZvciBuZXdlciB2ZXJzaW9ucyBvZiBHQ0MgKCMxMTI0NikKK01JTUUtVmVyc2lvbjogMS4wCitD
b250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXIt
RW5jb2Rpbmc6IDhiaXQKKworKGNoZXJyeSBwaWNrZWQgZnJvbSBjb21taXQgN2MyODI2Y2JjMGYz
NjAyN2Q0YTk3ODFmNDMzMTUwZDFjNWQwZDAzZikKKworRml4ZXM6CisKK21pbmV0ZXN0LTUuNC4x
L3NyYy9jbGllbnRpZmFjZS5oOjQ0NDozNjogZXJyb3I6IOKAmHNoYXJlZF9wdHLigJkgaW4gbmFt
ZXNwYWNlIOKAmHN0ZOKAmSBkb2VzIG5vdCBuYW1lIGEgdGVtcGxhdGUgdHlwZQorICA0NDQgfCAg
ICAgICAgIENsaWVudEludGVyZmFjZShjb25zdCBzdGQ6OnNoYXJlZF9wdHI8Y29uOjpDb25uZWN0
aW9uPiAmY29uKTsKKworU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
Z21haWwuY29tPgorLS0tCisgc3JjL2NsaWVudGlmYWNlLmggfCAxICsKKyAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKKworZGlmZiAtLWdpdCBhL3NyYy9jbGllbnRpZmFjZS5oIGIvc3Jj
L2NsaWVudGlmYWNlLmgKK2luZGV4IGNjNTI5MmI3MS4uZGZkOTc2NzQxIDEwMDY0NAorLS0tIGEv
c3JjL2NsaWVudGlmYWNlLmgKKysrKyBiL3NyYy9jbGllbnRpZmFjZS5oCitAQCAtMzEsNiArMzEs
NyBAQCB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2Fy
ZSBGb3VuZGF0aW9uLCBJbmMuLAorICNpbmNsdWRlIDxsaXN0PgorICNpbmNsdWRlIDx2ZWN0b3I+
CisgI2luY2x1ZGUgPHNldD4KKysjaW5jbHVkZSA8bWVtb3J5PgorICNpbmNsdWRlIDxtdXRleD4K
KyAKKyBjbGFzcyBNYXBCbG9jazsKKy0tIAorMi4zMS4xCisKLS0gCjIuMzEuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
