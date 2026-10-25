Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B07D606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZuwWTiwk
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EB7D816F6;
	Sun, 25 Oct 2026 11:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKmwrqu_YSQN; Sun, 25 Oct 2026 11:14:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 08D8481449
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792926867;
	b=sqKdqgtolN0ri7DGvPG0U4O9q2nhWY47StzNz6Jm7CZPYpHlgoxoYHXOfUC6jLNTDXOy
	 FPbJoF/cC/+ysWQOQRpKpntxwGpXDHq8q5A5IQEUbvyCEn8QP73WOD5tcgtiKYINDnpZ5
	 Gk6vOebZUSNlXZkpLY8iyIRMuI45M/3jy6wvOb58+HPCyUMKR+Z2Sw71lV2CkJ8V7s0qp
	 5W6QUsMwbZJdvv3TtdkAKHuuy96D4fTzPDqESHOivYodY5tqCgmGsMd+R8uhwkoxGhzt/
	 pObTz6s+4/25vyMEEjiSnABEn+OwfSx3/Cy+TYlECCpEmd5lfkO7B56BPdMxORjY9sQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792926867;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JT+RUIRI4ygJ9/6xVJszQN6a52lKDbRJR8Ir2Nf7K9g=;
	b=P09EjVYJ92XcM6DmlMEm+ALqKxOzFC3vfVqnBDhIiAxWd+YdCWRBnsTNkeU2q6U+9hoa
	 vP6YfNolSy5aCDjnJEE/nb2a6URYNVdOjL1/jhcLcPuQIM2DPZojn+VEtT8MJOccjeY/M
	 IvRfZegU9hurHtkvYTGrW1R6DI4ZeabXgS7nGZNn+ndnjSpsEQuMLQMOhQxkNcLA0MuFB
	 By0Mf/kMtL6imoy5UpuSvn0kt3LpmGRGiH5FWELl1bX0XUwWO0z6cdTYgGNQQjZgfTyAY
	 Ajwbub+DMAD/IbmjbuMQEXecR3TgWzQNngqh1hzR4xAVY3BxH2RZD8c2MsAHItwZbwg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792926867;
	bh=JT+RUIRI4ygJ9/6xVJszQN6a52lKDbRJR8Ir2Nf7K9g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZuwWTiwkt/+FFUBUU9wmMM8bSKrA7q1D9h2+WfmhXJBHwd2bOapn12TerXP2o7HBb
	 f7ZQLCcY2yZQftMVtoTKJvtTNk5mzW59Kv10B7ANSaB9TVRXCOoGEFyhrq7kKuZnJK
	 tz9G2WYklv1x+b3QIrXQA9eNVo5qDDiZqK9z5rscdvBscyCG7I1dPDUUJdK2u6KYxZ
	 gawQ6HtoRDs09ZiUeHpWa4uQpTUdmSTNOuOUxPHk8T/l0DsyAkg/IA4WOdbZmWmjJq
	 MQOH6GbYmamfdMQw+0pyKMw+Txtg6gxE0l008S20N5GcCph5BiJ7iPXMmbdwRsIsdr
	 14jNeCDD6RbcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08D8481449;
	Sun, 25 Oct 2026 11:14:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E9E343
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 046DB4063E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRYjDBzMZDQ7 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:14:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 44263405E3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792926865;
 b=pT3NABj2Xm8Cr4wZvzOCTmBu1fUegJoN3aRmEXy3qViZKNBhYIbIIh3QXv4SbzqDYwa0
 Y6sRyzlVgZTSfgTCiFgS0cJTIMJpvFPV5CvPJTuctydULoPml+ubeKy3IZsEAE8lSoyG4
 6DvtCGk06/xkZWW0bKX3mmrj7NsrsftbjAbzMO6kLslRDjXZ1OnsnJnbnRcE2u57lVUtk
 q07OXCGhSlCGZkgi+sNqruyH8zYccKvZ+GuUR+SssS3NOHKJsQG0W+KSDl+I5kt4y++Uz
 xUpdijDvrkvaZtjCxfvrnicMLzPv4BjpIhMZj4pWWJXnScYzfxXXo/oEgmLRYcGy4mg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792926865;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=T1/KK4fgUR4veYihAUxVRJ/3JhMNdSLKBkwvo58bTrs=;
 b=mxzm2DsSpISPOAOwEEzQOv2r83qyDIbm1Gra4P6YKxPRAGUosBgtfJSv7I3IHRZq0y3C
 kXJeGqxLoBcHIJGqQuYZkaDTuG7/DYtOrSdu2dCQjY7RriB3LQMggLX/QM86GZ7w1wbHp
 C1jUaFv2a1jV+GSaMty42V8fXpP0GN9iiq+G5o6k7X5doWWdK+cxpMr4FzmTQKvg4Bifd
 OnzywPzo5VLfBG2T6sX60Q6B1QWGmy9NYtIjM5WH6Bi4z/gIRZ4KWiBOHIp57kIOSV6gz
 GNIFwhTnYq0PTjEGadca5LKRuFLPZoQbl9esiMtEE0mWr53MQnCi5vlN5mhmA2vqj1g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SYv146By; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44263405E3
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:14:23 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48c4be28b82so1830989f8f.2
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 04:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792926862; x=1793531662;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=T1/KK4fgUR4veYihAUxVRJ/3JhMNdSLKBkwvo58bTrs=;
 b=dg31Z90mrG3o2xHENTw9gkcBchp7WCLO1YqSP8B38RFQGQCt0ur8helm9ahIoumUQ7
 v4+JhxhaPkX/OwOEPfN0etdUaPYeQywjCA/aLbF4aBpkC6U37xTBUE6wg6mh9ljHIac5
 Zu1kmzJWH8mvp/41glF9VNh9c/Qc5Ovaf7uUrn3sJ/iRMvL1S3pG/40nNFIpbS0rjWk+
 2hZHK7UXGNkqiRFIFWWk/jsh2Vjm7WePCC2wo8V5/C/og+DEimVZ3mZ3nIrcsEB5A7Gz
 CvzcAhzMRZrp2PnYJnlFsSqaICqr60njIADOy5XLWAlR8OanuOlexLppnd3wYylBv9np
 00ng==
X-Forwarded-Encrypted: i=1;
 AKwUvBz1iQK08loR4Szt33NjF35ZBQjA58p6Puq9zYO39lT1mmETwhZE+4aiCSwIZ8ncRnyybzTCHG9KRc8=@buildroot.org
X-Gm-Message-State: AFq9FYJiazLUm8lO73R7kWbei0pnWc9XEVaEvMSXS6C/v6nNNcQ/ox2C
 V64YhxhX93Mfvqqphyn+qpTGqdXU41BO2jzX/sTE+Ea5//GfBSpXItJ3syWyKj4NBBo=
X-Gm-Gg: AYBFou1X1YdGQroWLJsvleoRQgLCJyAE+QAEQbKaqVr7/e0sOe5kZwMDPxdyAPanvOt
 1cOIqTjizpsYLX1Mzfi+919Q+vRYVtIiPTy+k77nNXYFR8sOt2gUkOjei6okJzT6WAsmIvgNP1J
 FrpXHkvyk6vWCLDYo7TahRUXkp2wlIUB9vl1Ufo44FjoUpTIk6rF6tofJUv1gb42zRqB5VPjFpq
 wI0H/r9WSuULFTjz1g9nbDLBQPYysDQ8nIiwavW5vgmiL3LQpxvVc+M82pTafQDOGO0rBKDK8Fx
 voe9bwmh3CJgYgGuU7QALW3hnxRgrPWs/zfHq9VmfMpmRtvvNucvV2qt/9P8OiEio699h3RdoGC
 vdao7hC2X/8LN2lnYwpHJgAsLbG0TJM8dQT65grNsU+L10z2JlJTCNn+XM2ojTYobs3ndWXJ4W6
 0kPAqALkt5bI9HkAP0xR4qyYJhs85csRxxwURL27PwJEy88bk7+1Psi7H5QNu6hJcWWu+toe6LA
 iCfv7/s8Cl2ADc2n3TKhNkEZxkDHiqo04XI2WfzEasCPVv3bGokcbzdgafr3uon5wBXmQ==
X-Received: by 2002:a05:6000:200f:b0:48e:f8d:8cab with SMTP id
 ffacd0b85a97d-48e3eb455bdmr7132867f8f.4.1792926861642; 
 Sun, 25 Oct 2026 04:14:21 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd48eesm9557979f8f.30.2026.10.25.04.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2026 04:14:21 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org,
 Quentin Schulz <quentin.schulz@cherry.de>
Date: Sun, 25 Oct 2026 12:14:08 +0100
Message-ID: <20261025111420.79613-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <0e85bd1c-3122-440e-b366-7863384e19f1@gmx.de>
References: <0e85bd1c-3122-440e-b366-7863384e19f1@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 2/2] utils/generate-cyclonedx: include
 external tree information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8gRmlvbmEsIEFybm91dCwKCkluIHJlcGx5IG9mOgo+IEFtIDI0LjEwLjI2IHVtIDIxOjUw
IHNjaHJpZWIgQXJub3V0IFZhbmRlY2FwcGVsbGU6Cj4gPiA+ID4gT24gMjQvMTAvMjAyNiAyMToz
OSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiA+PiDCoMKgSGkg
YWxsLAo+ID4gPj4gwqDCoEkgZG9uJ3QgaGF2ZSBhIHNvbHV0aW9uIHVuZm9ydHVuYXRlbHkuLi4K
PiAKPiBUaGF0J3Mgd2h5IG15IHBhdGNoIHRoYXQgc3RhcnRlZCB0aGlzIGRpc2N1c3Npb24gKGlu
IGNhc2UgdGhlIHRocmVhZCBicm9rZTogWzJdKSBkZWZpbmVzIGEgcHJvcGVydHkgdG8gY2Fycnkg
dGhhdCBpbmZvcm1hdGlvbi4gVGhhdCB3YXkgaXQncyB1bmFtYmlndW91cy4gU3VyZSwgZXhpc3Rp
bmcgQ3ljbG9uZURYIHRvb2xpbmcgd29uJ3QgdW5kZXJzdGFuZCB0aGF0IG1lYW5pbmcsIGJ1dCBz
byBmYXIgd2UndmUgbW9zdGx5IGFncmVlZCB0aGVyZSdzIG5vIGV4aXN0aW5nIGVsZW1lbnQgdGhh
dCBjb3JyZWN0bHkgY2FycmllcyB0aGUgbWVhbmluZy4KPiAKPiA+ICDCoEFjdHVhbGx5IEkgZm91
bmQgc29tZXRoaW5nOiBjb21wb3NpdGlvbnMgWzFdLiBJdCdzIG5vdCBfZXhhY3RseV8gd2hhdCA+
IHdlIG5lZWQgLSBJIHRoaW5rIGl0J3MgbW9yZSBmb3IgdHJhY2tpbmcgdmVuZG9yZWQgcGFja2Fn
ZXMuIEJ1dCBpdCdzID4gYmV0dGVyIHRoYW4gdGhlIGFsdGVybmF0aXZlcyBJIHRoaW5rLgo+IAo+
IEhvdyB3b3VsZCB0aGF0IGxvb2s/IEZyb20gbG9va2luZyBhdCB0aGUgc2NoZW1hIEkgY2FuJ3Qg
aW1hZ2luZSBob3cgeW91J2QgdXNlIGl0IHRvIGRlc2NyaWJlICJ0aGlzIHBhY2thZ2UgY29tZXMg
ZnJvbSB0aGF0IGV4dGVybmFsIHRyZWUiLCBvciB0aGUgbWV0YWRhdGEgb2YgdGhlIGV4dGVybmFs
IHRyZWUuCgpObyBjb21wb3NpdGlvbiBpcyBmb3Igc29tZXRoaW5nIGVsc2Ugc2VlIFsxXSBzZWN0
aW9uOgoKYEVzdGFibGlzaGluZyByZWxhdGlvbnNoaXBzIGluIEN5Y2xvbmVEWGAKICAtPiBgQ29t
cG9zaXRpb24gQ29tcGxldGVuZXNzIGFuZCAiS25vd24gVW5rbm93bnMiYAoKVGhpcyBzZWN0aW9u
ICJUaGlzIGFsbG93cyBCT00gYXV0aG9ycyB0byBkZXNjcmliZSBob3cgY29tcGxldGUgdGhlIEJP
TSBpcyBvciBpZgp0aGVyZSBhcmUgY29tcG9uZW50cyBpbiB0aGUgQk9NIHdoZXJlIGNvbXBsZXRl
bmVzcyBpcyB1bmtub3duIG9yIGhhcyBiZWVuCnJlZGFjdGVkIi4gU28gaWYgeW91IGhhdmUgcGFy
dCBvZiB5b3VyIGJvbSB3aGVyZSB0aGUgZGVwZW5kZW5jaWVzIGFyZSB1bmtub3duCnlvdSBjb3Vs
ZCB1c2UgdGhpcyBzZWN0aW9uIHRvIGRvY3VtZW50IGl0IGlmIEkgdW5kZXJzdGFuZCBjb3JyZWN0
bHkuCgpCZXN0IFJlZ2FyZHMsClBFUkFMRSBUaG9tYXMKClsxXSBodHRwczovL2N5Y2xvbmVkeC5v
cmcvZ3VpZGVzL09XQVNQX0N5Y2xvbmVEWC1BdXRob3JpdGF0aXZlLUd1aWRlLXRvLVNCT00tZW4u
cGRmCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
