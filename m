Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C55C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 12:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7749D60DDF;
	Tue, 18 Jan 2022 12:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q2m1IjRg_qcU; Tue, 18 Jan 2022 12:03:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBEBA60DA5;
	Tue, 18 Jan 2022 12:03:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47FCB1BF990
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 12:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42EEB60DA0
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 12:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BWOLQobP6sVv for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 12:03:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F2BB60DA5
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 12:03:01 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id p7so25203502iod.2
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 04:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fYbJs4uIyYNA/Pakhzzy0D49lkMcw7n7CV/M3bjwYDo=;
 b=j8qslh3detveu4PJ9PZ0tTer3KdnYfdh3LXzHCHImyMDjG3s35I7VW6y2xP5Hn2T5s
 ExSI6Gl/KVVU3LPucAVxJmhOFPcz6vU27fVYy992UA5bPFpK+4UeaU5QbYXWG7e/KMVF
 bI/FngIqS+SGpW94cldU5b5V+caaAR6Y7q18Y0zxnI/MoBEcXvnVPrBQyaR7yRNKgOsp
 B+60c1j1vrhIcPxnf+2uWpTPj0RHbj0maQUBgYpl2VJLBFNt+qJ0DwTyw1257oNMcygS
 Ypyd8pkRR4V31IRvRUCK1VCyRsWFqDfRe6G2kC7GCIxWM7eqyJXylUTpRRkDpp+RRbJf
 0K+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fYbJs4uIyYNA/Pakhzzy0D49lkMcw7n7CV/M3bjwYDo=;
 b=4/QZeFB7PR/dq3VuCWwQhR9RCytTsoylVgbggnk8mY+KcvyGm1cfaI6rgY1wEUAXz2
 n0y73uhQgLvWhTd++mscpjqjFUEgei4IA6Ka156d19+Hhyipi6jOKssM1G4PGYtcar+d
 BeKs6SQwDjsUc6+bRppeXyQmpzm4b7mwEEcAuIQF4FOlp9BGkAH94Eo03NgmEnWqGUBi
 pdK/DcWGOB0ht9eQWsnZsA/sfgJ7+Hhm+xohR9wGMS12rrLy0UMbPvAHDCWqUdj/oxSA
 q2eq+lGTjdji+VGTEAN+xTW2Z391wxnKknQb4HYMl4hsXyhCk5fwePlD9dMNj2tPj0yG
 B0kw==
X-Gm-Message-State: AOAM533UgOn1PALvqmQsboP7iX/6yqq2z3HGsnm4hVFPURvXQTREpa8V
 Ard4itcjq5KOkOyI3BhGBXXqn+t/tvws+2Oz768=
X-Google-Smtp-Source: ABdhPJyOvmscrnPtkLFPKLTXQBAkwLl73lPoDgqirB17f24mE2exrJ7HnrA7SLkbAhriyHunNft3Zon9uOAaUquMgKY=
X-Received: by 2002:a05:6602:804:: with SMTP id
 z4mr8872307iow.60.1642507380377; 
 Tue, 18 Jan 2022 04:03:00 -0800 (PST)
MIME-Version: 1.0
References: <20220115200306.14037-1-patrickdepinguin@gmail.com>
 <20220115200306.14037-7-patrickdepinguin@gmail.com>
 <CAAXf6LU949oVpaUvM=q8t8jZzTNXHWoLDu0gB3BdTEudK+6G7Q@mail.gmail.com>
 <13491b39-7995-1aa7-a2cb-5af43467bb95@gmail.com>
In-Reply-To: <13491b39-7995-1aa7-a2cb-5af43467bb95@gmail.com>
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 Jan 2022 13:02:49 +0100
Message-ID: <CAAXf6LViLChXOpjcprpPN61mYQ+Wxrf8nPtfj9k0ndCqkqkz8w@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCHv2 6/7] configs: add new qemu defconfig
 'x86_multilib'
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKRWwgbWFyLCAxOCBlbmUgMjAyMiBhIGxhcyAxMjo1MSwgUm9tYWluIE5hb3Vy
Cig8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4pIGVzY3JpYmnDszoKPgo+IEhlbGxvIFRob21hcywK
Pgo+IExlIDE4LzAxLzIwMjIgw6AgMTI6MTksIFRob21hcyBEZSBTY2hhbXBoZWxlaXJlIGEgw6lj
cml0IDoKPiA+IEhpLAo+ID4KPiA+IEVsIHPDoWIsIDE1IGVuZSAyMDIyIGEgbGFzIDIxOjAzLCBU
aG9tYXMgRGUgU2NoYW1waGVsZWlyZQo+ID4gKDxwYXRyaWNrZGVwaW5ndWluQGdtYWlsLmNvbT4p
IGVzY3JpYmnDszoKPiA+Pgo+ID4+IEZyb206IFRob21hcyBEZSBTY2hhbXBoZWxlaXJlIDx0aG9t
YXMuZGVfc2NoYW1waGVsZWlyZUBub2tpYS5jb20+Cj4gPj4KPiA+PiBBZGQgYSBuZXcgcWVtdSBk
ZWZjb25maWcgZm9yIGFuIHg4Nl82NCB0YXJnZXQgdGhhdCB3aWxsIHJ1biBhbiB4ODZfNjQga2Vy
bmVsCj4gPj4gYnV0IHVzZXJzcGFjZSBpbiAzMi1iaXQgKHg4NikgbW9kZSwgdXNpbmcgQlIyX0tF
Uk5FTF9BUkNIX09WRVJSSURFLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIERlIFNj
aGFtcGhlbGVpcmUgPHRob21hcy5kZV9zY2hhbXBoZWxlaXJlQG5va2lhLmNvbT4KPiA+PiAtLS0K
PiA+Pgo+ID4+IE5vdGUgdGhhdCB0aGUgZGVmY29uZmlnIHJlZmVycyB0byBhIHRvb2xjaGFpbiBh
dAo+ID4+IGF1dG9idWlsZC5idWlsZHJvb3Qub3JnLCBidXQgaXMgbm90IHlldCBwcmVzZW50IGF0
IHRoYXQgbG9jYXRpb24uCj4gPj4gSSB1cGxvYWRlZCB0aGUgdG9vbGNoYWluIHRlbXBvcmFyaWx5
IHRvOgo+ID4+IGh0dHA6Ly9wYXRyaWNrZGVwaW5ndWluLmNvbS9jdG5nLTY3MzdjZmFhOGNlNi14
ODZfbXVsdGlsaWItZ2xpYmMtZ2NjMTEudGFyLnh6Cj4gPj4gbWQ1c3VtOmIwODVjMGQ4ZjEzN2Mw
NzhmOGYwOWQxMTZkODM2NGY4Cj4gPj4gc2hhMjU2c3VtIDJhNTI0MWQ5Mjc0MjM5NTMyZTQ0ZDM3
YzY1NTA5OTMxZmJjMTIwZGI1OTkxNDEyZjk0NmViMzgxNzZkYjRkYzIKPiA+Pgo+ID4+Cj4gPgo+
ID4gUm9tYWluIE5hb3VyIG5vdGlmaWVkIG1lIHRoYXQgdGhpcyB0b29sY2hhaW4gZG9lcyBub3Qg
cnVuIG9uIHRoZSBHQ0MKPiA+IEZhcm0gKElsbGVnYWwgaW5zdHJ1Y3Rpb24pIHNvIEkgbWFkZSBh
IG5ldyB2ZXJzaW9uLCBjdXJyZW50bHkgdXBsb2FkZWQKPiA+IGF0Ogo+ID4gaHR0cDovL3BhdHJp
Y2tkZXBpbmd1aW4uY29tL2N0bmctNjczN2NmYWE4Y2U2LXg4Nl9tdWx0aWxpYi1nbGliYy1nY2Mx
MS0yLnRhci54ego+ID4gbWQ1c3VtOiAgM2NlZTY0ZjgyNjc1NDQ2YWQyNTVmNmMxNjU3ODZlYjUK
PiA+IHNoYTI1NnN1bTogNjcxNWJmYmMxOTU1ODhiNjQ4M2QzOWU5ZWM2ZDcwNjExY2FjM2I5OWJm
MmRkMzRmZWRiZWQwZDRlNmM3ZWRjMQo+Cj4gVGhpcyB0b29sY2hhaW4gZG9lc24ndCB3b3JrIGVp
dGhlci4KPgo+IERpZCB5b3UgdHJpZWQgd2l0aCBDVF9FWFRSQV9DRkxBR1NfRk9SX0JVSUxEPSIt
bWFyY2g9eDg2LTY0IiA/Cj4gV2l0aCBDVF9FWFRSQV9DWFhGTEFHU19GT1JfQlVJTEQgbWF5YmUg
b3IgYm90aC4KClNvIHlvdSBnZXQgdGhlIHNhbWUgZXJyb3Igb2YgJ0lsbGVnYWwgaW5zdHJ1Y3Rp
b24nID8KCkZvbGxvd2luZyBjb25maWcgd2FzIHVzZWQgKGJvdGggdGhlIGNvbmZpZyBhcyB0aGUg
YnVpbGQgbG9nIGFyZSBwYXJ0Cm9mIHRoZSBhcmNoaXZlKToKCkNUX0NPTkZJR19WRVJTSU9OPSIz
IgojIENUX1BSRUZJWF9ESVJfUk8gaXMgbm90IHNldApDVF9FWFRSQV9DRkxBR1NfRk9SX0JVSUxE
PSItbWFyY2g9eDg2LTY0IgpDVF9FWFRSQV9DWFhGTEFHU19GT1JfQlVJTEQ9Ii1tYXJjaD14ODYt
NjQiCkNUX0FSQ0hfWDg2PXkKQ1RfTVVMVElMSUI9eQpDVF9BUkNIXzY0PXkKQ1RfU1RBVElDX1RP
T0xDSEFJTj15CkNUX1RBUkdFVF9WRU5ET1I9Im11bHRpbGliIgpDVF9LRVJORUxfTElOVVg9eQpD
VF9HTElCQ19LRVJORUxfVkVSU0lPTl9OT05FPXkKIyBDVF9DUkVBVEVfTERTT19DT05GIGlzIG5v
dCBzZXQKQ1RfQ0NfR0NDX01VTFRJTElCX0xJU1Q9Im02NCxtMzIiCkNUX0NDX0dDQ19MTktfSEFT
SF9TVFlMRV9CT1RIPXkKQ1RfQ0NfTEFOR19DWFg9eQpDVF9ERUJVR19HREI9eQpDVF9aTElCX05F
RURFRD15CgoKCj4KPiBBbHNvLCBidWlsZGluZyB3aXRoIGEgRGViaWFuIGplc3NpZSBkb2NrZXIg
Y29udGFpbmVyIHdvdWxkIGFsbG93IHRvIHJ1biB0aGUKPiB0b29sY2hhaW4gd2l0aCBvbGQgR2xp
YmMuCgpUaGUgdG9vbGNoYWluIGlzIGJ1aWx0IHN0YXRpY2FsbHksIHNvIHRoZSBnbGliYyB2ZXJz
aW9uIG9uIHRoZSBob3N0CmRvZXMgbm90IG1hdHRlci4KUGVyaGFwcyBJIG1pc3VuZGVyc3RhbmQg
dGhlIHByb2JsZW0geW91IGFyZSByZWZlcnJpbmcgdG8/CgpUaGFua3MsClRob21hcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
