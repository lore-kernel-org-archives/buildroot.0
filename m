Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A5DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 051F1401D6;
	Sun,  6 Feb 2022 20:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CuP5tZrWxDTZ; Sun,  6 Feb 2022 20:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E664340201;
	Sun,  6 Feb 2022 20:48:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF98F1BF360
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D64474010F
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=posteo.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JSlsuQUd4m-p for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:48:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBAD6400CE
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:48:17 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 3FE7B240028
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 21:48:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1644180495; bh=yfwIEVzeUBMZuNT0DiWTmK+/BN6Q7BAh/rHGGV+7MsY=;
 h=Date:From:To:Cc:Subject:From;
 b=I/M8X0xgBu0Np1ZRUcqofkId/3HYEhIOFyBlkIx4DtPIAUIdzln+x6sfk4/OpyKxw
 3iV9TgpxnvCej6eUe7NEg6owOGSZQ8CPM4KQpV52c4QvQd6ZyzQfIRqi63RbBV+9By
 NRh/pTfQuUl0MI4RHuey/fldtk70egH5bD46sh+YogjDK6FuXvVvjh6TLKtXKWbUf5
 wO66MfowmLe6v3L0pbTrdQTYZSPB4TDwXJkJJTaq9D8mRCzkfhlXsPsXPNOYVlTTa9
 kNckTPJI/Bxmpkd0iZP3gte6fwzRAEsqO47mwQ0iO2XccXENTs7JpZB/4hxCUEFPVw
 URnWFYbPdKJUA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4JsLvd1yK3z6tmK;
 Sun,  6 Feb 2022 21:48:12 +0100 (CET)
Date: Sun,  6 Feb 2022 20:47:00 +0000
From: Daniil Stas <daniil.stas@posteo.net>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20220206224700.4b3519b2@ux550ve>
In-Reply-To: <87mtj3de6j.fsf@tarshish>
References: <20220206020711.3dc6e42e@ux550ve>
	<87mtj3de6j.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [BUG] boot/arm-trusted-firmware: Stack protection
 setting doesn't work
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksIEJhcnVjaAoKPiBXaGF0IGhhcHBlbnMgd2hlbiB5b3UgYnVpbGQgd2l0aCBhIHRvb2xjaGFp
biB0aGF0IGhhcyBubyBTU1Agc3VwcG9ydAo+IHdpdGggdGhlIGNvbW1pdCB5b3UgbWVudGlvbmVk
IHJldmVydGVkPyBJIGJlbGlldmUgeW91IHdpbGwgZ2V0IGEgYnVpbGQKPiBlcnJvciBzaW1pbGFy
IHRvIHRoaXMgb25lOgo+IAo+IGFhcmNoNjQtYnVpbGRyb290LWxpbnV4LXVjbGliYy1nY2MuYnJf
cmVhbDogZXJyb3I6IHVucmVjb2duaXplZAo+IGNvbW1hbmQtbGluZSBvcHRpb24g4oCYLWZzdGFj
ay1wcm90ZWN0b3ItMOKAmTsgZGlkIHlvdSBtZWFuCj4g4oCYLWZzdGFjay1wcm90ZWN0b3LigJk/
IGFhcmNoNjQtYnVpbGRyb290LWxpbnV4LXVjbGliYy1nY2MuYnJfcmVhbDoKPiBlcnJvcjogdW5y
ZWNvZ25pemVkIGNvbW1hbmQtbGluZSBvcHRpb24g4oCYLWZzdGFjay1wcm90ZWN0b3ItMOKAmTsg
ZGlkCj4geW91IG1lYW4g4oCYLWZzdGFjay1wcm90ZWN0b3LigJk/IE1ha2VmaWxlOjEwNzU6IHJl
Y2lwZSBmb3IgdGFyZ2V0Cj4gJy9idWlsZHMvYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qvb3V0cHV0
L2J1aWxkL2FybS10cnVzdGVkLWZpcm13YXJlLXYyLjQvYnVpbGQvYTgweDBfbWNiaW4vcmVsZWFz
ZS9saWJjL2Fzc2VydC5vJwo+IGZhaWxlZCBtYWtlWzFdOiAqKioKPiBbL2J1aWxkcy9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYXJtLXRydXN0ZWQtZmlybXdhcmUtdjIuNC9i
dWlsZC9hODB4MF9tY2Jpbi9yZWxlYXNlL2xpYmMvYXNzZXJ0Lm9dCj4gRXJyb3IgMQo+IAo+IENv
cGllZCBmcm9tCj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0v
am9icy8xNDk3NjYzMjk0Lgo+IAo+IERvIHlvdSBoYXZlIGEgYmV0dGVyIHN1Z2dlc3Rpb24/Cj4g
Cj4gYmFydWNoCj4gCgpZZXMsIGlmIHlvdSBwYXNzIEVOQUJMRV9TVEFDS19QUk9URUNUT1I9MCBh
cmd1bWVudCB0byB0aGUgbWFrZSBjb21tYW5kCnlvdSB3aWxsIGdldCB0aGlzIGVycm9yLgoKSSBk
b24ndCBrbm93IHdoYXQgaXMgdGhlIHByb3BlciBmaXggaGVyZS4uLgpUaGUgY3VycmVudCBURi1B
IGRvY3VtZW50YXRpb24gc2F5cyB0aGF0IHRoZSB2YWxpZApFTkFCTEVfU1RBQ0tfUFJPVEVDVE9S
IHZhbHVlcyBhcmU6ICJhbGwiLCAic3Ryb25nIiwgImRlZmF1bHQiIGFuZAoibm9uZSIuIEFuZCB0
aGUgY29tbWVudHMgaW4gQnVpbGRyb290IHNheSB0aGF0J3Mgb2xkZXIgdmVyc2lvbnMgZGlkbid0
CnN1cHBvcnQgIm5vbmUiIHZhbHVlIGFuZCBleHBlY3RlZCAiMCIgdmFsdWUgaW5zdGVhZCAobG9v
a3MgbGlrZSBpdCB3YXMKY2hhbmdlZCBpbiBURi1BIGNvbW1pdCBmZDdiMjg3Y2JlKS4KCk1heWJl
IEJ1aWxkcm9vdCBzaG91bGQgY2hlY2sgdGhlIFRGLUEgdmVyc2lvbiBhbmQgb25seSBwYXNzICIw
IiB0byB0aGUKb2xkIHZlcnNpb25zLiBCdXQgSSBkb24ndCBrbm93IGlmIHRoaXMgdmVyc2lvbiBj
b21wYXJpc29uIGNhbiBiZQppbXBsZW1lbnRlZCBpbiBCdWlsZHJvb3QuCgpPciBtYXliZSB3ZSBj
YW4gZ2l2ZSB1c2VyIGFuIGFkZGl0aW9uYWwgb3B0aW9uIHRvIHNwZWNpZnkgaG93IHRvIHBhc3MK
RU5BQkxFX1NUQUNLX1BST1RFQ1RPUiBhcmd1bWVudCwgYnV0IHRoaXMgZG9lc24ndCBsb29rIHZl
cnkKY29udmVuaWVudC4uLgoKT3IgbWF5YmUgaXQncyBiZXR0ZXIgdG8gcGF0Y2ggVEYtQSBzbyB0
aGUgbmV3ZXIgdmVyc2lvbnMgdHJlYXRlZCAiMCIKdmFsdWUgZXhhY3RseSBhcyAibm9uZSIuLi4K
CkJlc3QgcmVnYXJkcywKRGFuaWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
