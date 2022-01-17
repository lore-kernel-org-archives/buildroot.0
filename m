Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30390C433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 21:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9565340495;
	Mon, 17 Jan 2022 21:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdLQ6PYdju4F; Mon, 17 Jan 2022 21:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC3F8403EC;
	Mon, 17 Jan 2022 21:19:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8901BF388
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 21:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 289154031F
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 21:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C540OxyZ-FeL for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 21:19:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E225A4031E
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 21:19:33 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id d3so62413852lfv.13
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 13:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lkeKO4h07KYRjub63tCTgTw8Dr16m2obLEdXCqiMSpQ=;
 b=CW0NT1GxkpQqdoxyPeneDijhf/85vekpka9L6o7DnrFs+hsph9daXA1b1ovGra2b64
 RGJEMYMrkaYj8ns8KxuLgRViYzyMqmr9I8sx0OKj3pUYFVVZiN3Ep3GR8KGBIsueHUWC
 JnVr6/11nOwb1gan6XepsfX9I0z6+YVYofcZB7dGK23PoCqisQ6KsEk9karBANqXljPC
 5Wobp5AZ33GcBLr8glGBPp5pQqQfUGn0Q+fxGTKfZl+5YefNETgfSc+q+326UJY0juZN
 Efc6Il2T5HZaZoH7MIu5PU+Kzhy8M5oHXSwGRZTJafWgYW6ScQJO6mOQVb9isfVPaYbE
 LQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lkeKO4h07KYRjub63tCTgTw8Dr16m2obLEdXCqiMSpQ=;
 b=OHsQGGLD/JH6YrXi4piIUf2CjL0GnYQjkbS745parxXKVgsUcK4x434ngESjrHVufm
 rwp80TAOOkjnNgwXRY1HwmcWwIazUxiXozuZNidUqSvhQBoErEP4/+aayzLwXUJBRGo4
 Pg1sAfFVNtrHL5uBhON87UcqeWuTRzuK573AoJBW5oYbGDe4zTHqCPRyNOFp0lMF4DO/
 bOQTrtt/BgHzyeO979UHzUhPwiSnqJKImwDaUT6pg+a0aA9VPaT8hLwBZWUCFGFks2AV
 eEuhg0Q2+RagD/Ly+hn7pxfluH2ulcoRwob30yaGw9MejAPgFQa1R7xILmT57FIxzUPP
 OOVw==
X-Gm-Message-State: AOAM5325sE7Bb4bDWoQGRpo8ZAeMuP2guitkqLLalbmsMtRP8ixa6xF2
 IDy7IIwL1kfCs7nAgkJ0UgmT8ZcPa4o=
X-Google-Smtp-Source: ABdhPJypwrRJTguKlA7haARPn5L5spiyXz/rvdhPQqPlxMtXW6nst4AKAe7VE3l5FnysfxZKq7RibQ==
X-Received: by 2002:a2e:8751:: with SMTP id q17mr16275898ljj.235.1642454371533; 
 Mon, 17 Jan 2022 13:19:31 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.204])
 by smtp.gmail.com with ESMTPSA id l1sm558477lji.49.2022.01.17.13.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 13:19:31 -0800 (PST)
Message-ID: <4f564638-77fa-be2c-6bed-2ea5937695d7@gmail.com>
Date: Tue, 18 Jan 2022 00:19:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: ru-RU
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220116112600.28441-1-kuzminov.sergey81@gmail.com>
 <300B22A3-0051-4FF0-8B59-499BC08C6A7C@benettiengineering.com>
 <78e0fe75-0ecc-51ce-6270-d6f228cfdbaf@gmail.com>
 <759da9ea-e1b8-353c-9745-1f9d91038f08@benettiengineering.com>
 <5abde9b8-d7de-ceb7-10bb-136f3f5992f1@gmail.com>
 <4da691a9-cdba-1a3c-0aed-f2b8ac072e0d@benettiengineering.com>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <4da691a9-cdba-1a3c-0aed-f2b8ac072e0d@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] board/orangepi/orangepi-zero:extlinux,
 refactoring
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T2suIEknbGwgbWFrZSBhIHYyIHBhdGNoIHRvbW9ycm93LCBJIHdhbnQgdG8gY2hlY2sgc29tZXRo
aW5nIGVsc2UgCihCUjJfQVJNX0VBQklIRiwgQlIyX0FSTV9GUFVfTkVPTl9WRlBWNCkuCgoxOC4w
MS4yMDIyIDAwOjA4LCBHaXVsaW8gQmVuZXR0aSDQv9C40YjQtdGCOgo+IEhpIFNlcmdleSwKPgo+
IHBsZWFzZSBrZWVwIE1MIGluIENjLAo+Cj4gT24gMTcvMDEvMjIgMjE6NTYsIFNlcmdleSBLdXpt
aW5vdiB3cm90ZToKPj4gSGksIEdpdWxpby4gV2lmaSBpcyB3b3JraW5nLCB0aGFua3MuCj4+Cj4+
ICMgdW5hbWUgLWEKPj4gTGludXggT3JhbmdlUGlfWmVybyA1LjE2LjEgIzEgU01QIE1vbiBKYW4g
MTcgMjE6NDY6NDUgTVNLIDIwMjIgYXJtdjdsCj4+IEdOVS9MaW51eAo+PiAjIGl3Y29uZmlnCj4+
IGxvwqDCoMKgwqDCoMKgwqAgbm8gd2lyZWxlc3MgZXh0ZW5zaW9ucy4KPj4KPj4gZXRoMMKgwqDC
oMKgwqAgbm8gd2lyZWxlc3MgZXh0ZW5zaW9ucy4KPj4KPj4gd2xhbjDCoMKgwqDCoCBJRUVFIDgw
Mi4xMcKgIEVTU0lEOiJBRkQ3REYiCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBNb2RlOk1hbmFn
ZWTCoCBGcmVxdWVuY3k6Mi40NTIgR0h6wqAgQWNjZXNzIFBvaW50Ogo+PiAyQzpDODoxQjo0QzpF
MTpGMwo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgQml0IFJhdGU9MjYgTWIvc8KgwqAgVHgtUG93
ZXI9MjAgZEJtCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBSZXRyeSBzaG9ydCBsaW1pdDo3wqDC
oCBSVFMgdGhyOm9mZsKgwqAgRnJhZ21lbnQgdGhyOm9mZgo+PiDCoCDCoMKgwqDCoMKgwqDCoMKg
wqAgRW5jcnlwdGlvbiBrZXk6b2ZmCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBQb3dlciBNYW5h
Z2VtZW50Om9uCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBMaW5rIFF1YWxpdHk9MjgvNzDCoCBT
aWduYWwgbGV2ZWw9LTgyIGRCbQo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgUnggaW52YWxpZCBu
d2lkOjDCoCBSeCBpbnZhbGlkIGNyeXB0OjDCoCBSeCBpbnZhbGlkIGZyYWc6MAo+PiDCoCDCoMKg
wqDCoMKgwqDCoMKgwqAgVHggZXhjZXNzaXZlIHJldHJpZXM6NMKgIEludmFsaWQgbWlzYzowwqDC
oCBNaXNzZWQgYmVhY29uOjAKPj4KPj4gIyBpZmNvbmZpZwo+PiBldGgwwqDCoMKgwqDCoCBMaW5r
IGVuY2FwOkV0aGVybmV0wqAgSFdhZGRyIDAyOjQyOkZEOjQ2OjFEOkQzCj4+IMKgIMKgwqDCoMKg
wqDCoMKgwqDCoCBVUCBCUk9BRENBU1QgTVVMVElDQVNUwqAgTVRVOjE1MDDCoCBNZXRyaWM6MQo+
PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgUlggcGFja2V0czowIGVycm9yczowIGRyb3BwZWQ6MCBv
dmVycnVuczowIGZyYW1lOjAKPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgIFRYIHBhY2tldHM6MCBl
cnJvcnM6MCBkcm9wcGVkOjAgb3ZlcnJ1bnM6MCBjYXJyaWVyOjAKPj4gwqAgwqDCoMKgwqDCoMKg
wqDCoMKgIGNvbGxpc2lvbnM6MCB0eHF1ZXVlbGVuOjEwMDAKPj4gwqAgwqDCoMKgwqDCoMKgwqDC
oMKgIFJYIGJ5dGVzOjAgKDAuMCBCKcKgIFRYIGJ5dGVzOjAgKDAuMCBCKQo+PiDCoCDCoMKgwqDC
oMKgwqDCoMKgwqAgSW50ZXJydXB0OjQzCj4+Cj4+IGxvwqDCoMKgwqDCoMKgwqAgTGluayBlbmNh
cDpMb2NhbCBMb29wYmFjawo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgaW5ldCBhZGRyOjEyNy4w
LjAuMcKgIE1hc2s6MjU1LjAuMC4wCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBVUCBMT09QQkFD
SyBSVU5OSU5HwqAgTVRVOjY1NTM2wqAgTWV0cmljOjEKPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKg
IFJYIHBhY2tldHM6MCBlcnJvcnM6MCBkcm9wcGVkOjAgb3ZlcnJ1bnM6MCBmcmFtZTowCj4+IMKg
IMKgwqDCoMKgwqDCoMKgwqDCoCBUWCBwYWNrZXRzOjAgZXJyb3JzOjAgZHJvcHBlZDowIG92ZXJy
dW5zOjAgY2FycmllcjowCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBjb2xsaXNpb25zOjAgdHhx
dWV1ZWxlbjoxMDAwCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBSWCBieXRlczowICgwLjAgQinC
oCBUWCBieXRlczowICgwLjAgQikKPj4KPj4gd2xhbjDCoMKgwqDCoCBMaW5rIGVuY2FwOkV0aGVy
bmV0wqAgSFdhZGRyIDEyOjQyOkZEOjQ2OjFEOkQzCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBp
bmV0IGFkZHI6MTkyLjE2OC4xMC4yNDDCoCBCY2FzdDoxOTIuMTY4LjEwLjI1NSAKPj4gTWFzazoy
NTUuMjU1LjI1NS4wCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBVUCBCUk9BRENBU1QgUlVOTklO
RyBNVUxUSUNBU1TCoCBNVFU6MTUwMMKgIE1ldHJpYzoxCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDC
oCBSWCBwYWNrZXRzOjg4IGVycm9yczowIGRyb3BwZWQ6MzQgb3ZlcnJ1bnM6MCBmcmFtZTowCj4+
IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBUWCBwYWNrZXRzOjE0IGVycm9yczowIGRyb3BwZWQ6MCBv
dmVycnVuczowIGNhcnJpZXI6MAo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgY29sbGlzaW9uczow
IHR4cXVldWVsZW46MTAwMAo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgUlggYnl0ZXM6MTM1MTYg
KDEzLjEgS2lCKcKgIFRYIGJ5dGVzOjE5MjcgKDEuOCBLaUIpCj4+Cj4+ICMgcGluZyBnb29nbGUu
Y29tCj4+IFBJTkcgZ29vZ2xlLmNvbSAoMjE2LjIzOS4zOC4xMjApOiA1NiBkYXRhIGJ5dGVzCj4+
IDY0IGJ5dGVzIGZyb20gMjE2LjIzOS4zOC4xMjA6IHNlcT0wIHR0bD0xMDIgdGltZT01NC44OTAg
bXMKPj4gNjQgYnl0ZXMgZnJvbSAyMTYuMjM5LjM4LjEyMDogc2VxPTEgdHRsPTEwMiB0aW1lPTU0
LjEwMiBtcwo+PiA2NCBieXRlcyBmcm9tIDIxNi4yMzkuMzguMTIwOiBzZXE9MiB0dGw9MTAyIHRp
bWU9NTEuNTgzIG1zCj4+IF5DCj4+IC0tLSBnb29nbGUuY29tIHBpbmcgc3RhdGlzdGljcyAtLS0K
Pj4gMyBwYWNrZXRzIHRyYW5zbWl0dGVkLCAzIHBhY2tldHMgcmVjZWl2ZWQsIDAlIHBhY2tldCBs
b3NzCj4+IHJvdW5kLXRyaXAgbWluL2F2Zy9tYXggPSA1MS41ODMvNTMuNTI1LzU0Ljg5MCBtcwo+
Pgo+Cj4gVGhhbmtzIGEgbG90IGZvciB0cnlpbmcuIFNvIHBsZWFzZSBidW1wIGxpbnV4IHZlcnNp
b24gdG8gCj4gbGF0ZXN0KDUuMTYuMSkgYW5kIHNlbmQgVjIgcGF0Y2guIEluIHRoZSBtZWFud2hp
bGUgSSd2ZSBqdXN0IHNlbnQgYSAKPiBwYXRjaCBmb3Igcng4MTktcmFkaW86Cj4gaHR0cHM6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDExNzIxMDcz
OS4yMDIyNTUxLTEtZ2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbS8gCj4KPgo+
IFNvIHdoZW4geW91IHNlbmQgVjIsIHBsZWFzZSBjcmVhdGUgYSBjb3Zlci1sZXR0ZXIgd2hlcmUg
eW91IHN0YXRlIG15IAo+IHBhdGNoIGZvciByeDgxOS1yYWRpbyBpcyBuZWVkZWQgdG8gd29yay4K
Pgo+IFRoYW5rIHlvdSEKPiBCZXN0IHJlZ2FyZHMKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
