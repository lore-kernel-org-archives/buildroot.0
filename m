Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C210C5DF8E
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 22:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3982E80FC1;
	Thu, 20 Aug 2026 22:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-hv22tRii0B; Thu, 20 Aug 2026 22:18:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787264293;
	bh=n5q74cKT5f3VInZid83i0+RGJxnOX3SVJCPOL6k1klY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ALbdnL2ClFGH/6iCrCKEC1xXl/2LbFbLI5/1p32/hSOblkuGJNbOUtB7pdcSD5/1x
	 EcYRzHDL5csaps1lzCY73RlH1ZPYmcEmQljqsH9kfSy1GBpvKdIP4/BKCfm/BVtl4I
	 NwBYZXzBHcf6aF65qq131P51Gtawv5snr7DvC2kgWIDh/BVjYpVxIv53n0OlLAEw6Q
	 CG4BOzLfVSjZMrPs7h8mR+Uh/2BxVjwGNsGZx6fMOaxtNEguXNqpptthLgkjVov9Tq
	 WQrjQ3Be+KiNADrAo5m9e61dJk4Nsus6dr4AgXX3h3YuXAhhQp2RV4Tu2mIZERIF8G
	 6ei2RGEnwQYfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D392C80C41;
	Thu, 20 Aug 2026 22:18:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89473EA3
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 22:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7858980C41
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 22:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VciC7Tot14YN for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 22:18:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7041780B63
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 22:18:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1F71F4E4130E;
 Thu, 20 Aug 2026 22:18:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D90A55FF59;
 Thu, 20 Aug 2026 22:18:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DE67511C76915; 
 Fri, 21 Aug 2026 00:18:03 +0200 (CEST)
Date: Fri, 21 Aug 2026 00:18:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aod9DnrVNEch93zS@windsurf>
References: <20260623051725.4526-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260623051725.4526-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: add upstream patch to fix
 build on s390, mark unavailable on m68k
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdW4gMjMsIDIwMjYgYXQgMDc6MTc6MjVBTSArMDIwMCwgQmVybmQgS3VobHMgd3Jv
dGU6Cj4gQnVpbGQgZXJyb3JzIHdlcmUgZm91bmQgYnkgdGhlIEdpdGxhYiBwaXBlbGluZXMgd2l0
aCB0aGVzZSBkZWZjb25maWdzOgo+IAo+IC0gYm9vdGxpbi1tNjhrLTY4MDQwLXVjbGliYwo+ICAg
Q01ha2UgRXJyb3IgYXQgY21ha2Uvc2NyaXB0cy9saW51eC9BcmNoU2V0dXAuY21ha2U6NTAgKG1l
c3NhZ2UpOgo+ICAgICBVbmtub3duIENQVTogbTY4awo+IAo+IC0gYm9vdGxpbi1zMzkweC16MTMt
Z2xpYmMKPiAgIENNYWtlIEVycm9yIGF0IGNtYWtlL3NjcmlwdHMvbGludXgvQXJjaFNldHVwLmNt
YWtlOjUwIChtZXNzYWdlKToKPiAgICAgVW5rbm93biBDUFU6IHMzOTB4Cj4gCj4gQmFja3BvcnQg
YW4gdXBzdHJlYW0gY29tbWl0IGZyb20gdGhlIHVwY29taW5nIFBpZXJzIGJyYW5jaCB0byBmaXgg
dGhlCj4gcmVzdHJpY3Rpb24gaW4gQXJjaFNldHVwLmNtYWtlLgo+IAo+IFRoaXMgY2F1c2VkIGEg
ZGlmZmVyZW50IGJ1aWxkIGVycm9yIG9uIG02OGsgbGF0ZXIgb246Cj4gCj4gL2J1aWxkcy9ia3Vo
bHMvYnVpbGRyb290L2JyLXRlc3QtcGtnL2Jvb3RsaW4tbTY4ay02ODA0MC11Y2xpYmMvYnVpbGQv
a29kaS0yMS4zLU9tZWdhL3hibWMvdXRpbHMvTWF0aFV0aWxzLmg6MTQyOjU6Cj4gIGVycm9yOiB1
bmtub3duIHJlZ2lzdGVyIG5hbWUg4oCYc3TigJkgaW4g4oCYYXNt4oCZCj4gICAxNDIgfCAgICAg
X19hc21fXyBfX3ZvbGF0aWxlX18gKAo+IAo+IGJlY2F1c2UgbTY4ayBpcyBub3QgcGFydCBvZiB0
aGUgbGlzdCBvZiBhcmNocyB0byBkaXNhYmxlIGFzbSBjb2RlOgo+IGh0dHBzOi8vZ2l0aHViLmNv
bS94Ym1jL3hibWMvYmxvYi9PbWVnYS94Ym1jL3V0aWxzL01hdGhVdGlscy5oI0wyNgo+IAo+IFVw
c3RyZWFtIHJlamVjdGVkIHRvIGFkZCBtNjhrIHRoZXJlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS94
Ym1jL3hibWMvcHVsbC8yMjUxOQo+IGh0dHBzOi8vZ2l0aHViLmNvbS94Ym1jL3hibWMvcHVsbC8y
MjM1NyNpc3N1ZWNvbW1lbnQtMTM2ODM1ODQ3MQo+IAo+IHNvIHdlIGRpc2FibGUgbTY4ayBpbiBC
UjJfUEFDS0FHRV9LT0RJX0FSQ0hfU1VQUE9SVFMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmVybmQg
S3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KClRoYW5rcywgYXBwbGllZCB0byBtYXN0ZXIhCgpUaG9t
YXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290
bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
