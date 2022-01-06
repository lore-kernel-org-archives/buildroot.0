Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9720C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 15:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F95040A40;
	Thu,  6 Jan 2022 15:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3lOY3a3DhxRg; Thu,  6 Jan 2022 15:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51EF640A2E;
	Thu,  6 Jan 2022 15:57:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AA651BF3F6
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9F2540A2E
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R7GuD9PGMRPd for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 15:56:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAF2C40133
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 15:56:57 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 133B424000B;
 Thu,  6 Jan 2022 15:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1641484613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4M1MAeB3qVfVC1xiSyTvp9cP2MkWglEwKznlv+x5LI=;
 b=OkpvMVPBxlNZkWMQaMNooCNinH6sDSUG4cuD7uRETRQuBkxTC1CnzG5ggJ9Wl9NvNqZvdb
 UbaKgbKCpSXZwc9M/T+tUm1GddqZCAGb8DNoHQIwJUCx6GWd5xZyyar9wEMI6zzS05XFRa
 mZSFC10xlTVxrux2f/oC7UIbP+DYzYY5XIcZnQJJL8J0gXq2hCviaw6zimHxB7gPXK3ZpS
 NA+a3F3TkycUqnbHMD3h/FTqAABY++A9V3vvSfMOiO2nnGc3Vxl8mBTXxt1B0caXDFaJEN
 bPG1xpSwkRqduQxl4zPUttlPxrwOBgC0U+0lT0aZXoh2gzGz/g/DkBA5/7wXJw==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211223111348.3532601-1-thierry.bultel@linatsea.fr>
 <20211223111348.3532601-2-thierry.bultel@linatsea.fr>
 <20220105231654.GL614810@scaer>
 <365b8f6c-18b5-e30b-3c94-4dff3c51215f@linatsea.fr>
 <20220106161347.014794a6@windsurf>
From: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <a8d51eae-95d2-ee31-6622-4cde984f07ac@linatsea.fr>
Date: Thu, 6 Jan 2022 16:56:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106161347.014794a6@windsurf>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v3 2/3] package/dracut: new host package
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpMZSAwNi8wMS8yMDIyIMOgIDE2OjEzLCBUaG9tYXMgUGV0YXp6b25pIGEgw6ljcml0wqA6Cj4g
T24gVGh1LCA2IEphbiAyMDIyIDE1OjU2OjMyICswMTAwCj4gVGhpZXJyeSBCdWx0ZWwgPHRoaWVy
cnkuYnVsdGVsQGxpbmF0c2VhLmZyPiB3cm90ZToKPgo+PiBLZWVwaW5nIGluIG1pbmQgdGhhdCBz
eXN0ZW1kIGlzIHRoZSBvZmZpY2lhbGx5IHN1cHBvcnRlZCBpbml0IHN5c3RlbSBieQo+PiBkcmFj
dXQsIHRoZXJlIGlzIG5vIGV4dHJhIHdvcmsKPj4gZm9yIGl0LiBIb3dldmVyLCBJIGJyb3VnaHQg
c3VwcG9ydCBmb3IgYnVzeWJveCBpbml0LCB0aHJvdWdoIHRoZSBhYm92ZQo+PiBkcmFjdXQgbW9k
dWxlICgwNWJ1c3lib3gtYnVpbGRyb290KS4KPj4gQWRkaW5nIHN1cHBvcnQgZm9yIHRoZSBvdGhl
ciBvbmVzIGNvdWxkIGJlIGRvbmUgbGF0ZXIsIHNvIEkgc3VnZ2VzdCB3ZQo+PiBzaW1wbHkgZGlz
YWJsZSBkcmFjdXQgd2hlbiB0aGUKPj4gaW5pdCBzeXN0ZW0gaXMgbm90IHN1cHBvcnRlZDsgYnkg
YWRkaW5nCj4+Cj4+ICAgwqDCoMKgIGRlcGVuZHMgb24gIUJSMl9JTklUX1NZU1YKPj4gICDCoMKg
wqAgZGVwZW5kcyBvbiAhQlIyX0lOSVRfT1BFTlJDCj4+Cj4+IGluIENvbmZpZy5pbi5ob3N0OyB3
aXRoIHRoZSBhcHByb3ByaWF0ZSBjb21tZW50LiBEb2VzIHRoYXQgc291bmQKPj4gYWNjZXB0YWJs
ZSA/Cj4gQnV0IGlzIGl0IGp1c3QgdGhlIGluaXQgc3lzdGVtIHRoYXQgcmVxdWlyZXMgdGhvc2Ug
c3BlY2lhbCBkcmFjdXQKPiAibW9kdWxlcyIgPyBPciBvdGhlciBhc3BlY3RzIG9mIHRoZSBzeXN0
ZW0gd2lsbCBhbHNvIHJlcXVpcmUgc29tZQo+IHNwZWNpYWwgbW9kdWxlcyA/CgpUaGUgZHJhY3V0
IG1vZHVsZXMgYXJlIHVzZWQgYXQgYnVpbGQgdGltZS4KVGhlIHJ1bGUgaXMgdGhhdCBhbnkgZmls
ZSB0aGF0IGlzIGV4cGVjdGVkIGluIHRoZSBkcmFjdXQgaW1hZ2UgbXVzdCBiZSAKaGFuZGxlZApi
eSBhIGRyYWN1dCBtb2R1bGUuIEZvciBpbnN0YW5jZSwKImhvc3QvbGliL2RyYWN1dC9tb2R1bGVz
LmQvMDBiYXNoIgoiaG9zdC9saWIvZHJhY3V0L21vZHVsZXMuZC81MHNzaGQiIHdvcmsgb3V0IG9m
IHRoZSBib3guCgpUaGUgaW1wbGljaXRlbHkgbG9hZGVkICI5MGtlcm5lbC1tb2R1bGVzIiAodGhh
dCBjaGVjayBtb2R1bGVzIApkZXBlbmRlbmNpZXMgdG8gb25lIGFub3RoZXIsCmFuZCB0byBmaXJt
d2FyZXMpIGFsc28gd29yayBmaW5lLgoKQnV0IG5vdGhpbmcgaGFuZGxlcyAvZXRjL2luaXQuZC9y
Y1MsIHR5cGljYWxseS4KQW5kIGFsbCB0aGUgd2FudGVkIGluaXQgc2NyaXB0cyAoL2V0Yy9pbml0
LmQvUzQwbmV0d29yayBpcyBhIGdvb2QgZXhhbXBsZSkKbXVzdCBiZSB0YWtlbiBpbmRpdmlkdWFs
bHkuCkEgaHVnZSB3b3JrIHdvdWxkIGJlIHRvIGNvbnRyaWJ1dGUgdG8gZHJhY3V0IHRvIGJyaW5n
IHdob2xlIHN1cHBvcnQgZm9yIAppbml0ZApzY3JpcHRzLCBidXQgSSB0aGluayBpdCBpcyBvdXQg
b2YgdGhlIHNjb3BlLgoKQW5vdGhlciByZWFzb24gdG8gd3JpdGUgYSBtb2R1bGUgaXMgd2hlbiBk
cmFjdXQgZG9lcyBub3Qgc3VwcG9ydCB0aGUgCmZlYXR1cmUsIHlldCwKZm9yIGluc3RhbmNlLCBJ
IGhhZCB0byB3cml0ZSBvbmUgZm9yIGhvc3RhcGQuIEFwcGFyZW50bHkgaXQgaXMgbm90IGEgCmNv
bW1vbiBjYXNlCnRvIGhhdmUgdGhlIHdpZmkgaW4gYW4gaW5pdHJhbWZzLCBidXQgZm9yIGEgcmVj
b3Zlcnkgc3lzdGVtLCB0aGF0IG1ha2VzIAptb3JlIHNlbnNlLgoKQWRkaW5nIHN1cHBvcnQgZm9y
IFNZU1Ygb3IgT1BFTlJDIGJhc2ljYWxseSBjb25zaXN0cyBpbiB3cml0aW5nIHRoZSAKYXBwcm9w
cmlhdGUgcnVsZXMKaW4gbmV3IG1vZHVsZXMgdG8gYnJpbmcgdGhlIGV4cGVjdGVkIGZpbGVzIHRv
IHRoZSBmaWxlc3lzdGVtLCBub3RoaW5nIG1vcmUuCgpCeSB0aGUgd2F5LCBteSBzdWdnZXN0aW9u
IHRvIHVzZSAiZGVwZW5kcyBvbiAheHh4IiBkaXJlY3RpdmVzIGNhbm5vdAp3b3JrIGJlY2F1c2Ug
aXQgZG9lcyBhbiAidW5tZXQgZGlyZWN0IGRlcGVuZGVuY3kgZGV0ZWN0ZWQiLCBzaW5jZQpCUjJf
UEFDS0FHRV9IT1NUX0RSQUNVVCBpcyBzZWxlY3RlZCBieSBCUjJfVEFSR0VUX1JPT1RGU19DUElP
X0RSQUNVVAoKSSBhbSBhIGxpdHRsZSBiaXQgY29uZnVzZWQgYWJvdXQgaG93IHRvIHNvbHZlIHRo
YXQgcHJvcGVybHkuCgpUaGllcnJ5Cgo+IFRob21hcwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
