Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49448EC1EA2
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 11:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AC59406A1;
	Thu,  5 Feb 2026 11:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvH6kOwYfMip; Thu,  5 Feb 2026 11:28:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 155EB406DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770290906;
	bh=572zoRMQkiHOoOiAltcRBtzZnetWNeZksdlDQbh7cl8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bW6xvO7FXzqqfgUycu7Ka7PM+AAk2hNOtXT316D9vk8mfaZCCBMse7WF8n8KTnx6B
	 jEzlc40vKUKAW97PWuKf2LsS1/FbewNDhQwfGROsiwoohKuC1nJwI3WlQWbl5/+xCF
	 8zAZ6YEkiaGaujgbnoY1Ic0hf6Wf0eBKrlPrFdbWseWdJP5iR6n3HU3bpj9BeZ2OZ9
	 8M/+qKSoHUCRtu/HOnyj3GGAAWu906fgETkLgKycodlm5WNw41e9uifoL69f/nTP+J
	 zly1mlBwIcBG+mPaV9aBLdyo7jU+Z5uXFQSQO5LC6YSAiAJ80BfrIB4dpV7QHCFm9f
	 fKRNcV/1FCzrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 155EB406DE;
	Thu,  5 Feb 2026 11:28:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD873F5
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 11:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE2AD60777
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 11:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1TYbvIQbXOc for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 11:28:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BB9960725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BB9960725
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BB9960725
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 11:28:23 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so8823835e9.2
 for <buildroot@buildroot.org>; Thu, 05 Feb 2026 03:28:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770290901; x=1770895701;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gqQlei8AsBbpz4p1Vm1DaOW/shljunUKVCvBqpyoiWs=;
 b=l+V3XhBXT/r/rhHHFPKsUMnvessVGrklt9DSSiqmgWYVaA8KpWfg1LhWOlQTK2I7XV
 Jy8iAQQ80424u9C+vWOABHHVBW9Zy8SSaIWWm7wfheCJK8ma8KvRJmeMMoOLFWarjz6e
 d1KOvOYD62BAIab8Chsf38YvD3cqlCigdsjB8Gzwt+CvR9Yo/CAknYwnCSxza0Ar+yV1
 8//kXFgLSejlXyVosvAWn7iPdoiiLu81tEFErrL+dX2UmhYhMEO6JsNf8YrRQ2b4Eztq
 HiQucFS8nSqMUObcVl5Ijv4O5G1/16QqhpVsUxOoSZKZkjM4ghWh0PBoUTbz6le9bPkj
 0E+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUat64QSYf38DxUjQdqbwJez+Bo4SQTIy/LTi1GUnRKs8kqUW4j2OARhIwp9RdaY5KXWx9gTMVENTU=@buildroot.org
X-Gm-Message-State: AOJu0YyXpOIXRxuIgZyMtvGzHRYCsLigGZ9g/RvdbIvF8OsPKyz9gHSS
 PbwpiKuaMS4ftJ3hQjvsRx3xKzdLU6sflgJ0wlBpr+/HSnoM2mPreDXXWRToU1/7zW8=
X-Gm-Gg: AZuq6aJML21lquONq7f87i1Iq/tojBLfI3yX9sgOicKkiqCC3j0MrZUZDOTHp8oFGtV
 A4ITsCZ4Jo4TYJDVavKaZIvsz2Xw1CtldG0oNcyNA8AySMqdyvvqi7mJkEaDum6CBXuzScNI6jD
 izKQjNbOoeNrzAbTrUEvs9hfirLEo8rBY4oPOs6O73qQY7COJJuAG7hUBB48hMO07CLsr7/OJeY
 pfSzZ3xHNbKXNET/DR16RvuZ0gdpaIKUJoKnktVoMIinkR1CPXJG6wOHJMU1a7fAAGjzvPpPdFk
 SRdEPIGA6gQN8H2TLAit7161uLaBya3M95CyA/mI3wG0xtS9A+JQyvzCI5rxa2NBBL4PVD1PxP+
 aIpuk09LSyw6RqrKe6WrHbzGGUUoqjl+QYlsyZV725AbAfSLAYG51+N2+kjKOSJpXok5FJEluyi
 rkQjat2zeg8aS2wVcbx585Hwf9jgxT3Ln2B9YhPnp9tAqw+gY4hqunl7sLgGOz1GbGK6V+GNHzH
 MT4uVxkmZCAKHZmiTjiiB3NqjUIbv4mJW6UR3PtRJV1t7zd1QwLvw==
X-Received: by 2002:a05:6000:250f:b0:435:dd87:fc2d with SMTP id
 ffacd0b85a97d-4361805ba7cmr10097753f8f.45.1770290901036; 
 Thu, 05 Feb 2026 03:28:21 -0800 (PST)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e38ec5sm14103775f8f.14.2026.02.05.03.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 03:28:20 -0800 (PST)
Message-ID: <a8dea432-0a90-4f5a-a5f2-781329c288be@smile.fr>
Date: Thu, 5 Feb 2026 12:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: bernd@kuhls.net, buildroot@buildroot.org, romain.naour@gmail.com,
 thomas.devoogdt@barco.com, thomas.petazzoni@bootlin.com
References: <CACXRmJgF31hdsS_wY2tt6ok=CqMXbWwmy227s42jPw_tOZcPyw@mail.gmail.com>
 <20260204123609.3607193-1-thomas@devoogdt.com>
 <CACXRmJh1-5Cy92kF9TM5nDs_uB90WAe5iOGmNNL2E-cMhJE7GA@mail.gmail.com>
 <a8b5d9b0-9142-4aaf-a3f8-38b1d8abfd69@smile.fr>
 <CACXRmJgpFK8DkT+rZ=k_JUFZTZA5x4Saj7hP_Vx5XO6+QZotuA@mail.gmail.com>
Content-Language: fr
In-Reply-To: <CACXRmJgpFK8DkT+rZ=k_JUFZTZA5x4Saj7hP_Vx5XO6+QZotuA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770290901; x=1770895701; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gqQlei8AsBbpz4p1Vm1DaOW/shljunUKVCvBqpyoiWs=;
 b=qimFwQAE++ASxdvJTdfx+Sch6yT/97lISyVeTJ972Vz4XJv/kddDJOKVaK+RBcBgw+
 Js7Hfv+sYH/Rjnkp+Xp9Fj7Afe+pZY0yqaiCWss4uZa474NGaXD7N/4NpfOTrgO1WCKR
 OvTTmOt8FbwMfl9On6w4WfOahg2FHX598VjhA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=qimFwQAE
Subject: Re: [Buildroot] [PATCH v3] package/mesa3d: fix compilation with
 host-llvm enabled
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAwNS8wMi8yMDI2IMOgIDExOjA4LCBUaG9tYXMgRGV2b29n
ZHQgYSDDqWNyaXTCoDoKPiBIaSBSb21haW4sIEFsbCwKPiAKPiBPcCB3byA0IGZlYiAyMDI2IG9t
IDE5OjMzIHNjaHJlZWYgUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Ogo+Pgo+
PiBIaSBUaG9tYXMsIEFsbCwKPj4KPj4gTGUgMDQvMDIvMjAyNiDDoCAxNDo0MSwgVGhvbWFzIERl
dm9vZ2R0IGEgw6ljcml0IDoKPj4+IEhpIFJvbWFpbiwgQWxsLAo+Pj4KPj4+Cj4+PiBVcGRhdGU6
Cj4+Pgo+Pj4gV2hlbiBjb21waWxpbmcgb24gbWFzdGVyLCB0aGVuIG1lc29uIGlzIHNvbWVob3cg
YWJsZSB0byBmaW5kIHRoZSByaWdodAo+Pj4gbGx2bS1jb25maWcsIHNvIHJlcHJvZHVjdGlvbiBv
bmx5IHNlZW1zIHRvIGJlIHBvc3NpYmxlIGlmIHRoZSBob3N0Cj4+PiBtYWNoaW5lIHNoaXBzIHdp
dGggYSBuZXdlciB2ZXJzaW9uIGFzIHRoZSBvbmUgYnVpbGRyb290IGlzIHVzaW5nLgo+Pj4KPj4+
IGxsdm0tY29uZmlnIGZvdW5kOiBZRVMKPj4+ICgvaG9tZS90aG9tYXMvRG9jdW1lbnRzL2V4dGVy
bmFsL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9iaW4vbGx2bS1jb25maWcpCj4+PiAyMS4xLjgKPj4+
IFJ1bi10aW1lIGRlcGVuZGVuY3kgTExWTSAobW9kdWxlczogYml0d3JpdGVyLCBjb3JlLCBjb3Zl
cmFnZSwgZW5naW5lLAo+Pj4gZXhlY3V0aW9uZW5naW5lLCBpbnN0Y29tYmluZSwgaXJyZWFkZXIs
IGxpYmRyaXZlciwgbGlua2VyLCBsdG8sCj4+PiBtY2Rpc2Fzc2VtYmxlciwgbWNqaXQsIG5hdGl2
ZSwgb3B0aW9uLCBzY2FsYXJvcHRzLCB0YXJnZXQsCj4+PiB0cmFuc2Zvcm11dGlscywgYWxsLXRh
cmdldHMsIGNvcm91dGluZXMsIGZyb250ZW5kZHJpdmVyLCBmcm9udGVuZGhsc2wsCj4+PiBsdG8s
IHdpbmRvd3Nkcml2ZXIpIGZvdW5kOiBZRVMgMjEuMS44Cj4+Cj4+IFRoYW5rcyBmb3IgdGhpcyB1
cGRhdGUuCj4+Cj4+IEknbSB3b25kZXJpbmcgaWYgdGhlIGlzc3VlIGNvdWxkIGFsc28gYmUgcmVs
YXRlZCB0byB0aGUgdGFyZ2V0IGFyY2hpdGVjdHVyZS4uLgo+Pgo+PiBZb3UgY2FuIHJlcHJvZHVj
ZSB0aGUgaXNzdWUgdGFyZ2V0dGluZyBhbiBCUjJfeDg2XzY0ICh3aGlsZSBidWlsZGluZyBvbiB4
ODZfNjQpCj4+IG9uIDIwMjUuMDUueCBicmFuY2guIEJ1dCBjYW4geW91IHN0aWxsIHJlcHJvZHVj
ZSBpdCBpZiB5b3UgdXNlIGFuIGFhcmNoNjQgYXMgYQo+PiB0YXJnZXQpPwo+IAo+IEkgdHJpZWQg
aXQgd2l0aCBvdGhlciBjb21iaW5hdGlvbnMsIGJ1dCB0aGV5IGFsbCBmYWlsIGluIHRoZSBzYW1l
IHdheS4KPiBUaGlzIG1ha2VzIGFjdHVhbGx5IHBlcmZlY3Qgc2Vuc2UgYXMgd2UgYXJlIHRhbGtp
bmcgYWJvdXQgaG9zdC1tZXNhM2QuCj4gCj4gVGhpcyB3YXMgbXkgY29uZmlnOgo+IAo+IEJSMl9h
YXJjaDY0PXkKPiBCUjJfY29ydGV4X2E3Ml9hNTM9eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9
eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15Cj4gQlIyX1RPT0xDSEFJTl9FWFRF
Uk5BTF9CT09UTElOX0FBUkNINjRfR0xJQkNfU1RBQkxFPXkKPiBCUjJfTElOVVhfS0VSTkVMPXkK
PiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiBCUjJfTElOVVhfS0VSTkVMX0NV
U1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEyLjI4Igo+IEJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hf
REVGQVVMVF9DT05GSUc9eQo+IEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+IEJSMl9M
SU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJyb2NrY2hpcC9yazMzOTktcm9jay00c2UiCj4g
QlIyX0xJTlVYX0tFUk5FTF9JTlNUQUxMX1RBUkdFVD15Cj4gQlIyX0xJTlVYX0tFUk5FTF9ORUVE
U19IT1NUX09QRU5TU0w9eQo+IEJSMl9QQUNLQUdFX01FU0EzRD15Cj4gQlIyX1BBQ0tBR0VfTUVT
QTNEX0xMVk09eQo+IEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9JOTE1PXkKPiBC
UjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfSVJJUz15Cj4gQlIyX1BBQ0tBR0VfTUVT
QTNEX09QRU5HTF9FR0w9eQo+IEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfRVM9eQo+IAo+IFll
YWgsIEkga25vdywgdGhlIEk5MTUgZHJpdmVyIGRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNlIG9uIGEg
cm9ja2NoaXAsCj4gYnV0IHRoYXQncyBvYnZpb3VzbHkgbm90IHRoZSBwb2ludCBoZXJlLiBBdCB0
aGUgbW9tZW50IHRoYXQKPiBob3N0LW1lc2EzZCByZXF1aXJlcyBMTFZNLCB0aGVuIHlvdSBjYW4g
cmVwcm9kdWNlIGl0IG9uIHRoZSAyMDI1LjA1LjMKPiByZWxlYXNlIHRhZy4KCkkgc2xpZ2x5IHVw
ZGF0ZWQgdGhlIGNvbW1pdCB0aXRsZSBhbmQgdGhlIGNvbW1pdCBsb2cgd2l0aCB0aGUgZGV0YWls
cyB5b3UKcHJvdmlkZWQgZm9yIHRoZSBtYXN0ZXIgYnJhbmNoLgoKU2VlOgpodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvZWIwZTYzODg4YmFlNGI3OWIy
MGI5Y2ZjZmRmNDRjYzI1NmM1MzJmZgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiAKPj4gQmVzdCByZWdhcmRzLAo+PiBSb21haW4KPj4KPj4KPj4+
Cj4+Pgo+Pj4gS3IsCj4+Pgo+Pj4gVGhvbWFzIERldm9vZ2R0Cj4+Pgo+Pj4KPj4+IE9wIHdvIDQg
ZmViIDIwMjYgb20gMTM6MzYgc2NocmVlZiBUaG9tYXMgRGV2b29nZHQgPHRob21hc0BkZXZvb2dk
dC5jb20+Ogo+Pj4+Cj4+Pj4gRnJvbTogVGhvbWFzIERldm9vZ2R0IDx0aG9tYXMuZGV2b29nZHRA
YmFyY28uY29tPgo+Pj4+Cj4+Pj4gTWVzb24ncyBjdXN0b20gTExWTSBwYXJzZXIgdXNlcyBsbHZt
LWNvbmZpZyB3aXRoIGEgZGVmYXVsdCBzZWFyY2ggcGF0aCBvZgo+Pj4+IC91c3IvYmluLCBjYXVz
aW5nIGl0IHRvIGRldGVjdCB0aGUgaG9zdCBzeXN0ZW0ncyBsbHZtLWNvbmZpZyAodmVyc2lvbiAx
OC4xLjMpCj4+Pj4gaW5zdGVhZCBvZiB0aGUgYnVpbGRyb290LWNvbXBpbGVkIG9uZS4gVGhpcyBm
b3JjZXMgYWxsIExMVk0tcmVsYXRlZCBwYWNrYWdlcyB0bwo+Pj4+IG1hdGNoIHZlcnNpb24gMTgu
MS4zLCBidXQgc2luY2UgdGhlIGhvc3Qgc3lzdGVtIGxhY2tzIGxsdm1zcGlydmxpYiwgdGhlIGJ1
aWxkCj4+Pj4gZmFpbHMuIFRoaXMgcGF0Y2ggZm9yY2VzIE1lc29uIHRvIHVzZSB0aGUgYnVpbGRy
b290LWNvbXBpbGVkIGxsdm0tY29uZmlnLgo+Pj4+Cj4+Pj4gTm90ZSB0aGF0IExMVk1fQ09ORklH
IGlzIGEgQ01ha2Ugb3B0aW9uLCBub3QgYSBNZXNvbiBvbmUuIFRoaXMgaXMgYmVjYXVzZQo+Pj4+
IE1lc29uIGhhcyBjdXN0b20gZGVwZW5kZW5jeSByZXNvbHV0aW9uIGxvZ2ljIGZvciBMTFZNIChz
ZWUKPj4+PiBodHRwczovL21lc29uYnVpbGQuY29tL0RlcGVuZGVuY2llcy5odG1sI2xsdm0pLiBU
aGUgRVhUUkFfQklOQVJJRVMgbWVjaGFuaXNtCj4+Pj4gY2Fubm90IGJlIHVzZWQgaGVyZSwgYXMg
aXQgb25seSBhcHBsaWVzIHRvIGNyb3NzLWNvbXBpbGF0aW9uIHNjZW5hcmlvcywgd2hpY2gKPj4+
PiBkb2VzIG5vdCBhcHBseSB0byBob3N0LW1lc2EzZCBidWlsZHMuCj4+Pj4KPj4+PiBSZXByb2R1
Y3Rpb24gKE9uIEJSMiB0YWc6IDIwMjUuMDUuMyk6Cj4+Pj4KPj4+PiBCUjJfeDg2XzY0PXkKPj4+
PiBCUjJfeDg2X2F0b209eQo+Pj4+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQo+Pj4+IEJSMl9U
T09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9YODZfNjRfR0xJQkNfU1RBQkxFPXkKPj4+PiBCUjJf
TElOVVhfS0VSTkVMPXkKPj4+PiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPj4+
PiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEuMjQiCj4+Pj4gQlIy
X0xJTlVYX0tFUk5FTF9VU0VfQ1VTVE9NX0NPTkZJRz15Cj4+Pj4gQlIyX0xJTlVYX0tFUk5FTF9D
VVNUT01fQ09ORklHX0ZJTEU9ImJvYXJkL3BjL2xpbnV4LmNvbmZpZyIKPj4+PiBCUjJfTElOVVhf
S0VSTkVMX0lOU1RBTExfVEFSR0VUPXkKPj4+PiBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1Rf
T1BFTlNTTD15Cj4+Pj4gQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX0xJQkVMRj15Cj4+Pj4g
QlIyX1BBQ0tBR0VfTUVTQTNEPXkKPj4+PiBCUjJfUEFDS0FHRV9NRVNBM0RfTExWTT15Cj4+Pj4g
QlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX0k5MTU9eQo+Pj4+IEJSMl9QQUNLQUdF
X01FU0EzRF9HQUxMSVVNX0RSSVZFUl9JUklTPXkKPj4+PiBCUjJfUEFDS0FHRV9NRVNBM0RfT1BF
TkdMX0VHTD15Cj4+Pj4gQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9FUz15Cj4+Pj4KPj4+PiBG
aXhlczoKPj4+Pgo+Pj4+IGxsdm0tY29uZmlnIGZvdW5kOiBZRVMgKC91c3IvYmluL2xsdm0tY29u
ZmlnLTE4KSAxOC4xLjMKPj4+PiBSdW4tdGltZSBkZXBlbmRlbmN5IExMVk0gKG1vZHVsZXM6IGJp
dHdyaXRlciwgY29yZSwgY292ZXJhZ2UsIGVuZ2luZSwgZXhlY3V0aW9uZW5naW5lLCBpbnN0Y29t
YmluZSwgaXJyZWFkZXIsIGxpYmRyaXZlciwgbGlua2VyLCBsdG8sIG1jZGlzYXNzZW1ibGVyLCBt
Y2ppdCwgbmF0aXZlLCBvcHRpb24sIHNjYWxhcm9wdHMsIHRhcmdldCwgdHJhbnNmb3JtdXRpbHMs
IGFsbC10YXJnZXRzLCBjb3JvdXRpbmVzLCBmcm9udGVuZGRyaXZlciwgZnJvbnRlbmRobHNsLCBs
dG8sIHdpbmRvd3Nkcml2ZXIpIGZvdW5kOiBZRVMgMTguMS4zCj4+Pj4gRGVwZW5kZW5jeSBMTFZN
U1BJUlZMaWIgZm91bmQ6IE5PLiBGb3VuZCAxNS4wLjAuMCBidXQgbmVlZDogJz49IDE4LjEnIDsg
bWF0Y2hlZDogJz49IDE1LjAuMC4wJywgJzwgMTguMicKPj4+PiBSdW4tdGltZSBkZXBlbmRlbmN5
IGxsdm1zcGlydmxpYiBmb3VuZDogTk8gKHRyaWVkIGNtYWtlKQo+Pj4+Cj4+Pj4gb3V0cHV0L2J1
aWxkL2hvc3QtbWVzYTNkLTI1LjAuNi9tZXNvbi5idWlsZDoxODgyOjIxOiBFUlJPUjogRGVwZW5k
ZW5jeSBsb29rdXAgZm9yIExMVk1TUElSVkxpYiB3aXRoIG1ldGhvZCAncGtnY29uZmlnJyBmYWls
ZWQ6IEludmFsaWQgdmVyc2lvbiwgbmVlZCAnTExWTVNQSVJWTGliJyBbJz49IDE4LjEnXSBmb3Vu
ZCAnMTUuMC4wLjAnLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIERldm9vZ2R0IDx0
aG9tYXMuZGV2b29nZHRAYmFyY28uY29tPgo+Pj4+IC0tLQo+Pj4+IHYzOiBBZGRlZCByZXByb2R1
Y3Rpb24gaW5mby4KPj4+PiAgICAgQWN0dWFsbHksIEkgc2F3IHRoZSBpc3N1ZSBmaXJzdCBvbiAy
MDI1LjAyLnggd2l0aCB0aGVzZSBjb21taXRzIGNoZXJyeS1waWNrZWQ6Cj4+Pj4gICAgIC0gMzE3
MjYwZjMzNmI2NWZmMGI0MWE5NTM4ODJjYjhjY2NiNzg5ZTAxMAo+Pj4+ICAgICAtIDhiNWRkNDlj
NWIyZWI1MmU3MWJhOWRmZjY3YjFiYTU0ZDBlMDBhYzMKPj4+PiAgICAgLSA0ODkwNDE1YWE5ZTkx
OGJkYmI1MjQxNGUwZTUzZjI5ZTkzMzE1MjkxCj4+Pj4gICAgIC0gYjA4YmM1YjllOTQyNjlhZGI0
YTFjNTc3MWM4YzI2YzhjODdlNWI1YQo+Pj4+IC0tLQo+Pj4+ICBwYWNrYWdlL21lc2EzZC9tZXNh
M2QubWsgfCAzICsrKwo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Pj4K
Pj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rIGIvcGFja2FnZS9tZXNh
M2QvbWVzYTNkLm1rCj4+Pj4gaW5kZXggZGI0NmQ3YmM3YzIuLmI1MzAwZGYyYmEzIDEwMDY0NAo+
Pj4+IC0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+Pj4+ICsrKyBiL3BhY2thZ2UvbWVz
YTNkL21lc2EzZC5tawo+Pj4+IEBAIC0yOTIsNiArMjkyLDkgQEAgaWZlcSAoJChCUjJfUEFDS0FH
RV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9JTUFHSU5BVElPTikseSkKPj4+PiAgSE9TVF9NRVNBM0Rf
VE9PTFMgKz0gaW1hZ2luYXRpb24KPj4+PiAgZW5kaWYKPj4+Pgo+Pj4+ICtIT1NUX01FU0EzRF9D
T05GX0VOViA9IFwKPj4+PiArICAgICAgIExMVk1fQ09ORklHPSIkKEhPU1RfRElSKS9iaW4vbGx2
bS1jb25maWciCj4+Pj4gKwo+Pj4+ICBIT1NUX01FU0EzRF9DT05GX09QVFMgPSBcCj4+Pj4gICAg
ICAgICAtRGdsdm5kPWRpc2FibGVkIFwKPj4+PiAgICAgICAgIC1EZ2FsbGl1bS1kcml2ZXJzPSQo
c3Vic3QgJChzcGFjZSksJChjb21tYSksJChIT1NUX01FU0EzRF9HQUxMSVVNX0RSSVZFUlMteSkp
IFwKPj4+PiAtLQo+Pj4+IDIuNDMuMAo+Pj4+Cj4gCj4gS2luZCByZWdhcmRzLAo+IAo+IFRob21h
cyBEZXZvb2dkdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
