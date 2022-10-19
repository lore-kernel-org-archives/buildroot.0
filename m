Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71AEC4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 18:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5077C41D32;
	Wed, 19 Oct 2022 18:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5077C41D32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mt_R2thA5GCn; Wed, 19 Oct 2022 18:25:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E660B41A69;
	Wed, 19 Oct 2022 18:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E660B41A69
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 941A41BF3FD
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 18:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F3BC60AD0
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 18:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F3BC60AD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oCx_yJX3ylfk for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 18:25:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D343A60615
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D343A60615
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 18:25:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b849:ce06:f6eb:ded9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2C31F78034D;
 Wed, 19 Oct 2022 20:25:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 20:25:21 +0200
Date: Wed, 19 Oct 2022 20:25:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nevo Hed <nhed+buildroot@starry.com>
Message-ID: <20221019182521.GF3666@scaer>
References: <20221019175151.1030079-1-nhed+buildroot@starry.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019175151.1030079-1-nhed+buildroot@starry.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666203924;
 bh=oyzzaxml5/N8W+ix/WurnPAKPZ+SmUsGYLH6mbh/zk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TiN+tGrCPDmw65TZy33fYCnM1Jw7URM2kKNVUF2DPtOo2PLjG4KzGHm50Hp3JBUUV
 KTZutD7B8Cwq3BuEjkFqYrKmC8VMalx1IyM3uyTnm06YfXVM+d8yPCWee5RjpuphFS
 RuW3KnTLV+fo2GehAoKYP7qVF9U0r1naq/MkDlK6pEGra7fY1YqLboWZddIEczLTcb
 zOG+s1+Xd/FNQKuGhzOcl9XnhimGRrFkv0mwMsJ0pwIidrGdo9Dr9nuDh+hrxTXzuS
 kp5OAv3PLzMEP23cbgCm0O9eATY1vm7UF1eqtfb9YvGr/5AA6VYtcK1ZnqbEBdrAnL
 yAyhNPqtG0Eag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TiN+tGrC
Subject: Re: [Buildroot] [PATCH] core: Use of percent_defconfig seems to
 impact performance
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TmV2bywgQWxsLAoKT24gMjAyMi0xMC0xOSAxMzo1MSAtMDQwMCwgTmV2byBIZWQgc3Bha2UgdGh1
c2x5Ogo+IE5vdGljZWQgYSBzaWduaWZpY2FudCBzbG93ZG93biB3aXRoIHJpc2Ugb2YgbnVtYmVy
IG9mIGV4dGVybmFsIHRyZWVzCj4gaW4gb3VyIGVudi4gIFRoaXMgc2xvd2Rvd24gc2VlbWVkIHRv
IGJlIHJlbGF0ZWQgdG8gaW52b2NhdGlvbnMgaWYgdGhlCj4gcGVyY2VudF9kZWZjb25maWcgZnVu
Y3Rpb24gKEdOVSBNYWtlIDQuMykuCgpXZSBhbHJlYWR5IGhhdmUgYSBwZW5kaW5nIHBhdGNoIHRv
IGFkZHJlc3MgdGhpcyBpc3N1ZToKICAgICBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwOTIwMTk0NjQ1LjY3MDQzMi0xLXlhbm4ubW9yaW4u
MTk5OEBmcmVlLmZyLwoKPiBXaGlsZSBJIGhhdmUgbm90IGRvIGEgZGVlcCBkaXZlIGluIGFuYWx5
emluZyB0aGUgcGVyZm9ybWFuY2UgaXNzdWUsIGl0Cj4gZmVsdCBsaWtlIHJlZGVmaW5pbmcgdGhl
ICVfZGVmY29uZmlnIHJ1bGUgTiB0aW1lcyBpbXBhY3QgcGVyZm9ybWFuY2UuCgpQbGVhc2UsIG5v
IGZpcnN0LXBlcnNvbiBzZW50ZW5jZXMgaW4gY29tbWl0IGxvZyAoaS5lLiwgbm8gIkkiKS4KCj4g
VGhpcyBwYXRjaCBtYWtlcyAlX2RlZmNvbmZpZyBhIHNpbmdsZSBydWxlIHdoaWNoIGNvbWJpbmVz
IHVzZXMgdGhlCj4gZmlyc3QgcmV0dXJuIG9mIGEgd2lsZGNhcmQgZXhwcmVzc2lvbi4KCkkgY2Fu
IGNlcnRhaW5seSBzZWUgdGhhdCB0aGlzIGxvb2tzIGEgYml0IHNpbXBsZXIgdGhhbiBteSBwcm9w
b3NhbC4KCkhvZXZlciwgSSBhbSBub3QgdG9vIGZvbmQgb2YgaXQsIGJlY2F1c2UgaXQgZGVmZXJz
IHRoZSB0ZXN0IHRoYXQgdGhlCmRlZmNvbmZpZyBleGlzdHMgaW50byB0aGUgc2hlbGwgcmF0aGVy
IHRoYW4gdGhlIE1ha2VmaWxlLiBJIGRvbid0IGtub3csCm1heWJlIGl0IGlzIGluIGZhY3QgYmV0
dGVyIGJlY2F1c2Ugd2UgY2FuIHByaW50IGEgbW9yZSB1c2VyLWZyaWVuZGx5CmVycm9yIG1lc3Nh
Z2UuLi4KCj4gVGltaW5nIChzZWNvbmRzKSBvZiBgbWFrZSBwY194ODZfNjRfYmlvc19kZWZjb25m
aWdgIHdpdGggMS04IGV4dGVybmFsCj4gdHJlZXM6Cj4gCj4gICAgICNUcmVlcyAgICBCZWZvcmUg
ICAgQWZ0ZXIKPiAgICAgICAgICAxICAgICAgMC4zOCAgICAgMC4zNwo+ICAgICAgICAgIDIgICAg
ICAwLjMyICAgICAwLjMxCj4gICAgICAgICAgMyAgICAgIDAuMzEgICAgIDAuMzMKPiAgICAgICAg
ICA0ICAgICAgMC4zNiAgICAgMC4zMgo+ICAgICAgICAgIDUgICAgICAwLjQ1ICAgICAwLjM1Cj4g
ICAgICAgICAgNiAgICAgIDEuMjYgICAgIDAuMzYKPiAgICAgICAgICA3ICAgICAgOS4xMCAgICAg
MC4zNgo+ICAgICAgICAgIDggICAgIDg1LjkzICAgICAwLjQyCgpXZWlyZC4gRm9yIG1lLCBzdGFy
dGluZyBhdCA2IGV4dGVybmFsIHRyZWVzLCB0aGUgdGltZSB0byBjb21wbGV0aW9uCmRpcmVjdGx5
IGV4cGxvZGVkIGFib3ZlIHRoZSBob3VyLgoKT25lIGludGVyZXN0aW5nIHBvaW50LCB0aG91Z2gg
aXMgdGhhdCB0aGUgZHVyYXRpb24gZG9lcyBub3Qgc2VlbSB0byBiZQptdWNoIGltcGFjdGVkIGJ5
IHRoZSBudW1iZXIgb2YgYnLDqWV4dGVybmFsIHRyZWVzLiBDb3VsZCB5b3UgdGVzdCB3aXRoIHVw
CnRvIDEwMDAgdHJlZXMsIGxpa2UgSSBkaWQ/CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBT
aWduZWQtb2ZmLWJ5OiBOZXZvIEhlZCA8bmhlZCtidWlsZHJvb3RAc3RhcnJ5LmNvbT4KPiAtLS0K
PiAgTWFrZWZpbGUgfCAxMyArKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFr
ZWZpbGUKPiBpbmRleCBlYzdjMDM0YWMxLi5hODI5OGRkNWZkIDEwMDY0NAo+IC0tLSBhL01ha2Vm
aWxlCj4gKysrIGIvTWFrZWZpbGUKPiBAQCAtMTAxMCwxMyArMTAxMCwxMiBAQCBvbGRjb25maWcg
c3luY2NvbmZpZyBvbGRkZWZjb25maWc6ICQoQlVJTERfRElSKS9idWlsZHJvb3QtY29uZmlnL2Nv
bmYgb3V0cHV0bWFrZQo+ICBkZWZjb25maWc6ICQoQlVJTERfRElSKS9idWlsZHJvb3QtY29uZmln
L2NvbmYgb3V0cHV0bWFrZWZpbGUKPiAgCUAkKENPTU1PTl9DT05GSUdfRU5WKSAkPCAtLWRlZmNv
bmZpZyQoaWYgJChERUZDT05GSUcpLD0kKERFRkNPTkZJRykpICQoQ09ORklHX0NPTkZJR19JTikK
PiAgCj4gLWRlZmluZSBwZXJjZW50X2RlZmNvbmZpZwo+IC0jIE92ZXJyaWRlIHRoZSBCUjJfREVG
Q09ORklHIGZyb20gQ09NTU9OX0NPTkZJR19FTlYgd2l0aCB0aGUgbmV3IGRlZmNvbmZpZwo+IC0l
X2RlZmNvbmZpZzogJChCVUlMRF9ESVIpL2J1aWxkcm9vdC1jb25maWcvY29uZiAkKDEpL2NvbmZp
Z3MvJV9kZWZjb25maWcgb3V0cHV0bWFrZWZpbGUKPiAtCUAkJChDT01NT05fQ09ORklHX0VOVikg
QlIyX0RFRkNPTkZJRz0kKDEpL2NvbmZpZ3MvJCRAIFwKPiAtCQkkJDwgLS1kZWZjb25maWc9JCgx
KS9jb25maWdzLyQkQCAkJChDT05GSUdfQ09ORklHX0lOKQo+IC1lbmRlZgo+IC0kKGV2YWwgJChm
b3JlYWNoIGQsJChjYWxsIHJldmVyc2UsJChUT1BESVIpICQoQlIyX0VYVEVSTkFMX0RJUlMpKSwk
KGNhbGwgcGVyY2VudF9kZWZjb25maWcsJChkKSkkKHNlcCkpKQo+ICslX2RlZmNvbmZpZzogJChC
VUlMRF9ESVIpL2J1aWxkcm9vdC1jb25maWcvY29uZiAgb3V0cHV0bWFrZWZpbGUKPiArCUBkZWZj
b25maWc9JChmaXJzdHdvcmQgJChmb3JlYWNoIGQsXAo+ICsJCSQoY2FsbCByZXZlcnNlLCQoVE9Q
RElSKSAkKEJSMl9FWFRFUk5BTF9ESVJTKSksJCh3aWxkY2FyZCAkKGQpL2NvbmZpZ3MvJEApKSk7
IFwKPiArCWlmIFsgLXogIiQke2RlZmNvbmZpZ30iIF07IHRoZW4gZWNobyAiQ2FuJ3QgZmluZCAk
QCIgPiYyOyBleGl0IDE7IGZpOyBcCj4gKwkkKENPTU1PTl9DT05GSUdfRU5WKSBCUjJfREVGQ09O
RklHPSQke2RlZmNvbmZpZ30gXAo+ICsJCSQ8IC0tZGVmY29uZmlnPSQke2RlZmNvbmZpZ30gJChD
T05GSUdfQ09ORklHX0lOKQo+ICAKPiAgdXBkYXRlLWRlZmNvbmZpZzogc2F2ZWRlZmNvbmZpZwo+
ICAKPiAtLSAKPiAyLjM3LjMKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwg
UmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5
OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdO
ICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0t
LS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0
cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAg
diAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
