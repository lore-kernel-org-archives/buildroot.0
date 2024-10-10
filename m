Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C293CF11FC
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 15:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 406CF81D0B;
	Thu, 10 Oct 2024 15:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVqbosS4HpSY; Thu, 10 Oct 2024 15:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21CCD81CA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21CCD81CA0;
	Thu, 10 Oct 2024 15:45:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE87D1BF3D9
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 15:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D902540CF3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 15:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KeIW-S9Q5wer for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 15:45:25 +0000 (UTC)
X-Greylist: delayed 364 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 10 Oct 2024 15:45:25 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 26BA140967
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26BA140967
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=81.169.146.160; helo=mo4-p00-ob.smtp.rzone.de;
 envelope-from=nerv@dawncrow.de; receiver=<UNKNOWN> 
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.160])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26BA140967
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 15:45:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728574758; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=OrzT9pLxaMEWPavPX6jVgFqL+x9PTLhb57xqLeav3BQlfeK3cIakbikhnpWxL8N5Pv
 NoERyrUmjMq4mSC0iKY6BZbgv2eo77MVpE6WqHkv0SYT70DT+tpD2KLKHW5iUIWQv/Kj
 nX581I4opqxpDwvU3CieOcucGS8PG05BXx7H02JfvZyR0OyKQRF7qVRrIg95CAtDj+Xe
 gJmKMMwhrAeYdFrs+NhS/5jW4TgYnPnE9vL1fQWInsivpvtZ7xYS3w4QwvjzEukitxk3
 87sq1W6eZ1ZQSJQEcEtS3YsjiZJ2C5rEuqGN0R99UcdS9NG9uSSV9S1paZJfRGW9/mna
 dKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728574758;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
 Subject:Sender;
 bh=wuMmloXI0BRzVVW0tXQtz2tETnnR66YsINDdTyH2F84=;
 b=J6Ji7iHoU+BrpQkrBSfPVLzSoyJJ0wJ8LWNuy+yll6bp+3vund7Dx3TyuV+qJ9Jy/G
 QadWjYpE9yLbD0hKRGzcdkjm35T8qy97vLCxBwh4sZVzaG9Q5Kb2nYK1FeemZGat/Osh
 i/vGES+B0+O1GpqD/tweKDB9jES2khyTmz4vem3hfCofmtEH4ZnFkW0SQSDbQOMsRnxf
 XnIpINh1WhkUkXI01dxsl27CX7UE7kRg18CrJwYTviGHiyL3tlhuSl2x4y9PWYQLztz+
 3gCSeW47J1K82UjTgir+PRBe50anm9PnyliwFTbULJ5On0dXbseJ5Tthm1U6vO+111Hc
 AOQA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzY2Fi46ptduc1rEC09lTNV2vVUqpUaM="
Received: from [192.168.178.46] by smtp.strato.de (RZmta 51.2.11 DYNA|AUTH)
 with ESMTPSA id jd20c009AFdI07W
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 10 Oct 2024 17:39:18 +0200 (CEST)
Message-ID: <ff5c88fb-c745-483c-9f8e-8aa49164e76b@dawncrow.de>
Date: Thu, 10 Oct 2024 17:39:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241009213719.49469-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20241009213719.49469-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1728574758; 
 s=strato-dkim-0002; d=dawncrow.de;
 h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
 Subject:Sender;
 bh=wuMmloXI0BRzVVW0tXQtz2tETnnR66YsINDdTyH2F84=;
 b=tt33WfIn6CvSzrp1QZaCgDGZ6LmXJvs8Zj0jm4E8fgcFvSX5B8xhd9zt8B0nw80D7f
 3UTmbUpCurSi0MNrIDtONT2/HTFqpcKnFYJzPoHgBx8OoGWOxFMyghvZyQeei/AzExeh
 Ja+GCOpUNmaUF/pZzobcshO7ckO3wZOb3akHPbyWbeZUz/W+KEwRK4tGbMO6bm8+wRr2
 K7PZyMsxxN8QwohZkXzkL9TOpARgn+MsaEIfmX/GFHSHHuUaeAKNtFH/5kZ2fn5j4sPC
 tU/+sLD4LaOH97hE++GGbMLQXn2W1bjRZkGq6ohXW28PIBuuJDYE3pMkjfS+bok08K2l
 gRfg==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1728574758; 
 s=strato-dkim-0003; d=dawncrow.de;
 h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
 Subject:Sender;
 bh=wuMmloXI0BRzVVW0tXQtz2tETnnR66YsINDdTyH2F84=;
 b=Wk4BMw7L+1FxLlDZ/Xr3viy/gmE2n8DpxYUc6HT6sgfZYgsko64fZMDkV9lNXCqZ1J
 GnGJJ6yQVe0SjZz8EcBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=dawncrow.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=dawncrow.de
 header.i=@dawncrow.de header.a=rsa-sha256 header.s=strato-dkim-0002
 header.b=tt33WfIn; 
 dkim=pass header.d=dawncrow.de header.i=@dawncrow.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=Wk4BMw7L
Subject: Re: [Buildroot] [PATCH 1/1] package/wine: bump to version 9.19
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
From: =?utf-8?q?Andr=C3=A9_Zwing_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Andr=C3=A9_Zwing?= <nerv@dawncrow.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMDkuMTAuMjQgdW0gMjM6Mzcgc2NocmllYiBKdWxpZW4gT2xpdmFpbjoKPiBGb3IgYSBzdW1t
YXJ5IG9mIGNoYW5nZXMgc2luY2UgOC4wLjIsIHNlZToKPiBodHRwczovL3d3dy53aW5laHEub3Jn
L25ld3MvCj4gCj4gVGhpcyBjb21taXQgYWRkcyB0aGUgc2hhNTEyIGhhc2ggcHVibGlzaGVkIG9u
IHRoZSBkb3dubG9hZCBzaXRlLgo+IFRoZSBMSUNFTlNFIGhhc2ggYWxzbyBjaGFuZ2VkLCBkdWUg
dG8gYSB5ZWFyIHVwZGF0ZS4KPiAKPiBUaGlzIGNvbW1pdCBhbHNvIGFkZHMgbmV3IG9wdGlvbmFs
IGRlcGVuZGVuY2llcyBmb3I6Cj4geGxpYl9saWJYZml4ZXMsIGZmbXBlZywgcGNzYy1saXRlLCBh
bmQgd2F5bGFuZC4KPiAKPiBBbGwgbmV3IGJ1aWxkIG9wdGlvbnMgYXJlIGRpc2FibGVkIGluIEhP
U1RfV0lORV9DT05GX09QVFM6Cj4gZmZtcGVnLCBwY3NjLWxpdGUsIHVkZXYsIHdheWxhbmQgYW5k
IHhmaXhlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZy
Pgo+IC0tLQo+IFBhdGNoIHRlc3RlZCBpbjoKPiBodHRwczovL2dpdGxhYi5jb20vam9saXZhaW4v
YnVpbGRyb290Ly0vam9icy84MDM4MjA5ODg0CgpIaSBKdWxpZW4sCgpJSVJDIHdlIGFncmVlZCBh
dCBzb21lIHBvaW50IHRvIG9ubHkgdXNlIHN0YWJsZSB2ZXJzaW9ucyAoZS5nLiA5LjApIGluIGJ1
aWxkcm9vdC4gQW5kIHllcywgSSBoYXZlbid0IGRvbmUgdGhhdCB5ZXQgdGhpcyB5ZWFyLgpTbywg
cGxlYXNlIGNvbnNpZGVyIGFkZGluZyA5LjAgaW5zdGVhZC4KCkJlc3QgcmVnYXJkcywKQW5kcsOp
IFp3aW5nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
