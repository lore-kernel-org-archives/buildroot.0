Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926D9C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 19:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42BC181286;
	Thu,  4 Jul 2024 19:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mf6gzPy26F55; Thu,  4 Jul 2024 19:49:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5524281297
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5524281297;
	Thu,  4 Jul 2024 19:49:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D65731BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEDC081286
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zvHZqRkPITV for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 19:49:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 945ED8127F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 945ED8127F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 945ED8127F
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 19:49:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkYXm-1rzQgk0tSA-00jOOR; Thu, 04
 Jul 2024 21:44:36 +0200
Date: Thu, 4 Jul 2024 21:44:35 +0200
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <Zob7o5PDqPQUe_04@probook>
References: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
X-Provags-ID: V03:K1:76YTYRf25MOb0A90MqA6sw8hkgtWQB+jfbgOH0+qWTT0bSDsEhZ
 ktx7XDpjf+DsDUmxJGdjJnHIRFGdLqRTJvbn7wNYty70/Ly5vfyiQC546C4lTzDFvMoQ/O0
 kyzOFfj9uTvkdviDW+MFx3UUbedAl2LTEkkSWKwNWj53rW55lHvS/gOrwUYXN0yW6BONkXX
 Q5CquIHIAPfeckOHYxBxQ==
UI-OutboundReport: notjunk:1;M01:P0:5tIP7X8QYY4=;I+FxXzlHbgyA0tVRAu/f01TR5/6
 KMY+5I086GEQI+EUGCuF9d8HsKIT+exrEpVwOBPPw0o43UUzVJVO/lOfJCs9XV3tdHJgH7LC0
 R9VYAd5WwK2jH7Vckorxsyxc8vHOCmgKx3GekGB5nnrxBDWbKzajqvcgIHp5TZLjtQoI7l8Te
 ji1F25NA4tZq/H5eIZeT/QD7m6TBKo3nrVe6XM+QznOXT/enxq2mNaW6ZL+uycm548fGNaBHy
 rHD/AGnB9hjYIPqZdB85P3VW6ZJbvJposrpdE6myXzQUQQ4VtBfn6fyEAq7YWWlFaB9t0O+8G
 2XG1s4PefU5S3JGMxYM6Mx0RaYcbNg3CByhxfrLBmFYTM2zT/m88IvJ0r5a56DSBffof2mRbg
 /U1BOLedvH+UXTzy7zdchEMHHNV/gT17Ws2TqRyijCvAM2rSatOFWlGiWjaSizdKItPs2lvr+
 clgxo1vBp5M2JAH+ZMpb+pESma1tP6qsqJla9dN05RiXpFExUfo0Y1ura68k6EYRnrUNyQfEO
 U7vk4Cqz4bKxrD8LO0dlG8qyGlntcc87QfBBDLP7VNH3oc/h+YQBjn+mXTOqm3BsLoMvAz+6e
 83wzC1EyydXM1DtRANck/g4fSLwxcgiKTyn/liDgQFGMYzefpr7N+ahUwzi+cwVjeEqzSVa3f
 StN8VAj5EvtI9IkCojXrBdqTKyemxrwRnh3RegfvuETIV9XZ2myAvVAvNDvQlXuT1lI6BCxKu
 z8QqsCNfyEyuJclqC81QGJ3N6uBCY2sqP1Ga6SDOq6DSRgajxsmYNyhPIla0hn/H/l4wW8NN/
 Uh5iLyUZNM1aWjGUuxhWnXAi/m5EvV3TbJzaqPv7POvN0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720122576; x=1720727376; i=j.neuschaefer@gmx.net;
 bh=2c6KW1fS55MLpMyMQR5vR58cjSAkFugjVWAxBJOogyQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=AFcLLzOwKohiowsI5AjrmVM1AuTkePtcjxyXcxvmq0jBTXr8ALF6sVQRTA22yVMl
 WGHtThfG7sg321BXpLSuASEUM4mkraBy+O/87NrDVi3964FcXpv4/PneYxo5xjFOC
 L5PCvuoXCgTZOf10eVbod2t0+qc00ixw2JLKsWLm2rh288Y17q1ZkDfUdYtu8HfkI
 cIf7rMgKtDkhgp53Tt2U41nx6T+Noq197uEV9ATIUQS8zu/krVZmMWTWjsshCUWIy
 3SK4cBo27PahKftnTa0VhFIcqTu5g/HBXuZedK7pSVLs5frUbnGPpVGaKQtzLCw8L
 otm/rHOmaFq6HFr22A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=AFcLLzOw
Subject: Re: [Buildroot] [PATCH 0/8] Various skarnet.org updates and new
 tipidee package
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBKdWwgMDQsIDIwMjQgYXQgMDk6NDA6MjZQTSArMDIwMCwgSi4gTmV1c2Now6RmZXIg
d3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214
Lm5ldD4KPiAtLS0KPiBKLiBOZXVzY2jDpGZlciAoOCk6Cj4gICAgICAgc2thbGliczogYnVtcCB0
byB2ZXJzaW9uIDIuMTQuMi4wCj4gICAgICAgczY6IGJ1bXAgdG8gdmVyc2lvbiAyLjEzLjAuMQo+
ICAgICAgIGV4ZWNsaW5lOiBidW1wIHRvIHZlcnNpb24gMi45LjYuMAo+ICAgICAgIHM2LW5ldHdv
cmtpbmc6IGJ1bXAgdG8gdmVyc2lvbiAyLjcuMC4zCj4gICAgICAgczYtcmM6IGJ1bXAgdG8gdmVy
c2lvbiAwLjUuNC4zCj4gICAgICAgbWRldmQ6IGJ1bXAgdG8gdmVyc2lvbiAwLjEuNi40Cj4gICAg
ICAgczYtZG5zOiBidW1wIHRvIHZlcnNpb24gMi4zLjcuMgo+ICAgICAgIHRpcGlkZWU6IG5ldyBw
YWNrYWdlCgpBaCBzb3JyeSwgSSBmb3Jnb3QgdG8gYWRkIHRoZSBTaWduZWQtb2ZmLWJ5IGxpbmUg
aW4gZmV3IG9mIHRoZXNlLiBJJ2xsCmZpeCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
