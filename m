Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523E2C636D3
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 20:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D634340B88;
	Thu,  2 Feb 2023 20:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D634340B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nzjUqd7FkS8f; Thu,  2 Feb 2023 20:41:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 135504108D;
	Thu,  2 Feb 2023 20:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 135504108D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5645F1BF417
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 20:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 307DB4108D
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 20:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 307DB4108D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2QBvIqMOVFI for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 20:41:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CC7940B88
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CC7940B88
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 20:41:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.54]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEFvp-1pVgbI0xHR-00AEOV; Thu, 02
 Feb 2023 21:41:17 +0100
Date: Thu, 2 Feb 2023 21:41:16 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Kenneth Roland <kjroland75@hotmail.com>
Message-ID: <20230202214116.2478d971@gmx.net>
In-Reply-To: <BN0PR10MB535047C6BBE609A96984C22ED6D19@BN0PR10MB5350.namprd10.prod.outlook.com>
References: <BN0PR10MB535094D28596AC0858222678D6D19@BN0PR10MB5350.namprd10.prod.outlook.com>
 <BN0PR10MB5350E76531565457919042C8D6D19@BN0PR10MB5350.namprd10.prod.outlook.com>
 <20230201184154.2c7e2680@gmx.net> <20230201190450.4636771a@gmx.net>
 <BN0PR10MB535047C6BBE609A96984C22ED6D19@BN0PR10MB5350.namprd10.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:O59caYBNkIH9ng7wYWzOqrlIPg9iWZ2QkcpNRPMYavEqq/1BCX1
 JEcduXTwnXrpcXN1kyqx5dG+9Bz1w8/XwuAOSrKRsrGDV+yUit63qfKdt+A9/MPaYLfuCLF
 eavUdcoMHuT3PH746ES8w69CDhS4fkM7KdxqT2eFPASEvlVkXKGj9jkTz+6HU/sT5TLtGJe
 lh6iv1XgQwZxzNjdzz45Q==
UI-OutboundReport: notjunk:1;M01:P0:sqhC/CmUc0M=;ER6Fj1GphCjYisavnmq5Y0hJdz7
 ru8w+N/zoFqb9+NUuyU8uBC6puHrTAfhMD+P1KPlNlm6MzjYl0oXLEKI6d67m5z7Ab+HwbZaz
 94O+B9N7PEYYku7skphN210Mo0dWca8V62ahQE3VoR3VMgKLH+uqR6qw+hRJdPxyyNabBrDMz
 KWb6VIouZOAwpe6k7itnUL/iUT7m9MysAuk3LOF0MUpxd0F1Cmytwn2jbRjgQz2n+c/2zTolc
 CrdlAL8tAFRfrBr4EAuhysG3LSZUxOzEYFVNDNrs+57uV0bXG9fKSJ3XpmE0706MrkuOO/M5v
 XHDunL41h/r4jx1jy1ftjvrornZF5bbLhAFc+VsTeiBesKp8jMq6KZygTPRB1iNIGi6LJsa8q
 nipLzOnCy/Xm6kUhYIBFm4RuPBJ3hXS8mZ42k+jl6DNB6ZLpdg8ZHn0ge1z5AWqHtGoAhmCcd
 1wDlhcASRKJrWUWCqWnxewLKB0woSgO2HUxaVOHVyvuWnmx+4SvizNqgxfznwC6Jx6ZqZ1YKv
 Xm3+i4tqyh397CV6zDtq8d4cpG96gpcP7YrHbbHocX0xhEWkQDnZqYxc5cPZlCjuYg2aTifc2
 cP61M/2qzCglG14kg5i9yFP0DYCzIUffXCdnNgCWwifGlKr2P5wJQeTvuzJtk7Zpk0PkPtw58
 MS9QKZOJwPhtWE2/xHOs/mO0H74F8GGpX8kdecsVF3QbwRLUQQAuHToL/sEN5eRlG4Fz+RpS7
 VoWQjwFQQMpxMFAUW32nY0g7at/QUU+MeX/AYhJhYpNbyH9CamTtMlzwq7TfuPMO5nYnmxNFK
 J3W2Pm+7fgy0SjgOqQZmwbF/mDvlD/X8p5YineO/A0+igdUfDBagtTc6zJfY6J29efsX0aAqI
 WiALAnqh2kwFxz9NS9hwsvYbskR56y9nUdqe6q2jUJO+rgHlH/EPARFSomAIwALd2nWFN4oul
 tU7RjzN3axIdmxkIzRavY9bksV4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1675370477; bh=zvV4aqMeL3AVw30rNCSmzKWHzw6myL+ezZBlCkqPVg8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=tkU9DeVfYzXZOa1JhHxr/5jvW1om1a32R+4dg1RbHCn1BxdvTXb0rF+JHwqhrB8sW
 aeqVlrFDuH5o/X1t1ParFhKhu/6JaHN9YBM5589DCcG4AaCsqp3GlJ4m64GhiApQwY
 c8+G+EnW7Vp5vou69JgKnJT9XauCEGBlSNKUdmgEaX4l2DvqrTR5vey8FlY8zlxzQv
 kU7H/gKsawGTI3zRya12F0DECwawkDY7b+GODZCPvOhHtPk/IuneUG5yHec3V/nufC
 idibZtP7hY2ofBS0vU7vimajGDuct8U84Wp2G8Hhqxufua5hoyRRxhXOhYo4i0TLAl
 QKgSplej7ESyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=tkU9DeVf
Subject: Re: [Buildroot] Libarchive always throws an error when building
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
 Pierre-Jean Texier <texier.pj2@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9sYW5kLAoKT24gV2VkLCAxIEZlYiAyMDIzIDE5OjI3OjM1ICswMDAwLCBLZW5uZXRo
IFJvbGFuZCA8a2pyb2xhbmQ3NUBob3RtYWlsLmNvbT4gd3JvdGU6Cgo+IEhlbGxvIFBldGVyLAo+
IEFmdGVyIGFwcGx5aW5nIHRoZSBwYXRjaCB5b3UgbWVudGlvbmVkPGh0dHBzOi8vZ2l0aHViLmNv
bS9saWJhcmNoaXZlL2xpYmFyY2hpdmUvY29tbWl0LzFmMzVjNDY2YWFhOTQ0NDMzNWExYjg1NGIw
YjcyMjNiMGQyMzQ2YzI+LCBhcyB3ZWxsIGFzIGluc3RhbGxpbmcgbGlic3NsLWRldiwgSSBub3cg
aGF2ZSB0aGlzIGVycm9yLgoKSG9zdCBpbnN0YWxsZWQgcGFja2FnZXMgYXJlIGlnbm9yZWQgYnkg
dGhlIGJ1aWxkcm9vdCBzeXN0ZW0sIG5ldmVyIGRvIHRoaXMuLi4KCj4gCj4gCj4g4oCLYGBgY2hl
Y2tpbmcgd2hldGhlciB0aGUgL21udC9oZGQvc2N0L291dHB1dC9ob3N0L2Jpbi9hYXJjaDY0LWJ1
aWxkcm9vdC1saW51eC1nbnUtZ2NjIGxpbmtlciAoL21udC9oZGQvc2N0L291dHB1dC9ob3N0L2Jp
bi9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUtbGQpIHN1cHBvcnRzIHNoYXJlZCBsaWJyYXJp
ZXMuLi4geWVzCj4gY2hlY2tpbmcgd2hldGhlciAtbGMgc2hvdWxkIGJlIGV4cGxpY2l0bHkgbGlu
a2VkIGluLi4uIG5vCj4gY2hlY2tpbmcgZHluYW1pYyBsaW5rZXIgY2hhcmFjdGVyaXN0aWNzLi4u
IEdOVS9MaW51eCBsZC5zbwo+IGNoZWNraW5nIGhvdyB0byBoYXJkY29kZSBsaWJyYXJ5IHBhdGhz
IGludG8gcHJvZ3JhbXMuLi4gaW1tZWRpYXRlCj4gY2hlY2tpbmcgd2hldGhlciBzdHJpcHBpbmcg
bGlicmFyaWVzIGlzIHBvc3NpYmxlLi4uIHllcwo+IGNoZWNraW5nIGlmIGxpYnRvb2wgc3VwcG9y
dHMgc2hhcmVkIGxpYnJhcmllcy4uLiB5ZXMKPiBjaGVja2luZyB3aGV0aGVyIHRvIGJ1aWxkIHNo
YXJlZCBsaWJyYXJpZXMuLi4geWVzCj4gY2hlY2tpbmcgd2hldGhlciB0byBidWlsZCBzdGF0aWMg
bGlicmFyaWVzLi4uIG5vCj4gY2hlY2tpbmcgcGtnLWNvbmZpZyBpcyBhdCBsZWFzdCB2ZXJzaW9u
IDAuMjAuLi4gL21udC9oZGQvc2N0L291dHB1dC9ob3N0L2Jpbi9wa2djb25mOiBlcnJvciB3aGls
ZSBsb2FkaW5nIHNoYXJlZCBsaWJyYXJpZXM6IGxpYnBrZ2NvbmYuc28uMzogY2Fubm90IG9wZW4g
c2hhcmVkIG9iamVjdCBmaWxlOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gbm8KPiBjaGVj
a2luZyBmb3IgTElCQVJDSElWRS4uLiBubwo+IGNvbmZpZ3VyZTogZXJyb3I6IGluIGAvbW50L2hk
ZC9zY3Qvb3V0cHV0L2J1aWxkL29wa2ctMC40LjUnOgo+IGNvbmZpZ3VyZTogZXJyb3I6IFRoZSBw
a2ctY29uZmlnIHNjcmlwdCBjb3VsZCBub3QgYmUgZm91bmQgb3IgaXMgdG9vIG9sZC4gIE1ha2Ug
c3VyZSBpdAo+IGlzIGluIHlvdXIgUEFUSCBvciBzZXQgdGhlIFBLR19DT05GSUcgZW52aXJvbm1l
bnQgdmFyaWFibGUgdG8gdGhlIGZ1bGwKPiBwYXRoIHRvIHBrZy1jb25maWcuCj4gCj4gQWx0ZXJu
YXRpdmVseSwgeW91IG1heSBzZXQgdGhlIGVudmlyb25tZW50IHZhcmlhYmxlcyBMSUJBUkNISVZF
X0NGTEFHUwo+IGFuZCBMSUJBUkNISVZFX0xJQlMgdG8gYXZvaWQgdGhlIG5lZWQgdG8gY2FsbCBw
a2ctY29uZmlnLgo+IFNlZSB0aGUgcGtnLWNvbmZpZyBtYW4gcGFnZSBmb3IgbW9yZSBkZXRhaWxz
Lgo+IAo+IFRvIGdldCBwa2ctY29uZmlnLCBzZWUgPGh0dHA6Ly9wa2ctY29uZmlnLmZyZWVkZXNr
dG9wLm9yZy8+Lgo+IFNlZSBgY29uZmlnLmxvZycgZm9yIG1vcmUgZGV0YWlscwo+IG1ha2U6ICoq
KiBbcGFja2FnZS9wa2ctZ2VuZXJpYy5tazoyODM6IC9tbnQvaGRkL3NjdC9vdXRwdXQvYnVpbGQv
b3BrZy0wLjQuNS8uc3RhbXBfY29uZmlndXJlZF0gRXJyb3IgMWBgYAoKU2VlIHRoZSBwcm9wZXIg
cGF0Y2ggZnJvbSBCZXJuZCBLdWhscyAoaW5jbHVkaW5nIEFVVE9SRUNPTkYgYW5kIGhvc3QtcGth
Z2NvbmYgZGVwZW5kZW5jeSk6CgoJaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L3BpcGVybWFpbC9i
dWlsZHJvb3QvMjAyMy1GZWJydWFyeS82NjA5MjEuaHRtbAoJaHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIzMDIwMTE4MTAwNS43MzE1NjQtMS1i
ZXJuZC5rdWhsc0B0LW9ubGluZS5kZS8KClJlZ2FyZHMsClBldGVyCgo+IAo+IAo+IEZyb20gYSBx
dWljayBzZWFyY2gsIGxpYnBrZ2NvbmYuc28uMyBpcyBmb3VuZCBvbiBSUE0gc3lzdGVtcywgd2hp
Y2ggaXNuJ3QgdGhlIGNhc2UgaGVyZSwgYnV0IHNvbWVob3cgaXQgaGFzIHNvbWV0aGluZyB0byBk
byB3aXRoIHBrZy1jb25maWcgYmVpbmcgdG9vIG9sZC4gRG8gSSBuZWVkIHRvIHVwZGF0ZSBteSBw
YXRoLCBhbmQgaWYgc28sIGlzIHRoYXQgdGhlIGJhc2ggZmlsZSBmb3VuZCBpbiBteSB1c2VyJ3Mg
aG9tZSBmb2xkZXI/IE9yIGlzIHRoZXJlIGFub3RoZXIgcGF0Y2ggSSBjYW4gYXBwbHk/IFRoYW5r
cywKPiBLZW5uZXRoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
