Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F70CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 13:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2E5F606D6;
	Mon,  2 Sep 2024 13:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocSlDwphlZM7; Mon,  2 Sep 2024 13:24:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1343260723
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1343260723;
	Mon,  2 Sep 2024 13:24:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1AED1BF414
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 13:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE05140347
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 13:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeV4XGvJ6nZU for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 13:24:33 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB2E3402AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB2E3402AA
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB2E3402AA
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 13:24:32 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-7143ae1b560so2210214b3a.1
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 06:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725283471; x=1725888271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nvtdv/b+G7UUiCBCgLtj3QhIlH8P/2ZHnUuzP2Ku77A=;
 b=TrAMo3bHw2sGJs9/Ak+PsJiDu+NHj+vTS+y1xnrWkxRU71+XFohx4KkShQeTKh6sAQ
 a+g+GxKjq516tqdmkcORylayWjDqQ9XEFSVkUkgH6PtoTLA2pznGpcp5n9jjFVFvWLaJ
 qVN2gEXDBwE86LH4UhPtVl4F95Wqo1X9Ny4HYj/XBDTo9oWsGTKmbVG5CYv5OTwDwCfH
 8s1ivEaImzQ8IDq9ewRy3nw4eMRKCnSqOtbjvIEdCu44usr4CbADDNRU2J8LQaYiLDxN
 xsLo2SoWJiFUeKOAqhIEd4+Gx1fUUHWB5VvQJ/KOYtqpU2+M/7pY/PlTtVBf36VephH+
 H2vA==
X-Gm-Message-State: AOJu0YxsJRNCDct478veyLKvYMQtrPZ2oqrqnPTuQEzSqPdJdzElzYXQ
 fYErh+JZUBJBP2WFiaubBhVqhQHO+ZGwcMywgXEL3taKlxzsz9e9LUsa/AnnFQyTDeihxoSxJew
 ehyQ=
X-Google-Smtp-Source: AGHT+IHmfb7M39mCaIGdwoM6N+jZmT6bFZ/Bfuk2Lylp1DHqlwo70N4w4m7teySJNtxs33zs8BXtuw==
X-Received: by 2002:a05:6a21:118a:b0:1cd:f065:4ef0 with SMTP id
 adf61e73a8af0-1cece5d139cmr6749986637.39.1725283471561; 
 Mon, 02 Sep 2024 06:24:31 -0700 (PDT)
Received: from niltesque.newtesc.com.br ([189.113.44.122])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20536f8cfaasm46127775ad.69.2024.09.02.06.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 06:24:31 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 10:24:03 -0300
Message-ID: <20240902132403.177333-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1725283471; x=1725888271;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nvtdv/b+G7UUiCBCgLtj3QhIlH8P/2ZHnUuzP2Ku77A=;
 b=OTrOsl/8AYQdoTxgwBKoifZ//hlj9Dl0vvz9DhYKYwr2GyUQWqnkNvqIzuz6iHremt
 uY1kXdYtUSZu7Eyrg+DV5iGJJmgSn2MwCu3ePWUZmccltGcMRixKut4B+khgNNpxaox7
 pk8zTDT1u2zEtdpU7nDwhk12slsBT2vnL4v9z6dGJoDP7ElEKlvX7SleAAgV7UMkqZ60
 LXU/tnNYIxYyPz7Oua7ALCH2GgcrIU4sYDTHJEAVe4p3wbXUFW/QXqu9u+Jhyq3HthOu
 M3Rt2piPFGgJv0SBqbwsfsxzn/wFn+GDVsIrSipG2vfhQflpUmHnLhpbx1L1hUvkm2/W
 U34g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=OTrOsl/8
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: fix build issue
 with setuptools > 69.3
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGF0Y2hpbmcgdGhlIHZlcnNpb24gY29uc3RyYWludCBpcyBjb25zaWRlcmVkIHNhZmUgYnkgaHR0
cHM6Ly9naXRodWIuY29tL3NxbGFsY2hlbXkvc3FsYWxjaGVteS9kaXNjdXNzaW9ucy8xMTgxOAoK
Rml4ZXM6CiAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvYzUzMWI2ZTYz
YzUxMjExMzhlOGU4YTFjNWQxNTAxZDlkN2UxMzkxZS8KClNpZ25lZC1vZmYtYnk6IEZsw6F2aW8g
VGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgotLS0KIC4uLnRvb2xzLWJl
bG93LTY5LjMtYW5kLXByZXBhcmUtZm9yLWJ1aS5wYXRjaCB8IDM1ICsrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9weXRob24tc3FsYWxjaGVteS8yLjAuMzIvMDAwMS1SZXZlcnQtcGluLXNldHVwdG9v
bHMtYmVsb3ctNjkuMy1hbmQtcHJlcGFyZS1mb3ItYnVpLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9weXRob24tc3FsYWxjaGVteS8yLjAuMzIvMDAwMS1SZXZlcnQtcGluLXNldHVwdG9vbHMt
YmVsb3ctNjkuMy1hbmQtcHJlcGFyZS1mb3ItYnVpLnBhdGNoIGIvcGFja2FnZS9weXRob24tc3Fs
YWxjaGVteS8yLjAuMzIvMDAwMS1SZXZlcnQtcGluLXNldHVwdG9vbHMtYmVsb3ctNjkuMy1hbmQt
cHJlcGFyZS1mb3ItYnVpLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLjcwNTMzNDIxYzYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNo
ZW15LzIuMC4zMi8wMDAxLVJldmVydC1waW4tc2V0dXB0b29scy1iZWxvdy02OS4zLWFuZC1wcmVw
YXJlLWZvci1idWkucGF0Y2gKQEAgLTAsMCArMSwzNSBAQAorRnJvbSA5ZjMyMWM5ZTczZjRjMTA4
YmFhMWVmNjM1Mjg5NjUwNzljYWIyZjZkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTog
PT9VVEYtOD9xP0ZsPUMzPUExdmlvPTIwVGFwYWo9QzM9QjNzPz0gPGZsYXZpby50YXBham9zQG5l
d3Rlc2MuY29tLmJyPgorRGF0ZTogTW9uLCAyIFNlcCAyMDI0IDEwOjEyOjU2IC0wMzAwCitTdWJq
ZWN0OiBbUEFUQ0ggMS8xXSBSZXZlcnQgInBpbiBzZXR1cHRvb2xzIGJlbG93IDY5LjMgYW5kIHBy
ZXBhcmUgZm9yICJidWlsZCIKKyBmb3IgcmVsZWFzZXMiCisKK1RoaXMgcmV2ZXJ0cyBjb21taXQg
OTU1MzYwNGZjYzgwZmExNzU4MzI0MzNmNGVmZjY1N2FjOTVhZTA1OC4KKy0tLQorIHB5cHJvamVj
dC50b21sIHwgMTIgKysrKystLS0tLS0tCisgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgNyBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL3B5cHJvamVjdC50b21sIGIvcHlwcm9q
ZWN0LnRvbWwKK2luZGV4IDBmNTM1OTRkZi4uNzgwYzliZjY4IDEwMDY0NAorLS0tIGEvcHlwcm9q
ZWN0LnRvbWwKKysrKyBiL3B5cHJvamVjdC50b21sCitAQCAtMSwxMSArMSw5IEBACisgW2J1aWxk
LXN5c3RlbV0KKy1idWlsZC1iYWNrZW5kID0gInNldHVwdG9vbHMuYnVpbGRfbWV0YSIKKy1yZXF1
aXJlcyA9IFsKKy0gICAgIyBhdm9pZCBtb3ZpbmcgdG8gaHR0cHM6Ly9naXRodWIuY29tL3B5cGEv
c2V0dXB0b29scy9pc3N1ZXMvMzU5MworLSAgICAjIHVudGlsIHdlJ3JlIHJlYWR5CistICAgICJz
ZXR1cHRvb2xzPj02MS4wLDw2OS4zIiwKKy0gICAgImN5dGhvbj49MC4yOS4yNDsgcGxhdGZvcm1f
cHl0aG9uX2ltcGxlbWVudGF0aW9uID09ICdDUHl0aG9uJyIsICMgU2tpcCBjeXRob24gd2hlbiB1
c2luZyBweXB5CistXQorKyAgICBidWlsZC1iYWNrZW5kID0gInNldHVwdG9vbHMuYnVpbGRfbWV0
YSIKKysgICAgcmVxdWlyZXMgPSBbCisrICAgICAgICAic2V0dXB0b29scz49NDciLAorKyAgICAg
ICAgImN5dGhvbj49MC4yOS4yNDsgcGxhdGZvcm1fcHl0aG9uX2ltcGxlbWVudGF0aW9uID09ICdD
UHl0aG9uJyIsICMgU2tpcCBjeXRob24gd2hlbiB1c2luZyBweXB5CisrICAgIF0KKyAKKyBbdG9v
bC5ibGFja10KKyBsaW5lLWxlbmd0aCA9IDc5CistLSAKKzIuNDYuMAorCi0tIAoyLjQ2LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
