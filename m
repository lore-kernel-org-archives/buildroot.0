Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE0AC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 548B285A90;
	Fri, 28 Feb 2025 17:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZCshcIXgP6k; Fri, 28 Feb 2025 17:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8F2886011
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8F2886011;
	Fri, 28 Feb 2025 17:25:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28ECD1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 151AA80C8C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1xdghbKphpH for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:59:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com;
 envelope-from=oscargomezf@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 36A7180C6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36A7180C6B
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36A7180C6B
 for <buildroot@busybox.net>; Fri, 28 Feb 2025 16:59:36 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-7c0818add57so233783985a.3
 for <buildroot@busybox.net>; Fri, 28 Feb 2025 08:59:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740761975; x=1741366775;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8J1E2xTIrtsRad3hUuTrkvuKxJhx5vgVIhrmGlPTqLY=;
 b=BqnF294LWJIrY+nUp3IiYwE0fj3h5neyw9I0MQSE2aNp8+wCSEHu3Hb90Z3y93SSFl
 i2BkdQ6PT5IN39uUiTiA4GEObhuYF6QwlBT8znjCdvW1ig0ee6yvl6Dt5psumXwletPo
 yKNu2SUgNHrc4j5IDObjyahlYxPggDinSi5FnMzP1peAn2LasY9xwWARTbgBNrNzEFZ5
 tE8SteQxpaj4eYaXegG7p2J2PPoS3OVIn1VXa71bno2J/sZaxLJix0H9jr+ehWGGNoAH
 E826Yw+JPYdzFHZg2I6ZMMrLNDXsK6Va0Y+rGzpqsf9m7EctWEeJYeU8rU7Mkb9uGYOW
 6qNw==
X-Gm-Message-State: AOJu0YzUzVnYgicEs8E1Q/D2tIQARg71XsptIwl2MLzkFlon1+jIRpoH
 W6cwOtLfFCyWyHN9Fw0goRMAi7KtUxgzMmFml1hLOAtKzBa7ltg8uvpzH4NstBjzWHTsIlHvNdo
 2hTa7QFBW1D+G2tUk5CZg6HEZLa+D/oefhdg=
X-Gm-Gg: ASbGnct8u5F9/GfKyCCK+/V2fR0USQUAxcaf49zHFuGEIo8Qw2LXsNRZ+oXja+gIwKv
 B6CPo75xAvf9dDOFfb2QA7lea83HVQhwGj0xPwcjG867pne4dZUyzFGxhWM5q7uiJbzrLFTkAJ4
 i+gnbJ
X-Google-Smtp-Source: AGHT+IHt+ivuKbzxeREnZuydW69C/jipw5cgi9DP5v76yoX9BRGNT7Q2lRyoEP6a0qLsALGBvlbZHYFCQYAkb6SFdLI=
X-Received: by 2002:a05:6214:2462:b0:6e6:5d9a:9171 with SMTP id
 6a1803df08f44-6e8a0d38fb7mr66600006d6.23.1740761974917; Fri, 28 Feb 2025
 08:59:34 -0800 (PST)
MIME-Version: 1.0
From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Fri, 28 Feb 2025 17:58:58 +0100
X-Gm-Features: AQ5f1JpEOsD8iRgMtumx6FE6EQ5BI512EATymbGeCGWBPWIVebey7vHYRLNR3Pg
Message-ID: <CALtfCQavKpSmec4tGcHedzQ+Uw7JBs5n-+_1EB0b3CjOJPKa3w@mail.gmail.com>
To: buildroot@busybox.net
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740761975; x=1741366775; darn=busybox.net;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8J1E2xTIrtsRad3hUuTrkvuKxJhx5vgVIhrmGlPTqLY=;
 b=Iuk7yjOi5GTSFqofQ5Dgy5WDIPHIX0BT65Z6/flVRf8EL30e9F+shfiZUpo0TvgQlh
 DJGzevApy9a3fXr5gtFGYhrqZClPsNrUTN0tlsh1vHYp1/AIVyLlh0myVa73ZsuKIUs2
 F1C+kkzecJwF6xEcOMJun323pzvuzVgjDyHk6DPOv38btgZjObti4f0kWooMIt4ycIKn
 Ldyn83WycLIl95L3rNyNonJKmaLP+KWkzfFHzrGjY7976Z6d18k63IJxowGDM/EYeY4N
 ZzWMOEQRILLXYVIPM9Io35zQ3lWJDbZBQ4gOI9lrhFJ11ThxzPu/8toheD/Y2QErwNHS
 3hbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Iuk7yjOi
Subject: [Buildroot] Add dtoverlay and dtparam commands for raspberry pi
 testing
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgZXZlcnlvbmUsCgpJcyB0aGVyZSBhbnl3YXkgdG8gYWRkIHRoZSBkdG92ZXJsYXkgYW5kIGR0
cGFyYW0gY29tbWFuZHMgZm9yCnJhc3BiZXJyeSBwaSB0ZXN0aW5nPwoKQmVzdCByZWdhcmRzLArD
k3NjYXIgR8OzbWV6IEZ1ZW50ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
