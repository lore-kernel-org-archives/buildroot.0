Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A17C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:35:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C55361501
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C55361501
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED9E540017;
	Mon,  4 Oct 2021 20:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BdEi2mNPxloj; Mon,  4 Oct 2021 20:35:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E67F6400D1;
	Mon,  4 Oct 2021 20:35:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBA1F1BF2C5
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA200400D1
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-XJ-7Su_hpO for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:35:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A57640017
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:35:48 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XUgcmZfHIJzjeXUgcmJu7D; Mon, 04 Oct 2021 22:35:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633379746; bh=cGYwKWUfZ3Hn3muP2KPCjf9ZgYv+kl8tPUqLg2AjK4M=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=a9DldHcdJT6c9t8hnmJvg55XO0GodtvW3060W2YotZDqSptoYvIMYEdKh/NLxQwRY
 Mfj+kE6HcwEU3VOJ5C2j4FPMIFnkTJ2ydZ8OtdavTiac+N45S8GECxAVSY87U80CcZ
 GCFfDGvmnwjXNt40zT+v2LjmbxPESbjy3RSD7MX/mL9ETPxhs1jzYkVOoK6/7b5Uxu
 qIGPRX4pjf8w3WzgSWe1oITKqnxwu5GVHlF1rzRJJwN6MgDeuYXbFN6exrFQTiFpZe
 Pdsx4iRpw5icAw9Ht74TESPXPO/ZH+Exs0iL1r1Q0u2/JIYBxD4h+1fmlTVSSrgsSC
 cy+VoigxxXGjA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Peter Korsgaard <peter@korsgaard.com>
References: <20211004150113.GB1504958@scaer>
 <1462D59B-55E2-4933-AD39-7EF25B2FBE9E@benettiengineering.com>
Message-ID: <8d31c452-eed9-5643-37e3-945bdba91968@benettiengineering.com>
Date: Mon, 4 Oct 2021 22:35:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1462D59B-55E2-4933-AD39-7EF25B2FBE9E@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfD516gRd0LH8Dk62JEawLLuhpfY9QIG6U9zBmbztdnid7eC901szTW6Wc0U3X76PyrV6dJPn2UA25B8NUqG1NQrEBPxwmChFg1FWp//AOd8In2z9qyeW
 D7CBRjJTxWdWI4ys/Jnpf3pEoBBlZDRc2Q9J4u6RiaOxoz7FR5RjzHv4nKygSECralS5U7pSu1ToQBmeg9h8hACzhDsADxfO5f7xTixFeFL0KNrR23bYjO2A
 oueq3elq0bTexbzrCeUzOfUDkVLKqApeKkFwFFyjQzV4iBAFWJzHyrzWt9q7C5uTs+Xl5bRjjTmtmcUm/EMFnEf3tRHGzwQM2zuW+Ve7+UGjWnpprhiRyNzU
 IkXfR0L5
Subject: Re: [Buildroot] [PATCH v2] package/mesa3d: fix build on m68k
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
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWdhaW4gUGV0ZXIsIFlhbm4sIEFsbCwKCk9uIDEwLzQvMjEgNToyMyBQTSwgR2l1bGlvIEJl
bmV0dGkgd3JvdGU6Cj4gSGkgUGV0ZXIsIFlhbm4sIEFsbCwKPiAKPj4gSWwgZ2lvcm5vIDQgb3R0
IDIwMjEsIGFsbGUgb3JlIDE3OjAxLCBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJl
ZS5mcj4gaGEgc2NyaXR0bzoKPj4KPj4g77u/UGV0ZXIsIEdpdWxpbywgQWxsLAo+Pgo+PiBPbiAy
MDIxLTEwLTA0IDEzOjQ2ICswMjAwLCBQZXRlciBLb3JzZ2FhcmQgc3Bha2UgdGh1c2x5Ogo+Pj4+
Pj4+PiAiR2l1bGlvIiA9PSBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVu
Z2luZWVyaW5nLmNvbT4gd3JpdGVzOgo+Pj4KPj4+PiBUbyBidWlsZCBtZXNhM2QgZm9yIG02OGsg
d2UgbmVlZCB0byBwYXNzIC1tbG9uZy1qdW1wLXRhYmxlLW9mZnNldHMgQ0ZMQUcKPj4+PiBzaW5j
ZSAnc3dpdGNoJyBibG9ja3MgYXJlIHByZXR0eSB3aWRlIGFuZCBsZWFkIHRvIGJ1aWxkIGZhaWx1
cmUuIFRoaXMgd2F5Cj4+Pj4gJ3N3aXRjaCcgYmxvY2tzIHdpbGwgaGF2ZSBhIDMyLWJpdCBhZGRy
ZXNzaW5nIGJ5IGRlZmF1bHQgaW5zdGVhZCBvZiB0aGUKPj4+PiBzdGFuZGFyZCAxNi1iaXQuIFRo
aXMgY2FuIGJlIGRvbmUgb25seSB3aXRoIG02OGsgZ2NjIHZlcnNpb24gPj0gNy54Cj4+Pj4gYmVj
YXVzZSBnY2MgZmxhZyB1c2VkIHRvIGZpeCB0aGlzKC1tbG9uZy1qdW1wLXRhYmxlLW9mZnNldHMp
IGlzCj4+Pj4gYXZhaWxhYmxlIG9ubHkgZnJvbSB0aGF0IHZlcnNpb24gb24uCj4+Pgo+Pj4+IEZp
eGVzOgo+Pj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzYwYzQ2NTNj
MmE5MzEyNWVkYmRkMGJlYjQzY2Q0NzMwMTY0MzQ2NGEvCj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+
Pj4+IC0tLQo+Pj4+IFYxLT4gVjI6Cj4+Pj4gKiBhZGQgZ2NjID49IDcueCBkZXBlbmRlbmN5IHRv
IENvbmZpZy5pbiBhcyBzdWdnZXN0ZWQgYnkgWWFubiBNb3Jpbgo+Pj4+ICogaW1wcm92ZSBjb21t
aXQgbG9nIGFjY29yZGluZyB0byBDb25maWcuaW4gY2hhbmdlCj4+Pgo+Pj4gLi4KPj4+Cj4+Pj4g
KyMgbTY4ayBuZWVkcyAzMi1iaXQgb2Zmc2V0cyBpbiBzd2l0Y2ggdGFibGVzIHRvIGJ1aWxkCj4+
Pj4gK2lmZXEgKCQoQlIyX202OGspLHkpCj4+Pj4gK01FU0EzRF9DRkxBR1MgKz0gLW1sb25nLWp1
bXAtdGFibGUtb2Zmc2V0cwo+Pj4+ICtlbmRpZgo+Pj4+ICsKPj4+PiArTUVTQTNEX0NPTkZfT1BU
UyArPSAtRENNQUtFX0NfRkxBR1M9IiQoTUVTQTNEX0NGTEFHUykiCj4+Pj4gKwo+Pj4+ICQoZXZh
bCAkKG1lc29uLXBhY2thZ2UpKQo+Pj4KPj4+IERvZXMgdGhhdCByZWFsbHkgd29yaz8gbWVzYTNk
IGlzIHVzaW5nIG1lc29uLCBub3QgY21ha2UuCgpJdCBjb21lcyBvdXQgdGhhdCBpdCB3b3JrcwoK
Pj4KPj4gQXBwYXJlbnRseSwgbm86Cj4+ICAgICBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5v
cmcvcmVzdWx0cy8yNmEvMjZhOTdlMDgwYzQ5YzQyYzA2ZWQ1OWVjNmE5ZDUxZDgxYjBhYjg4Mi9i
dWlsZC1lbmQubG9nCgpUaGlzIGhhcyBub3QgdGhpcyBwYXRjaCBhcHBsaWVkLCBzbyBpdCdzIG9r
IGl0IGZhaWxzLgoKVGhlcmUgaXMgb25lIHVubmVjZXNzYXJ5IGxpbmU6Ck1FU0EzRF9DT05GX09Q
VFMgKz0gLURDTUFLRV9DX0ZMQUdTPSIkKE1FU0EzRF9DRkxBR1MpIgoKT24gbWVzb24gd2UgZG9u
J3QgbmVlZCBpdCwgc28gaXQncyBzdXBlcmZsb3VzIGFuZCB3aGF0IHJlYWxseSBwYXNzZXMgdGhl
IAphZGRpdGlvbmFsIENGTEFHUyBpcyBpdHNlbGY6Ck1FU0EzRF9DRkxBR1MgKz0gLW1sb25nLWp1
bXAtdGFibGUtb2Zmc2V0cwpiZWNhdXNlIGluIHBrZy1tZXNvbi5tazoKJCgyKV9DRkxBR1MgPz0g
JCQoVEFSR0VUX0NGTEFHUykKCkkndmUganVzdCBzdWJtaXR0ZWQgYSBwYXRjaCB0byByZW1vdmUg
dGhlIHVubmVjZXNzYXJ5IGxpbmUuCgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5ldHRpCkJl
bmV0dGkgRW5naW5lZXJpbmcgc2FzCgo+IFN0cmFuZ2UsIEnigJltIGdvaW5nIHRvIGZpeCBpdCB0
b25pZ2h0LiBJIGRvbuKAmXQga25vdyBob3cgaXQgY291bGQgYmUsIGJlY2F1c2UgSeKAmW0gc3Vy
ZSB0aGUgc29sdXRpb24gd29ya3MuIFNvcnJ5Cj4gCj4gR2l1bGlvCj4gCj4+Cj4+IERhbW4sIG5v
dCBzdXJlIGhvdyBJIGxldCB0aGlzIHNwbGl0IHRocm91Z2guLi4gOi0vCj4+Cj4+IFJlZ2FyZHMs
Cj4+IFlhbm4gRS4gTU9SSU4uCj4+Cj4+IC0tIAo+PiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+
PiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJC
T04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+PiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJl
ICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+PiB8
ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAg
fCAgXGUvICBUaGVyZSBpcyBubyAgfAo+PiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8g
fCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+PiAnLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLS0tJwo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
