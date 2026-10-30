Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31302606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bJj9ayzo
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 119C760AB4;
	Fri, 30 Oct 2026 15:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiR5JE_FxbZh; Fri, 30 Oct 2026 15:27:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 098C260AB7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374035;
	b=YpN7/jK74Ij9CZrycvobqLlhDB+zwrU1Gh9pZk2fn4TOdZZsqGaLBd91slaHKBP9gRQU
	 XIIjjZwL5y1wANKMQj0lbNFnRVMVa8ZUcRIv6kx2eRShVpz90JsNe5M/pv/W/War8JdIr
	 oPjwIeGcqQXSNbWxgpT/cVBdFl2QWk35/fP+gcG7snsTYayr743mqGw8nZWXwE9QGrRhY
	 70jqx/zA+dpzwLCi8u2ZTPOOifeg+iQqQPb3nxRpChPtKekacXWW3GDntRwYyT+UNWNx4
	 vNvjpy2BFPNWGBJ8BJoG5SRlBgTpfylpbycfQ5vvreQKr3eANxP+sTApTX+xUAsdnjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374035;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=U6JGLLI69Dlpf/ULrRuoxbbPG04isyK9H5PGWR03j4E=;
	b=L4VvlndhmG9VLgnMfM7J4KIZN1Xm3UMRAy7qwDhKeD0Xzxwfzw/lgBS/lQ20A0g/PcDF
	 Nuj1N3OCQD+s8xzTXU8Z+NrYx6McDW17W9JhBxqa3on29tXbu2YMi374/X3u5R92SeT8H
	 qmbFSP1DjiHoLBj4AqBStx7EVSufOnjkOx5lfVBzqBgEqN0rRC6DEVMn7DeN9u6iy0QmP
	 GTyLMgXYAUajs8niha2K8VADl9Y3jtDQpnNS2OQgbHb0+IfVxY+3TJ0YoX7pCkTnMcEgc
	 EWykh93SYELFEj8EcpjlZYyb1eXV1rBDxejd1uF5OG+pj2w0ytV1gxy3c0jnzxiliuw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374035;
	bh=U6JGLLI69Dlpf/ULrRuoxbbPG04isyK9H5PGWR03j4E=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=bJj9ayzoBR//G09G6L9IyToC8NARuFj/mZte91lun1ZXK12tyN9a0LD6l1QJTV8G2
	 LDs6ZyP37cnpdXCmbCmffmEhgoNjaR7eeyRRKY6zYGtJzoc4d6DgAFU4jqDc4dCc2s
	 jmsfVLyVggKQLwdvad3PiXAfeMGVXsSnstloHdlO1h6XTuO82stxhRQZL3oue5XHWI
	 d3R2wAZRnBl2s09q1S3Yfze3cOZpRZJ+3thwIC5RWwzg41FdbWEbDOFr4xQgQNCLrm
	 5dVoDfXVX7X02rojjg1KBZLvlx0fGa726ohpaT4odb9jfsLtKceRTbiGts4oT99I1Y
	 sFu9o1nQfiWCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 098C260AB7;
	Fri, 30 Oct 2026 15:27:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 389193AF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A5A240530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LAYYiFSCkbOv for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 466D940211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374002;
 b=fgI/xlK5XGWainFZkCUAwEMfmb0zcq/gIhQQGPf0FTmK2oaArGg0iFIzI8kVwGu9p2TB
 3lsEeTVbQL9ieI5dHnVzChoaCERLhGIDnG88jOEIGmQm9u8V13fvDuo5SAeqmzAn6T0AC
 HZ5rsovAwcdKvWUUsAI2Rqy0b0BRi7u755iUyxE/x+K54o1sXIjGZ70GGBjIsbw5euKea
 rqSzIOX2CCfv/LsYPYzdo8ngKqYwa/jc78IBFpuBOQnzp/mLSXjw97496RtFDmLQxd8dD
 GepncdZyIaKOWnGPmyLhWHU0IbqYgkIDjVhdGSy8U6FWBUAydmbaLCEr6rKSE0g8oqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374002;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=bwX/K/NcTbgDhE34RCDwIwOIDT6tD+wWryFhKfQ7nko=;
 b=CM+l2TjSuR/kwvzwmM1MiaLKTxWXgbrrlUWqa1Y5Dbowua5rkidILs/J45MdRr3isTaZ
 ABfEkpHv/DwbgtuiITUzkfwya4cKxcOBkuMg4q1CgKldz0COJOKIP88JtwnNahQCRT/ry
 A+xmEmGUYlmR1TSL9Q0xEaNFJ2mPL98zlBupWy/YxBZjHwPP6ZTMJjKyc4IyPcjPQvAfF
 7V/lTspq5esFitLrkvzTDIsbsz/d8WRHpTbIx68NA7+xYbxnM+Kk2wdLHLpyTLSokUocT
 w9kr7CMQnDOqFJ0qxekfF9M3856OK8a2VTO2+laJHR8neu43Z2mB2xR7ttuX+nLnepg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RE4n7uBt; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 466D940211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:42 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48df8fe8513so768097f8f.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374000; x=1793978800;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=bwX/K/NcTbgDhE34RCDwIwOIDT6tD+wWryFhKfQ7nko=;
 b=lUhjwWkA4KTLV/Bh0ykt1aaIsrh1jlX5w2yWX4zoAkBfNceMoHftQnWoyThRTJLwRw
 uItphb+xf4AwSN5G72wTcmSCyFHGnwEjWlLL0OkzwNf7qa9Jdq1hO/7iT0/d2YxIDxiO
 oqBRkTua7kMDravJ4ISrLKeIKrIPp5GsBHH9/f0PS+tKoH+PiUQ0ayKtb459GaX381A1
 RWpXS38yMiwuOjcpBpnTexhUKFkLP0JA5L4tnyhWpOHlGIVkBPOWzcwaqpTiQ7lXftqz
 Pyf830kuyu+M2ISQf01O0MXBi0p25vtc0qWCOFfZnAlubugsUDn1Y1c9q9EvancKiOou
 eL/A==
X-Gm-Message-State: AFq9FYJDGVzI2F97plxrNUWlJvfVQL/ZMr3RimXbSf+39XjAeL0128m0
 KomN8fx+4cnb8V5ytV1I2Y6kzaUE5JtVRufyugeI0j5kgGEnThsQuccbZyCXycSM5dtdOJRQzeC
 LgF5Mfk8=
X-Gm-Gg: AYBFou1hpeq9KJDtvzBcTWHyYb7Ewt72hnHGcLFEJGtOnbex9ZraP8D3PMz7fUDxlDJ
 DhoovIX5ILQyHipFNvIFRxpPCO9EBlDTuC13cX4HXN65HBV5R2mk3M71jmBv0wWXT5SsEba2MyW
 0cvwFTpu67csA5pLY3nMsl/w36aQlZo5RMpArm2g0B2EqZ07wmGgQcddU9BG4oQUPuM/IXMoXcb
 EjzLJpYKlpZjRSqR8uZQpNyO4xpPW8fcIIQXyOkH+TignSndA4EvRApkHuDaYrouU0q1b1Lsk/W
 ORqPVpDSUKgWxXrHscOtFexqENdo5PQdMWh2dfI0XzlsbAVy2hKtCHom0kMmGQG1HXbitqcG6Pg
 D8XLsoj7gjRJCik36n8sHj0FV3mX4q77wbDQUvugBDbWyuzU43D3ayjluq5F3FmsVNxYi8MDGBq
 EOXSd+AJKpX+qrT9ALAqAnfaUCimfK5QUMQGhX2YfCDzCRVgHxJdBh3v2ARk0Biqc0+51Fijo3O
 0gBRVS+RRiX3HIErMuvHUTXNO8heZC5TuE5ti498+8VuemetWWwcWwO24skpKSsvPwFeVYvhXve
 SF5QFF5UU0RYrYDh+yuxHO7mK0Y8jEcyvz3vyVJuBTxbpgi3cgO9N5ObCCJBE7G+p//RDYHLOZN
 JDcDE9T+OALyEYjns1II=
X-Received: by 2002:a05:6000:4914:b0:48c:69b3:610f with SMTP id
 ffacd0b85a97d-48e6e5008b4mr6694096f8f.26.1793374000282; 
 Fri, 30 Oct 2026 08:26:40 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b728f9sm3827933f8f.10.2026.10.30.08.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:39 -0700 (PDT)
To: buildroot@buildroot.org,
 =?utf-8?b?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:37 +0100
Message-ID: <20261030152639.1906302-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016130716.32627-1-raphael.melotte@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] utils/bump-stable-kernel-versions: fix
 newline in commit message
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gQnkgZGVmYXVsdCAoeHBnX2VjaG8gZGlzYWJsZWQpIGJhc2gncyBlY2hv
IGRvZXNuJ3QgZXhwYW5kIGVzY2FwZXMsCj4gd2hpY2ggcmVzdWx0cyBpbiBhIGxpdGVyYWwgJ1xu
JyBiZWluZyBpbnNlcnRlZCBpbiB0aGUgY29tbWl0Cj4gbWVzc2FnZS4gRm9yIGV4YW1wbGU6Cj4g
VXBkYXRlIHRoZSBsYXRlc3Qga2VybmVsIHJlbGVhc2VzIHRvOlxuIC0gNi4xOC41MyAtPiA2LjE4
LjU0Cj4gCj4gQ29tbWl0IGRhMDFiNzI3MWEgKCJ1dGlscy9idW1wLXN0YWJsZS1rZXJuZWwtdmVy
c2lvbnM6IHVwZGF0ZSBmb3IKPiBzcGxpdCBoYXNoIGZpbGUiKSBhZGRlZCB0aGUgJ1xuJyBsaW5l
LCBidXQgYXQgdGhhdCBwb2ludCB0aGUgdmFyaWFibGUKPiB3YXMgbmV2ZXIgcHJpbnRlZC4KPiAK
PiBUaGUgYnVnIGJlY2FtZSB2aXNpYmxlIGluCj4gZmFiNTBlZDNiMSAoInV0aWxzL2J1bXAtc3Rh
YmxlLWtlcm5lbC12ZXJzaW9uczogYXV0b21hdGljYWxseSBjb21taXQKPiByZXN1bHQiKSwgd2hl
biBlY2hvICIke3VwZGF0ZWRfdmVyc2lvbnN9IiB3YXMgaW50cm9kdWNlZC4KPiAKPiBTaW5jZSB0
aGUgc2NyaXB0IGFscmVhZHkgdXNlcyBiYXNoIGFycmF5cyBhbmQgdGhlIGxpc3Qgb2YgdXBkYXRl
ZAo+IHZlcnNpb25zIGZpdHMgYW4gYXJyYXkgd2VsbCwgdXNlIG9uZS4gVGhpcyBhbGxvd3MgdXMg
dG8gZWFzaWx5IHByaW50Cj4gaXRzIGNvbnRlbnQgd2l0aCBhY3R1YWwgbmV3bGluZXMgd2l0aG91
dCBzdG9yaW5nIHRoZW0gaW4gYSB2YXJpYWJsZS4KPiAKPiBUaGUgZml4ZWQgc3RyaW5nIGluaXRp
YWxseSBjb250YWluZWQgaW4gJ3VwZGF0ZWRfdmVyc2lvbnMnIGlzIGFsc28KPiBtb3ZlZCB0byBh
biBlY2hvIGNhbGwsIHNvIHRoYXQgJ3VwZGF0ZWRfdmVyc2lvbnMnIHJlYWxseSBjb250YWlucyBv
bmx5Cj4gdGhlIGxpc3Qgb2YgdXBkYXRlZCB2ZXJzaW9ucy4KPiAKPiBGaXhlczogZmFiNTBlZDNi
MTUzMjAzN2ZhNjc1ODJhNmI0N2FjNDA4NGRhYWE4OCAoInV0aWxzL2J1bXAtc3RhYmxlLWtlcm5l
bC12ZXJzaW9uczogYXV0b21hdGljYWxseSBjb21taXQgcmVzdWx0IikKPiBTaWduZWQtb2ZmLWJ5
OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CgpBcHBsaWVkIHRv
IDIwMjUuMDIueCwgMjAyNi4wOC54LiBUaGFua3MKCj4gLS0tCj4gQ2hhbmdlcyB2MSAtPiB2MjoK
PiAgIC0gdXNlIGEgYmFzaCBhcnJheSBpbnN0ZWFkIG9mIEFOU0kgQyBxdW90aW5nLgo+IAo+ICB1
dGlscy9idW1wLXN0YWJsZS1rZXJuZWwtdmVyc2lvbnMgfCA3ICsrKystLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
dXRpbHMvYnVtcC1zdGFibGUta2VybmVsLXZlcnNpb25zIGIvdXRpbHMvYnVtcC1zdGFibGUta2Vy
bmVsLXZlcnNpb25zCj4gaW5kZXggYWY4NWQzMjg1Mi4uYjAyYjg1NGQ5NSAxMDA3NTUKPiAtLS0g
YS91dGlscy9idW1wLXN0YWJsZS1rZXJuZWwtdmVyc2lvbnMKPiArKysgYi91dGlscy9idW1wLXN0
YWJsZS1rZXJuZWwtdmVyc2lvbnMKPiBAQCAtMjcsNyArMjcsNyBAQCBlY2hvICIke2xhdGVzdF92
ZXJzaW9ufSAtPiAke2xhdGVzdF9yZWxlYXNlX3ZlcnNpb259Igo+ICAKPiAgdXBkYXRlZF9maWxl
c19saXN0PSgpCj4gIHVwZGF0ZWRfcmVsZWFzZXNfbGlzdD0nJwo+IC11cGRhdGVkX3ZlcnNpb25z
PSdVcGRhdGUgdGhlIGxhdGVzdCBrZXJuZWwgcmVsZWFzZXMgdG86Jwo+ICt1cGRhdGVkX3ZlcnNp
b25zPSgpCj4gIAo+ICB1cGRhdGVfbGludXhfaGFzaCgpIHsKPiAgICAgIEhBU0hGSUxFPSIkMSIK
PiBAQCAtODUsNyArODUsNyBAQCB1cGRhdGVfbGludXhfaGFzaCgpIHsKPiAgICAgICAgICAgICAg
ICAgIGZpCj4gIAo+ICAgICAgICAgICAgICAgICAgdXBkYXRlZF9yZWxlYXNlc19saXN0PSIke3Vw
ZGF0ZWRfcmVsZWFzZXNfbGlzdH0gJHtyZWxlYXNlX3ZlcnNpb259LngiCj4gLSAgICAgICAgICAg
ICAgICB1cGRhdGVkX3ZlcnNpb25zPSIke3VwZGF0ZWRfdmVyc2lvbnN9XG4gLSAke29sZF92ZXJz
aW9ufSAtPiAke25ld192ZXJzaW9ufSIKPiArICAgICAgICAgICAgICAgIHVwZGF0ZWRfdmVyc2lv
bnMrPSgiJHtvbGRfdmVyc2lvbn0gLT4gJHtuZXdfdmVyc2lvbn0iKQo+ICAgICAgICAgICAgICBm
aQo+ICAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgIyBEaWZmZXJlbnQgbGluZTogUmVzZXQg
aGFzaCBsaXN0IGFuZCBqdXN0IGNvcHkgdGhpcyBsaW5lIG92ZXIgYXMgaXMuCj4gQEAgLTExMSw3
ICsxMTEsOCBAQCBpZiBbIC1uICIke3VwZGF0ZWRfcmVsZWFzZXNfbGlzdH0iIF07IHRoZW4KPiAg
ICAgIGdpdCBjb21taXQgLS12ZXJib3NlIC0tZWRpdCAtLXNpZ25vZmYgLS1maWxlPTwoIHsKPiAg
ICAgICAgICBlY2hvICJ7bGludXgsIGxpbnV4LWhlYWRlcnN9OiBidW1wJHt1cGRhdGVkX3JlbGVh
c2VzX2xpc3QvLy54IC8ueCwgfSBzZXJpZXMiCj4gICAgICAgICAgZWNobwo+IC0gICAgICAgIGVj
aG8gIiR7dXBkYXRlZF92ZXJzaW9uc30iCj4gKyAgICAgICAgZWNobyAnVXBkYXRlIHRoZSBsYXRl
c3Qga2VybmVsIHJlbGVhc2VzIHRvOicKPiArICAgICAgICBwcmludGYgJyAtICVzXG4nICIke3Vw
ZGF0ZWRfdmVyc2lvbnNbQF19Igo+ICAgICAgfSApCj4gIGVsc2UKPiAgICAgIGVjaG8gJz4+PiBO
b3RoaW5nIGhhcHBlbmVkLicKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
