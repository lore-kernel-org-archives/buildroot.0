Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4216CC4332F
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 14:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D579080C05;
	Mon,  9 May 2022 14:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BOSkj3_Zig_j; Mon,  9 May 2022 14:11:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8B0D80BCF;
	Mon,  9 May 2022 14:11:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83C3C1BF33D
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 14:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 113EC600B4
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 14:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smtpcorp.com header.b="dvW+mICX";
 dkim=pass (2048-bit key) header.d=sonifex.co.uk header.b="l5GSNrDP"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hO_2lOVScj4W for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 14:11:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from e2i465.smtp2go.com (e2i465.smtp2go.com [103.2.141.209])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 767C360BDF
 for <buildroot@buildroot.org>; Mon,  9 May 2022 14:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=smtpcorp.com; s=a1-4; h=List-Unsubscribe:Feedback-ID:From:To:Subject:Date:
 Message-ID:Reply-To:Sender:X-Smtpcorp-Track;
 bh=AiGJ4f9bikqIZTSkLx3+2weZdCIP1it9hZNFaPoFBJ4=; b=dvW+mICXaJVkL5DWnvFXlu83ha
 w6aq739Zo5GoLEY5MIaKbEGx7EGnEuRtnBYzEnxfTIIYuyue2BTVfyQY9QV4ytdvVEFlXtH7RKUYj
 e63BLP5jTsz9Asvl2e5Cx2DuvIEpZ8t/urXZicKIh0p2bFwRgKmJnwQpimANv4eSGYPzS2aHgvlVK
 DZMHnxHZt7EMmsy5TdX9puCiHTnOF4hRC74vbiPbGU7JL/44+anC8ljVuzo8QBfLX7YH3I7lMJvBq
 GUCQyCAPpUa6KCzltZ30NSzIfoDwmh9ARVISWCn0LMfKB6KV7NrTp1FpqvTNMLnNBC09Ef9ifsl7Q
 s9cYtdVA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonifex.co.uk;
 i=@sonifex.co.uk; q=dns/txt; s=s592615; t=1652105491; h=from : subject
 : to : message-id : date;
 bh=AiGJ4f9bikqIZTSkLx3+2weZdCIP1it9hZNFaPoFBJ4=;
 b=l5GSNrDPVVuVnagTys6IW+I2dJ3qY4f8x/yGH9ZcNXUOPVjbeN+Y3365vcxh2BEDHd+9j
 cZQrn61A+6fzGdSExoV/+mtY9i5cJebkChWjFPLej755rtqMnXgAS8W0YPowzKTq4NnJYYb
 93Su6u8gsTs/lFfvClWLP1YsKCxVzv9DGyC4t1HOQaChqcthCursWhmj5cFFw2EmXLsskwA
 2C9EMc1nB5NcP4b5f5vacsktWv9lkrNTkwPGysNUNtVaLgdXeUF8zPaD/KQvjhs+2bxWflF
 Jrzk2YqGpEkzE8q2pbx3Uji10QMdGWPpuMSzUF2qmGz301jzom/PtzlGPcRg==
Received: from [10.45.33.53] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <wesley@sonifex.co.uk>)
 id 1nnzTN-TRjwvZ-Tm; Mon, 09 May 2022 09:14:34 +0000
Received: from [10.87.224.66] (helo=NETHMAIL.sonifex.co.uk)
 by smtpcorp.com with esmtpsa (TLS1.2:DHE_RSA_2038__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <wesley@sonifex.co.uk>)
 id 1nnzTL-rlZCRG-TW; Mon, 09 May 2022 09:14:32 +0000
Received: from [192.168.0.19] (unknown [192.168.0.19])
 (Authenticated sender: wesley.revens@sonifex.co.uk)
 by NETHMAIL.sonifex.co.uk (Postfix) with ESMTPSA id 5A350819BA42;
 Mon,  9 May 2022 10:14:28 +0100 (BST)
Message-ID: <74b54843-fd4a-4f93-6f8f-3f3110ab0548@sonifex.co.uk>
Date: Mon, 9 May 2022 10:14:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Michal Simek <michal.simek@xilinx.com>, Neal Frager <nealf@xilinx.com>,
 Neal Frager <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <77b0f29f-7df7-36f4-9b49-5212fd46c5af@sonifex.co.uk>
 <51fb4a8c-cd8c-9db0-76e4-5461e72871f8@xilinx.com>
 <SJ0PR02MB7758503615E7EA06416E482CD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <dd608132-245a-32b7-7d27-f267c1524fee@xilinx.com>
From: Wesley Revens <wesley@sonifex.co.uk>
In-Reply-To: <dd608132-245a-32b7-7d27-f267c1524fee@xilinx.com>
Feedback-ID: 592615m:592615abMtQZZ:592615sHGBV5TFLK
X-Report-Abuse: Please forward a copy of this message, including all headers, 
 to <abuse-report@smtp2go.com>
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPbiAwOS8wNS8yMDIyIDA4OjI3LCBNaWNoYWwgU2ltZWsgd3JvdGU6Cj4gSGksCj4KPiBP
biA1LzkvMjIgMDg6MjMsIE5lYWwgRnJhZ2VyIHdyb3RlOgo+PiBIaSBNaWNoYWwsCj4+Cj4+Pgo+
Pj4gSGkgTmVhbCwKPj4+Cj4+PiBJIGhhdmUgYmVlbiB3b3JraW5nIG9uIGEgQnVpbGRyb290IGlt
YWdlIGZvciB0aGUgS3JpYSByZWNlbnRseSBzbyBteQo+Pj4gY29tcGFueSBjYW4gZXZhbHVhdGUg
dGhlIEsyNiBTT00uCj4+PiBJIHJlYWNoZWQgYSBzaW1pbGFyIHBvc2l0aW9uIHRvIHdoYXQgaGFz
IGJlZW4gaW5jbHVkZWQgaW4geW91ciBwYXRjaAo+Pj4gaG93ZXZlciBJIGhhdmUgbm90IGJlZW4g
YWJsZSB0byBnZXQgdGhlIEtyaWEgdG8gYm9vdCB1c2luZyB0aGUgVS1Cb290Cj4+PiBTUEwuCj4+
Pgo+Pj4gSSBoYXZlIHRyaWVkIG91dCB5b3VyIHBhdGNoIGFuZCBmb3VuZCB0aGF0IHRoZSBMaW51
eCBrZXJuZWwgaXMgYm9vdGluZwo+Pj4gZmluZSBmcm9tIHRoZSBTRCBjYXJkIHVzaW5nIHRoZSBw
cmUtcHJvZ3JhbW1lZCBib290LmJpbiB0aGF0IGlzCj4+PiBhbHJlYWR5IHByZXNlbnQgb24gdGhl
IEtyaWEuCj4+PiBIb3dldmVyLCBhZnRlciBidWlsZGluZyB1c2luZyB5b3VyIHBhdGNoLCBJIHRy
aWVkIHVwbG9hZGluZyB0aGUKPj4+IGJvb3QuYmluIHRoYXQgYXBwZWFycyBpbiBidWlsZHJvb3Qv
b3V0cHV0L2ltYWdlcyB0byBteSBLcmlhIHVzaW5nIHRoZQo+Pj4gIkJvb3QgSW1hZ2UgUmVjb3Zl
cnkgVG9vbCIgd2ViIFVJIHRoYXQgcnVucyBvbiB0aGUgS3JpYSBpZiB5b3UgaG9sZAo+Pj4gZG93
biB0aGUgRldVRU4gYnV0dG9uIGR1cmluZyByZXNldCBvZiB0aGUgYm9hcmQuIE9uIGJvb3QsIEkg
dGhlbiBnZXQKPj4+IHRoZSBmb2xsb3dpbmcgb3V0cHV0IGZyb20gVS1Cb290IFNQTDoKPj4+Cj4+
PiBVLUJvb3QgU1BMIDIwMjIuMDEgKE1heSAwNiAyMDIyIC0gMTE6MjE6NTUgKzAxMDApCj4+PiBQ
TVVGVzrCoCB2MS4xCj4+PiBMb2FkaW5nIG5ldyBQTVVGVyBjZmcgb2JqICgyMDE2IGJ5dGVzKSBT
aWxpY29uIHZlcnNpb246IDMgRUwKPj4+IExldmVsOsKgwqDCoMKgwqDCoCBFTDMgQ2hpcCBJRDrC
oMKgwqDCoMKgwqDCoCB4Y2syNgo+Pj4gTXVsdGlib290OsKgwqDCoMKgwqAgNjQKPj4+IFRyeWlu
ZyB0byBib290IGZyb20gU1BJCj4+Pgo+Pj4gVGhlbiBub3RoaW5nIGVsc2UgaGFwcGVucy4KPj4+
Cj4+PiBUaGVyZSBpcyBhIGJpZyBkaWZmZXJlbmNlIGluIHRoZSBmaWxlIHNpemVzIGZvciB0aGUg
Ym9vdC5iaW4gZnJvbQo+Pj4gYnVpbGRyb290L291dHB1dC9pbWFnZXMgYW5kIHRoZSBCT09ULkJJ
TiBJIGRvd25sb2FkZWQgZnJvbQo+Pj4gaHR0cHM6Ly94aWxpbngtd2lraS5hdGxhc3NpYW4ubmV0
L3dpa2kvc3BhY2VzL0EvcGFnZXMvMTY0MTE1MjUxMy9LcmlhKwo+Pj4gSzI2K1NPTSNCb290LUZp
cm13YXJlLVVwZGF0ZXMKPj4+Cj4+PiBzbyBJIGFtIG9idmlvdXNseSBtaXNzaW5nIHNvbWV0aGlu
ZyBzb21ld2hlcmUuIEkgdGhpbmsgYWxsIHRoZQo+Pj4gY29tcG9uZW50cyBhcmUgYmVpbmcgYnVp
bHQgYnV0IEknbSBub3Qgc3VyZSB0aGV5IGFyZSBiZWluZyBwYWNrYWdlZCBpbgo+Pj4gYSBzaW1p
bGFyIHdheSB0byBob3cgdGhlIHByZS1sb2FkZWQgYm9vdC5iaW4gaXMgbGFpZCBvdXQgKG9yIEkg
YW0KPj4+IHVzaW5nIHRoZSB3cm9uZyBvdXRwdXQgZmlsZSEpCj4+Pgo+Pj4gSW4gbXkgb3duIHRl
c3RpbmcgSSB3YXMgYWJsZSB0byB0ZXN0IHRoZSB1LWJvb3QuaW1nIHByb2R1Y2VkIGJ5IG15Cj4+
PiBCdWlsZHJvb3QgYnVpbGQgYnV0IEkgaGFkIHRvIHVzZSB0aGUgWGlsaW54IGJvb3RnZW4gdG9v
bHMgYW5kIHVzZSB0aGUKPj4+IFhpbGlueCBmc2JsIHJhdGhlciB0aGFuIHRoZSBVLUJvb3QgU1BM
Lgo+Pj4KPj4+IEluIGZ1dHVyZSwgd2Ugd291bGQgbGlrZSB0byBiZSBhYmxlIHRvIGJ5cGFzcyB0
aGlzIHN0ZXAgYW5kIGp1c3QgdXNlCj4+PiB3aGF0ZXZlciBCdWlsZHJvb3QgcHJvZHVjZXMuCj4+
PiBJIHdhcyB3b25kZXJpbmcgaWYgeW91IGNvdWxkIHBvaW50IG1lIGluIHRoZSByaWdodCBkaXJl
Y3Rpb24uCj4+Cj4+PiBOb3QgcXVpdGUgc3VyZSB3aGF0IE5laWwgaXMgdXNpbmcgYnV0IG9mIGNv
dXJzZSB5b3UgY2FuIHVzZSBTUEwgd2l0aCAKPj4+IEtyaWEgU09NIGFuZCBJIGFtIHVzaW5nIGl0
IG9uIGRhaWx5IGJhc2lzLgo+Pj4gSXQgcmVhbGx5IGRlcGVuZHMgd2hhdCBleGFjdGx5IHlvdSB3
YW50IGRvIGFuZCBkbyBzb21lIGFsaWdubWVudHMgdG8gCj4+PiB1LWJvb3QgY29uZmlnLgo+Pj4g
TGV0J3MgYXNzdW1lIHlvdSBoYXZlIHN0YXJ0ZXIga2l0IHdpdGggcHJlaW5zdGFsbGVkIEEvQiB1
cGRhdGVzIHlvdSAKPj4+IG5lZWQgdG8gc2F5IGlmIHlvdSB3YW50IHRvIGhhdmUgdGhpcyBmdW5j
dGlvbmFsaXR5IG9yIG5vdC4KPj4+IEkgcGVyc29uYWxseSBkaWRuJ3QgdHJ5IHRvIHVzZSBBL0Ig
d2l0aCBTUEwgYW5kIHVzaW5nIHBhcnRpdGlvbiBmb3IgCj4+PiBpbWFnZSBBIGZvciBib290LmJp
biAoU1BMIG9ubHkpIGFuZCBwYXJ0aXRpb24gQiBmb3IgaW1hZ2UuaXRiLgo+Pj4gVGhhdCBiZWlu
ZyBzYWlkIHlvdSBuZWVkIHRvIHRlbGwgU1BMIHdoZXJlIHUtYm9vdC5pdGIgaXMgcGxhY2VkIGlu
IAo+Pj4gUVNQSS4KPj4KPj4+IEl0IG1lYW5zIHlvdSBuZWVkIHRvIHNldHVwIENPTkZJR19TWVNf
U1BJX1VfQk9PVF9PRkZTPTB4RjgwMDAwIGFzIAo+Pj4gb2Zmc2V0IHRvIHBsYWNlIGltYWdlIHRv
IHRoaXMgbG9jYXRpb24uCj4+Cj4+PiBJZiB5b3UgdXNlIHVwZGF0ZSB1dGlsaXR5IHRoZW4gd3Jp
dGUgdS1ib290Lml0YiAoeW91IG5lZWQgdG8gcmVuYW1lIAo+Pj4gaXQgYmVjYXVzZSBndWkgZXhw
ZWN0cyAqLmJpbiBmaWxlbmFtZSkgZmlyc3QgdG8gaW1hZ2VCIGFuZCB0aGVuIAo+Pj4gYm9vdC5i
aW4gdG8gSW1hZ2UgQS4KPj4KPj4+IENvbXBhcmUgdG8gdGhlIGxhdGVzdCB1cHN0cmVhbSB2ZXJz
aW9uIHlvdSBuZWVkIGVuYWJsZSBzb21lIGNvbmZpZ3MuCj4+PiBDT05GSUdfREVGQVVMVF9ERVZJ
Q0VfVFJFRT0ienlucW1wLXNtay1rMjYtcmV2QSIKPj4+IENPTkZJR19FTlZfU0laRT0weDQwMDAw
Cj4+PiBDT05GSUdfU1lTX1NQSV9VX0JPT1RfT0ZGUz0weEY4MDAwMAo+Pgo+PiBUaGVzZSBjb25m
aWdzIGFyZSBjbGVhciBhbmQgc3BlY2lmaWMgdG8gdGhlIEtyaWEgU09NLgo+Pgo+Pj4gQ09ORklH
X0RUQl9SRVNFTEVDVD15Cj4+PiBDT05GSUdfTVVMVElfRFRCX0ZJVD15Cj4+PiBDT05GSUdfRU5W
X0lTX05PV0hFUkU9eSAob25seSkKPj4+IENPTkZJR19VU0VfREVGQVVMVF9FTlZfRklMRT15Cj4+
PiBDT05GSUdfREVGQVVMVF9FTlZfRklMRT0idmFycyIKPj4+IENPTkZJR19ETUE9eQo+Pj4gQ09O
RklHX1hJTElOWF9EUERNQT15Cj4+PiBDT05GSUdfUEhZPXkKPj4+IENPTkZJR19QSFlfWElMSU5Y
X1pZTlFNUD15Cj4+PiBDT05GSUdfUElOQ1RSTD15Cj4+PiBDT05GSUdfUElOQ09ORj15Cj4+PiBD
T05GSUdfUE9XRVJfRE9NQUlOPXkKPj4+IENPTkZJR19aWU5RTVBfUE9XRVJfRE9NQUlOPXkKPj4+
IENPTkZJR19ETV9SRVNFVD15Cj4+PiBDT05GSUdfUkVTRVRfWllOUU1QPXkKPj4+IENPTkZJR19W
SURFT19aWU5RTVBfRFBTVUI9eQo+Pgo+PiBUaGVzZSBjb25maWdzIGRvIG5vdCBhcHBlYXIgc3Bl
Y2lmaWMgdG8gS3JpYS7CoCBTaG91bGQgd2UgYmUgdXNpbmcgCj4+IHRoZW0gZm9yIG90aGVyIHp5
bnFtcCBib2FyZHMgYXMgd2VsbD8KPj4gU3VjaCBhcyB0aGUgemN1MTAyIGFuZCB6Y3UxMDY/Cj4K
PiBUaGVzZSBmZWF0dXJlcyB3ZXJlIGRldmVsb3BlZCBmb3IgS3JpYSBhbmQgYXMgd2UgYWx3YXlz
IGRvIHdlIHdpbGwgdHJ5IAo+IHRvIGVuYWJsZSBpdCBmb3IgYWxsIHp5bnFtcCBib2FyZHMgYnV0
IHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgaXQgCj4gd2lsbCB3b3JrIHdpdGggb3RoZXIgY29u
ZmlndXJhdGlvbnMuIEl0IG1lYW5zIHdlIGFyZSBwbGFubmluZyB0byAKPiBlbmFibGUgdGhlIG1v
c3Qgb2Ygb3B0aW9ucyBieSBkZWZhdWx0IGZvciBhbGwgcGxhdGZvcm1zIGFmdGVyIGNoZWNraW5n
Lgo+Cj4gVGhhbmtzLAo+IE1pY2hhbAo+Cj4KVGhhbmtzIGZvciB0aGUgaGVscC4gSSBoYXZlIGJl
ZW4gYWJsZSB0byBtYWtlIHNvbWUgcHJvZ3Jlc3MgYnkgcHV0dGluZyAKYm9vdC5iaW4KaW4gUVNQ
SSBwYXJ0aXRpb24gQSBhbmQgdS1ib290Lml0YiBpbiBwYXJ0aXRpb24gQiB1c2luZyB0aGUgYm9v
dCBpbWFnZSAKcmVjb3ZlcnkgdG9vbC4KCkkgdHJpZWQgdXNpbmcgdGhlIGJvb3QuYmluIGFuZCB1
LWJvb3QuaXRiIGZyb20gYSB0cmVlIHVzaW5nIHRoZSBvZmZpY2lhbCAKcGF0Y2ggd2l0aCBDT05G
SUdfU1lTX1NQSV9VX0JPT1RfT0ZGUz0weEY4MDAwMAphbmQgSSBnb3QgdGhlIHNhbWUgcmVzdWx0
IHdpdGggdGhlIGNvbnNvbGUgYmVpbmcgc3R1Y2sgYXQgIlRyeWluZyB0byAKYm9vdCBmcm9tIFNQ
SSIKClVzaW5nIGEgZGlmZmVyZW50IHRyZWUgd2l0aCBteSBvd24gYXR0ZW1wdCB0aGF0IEkgd2Fz
IHdvcmtpbmcgb24gdG8gZ2V0IAphIGJ1aWxkcm9vdAprcmlhIGJ1aWxkIHdvcmtpbmcgSSBnb3Qg
YSBsaXR0bGUgZnVydGhlciAtIEFURiB3YXMgbm90IHJ1bm5pbmcgaW4gdGhlIAp2ZXJzaW9uIGJ1
aWx0CmZyb20gTmVhbCdzIHBhdGNoLiBDb21wYXJpbmcgdGhlIGNvbmZpZ3MgSSB0aGluayB0aGUg
Zm9sbG93aW5nIGxpbmUgaW4gCm1pc3NpbmcgTmVhbCdzIHBhdGNoOgoKQlIyX1RBUkdFVF9BUk1f
VFJVU1RFRF9GSVJNV0FSRV9BRERJVElPTkFMX1ZBUklBQkxFUz0iWllOUU1QX0NPTlNPTEU9Y2Fk
ZW5jZTEgClBSRUxPQURFRF9CTDMzX0JBU0U9MHg4MDAwMDAiCgpBZGRpbmcgdGhpcyBjb25maWcg
YWxsb3dlZCBtZSB0byBwcm9ncmVzcyBmdXJ0aGVyIG5vdyBJIGdldCB0aGUgCmZvbGxvd2luZyBi
dXQgaXQgaXMgc3RpbGwgbm90CmJvb3RpbmcgaW50byBMaW51eCBhZnRlciB0aGlzIGFuZCBJIGNh
bid0IGdldCBhIHVib290IGNvbW1hbmQgcHJvbXB0IApoZXJlIGVpdGhlci4KClUtQm9vdCBTUEwg
MjAyMi4wMSAoTWF5IDA5IDIwMjIgLSAwOTo1MTo0MyArMDEwMCkKUE1VRlc6wqAgdjEuMQpMb2Fk
aW5nIG5ldyBQTVVGVyBjZmcgb2JqICgyMDE2IGJ5dGVzKQpTaWxpY29uIHZlcnNpb246wqDCoMKg
wqDCoMKgwqAgMwpFTCBMZXZlbDrCoMKgwqDCoMKgwqAgRUwzCkNoaXAgSUQ6wqDCoMKgwqDCoMKg
wqAgeGNrMjYKTXVsdGlib290OsKgwqDCoMKgwqAgNjQKVHJ5aW5nIHRvIGJvb3QgZnJvbSBTUEkK
Tk9USUNFOsKgIEJMMzE6IHYyLjYocmVsZWFzZSk6Ck5PVElDRTrCoCBCTDMxOiBCdWlsdCA6IDA5
OjUxOjA5LCBNYXnCoCA5IDIwMjIKCgpVLUJvb3QgMjAyMi4wMSAoTWF5IDA5IDIwMjIgLSAwOTo1
MTo0MyArMDEwMCkKCkNQVTrCoMKgIFp5bnFNUApTaWxpY29uOiB2MwpQTVVGVyBubyBwZXJtaXNz
aW9uIHRvIGNoYW5nZSBjb25maWcgb2JqZWN0CkRldGVjdGVkIG5hbWU6IHp5bnFtcC1zbWstazI2
LXhjbDJnLXJldjEtc2NrLWt2LWctcmV2MQpNb2RlbDogQXZuZXQgVWx0cmE5NiBSZXYxCkJvYXJk
OiBYaWxpbnggWnlucU1QCkRSQU06wqAgMiBHaUIKUE1VRlc6wqAgdjEuMQpFTCBMZXZlbDrCoMKg
wqDCoMKgwqAgRUwyCkNoaXAgSUQ6wqDCoMKgwqDCoMKgwqAgeGNrMjYKUE1VRlcgbm8gcGVybWlz
c2lvbiB0byBjaGFuZ2UgY29uZmlnIG9iamVjdApOQU5EOsKgIDAgTWlCCk1NQzrCoMKgIFBNVUZX
IG5vIHBlcm1pc3Npb24gdG8gY2hhbmdlIGNvbmZpZyBvYmplY3QKCklzIHRoZXJlIHNvbWUgZGV2
aWNlIHRyZWUgc2V0dGluZyB0aGF0IG5lZWRzIHR3ZWFraW5nIGluIHVib290IHRvIGdldCBpdCAK
dG8gY29udGludWUgYm9vdGluZyBmcm9tIHRoZSBNTUM/CgpSZWdhcmRzLAoKV2VzbGV5CgpUbyB1
bnN1YnNjcmliZSBjbGljazogaHR0cDovL2xpbmsuc29uaWZleC5jby51ay91cy8/ZT0xbm56VExy
X1pDUkdUVy4tanR6Y2RHUUgybzZUCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
