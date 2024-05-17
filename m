Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26822C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 19:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C31A182786;
	Fri, 17 May 2024 19:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id garZSpwCOYGR; Fri, 17 May 2024 19:43:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E70B882F13
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E70B882F13;
	Fri, 17 May 2024 19:43:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C27141BF348
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 19:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB61A405E4
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 19:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPQI5bW0Vm54 for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 19:43:21 +0000 (UTC)
X-Greylist: delayed 516 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 17 May 2024 19:43:20 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D9CC40346
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D9CC40346
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D9CC40346
 for <buildroot@buildroot.org>; Fri, 17 May 2024 19:43:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2CCE1424;
 Fri, 17 May 2024 12:35:07 -0700 (PDT)
Received: from debian (unknown [10.57.5.138])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 328203F762;
 Fri, 17 May 2024 12:34:43 -0700 (PDT)
Date: Fri, 17 May 2024 21:34:39 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <ZkexT4gGzutfaeOM@debian>
Mail-Followup-To: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
References: <c3811011-d5b3-4eec-99a4-dc765b98afdc@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3811011-d5b3-4eec-99a4-dc765b98afdc@grenoble.cnrs.fr>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: Re: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 14 version
 selection
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

T24gRnJpLCBNYXkgMTcsIDIwMjQgYXQgMDk6MTg6MjVBTSArMDIwMCwgRWRnYXIgQm9uZXQgd3Jv
dGU6Cj4gVGhpcyBwYXRjaCBhbGxvd3MgdG8gdXNlIGFuIGV4dGVybmFsIHRvb2xjaGFpbiBiYXNl
ZCBvbiBnY2MgMTQuCgpUaGFua3MgRWRnYXI7IHRoaXMgd29ya3Mgb24gbXkgc2lkZS4KCkZXSVcs
IGZlZWwgZnJlZSB0byBhZGQgKG9yIG5vdCk6CgogICAgVGVzdGVkLWJ5OiBWaW5jZW50IFN0ZWhs
w6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEVkZ2FyIEJv
bmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgo+IC0tLQo+ICAuLi4vdG9vbGNoYWluLWV4dGVy
bmFsLWN1c3RvbS9Db25maWcuaW4ub3B0aW9ucyAgICAgICAgICAgICAgIHwgNCArKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbGNoYWlu
L3Rvb2xjaGFpbi1leHRlcm5hbC90b29sY2hhaW4tZXh0ZXJuYWwtY3VzdG9tL0NvbmZpZy5pbi5v
cHRpb25zIGIvdG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC90b29sY2hhaW4tZXh0ZXJuYWwt
Y3VzdG9tL0NvbmZpZy5pbi5vcHRpb25zCj4gaW5kZXggZjc4MjVjYjg4ZS4uMWM0YjBkMjU1NCAx
MDA2NDQKPiAtLS0gYS90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3Rvb2xjaGFpbi1leHRl
cm5hbC1jdXN0b20vQ29uZmlnLmluLm9wdGlvbnMKPiArKysgYi90b29sY2hhaW4vdG9vbGNoYWlu
LWV4dGVybmFsL3Rvb2xjaGFpbi1leHRlcm5hbC1jdXN0b20vQ29uZmlnLmluLm9wdGlvbnMKPiBA
QCAtNDYsNiArNDYsMTAgQEAgY2hvaWNlCj4gIAkgIFNldCB0byB0aGUgZ2NjIHZlcnNpb24gdGhh
dCBpcyB1c2VkIGJ5IHlvdXIgZXh0ZXJuYWwKPiAgCSAgdG9vbGNoYWluLgo+ICAKPiArY29uZmln
IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfR0NDXzE0Cj4gKwlib29sICIxNC54Igo+ICsJc2VsZWN0
IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzE0Cj4gKwo+ICBjb25maWcgQlIyX1RPT0xDSEFJ
Tl9FWFRFUk5BTF9HQ0NfMTMKPiAgCWJvb2wgIjEzLngiCj4gIAlzZWxlY3QgQlIyX1RPT0xDSEFJ
Tl9HQ0NfQVRfTEVBU1RfMTMKPiAtLSAKPiAyLjM0LjEKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
