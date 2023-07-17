Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E0FEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 21:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0C61404D2;
	Mon, 17 Jul 2023 21:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0C61404D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPGl5qJx9-om; Mon, 17 Jul 2023 21:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A5F7404C6;
	Mon, 17 Jul 2023 21:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A5F7404C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D58F1BF2C1
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 21:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54861400FC
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 21:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54861400FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZRFVxNfz3FhW for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 21:39:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B871400AB
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B871400AB
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 21:39:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CD35E0002
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 21:39:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qLVwP-00EpEx-NX
 for buildroot@buildroot.org; Mon, 17 Jul 2023 23:39:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 23:39:37 +0200
Message-ID: <87y1je6wva.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.02.3 released
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

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cDovL2J1aWxkcm9vdC5vcmcpLgoKQnVpbGRyb290IDIw
MjMuMDIuMyBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjMudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjMudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjAyLjMgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMuMDIuMiByZWxlYXNlLgoKLSBTZWN1cml0
eSBmaXhlcyBmb3IgYmluZCwgYy1hcmVzLCBkYXYxZCwgZGJ1cywgZ2hvc3RzY3JpcHQsIGpoZWFk
LAogIGxpYmNhcCwgbm9kZWpzLCBwaHAsIHB5dGhvbi1kamFuZ28sIHB5dGhvbi1yZXF1ZXN0cywg
cHl0aG9uMywgdGlmZiwKICB3aXJlc2hhcmsKCi0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0
aW9uL3J1bnRpbWUvbGljZW5zZSBpc3N1ZXMgaW4gYWdlbnRwcCwKICBhbHNhLXBsdWdpbnMsIGFz
c2ltcCwgYnVzeWJveCwgY2hlY2ssIGZmdHcsIGZsdWlkc3ludGgsIGZ3dHMsIGdudXBnMiwKICBn
bnVyYWRpbywgZ3VwbnAsIGhhcHJveHksIGhlaW1kYWwsIGh3ZGF0YSwgbGliZ2NyeXB0LCBsaWJn
cGctZXJyb3IsCiAgbGliZ3RrMywgbGlieHNsdCwgbWVzYTNkLWRlbW9zLCBtcGlyLCBwa2djb25m
LCBweXRob24tY3J5cHRvZ3JhcGh5LAogIHB5dGhvbi1kYnVzLWZhc3QsIHB5dGhvbi1weWljdSwg
cXQ2LCBxdWlja2pzLCBzY29uZXNlcnZlciwgdGFnbGliLAogIHhkcml2ZXJfeGY4Ni12aWRlby1k
dW1teQoKRm9yIG1vcmUgZGV0YWlscywgc2VlIHRoZSBDSEFOR0VTIGZpbGU6CgpodHRwczovL2dp
dC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9wbGFpbi9DSEFOR0VTP2lkPTIwMjMuMDIuMwoKVXNl
cnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVw
Z3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBlb3BsZSBjb250cmlidXRpbmcgdG8gdGhp
cyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zbiAyMDIzLjAyLjIuLgoKICAgIDQyICBCZXJuZCBL
dWhscwogICAgMTAgIFBldGVyIEtvcnNnYWFyZAogICAgIDIgIEdhcnkgQmlzc29uCiAgICAgMiAg
SmFtZXMgSGlsbGlhcmQKICAgICAyICBNYXJjaW4gTmllc3Ryb2oKICAgICAxICBDaGFybGVzIEhh
cmRpbgogICAgIDEgIEZyYW5jb2lzIFBlcnJhZAogICAgIDEgIEd3ZW5oYWVsIEdvYXZlYy1NZXJv
dQogICAgIDEgIEp1bGllbiBPbGl2YWluCiAgICAgMSAgTHVjYSBDZXJlc29saQogICAgIDEgIFBl
dGVyIFNlaWRlcmVyCiAgICAgMSAgUm9tYWluIE5hb3VyCiAgICAgMSAgU8OpYmFzdGllbiBTenlt
YW5za2kKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
