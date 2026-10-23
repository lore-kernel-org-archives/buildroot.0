Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF87606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=StJ8AFIW
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AF2C405B9;
	Fri, 23 Oct 2026 14:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5eWBrKBmmbUt; Fri, 23 Oct 2026 14:05:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 251B440655
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792764307;
	b=M2b3M7FchRfzJs90rfnr4h4LFTb6G89dgJAehzLF/v5KufJ0HAyNlAXo9AUlNppqjon8
	 GWQYhm1gdBOrUGqyhyfAD+oPHVkHG0/IVy9CVMKDNcZErJfe138uuIgLDEMBWrS9h3f1j
	 dyOa6jUdS+mRoAPXnF2RZjgpkL7zKC0kqESmyT3opkUQtOcIrpULJJPWJRLBdktVG42cO
	 STB4jdAKvc6+w4JxcTdv2oxHILJ9UHRedoNTqkQA+Rof7aqOhxJ227jW4zRicL/s3JFsb
	 PrJCQwPKTWVcyJizNmenvhA5AnXsOg1Y8WroK4/cIEacW/bF5MHTklU6t73OPbUt3wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792764307;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:Message-Id:MIME-Version:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mKcS51KKUedqTF8M+uF+Bil7QpkNx2O62Qj53Q0UZ08=;
	b=eCuRJFpkKbl+HjKpBmQizDsGPws+k8VdY3eYSaWG/lggzfBV4t1nPLzrX8VrAVeTD7XS
	 qydX37oj9W+BWdo8SaLFf3LMS+Il3hP53c4SxvZf2OdpisStz2L1FjmL1E0KLia37UNEL
	 Q07p8WGSKxCM5cqDeWNPjju5kEmpuhk42d3JDR1CgW3Txhvx4UTPX9isrFoqWJdCen6Hx
	 9p+TY31yOeJ0m5T1K4UWjA4l5IuEs+XV5s/b2LClZD7rBdTHCPQhNcMK4HFyZO0MSd9L+
	 39lUvpX/eqzyysEiuXrSqa1obNLVATHeIDt1ULT1OheXz4zNlQ+PcdQG/hGzJXUw2SQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792764307;
	bh=mKcS51KKUedqTF8M+uF+Bil7QpkNx2O62Qj53Q0UZ08=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=StJ8AFIWkospTYHwizobN9TgRC8kinIpbWQZw99dSxY02cXNWpn9ZjObfLO+YBA7I
	 ZpeoLG6NBZBmdtw8+atU9PI73qQ5rlv9LqHp5Bgg/Fnt9CHkXfyvspdBF9kkOqC6yc
	 KPO/5PWQsFZlCG5gW3pYHU/a3/DXCNc+9/LGnGFN/BzUleIY9q9iUdwNzr3pnlyd5O
	 +DwDuiXM463PiVyNLFE+loXiRJMxziShc/seVgH/dCVRtk0lBILXPo5HcQXx69gsOx
	 f7UxPVDgmEqtxf2163t/lSDtkNyYABHB5Zjz3VQl77vKT+rjrn6iXKA5oWkR11HnaC
	 h0CZW50kEKXDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 251B440655;
	Fri, 23 Oct 2026 14:05:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9731B3C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88C5E40655
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tpsPoH0j5Fw9 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 14:05:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3A425405B9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792764304;
 b=tOzPV+RCtLa4/rOTqD/JWaakQ8BACkxZjXfGJJnvDi47I0WMzhaBYsnGrgXoxZWfiI3I
 3m50rCToFA8TStK3Xi1+OcwmJGf91XJ1Q+CLbyh7khjqcfS1MtnZ6/pkSjU1o6Pn4XvS3
 c+rcUnkM75dFmfG9oCzPYCkvw8F4txzvW1dEPXG/M4CCipwJGxwfwrLA8FXKOEklvkKli
 dJ3cq2fG8YBqUWSxROXLy/h3Y7OufXoqWyHwhpBoM2kasjVmP8Yp35ngGcViKYJHblv58
 WmeKPDkhaSyukCnFyijk1aiKAlivkLWz/GAIOLVerSe6v/RpiehEhCqcaojQhtJb4Fw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792764304;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:Subject:
 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
 bh=lLFLYiOkDnQjgRJd/VsZRChKzXPYq4VfKyARQjRMnj8=;
 b=qAco44Vd8HyjzV/21VeAlOxVyAUFLtwgX7Rd2yz2OTFChpJboReb4COOjfe3kQxT2N8u
 7r0pUnKyuzDq4QYJg69qnPGpBGnyNctMpd5vQgoM8wU3W3lFUBhB6fiURoa4U4TDTJ7Ll
 f0tPLO1QNsWrtaYB0LkDVjHWMkkzgTbVn0fJqmla7zpYuKBZN24FRPv33TukvUeDW2UDF
 wBmHjKVGFoNNehtLqHD/OxTo/wf/axRYf0SsDUYd/VHsLfh6UJPsYrckZZ1paZwfMzB6y
 9hhN5ZYPceL0SYnE6HfCb9OjvVmDfsx1qvx34dRLC6RM2V3xurHS5hXtiOamc65r0/A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NfLefjRq; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A425405B9
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:05:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D28C04E412D3;
 Fri, 23 Oct 2026 14:05:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A678160398;
 Fri, 23 Oct 2026 14:05:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5B3B11032901C; 
 Fri, 23 Oct 2026 16:04:55 +0200 (CEST)
Date: Fri, 23 Oct 2026 16:04:45 +0200
Message-Id: <20261023-netsnmp-enable-blumenthal-aes-v1-0-bb34083800a5@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORtYO6jgr4iHZKau0sXRdEMY+
 3erHt/l7WBSkhhcuh2KbMnSSxvcqYNxIn0Ipnsz+N4H1/sBVarpvKAocRbkvM6idaKMJIY8uBD
 PwUUmgnYsRWJ6//7r7W9b+Slj/aZwHB8u2MCKgQAAAA==
X-Change-ID: 20261023-netsnmp-enable-blumenthal-aes-b316f761fbaa
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Julien Olivain <ju.o@free.fr>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 0/2] package/netsnmp: enable Blumenthal AES256
 support when OpenSSL is set
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8sCnRoaXMgc21hbGwgc2VyaWVzIGVuYWJsZXMgc3Ryb25nZXIgY3J5cHRvZ3JhcGh5IHN1
cHBvcnQgaW4gbmV0c25tcCBieQplbmFibGluZyBCbHVtZW50aGFsIEFFUzI1NiBzdXBwb3J0IGlu
IFNOTVAgd2hlbiBPcGVuU1NMIGlzIHNldC4KLSBmaXJzdCBjb21taXQgYWRkcyB0aGUgb3B0aW9u
IHRvIG5ldHNubXAubWsKLSBzZWNvbmQgY29tbWl0IGFkZHMgYSBzbWFsbCB0ZXN0IHRvIHZhbGlk
YXRlIHRoYXQgQUVTMjU2IHN1cHBvcnQgaXMKICBwcm9wZXJseSBlbmFibGVkCgpTaWduZWQtb2Zm
LWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KQWxl
eGlzIExvdGhvcsOpICgyKToKICAgICAgcGFja2FnZS9uZXRzbm1wOiBlbmFibGUgQmx1bWVudGhh
bCBBRVMtMTkyL0FFUy0yNTYgZm9yIFNOTVB2MwogICAgICBzdXBwb3J0L3Rlc3Rpbmc6IGV4dGVu
ZCB0ZXN0X25ldHNubXAucHkgdG8gdGVzdCBBRVMyNTYgIHN1cHBvcnQKCiBwYWNrYWdlL25ldHNu
bXAvbmV0c25tcC5tayAgICAgICAgICAgICAgICAgICAgfCAgMyArKy0KIHN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmV0c25tcC5weSB8IDI2ICsrKysrKysrKysrKysrKysrKysr
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
LS0tCmJhc2UtY29tbWl0OiAwNzk3Njc5ODhjZTJhOWM2MmZmNzgyZDMxY2RjMGY1Y2VlYjRjNjUw
CmNoYW5nZS1pZDogMjAyNjEwMjMtbmV0c25tcC1lbmFibGUtYmx1bWVudGhhbC1hZXMtYjMxNmY3
NjFmYmFhCgpCZXN0IHJlZ2FyZHMsCi0tICAKQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9y
ZUBib290bGluLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
