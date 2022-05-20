Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21545C433EF
	for <buildroot@archiver.kernel.org>; Fri, 20 May 2022 15:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78F87613AD;
	Fri, 20 May 2022 15:26:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XY0jkBo2q-RR; Fri, 20 May 2022 15:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F250613A8;
	Fri, 20 May 2022 15:26:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB8251BF297
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 15:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CACE184733
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 15:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5EG8u9uzXq6T for <buildroot@lists.busybox.net>;
 Fri, 20 May 2022 15:26:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 515C384730
 for <buildroot@busybox.net>; Fri, 20 May 2022 15:26:16 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id l14so8351463pjk.2
 for <buildroot@busybox.net>; Fri, 20 May 2022 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=P4FXwjpb74+hN9dgwAB+qql/7sHkMbazJ4z8serhheU=;
 b=MNVgKxd895V3saFEqB34dCF2Lzk2qcNGkzHHYltaapGjenq/+x/U/8AQ//K/2DlrNl
 gIlg3iLxwRv44olgZCsFVOGM2zSbZ2A5KG+hMVjUHWrqbCKnleISV8QJxTVA3WBfr0Lh
 8jbOA4p2BYOxy5Hrx5UPtnUoAVBQXMWLo8mhYkiot9mO0/35aqKHkwiCukxJZh4z+lk5
 YY04KX0doeMu3wdbe9nNWqQEx6eCWCIl6qoVCY14q9kZNsBoMSz4Jx04NImJNUOcloiE
 JYXrwOSi7IP/x5ukcqMkhc2WNLjCDzlJJ8wMyD+OHCK0wg4y+Xlk2FA3q4rz8hzO/I+4
 JGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=P4FXwjpb74+hN9dgwAB+qql/7sHkMbazJ4z8serhheU=;
 b=H1mQqY/wzb9fWOFP7Yr0sJJe2sJuQrLOz/VUaLed3tv28LxmZ01RMYOCwdMpJfY+f6
 o4LsqmFls/vLJOZKtgtlWb/1Dmsg82TFyhVKQnqYKP9XSDvu6MUL9meNOuIMLt0ZhhOb
 bSSQmivL/pHVTeASgqLzWutxkUdBQN4GPQjlzh0ALrzi0upeVp5jahau9mnHSRCTfGYV
 CzUujn3gNwyr9Mq/Ho5Ah6W5GOt87XaQhXVDTn/i7iNh/fsDPNESoYT+arh0zUO7czGE
 uFELlH9T3Q3MEAtntyh0XSI/6aOD2huHRbA2YOu5TiEw+H+LyzFnj0l5jDqh5kP/3UKk
 ouXQ==
X-Gm-Message-State: AOAM532pKOx/9yDY+yJvKcbIv29FUNQ+PXVddGXAaNMLKogzgjmvYH5m
 VBvBn2b1V3CZHSgebkQbnYvJIkGuKv72fbr3GgDU9tiB4tA=
X-Google-Smtp-Source: ABdhPJzEiurChv39OmSJy/SuPPXqvaGHY85Ilgaot6UjK5Y4bk+hN2Q/LlvGKxuVk5uF4/wFxOR6EySlqffCCzbmnyg=
X-Received: by 2002:a17:903:3289:b0:161:4669:6914 with SMTP id
 jh9-20020a170903328900b0016146696914mr9833265plb.105.1653060375392; Fri, 20
 May 2022 08:26:15 -0700 (PDT)
MIME-Version: 1.0
From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Fri, 20 May 2022 17:25:40 +0200
Message-ID: <CALtfCQaLxNdrKhSjMfShjb-nQWUnqa3DSOwbyZm1+Q0fU1UUqQ@mail.gmail.com>
To: buildroot@busybox.net
Subject: [Buildroot] How to select python-cryptograhy package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgZXZlcnlvbmUsCgpJIGFtIHRyeWluZyB0byBidWlsZCBhbiBpbWFnZSBmb3IgYSBSYXNwYmVy
cnkgUGkgM0Igd2l0aCBCdWlsZHJvb3QKKFZ2cnNpb24gMjAyMi4wMi4xLiBJIGhhdmUgc2VsZWN0
ZWQgdGhlIHBhY2thZ2UgcHl0aG9uMywgYnV0IEkgbmVlZCB0bwp1c2UgdGhlIHBhY2thZ2UgcHl0
aG9uLWNyeXB0b2dyYWh5IChCUjJfUEFDS0FHRV9QWVRIT05fQ1JZUFRPR1JBUEhZKSwKYnV0IGl0
IHNlZW1lZCB0byBiZSB0aGF0IGluIHRoaXMgcmVsZWFzZSAyMDIyLjAyLjEsIGl0IGhhcyB0byBi
ZQpzZWxlY3RlZCB0aGVzZSB0d28gcGFja2FnZXM6CgpEZXBlbmRzIG9uOiBCUjJfUEFDS0FHRV9Q
WVRIT04zIFs9eV0gJiYKQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JU
UyBbPW5dCgpCdXQgSSBhbSBub3QgYWJsZSBob3cgdG8gc2VsZWN0IHRoaXMgcGFja2FnZToKQlIy
X1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUy4KCkNhbiBhbnlvbmUgaGVs
cCBtZSBvdXQ/CgpCZXN0IHJlZ2FyZHMuCsOTc2NhciBHw7NtZXogRnVlbnRlCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
