Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25CECD68E8
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 08:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 513C6408A8;
	Tue, 10 Oct 2023 08:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 513C6408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zqnzei6TsjgU; Tue, 10 Oct 2023 08:59:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B4C840131;
	Tue, 10 Oct 2023 08:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B4C840131
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74BC71BF20B
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 08:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46C8681F32
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 08:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46C8681F32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K_GHjdVGmIGW for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 08:59:23 +0000 (UTC)
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94C1C813C1
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 08:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94C1C813C1
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 1586444023D;
 Tue, 10 Oct 2023 11:59:00 +0300 (IDT)
References: <20231010070558.9791-1-ramirez.clement3@gmail.com>
 <874jiydiiq.fsf@tarshish>
 <CADRKr2ov7vayiQPreXt1Z5mhy848UJxztJ+seMmGk1t36ikRiw@mail.gmail.com>
User-agent: mu4e 1.9.21; emacs 29.1
To: =?utf-8?Q?Cl=C3=A9ment?= Ramirez <ramirez.clement3@gmail.com>
Date: Tue, 10 Oct 2023 11:54:57 +0300
In-reply-to: <CADRKr2ov7vayiQPreXt1Z5mhy848UJxztJ+seMmGk1t36ikRiw@mail.gmail.com>
Message-ID: <87v8bec0pm.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1696928340;
 bh=pNjnHlZB7nkHsc3qe/ly0ztK2lnGPcMHTA8jvv1Zi+4=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=ZIzmnQ/A7ILv4Tf47ysBxofRqC0a2SK1ZSKk2p7SeUXgLvp6AAEBrwSX/5rnnOChD
 fg3Ig83h36FwRZYaWmpWee/1rZDkGUNoGp9q0yHTuFjhW2ND8v/q/QwhDzcMTUjFH4
 l9y9hqCPF6F4uja2X3rShsrAnw+CZbSRQvDdKdS9MtL4+q6g1TaM/o7Q7pIuPMyJSm
 /gRPZyLqDMAxz8R0SVPEb6ifd6TstB6JAnKaViYN3Tl1O+jOoNnO5BU+EgVaY472eD
 SqD5xUsE/rZHxSntRstHsky6n+aKacv/Oh4yj5Xhint5uZltvVkTeSBf9LULfjvs3E
 i+FUAQxhA2+kQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=ZIzmnQ/A
Subject: Re: [Buildroot] [PATCH] package/qemu: security bump version to 8.1.1
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQ2zDqW1lbnQsCgpPbiBUdWUsIE9jdCAxMCAyMDIzLCBDbMOpbWVudCBSYW1pcmV6IHdyb3Rl
Ogo+PiBQcm92aWRlZCB0aGF0IHRoZXNlIENWRXMgYXJlIGZpeGVkIHdpdGggdGhpcyB2ZXJzaW9u
IGJ1bXAsIHdoeSBkbyB3ZQo+PiBuZWVkIHRvIGlnbm9yZSB0aGVtPwo+Cj4gV2hlbiBJIGRvbid0
IGlnbm9yZSB0aGUgQ1ZFcyBmaXhlZCB3aXRoIHRoZSB2ZXJzaW9uIGJ1bXAsIHRoZQo+IHBrZy1z
dGF0cyB0b29sIGtlZXBzIGRpc3BsYXlpbmcgdGhlbS4KPiBJIHRoaW5rIGl0J3MgYmVjYXVzZSB0
aGUgQ1BFIGRhdGFiYXNlIGhhcyBubyBlbnRyaWVzIGZvciB0aGUgcWVtdSA4LjEuMSB2ZXJzaW9u
Cj4gYW5kIHRoZXJlZm9yZSBkb2VzIG5vdCBrbm93IHdoaWNoIENWRXMgYXJlIGZpeGVkIGluIHRo
aXMgc3BlY2lmaWMgdmVyc2lvbi4KClRoaXMgaXMgc29tZXRoaW5nIHRoYXQgc2hvdWxkIGJlIGZp
eGVkIGluIHRoZSBDUEUgZGF0YWJhc2UuCgpJbiB0aGUgbWVhbiB0aW1lIHRoZXJlIHNob3VsZCBi
ZSBhIGNvbW1lbnQgdGhhdCBleHBsYWlucyB3aHkgd2UgaWdub3JlCnRoZXNlIENWRXMgZXZlbiB0
aG91Z2ggdGhleSBkbyBub3QgYWN0dWFsbHkgYWZmZWN0IHRoZSBjdXJyZW50IHBhY2thZ2UKdmVy
c2lvbi4KCmJhcnVjaAoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfi4gLn4gICBUayBPcGVuIFN5c3RlbXMKPX0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1vb08tLVUtLU9vby0tLS0tLS0tLS0tLXs9
CiAgIC0gYmFydWNoQHRrb3MuY28uaWwgLSB0ZWw6ICs5NzIuNTIuMzY4LjQ2NTYsIGh0dHA6Ly93
d3cudGtvcy5jby5pbCAtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
