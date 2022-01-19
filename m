Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C53C433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 08:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 202DE41515;
	Wed, 19 Jan 2022 08:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPeh8BUwa6B4; Wed, 19 Jan 2022 08:14:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51F39409AC;
	Wed, 19 Jan 2022 08:14:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76E3C1BF35B
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 08:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72F12409AC
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 08:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bt8nNw9PWGjP for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 08:14:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED2234091D
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 08:14:50 +0000 (UTC)
Received: from smtpclient.apple ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPA
 id A67EnTDiYc6LXA67Fn7D0M; Wed, 19 Jan 2022 09:14:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642580089; bh=Qg4xhQAwSfPYAI5UD+HrSxE5tCAqjFr80XbyGbWHrYM=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=ivAkpv0Lg/+mHZUqDpCJUhlrS5hawh84AD8iqdlpfNaARQ1HesS5kXYfdDw+HEo+i
 B8eQVE//Z99li7BNlDqwHZ0HXTw7HN5cA2Cd6Sw2j59Ym7M/1iEBnTeY5l1K52aPZs
 Ti2+i7J4KSvVM6cThniwxn0SE0qtDN2QasXFQKk92Edp8JP9OiwKkzzPSmzdhjXIk6
 WI+ST/dduxFJAsbnMDJ2WNoUe382WVWDD9Xdt9zm2okGb7zRRY2vKTOOk8b3GW+Ze1
 WcPZUHWOX/OpFX6+QTwqG28Y/lQU2NTOBaWHoHjnVNhh8c4G/r9lt5LvqC9iJ14Xl1
 HmF5U0BBZTLtg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 19 Jan 2022 09:14:48 +0100
Message-Id: <DDA3B9CA-4DF9-4E3E-8B23-B62D04711735@benettiengineering.com>
References: <20220119085411.22ee6fb6@windsurf>
In-Reply-To: <20220119085411.22ee6fb6@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfJUGW9au/4SyDrqtzR/eX3g8NhY2jz3t+1irI1J5oUmMj7G62LnJqlfAkSjwrAqe/yFSajcgPwtYk3w9OkSHOoBuGxVB1ygFxQ5c3P679jFPbtJR1LPV
 gYD9fZtkmWMlaZy7F7OBR5bTuZU1KV74YbEyPKateFDb2E7hmR+SZJdidyBrGB8lgbWx4kS/ONZaJ3dt9qiAHi461icn+No552zjuk1AL5XeK8oSMVf0IlOg
 Z1XmvYIn2R6GAz8Nv+7M68vbGZWioSmGOXhcLFmEkSNMNxV/wETrEmVgzWcwJ08+B9WETgshar15SVN5gx3yZpc4Klj82GqdjcPUdq1U+7VI/uvaA8UfOOog
 jpyaYPXqcyqkgLYSZDq84axKtFkwBzuA/6WY1vL9UoaKucSSuPU=
Subject: Re: [Buildroot] [PATCH 1/2] package/gcc: define _REENTRANT for
 OpenRISC when -pthread is passed
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, Will Newton <will.newton@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLCBBbGwsCgo+IElsIGdpb3JubyAxOSBnZW4gMjAyMiwgYWxsZSBvcmUgMDg6NTYs
IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGhhIHNjcml0
dG86Cj4gCj4g77u/SGVsbG8gRmFicmljZSwKPiAKPj4gT24gVHVlLCAxOCBKYW4gMjAyMiAyMzoy
NDoyNCArMDEwMAo+PiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bT4gd3JvdGU6Cj4+IAo+PiBQYXRjaCBhZGRlZCBieSBjb21taXQgZWVlOTZiMGYwYWQyMjRiM2Uw
OWE5Yjk4YzI2ZDA1NmUxOGYxN2ZkNSBvbiBnY2MKPj4gOS4zLjAgbXVzdCBhbHNvIGJlIGFwcGxp
ZWQgb24gZ2NjIDEwIGFuZCAxMSB0byBhdm9pZCB0aGUgZm9sbG93aW5nIGJ1aWxkCj4+IGZhaWx1
cmUgb24gbnVtZXJvdXMgcGFja2FnZXMgKGJhYmVsdHJhY2UyLCBwY3NjLWxpdGUsIHRwbTItcGtj
czExLAo+PiBldGMuKToKPj4gCj4+IGNvbmZpZ3VyZToxMzc3NDogY2hlY2tpbmcgd2hldGhlciBw
dGhyZWFkcyB3b3JrIHdpdGggLXB0aHJlYWQKPj4gY29uZmlndXJlOjEzODY4OiAvaG9tZS9naXVs
aW9iZW5ldHRpL2F1dG9idWlsZC9ydW4vaW5zdGFuY2UtMC9vdXRwdXQtMS9ob3N0L2Jpbi9vcjFr
LWxpbnV4LWdjYyAtbyBjb25mdGVzdCAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0
X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0ICAtT3MgLWcyICAtc3RkPWdudTk5IC1wdGhy
ZWFkIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZG
U0VUX0JJVFM9NjQgIGNvbmZ0ZXN0LmMgICA+JjUKPj4gY29uZnRlc3QuYzoyNzoyNjogZXJyb3I6
ICNlcnJvciAiX1JFRU5UUkFOVCBtdXN0IGJlIGRlZmluZWQiCj4+ICAgMjcgfCAjICAgICAgICAg
ICAgICAgICAgICAgICAgZXJyb3IgIl9SRUVOVFJBTlQgbXVzdCBiZSBkZWZpbmVkIgo+PiAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+Cj4+IAo+PiBJdCBzaG91bGQgYmUgbm90
ZWQgdGhhdCBleHRlcm5hbCBib290bGlucyB3aWxsIGhhdmUgdG8gYmUgcmVidWlsdC4KPj4gCj4+
IEZpeGVzOgo+PiAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2NiNThk
NGZiYWViMDhkMTg4YzJmOGJmMDVlZjE2MDQ3ODlmYTg3NjYKPj4gLSBodHRwOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy83YWY5ZDRiNjhiZDQ2ZWQyNjBlZDY2YmEyY2MzYzljMjE0
ODJlNzQxCj4+IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNmY5MjZi
ZWMxNDY3NTI4NzNmODAzMmI1OTNmMGRlMWNiMjIyZWE0Ngo+PiAKPj4gU2lnbmVkLW9mZi1ieTog
RmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gCj4gV293LCB0
aGlzIHBhdGNoIHN0aWxsIGhhc24ndCBiZWVuIGFjY2VwdGVkIGluIHVwc3RyZWFtIGdjYz8gSXQn
cyBiZWVuCj4gc3VibWl0dGVkIGEgbG9vb25nIHRpbWUgYWdvIEkgYmVsaWV2ZS4KClRoYXTigJlz
IHdoZW4gdGhlIG5ldyBtYWludGFpbmVyIHRvb2sgb3ZlciB0aGUgcHJldmlvdXMgb25lLiBJIHBp
bmcgaGltIGFib3V0IHRoaXMgc28gaGUgY2FuIGNvbW1pdCBpdC4gWWV0QW5vdGhlck9yMWtCdWcg
Oi0pCgpCZXN0IHJlZ2FyZHMKR2l1bGlvCgo+IAo+IFRob21hcwo+IC0tIAo+IFRob21hcyBQZXRh
enpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
