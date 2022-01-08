Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAECEC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 14:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BF8A81002;
	Sat,  8 Jan 2022 14:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NXiYlP7sqSuS; Sat,  8 Jan 2022 14:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8D9580CEA;
	Sat,  8 Jan 2022 14:36:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3D2A1BF2FA
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBD1F410D3
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXx9a7w_vCes for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 14:36:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9C17410C8
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 14:36:42 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id k21so26704888lfu.0
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 06:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DDJpANV8QPvQ+BndecHNTmcDCkwrzrLjQLSGvsTIr64=;
 b=LyiDin67dc95TO4M53+vhYESBvle7BwyZis3UaR74+H5I6J2uzfp68rYQYdpoGwaUF
 q/nNlDEqR6GRzR5kj1LlEFyaebfzlik8TBX/nPiPXOMwwHTI1wSWL8Xu5GUwNbzj04Te
 EaTvZQ5k5Ryac+etISBOB/oQzzgvZymKq6DNTpPdWpw7g6q2TTEBuxLtskNnmpEOkOYE
 W0jy2I2CXkEScIol6qemuuyidW38oevtdPvGpJWGTjEWUfm60H5MfzYNlUiuXsr7slG7
 379gbJwZ1lsLxkQXmE69UQaK40FCOr8RtA2ihEpjshOz31NhhtE43oWDn67bLJydE1OA
 JSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DDJpANV8QPvQ+BndecHNTmcDCkwrzrLjQLSGvsTIr64=;
 b=lu0bXQAmxDy46Ici+gf+n1uSl2vBDBhCrTA4FNkwW+UZ3cfWLRYjX3J8ZAmpT7n7i3
 mGzxWeLEBWwGfbGrhKwdswKKZ/EYtFePSyQDTxRIKbt/PqkKlfXZnAmVr/sMasAtw868
 17JEAp6TzjLTBwUQOaBUXesliyVmw/e9VO/+H2T9uPZGFHWIRktJQlpj2NzXj6r3eTGH
 BLmlQbQKqmR0fih3wNocfaDepehEJgvA6tOaMHt0nqMkDXc0etje2m05dGiTdaNCI/2+
 0xvrr/ay4vUFThTugCOy1I2dfg6maQUqJHCvBf2qKXIBO8NbWXkg5ckJ4G1hixWe8VVx
 xZww==
X-Gm-Message-State: AOAM532Kq4JxZTXonS0EQqQAnX0x+yk+eojh8xESmqJ41fJC7MiC/JT7
 r+QDKqoCNpRJf+umuyd/lR9RpGppKpP0lSeXENM=
X-Google-Smtp-Source: ABdhPJyKB7d1epCil0EWYWkQozNtF/iaN+5HtZzCJZIXH8cSEQKJU33Re/lbvu95eHStqbMXYkX5e0zoj1kKsmoUyO0=
X-Received: by 2002:a05:6512:282b:: with SMTP id
 cf43mr59308046lfb.331.1641652600791; 
 Sat, 08 Jan 2022 06:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20201126152832.1115350-1-nolange79@gmail.com>
 <49065289-1e01-f807-3e4f-d5e6303de5b5@smile.fr>
In-Reply-To: <49065289-1e01-f807-3e4f-d5e6303de5b5@smile.fr>
From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 8 Jan 2022 15:36:29 +0100
Message-ID: <CADYdroNrt_+mnJAumDbLZnVXBT8riLEo3PcwAkKaUEh4oBARPQ@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: Allow extra config
 options
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
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gU2EuLCA4LiBKYW4uIDIwMjIgdW0gMTI6MDQgVWhyIHNjaHJpZWIgUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAc21pbGUuZnI+Ogo+Cj4gSGVsbG8gTm9yYmVydCwKPgo+IExlIDI2LzExLzIw
MjAgw6AgMTY6MjgsIE5vcmJlcnQgTGFuZ2UgYSDDqWNyaXQgOgo+ID4gU3lzdGVtZCBoYXMgdmVy
eSBtYW55IG9wdGlvbnMsIGFkZGluZyBhIHdheSBmb3IgdGhlIHVzZXIKPiA+IHRvIHNldCBjdXN0
b20gb3B0aW9ucyBjYW4gaGVscCBjdXN0b21pemF0aW9ucwo+ID4gd2l0aG91dCBjaGFuZ2luZyBi
dWlsZHJvb3QgZmlsZXMuCj4KPiBUaGlzIGlzIGFsc28gdHJ1ZSBvZiBhbnkgcGFja2FnZSBpbiBC
dWlsZHJvb3QuIFVzZXJzIG1heSB3YW50IHRvIHByb3ZpZGUgYQo+IGN1c3RvbSBvcHRpb24gdGhh
dCBpcyBub3QgaGFuZGxlZCB5ZXQgYnkgQnVpbGRyb290Lgo+Cj4gV2hhdCBpZiB0aGUgb3B0aW9u
IHByb3ZpZGVkIGluIEJSMl9QQUNLQUdFX1NZU1RFTURfRVhUUkFfQ09ORklHIHJlcXVpcmVzIGEg
YnVpbGQKPiBkZXBlbmRlbmN5ID8KClJlc3BvbnNpYmlsaXR5IGZvciB0aGUgZ3V5IHVzaW5nIHRo
b3NlIGV4dHJhIG9wdGlvbnMuIFlvdSBoYXZlIHRob3NlCmV4dHJhIG9wdGlvbnMgZm9yIGEgZmV3
IHBhY2thZ2VzCmxpa2UgUVQ1LgpzeXN0ZW1kIGhhcyBhIHJlbWFya2FibGUgYnVuY2ggb2Ygb3B0
aW9ucywgYW5kIHVwc3RyZWFtaW5nIGNoYW5nZXMKdGFrZXMgeWVhcnMgKEkgZG9udCBoYXZlIGFu
eSBibGFja21haWwgb24gdGhlIG1haW50YWluZXJzLCB5b3VyCmV4cGVyaWVuY2UgbWF5IGRpZmZl
ciA7KSApCgoKPgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KCk5vcmJlcnQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
