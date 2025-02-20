Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA64DC021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 14:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B97EB40907;
	Thu, 20 Feb 2025 14:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9V8SBMzx8-e; Thu, 20 Feb 2025 14:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A2A240898
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A2A240898;
	Thu, 20 Feb 2025 14:58:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FDF9CF
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 14:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FDFB82096
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 14:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4Rk5bVRqueK for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 14:58:40 +0000 (UTC)
X-Greylist: delayed 3620 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 20 Feb 2025 14:58:39 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 114AD82075
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 114AD82075
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 114AD82075
 for <buildroot@busybox.net>; Thu, 20 Feb 2025 14:58:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A7534430B;
 Thu, 20 Feb 2025 14:58:36 +0000 (UTC)
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,  MTD Mailing
 List <linux-mtd@lists.infradead.org>,  Buildroot Mailing List
 <buildroot@busybox.net>,  "Josh Boyer (Fedora)"
 <mtd-utils-maintainers@fedoraproject.org>,  "Bastian Germann (Debian)"
 <bage@debian.org>,  "(Rosa Linux)" <a.proklov@rosalinux.ru>,  Embedded
 Gentoo <embedded@gentoo.org>,  "Robin H. Johnson" <robbat2@gentoo.org>,
 "John (OpenWRT)" <john@phrozen.org>,  "Michael Tross (T2 SDE)"
 <michael@tross.org>,  "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,  "Sergey Bolshakov (ALT
 Linux)" <sbolshakov@altlinux.org>,  "Silvan Calarco (openmamba)"
 <silvan.calarco@mambasoft.it>,  "Viric (nixpkgs)" <viric@viric.name>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,  "Levente Polyak
 (Arch)" <anthraxx@archlinux.org>, <shaba@altlinux.org>,  Richard Weinberger
 <richard@nod.at>
In-Reply-To: <016049d9-c15e-ee5f-e69a-4e5a6d351613@huawei.com> (Zhihao Cheng's
 message of "Thu, 20 Feb 2025 22:04:51 +0800")
References: <1b7a55a6-1c5b-4e86-8006-e2010e54367e@sigma-star.at>
 <87zfigk9ai.fsf@bootlin.com>
 <016049d9-c15e-ee5f-e69a-4e5a6d351613@huawei.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 20 Feb 2025 15:58:36 +0100
Message-ID: <875xl4k6hv.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeijeegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeefudfhfedvkeehjeeuiedvvdetheelffejjeehgfehtdffuefffeekudeigeffnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegthhgvnhhgiihhihhhrghoudeshhhurgifvghirdgtohhmpdhrtghpthhtohepuggrvhhiugdrohgsvghrhhholhhlvghniigvrhesshhighhmrgdqshhtrghrrdgrthdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsghuihhlughrohhothessghushihs
 ghogidrnhgvthdprhgtphhtthhopehmthguqdhuthhilhhsqdhmrghinhhtrghinhgvrhhssehfvgguohhrrghprhhojhgvtghtrdhorhhgpdhrtghpthhtohepsggrghgvseguvggsihgrnhdrohhrghdprhgtphhtthhopegrrdhprhhokhhlohhvsehrohhsrghlihhnuhigrdhruhdprhgtphhtthhopegvmhgsvgguuggvugesghgvnhhtohhordhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1740063516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zecOynphgxT+qOIC8isrCC7iHpZKrBxbXOC6nGD/R6I=;
 b=cASbn3vu6Y34Cr0GKv8BB1HFj7hua+DrFvQCN3q4H0q/E0FWNZ4yvN11x+uSjR0RN4tFpK
 T4YQqwlAI4Wsj+8zFLSKBzWpg0F9tcHAIuiM3IK0lIShrHeXoNvcu8DWIOUleqdiPK/NHc
 7N5r8aTVh53QsqifsmD3XKkdzlCwo1B5H8moQdI28cWF6f/QTlSYFuHO+j/VOUQb1uvgGZ
 oXczk5yAjvf6HtnNqaEw03gnmIGY6ELlHb272rD7VoMCu/sQ2Qm6/jQdBeHrc19/xkQ+xD
 Htu+U317gywf50Yvi26hI/AvAQjWTG2C3/NGiFvhb9iP2KBgUMGWrvf5PUnk1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cASbn3vu
Subject: Re: [Buildroot] [ANNOUNCE] mtd-utils-2.3.0 is released
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
From: Miquel Raynal via buildroot <buildroot@buildroot.org>
Reply-To: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWmhpaGFvLAoKPj4gVGhlIGNvbW1pdHMgZnJvbSBaaGloYW8gYWN0dWFsbHkgbGlzdCB0
aGVzZSAuZ3ogZmlsZXMgaW4gdGhlIC5hbQo+PiBmaWxlcywKPj4gYW5kIHRoZXkgYWxzbyBhcHBl
YXIgaW4gdGhlIE1ha2VmaWxlLmluIGFzCj4+ICAgICAgQEJVSUxEX1RFU1RTX1RSVUVAYW1fX2Fw
cGVuZF8yMgo+PiB5ZXQgdGhleSBhcmUgbm90IHBhcnQgb2YgdGhlIGZpbmFsIGRpc3RyaWJ1dGVk
IHRhcmJhbGwuIEFueSBpZGVhIGhvdwo+PiB0bwo+PiBmaXggdGhhdCBwcm9wZXJseT8KPgo+IEhp
IE1pcXVlbCwgc29ycnkgZm9yIGludHJvZHVjaW5nIHRoZSBwcm9ibGVtLiBJdCBjb3VsZCBiZSBm
aXhlZCBieSB0aGlzCj4gcGF0Y2g6Cj4KPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvbGludXgtbXRkL3BhdGNoLzIwMjUwMjIwMTEyNTU0LjIxNTAwNDYtMS1tLm9sYnJpY2hA
cGVuZ3V0cm9uaXguZGUvCgpFeGNlbGxlbnQhIEhhcHB5IHRvIGtub3cgdGhlcmUgaXMgYSBmaXgg
YWxyZWFkeS4gVW5mb3J0dW5hdGVseSBpdCBmZWVscwpsaWtlIHRoZXJlIGlzIG5vdCBtdWNoIHdl
IGNhbiBkbyBkaXJlY3RseSBpbiBCUiwgc28gSSdsbCB3YWl0IGZvciB0aGUKZml4IHRvIGxhbmQg
aW4gYSAuMSBtaW5vciByZWxlYXNlLgoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
