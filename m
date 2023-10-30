Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5A4C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 12:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B03B7853D3;
	Mon, 30 Oct 2023 12:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B03B7853D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2kLQHzv0O_Xv; Mon, 30 Oct 2023 12:30:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07BAA853A7;
	Mon, 30 Oct 2023 12:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07BAA853A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C319D1BF5A5
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 12:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A537E4388C
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 12:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A537E4388C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2wBlwkGT-ijl for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 12:30:45 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BA1C43885
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 12:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BA1C43885
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507f1c29f25so6085360e87.1
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 05:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698669043; x=1699273843;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9PCJX7ppcF+ODv2sR4O0jGnATLLNYE+OAL9SECJMltA=;
 b=cAZQQWAWHLctsqlw+9cqOgM/EPP6m/P9hOMQPKliFXaIvfYBpqso22CCUhp3VjRxDU
 ZzGM0eMz3YT6gwqOiJAQdzgtIWa3BNCg3Hm7Xke37SMZ1nndNwdRAM/LoP5wmujNmabH
 jdzPGOOTK4rX8iX267KSV7FgBdH1BvMvqfhI0UK0CkvfGQpPQ1VBeY5LpaWAXcLipYEF
 HPY5QphwpPspshGTn5qbZACiJ++ZZ9qvjjw16EQweLJumDKxE8fnQLet+ahOLKQR5V2E
 iJ1zEwAr2e9Jd666HKF3Ah7LO+2KDjWRMPiDD5DpJB21oJ6zgJ6/KQvOMkIqMvVN1AMd
 qLyA==
X-Gm-Message-State: AOJu0Yzuvy1OWh/0Ym7h9hmyj1ZlBGJQvpIRnHFmu+cFivUNKfC7xY3L
 wkSo2NgBLnx+mR+c6TJS6qkC0RoA/XMxwvmy8iI=
X-Google-Smtp-Source: AGHT+IF7ulpfqUG1l4+7ki3bXyDA43ha5yiIymSiErneOKrNGfdFTQzl1XKQz9l0MOXHKdgLYnamFgK3hc82WWOMRQw=
X-Received: by 2002:ac2:5226:0:b0:507:9a00:c169 with SMTP id
 i6-20020ac25226000000b005079a00c169mr6978458lfl.5.1698669042643; Mon, 30 Oct
 2023 05:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231029234003.2606006-1-james.hilliard1@gmail.com>
 <20231029234003.2606006-3-james.hilliard1@gmail.com>
In-Reply-To: <20231029234003.2606006-3-james.hilliard1@gmail.com>
Date: Mon, 30 Oct 2023 13:30:30 +0100
Message-ID: <CAGm1_ksRVvDgQ0U3Ljeu2TrsgWmXHSaNnE2TW1iNRcF0iyHvDQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1698669043; x=1699273843; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9PCJX7ppcF+ODv2sR4O0jGnATLLNYE+OAL9SECJMltA=;
 b=QwacWu8s+sJHgR8b+pG1UEGLdSJtybFtEZP9ozrywp4m3rAwDCHCpZUWTuGDZAuIwd
 dhHRMwsh8QGk44HC/nr2Qzlp0OtE2FJrdOoJ6Mf7N8bP36Q2OL/IJBhVw0WIU5KiXTre
 fWjevuNL2pdw7Ozygjoy/HlTH2vGHb6se28ZU1xZAANmaNXl/i6gyIw12BsBlzFfpsoy
 f9oK61XMyC9hm1XaNHR+LWz4zjg3M+P4BV7KLG5hacgB2V9O3Qa4A07cYkwjC/68kTYX
 7PgCSjY1ouWVp2Gm3UlB66UKoiOtVIIFb83wVQoCY17YzuDVhEqdQ8yiOk82GWfb6gxh
 Pwuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QwacWu8s
Subject: Re: [Buildroot] [PATCH v4 3/4] package/python-msgpack: add host
 cython dependency
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Gustavo Heinz <gustavo@gsthnz.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBPY3QgMzAsIDIwMjMgYXQgMTI6NDDigK9BTSBKYW1lcyBIaWxsaWFyZAo8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXZSBuZWVkIGhvc3QtcHl0aG9uLWN5dGhv
biBmb3IgcHl0aG9uLW1zZ3BhY2sgdG8gYnVpbGQgY29ycmVjdGx5Lgo+IFRoaXMgaXMgYSBoYXJk
IGVycm9yIHdoZW4gdXNpbmcgYSBwZXA1MTcgZnJvbnRlbmQuCj4KPiBGaXhlczoKPiAqIEdldHRp
bmcgYnVpbGQgZGVwZW5kZW5jaWVzIGZvciB3aGVlbC4uLgo+IHJ1bm5pbmcgZWdnX2luZm8KPiB3
cml0aW5nIG1zZ3BhY2suZWdnLWluZm8vUEtHLUlORk8KPiB3cml0aW5nIGRlcGVuZGVuY3lfbGlu
a3MgdG8gbXNncGFjay5lZ2ctaW5mby9kZXBlbmRlbmN5X2xpbmtzLnR4dAo+IHdyaXRpbmcgdG9w
LWxldmVsIG5hbWVzIHRvIG1zZ3BhY2suZWdnLWluZm8vdG9wX2xldmVsLnR4dAo+IHJlYWRpbmcg
bWFuaWZlc3QgZmlsZSAnbXNncGFjay5lZ2ctaW5mby9TT1VSQ0VTLnR4dCcKPiByZWFkaW5nIG1h
bmlmZXN0IHRlbXBsYXRlICdNQU5JRkVTVC5pbicKPiB3YXJuaW5nOiBubyBmaWxlcyBmb3VuZCBt
YXRjaGluZyAnKi5jJyB1bmRlciBkaXJlY3RvcnkgJ21zZ3BhY2snCj4gYWRkaW5nIGxpY2Vuc2Ug
ZmlsZSAnQ09QWUlORycKPiB3cml0aW5nIG1hbmlmZXN0IGZpbGUgJ21zZ3BhY2suZWdnLWluZm8v
U09VUkNFUy50eHQnCj4KPiBFUlJPUiBNaXNzaW5nIGRlcGVuZGVuY2llczoKPiAgICAgICAgIEN5
dGhvbn49MC4yOS4zMAo+Cj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xp
c3RzQGdvb2dsZW1haWwuY29tPgoKPiAtLS0KPiAgcGFja2FnZS9weXRob24tbXNncGFjay9weXRo
b24tbXNncGFjay5tayB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1tc2dwYWNrL3B5dGhvbi1tc2dwYWNrLm1rIGIv
cGFja2FnZS9weXRob24tbXNncGFjay9weXRob24tbXNncGFjay5tawo+IGluZGV4IDc4NWZlYzlm
MDAuLmMwYjc2ZTU1YWIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tbXNncGFjay9weXRo
b24tbXNncGFjay5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLW1zZ3BhY2svcHl0aG9uLW1zZ3Bh
Y2subWsKPiBAQCAtMTAsNSArMTAsNiBAQCBQWVRIT05fTVNHUEFDS19TSVRFID0gaHR0cHM6Ly9m
aWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2RjL2ExL2ViYTExYTBkNGI3Ngo+ICBQWVRI
T05fTVNHUEFDS19MSUNFTlNFID0gQXBhY2hlLTIuMAo+ICBQWVRIT05fTVNHUEFDS19MSUNFTlNF
X0ZJTEVTID0gQ09QWUlORwo+ICBQWVRIT05fTVNHUEFDS19TRVRVUF9UWVBFID0gc2V0dXB0b29s
cwo+ICtQWVRIT05fTVNHUEFDS19ERVBFTkRFTkNJRVMgPSBob3N0LXB5dGhvbi1jeXRob24KPgo+
ICAkKGV2YWwgJChweXRob24tcGFja2FnZSkpCj4gLS0KPiAyLjM0LjEKPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
