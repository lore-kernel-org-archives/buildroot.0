Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150F9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 16:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FDDA400C1;
	Sun, 20 Feb 2022 16:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5wuq5ikBT6P; Sun, 20 Feb 2022 16:25:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1019D4016A;
	Sun, 20 Feb 2022 16:25:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D10681BF41F
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 16:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEED7403A7
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 16:25:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XNqv6-AINbrR for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 16:25:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AD9B40360
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 16:25:08 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o24so23065632wro.3
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 08:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=DLrLrNbyjYfzptQI+hk1q37HN2z+dVguzeZRO0YCj/0=;
 b=Uc38olbZsPRyFl/D6r7XADegz+TKsov14ekmZyk1jdj5nO8f8maIEGxZs8Sr6SaZvg
 gJRfLUO/KOYPguciXJl4tkyrsxPM3VyXqfD17ERrUxgcJLOv2kU32mk8hEZWABwxPymU
 6a4h3RkWArNyKCqLQkIuZsmuYsNmKDEfTf8mJnzYRmNTYQkKQcAjTzKgc9JdNotTVN4E
 mnj//z7mnQRkwh3ex0/jMZD8Si2/PEf7Qc2ivrGc/jwDcuz2LL5UHrhzgLt5LbiBIzxA
 o49HCwjACUgvDZzI1eb5cMbYjUZhCz1MPL2tOVBycW83240RS1Zea3Pk/sIodwrCYH5Y
 zEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DLrLrNbyjYfzptQI+hk1q37HN2z+dVguzeZRO0YCj/0=;
 b=5gTFhb4ktHpq742ab7DuSeSg1tPJ3PzZdu3nsfD7EvizEdqo2Jtba07/bybi7ZJkvv
 ITGrKdanyAJN9jEf6CeSjgU0vffyuliXHZr/L2mZFiNmgAHKCmdVvXjRoeAEvW4QD3rP
 6YZv/40fDnTRkpGp9LSxtMA3EArD7rS6sEwwBD2RXlUnGaCvmzq6NN5vMzNUG2TtvDr3
 SmtI/uD9ET6MWYAjmSZhKhun+R4UIcRUBIy43eviy+mW/q/vSoSiRsOCft42L5nlK0IQ
 woIMfASjYBmGUzFqbLJnzsv3zAK3WYn9nXnUXY1s5+zG8Aa8zvoSeZiN6lzew2BJ8VCC
 m/nA==
X-Gm-Message-State: AOAM532hrZnauQycDWg5bfGxLd5uKN3nAiVMqwfcac8zNgVFohu7Ds5c
 5YdIjMO/0OdX8B7RtrsX6/I=
X-Google-Smtp-Source: ABdhPJxGT6kthrhuzFGBOBrwWsJUzWhrY13aSetFr8GtzC+0A5Xk6VHCahvSIvNtMHz22/qxzDgEnA==
X-Received: by 2002:adf:e4c2:0:b0:1e3:3e5d:bd65 with SMTP id
 v2-20020adfe4c2000000b001e33e5dbd65mr12999706wrm.422.1645374306354; 
 Sun, 20 Feb 2022 08:25:06 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 7sm32588969wrb.43.2022.02.20.08.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 08:25:05 -0800 (PST)
Message-ID: <842a7d9b-e991-149e-c6a6-9a36b29e9ff3@gmail.com>
Date: Sun, 20 Feb 2022 17:25:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20220220170222.06d88b45@windsurf>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220220170222.06d88b45@windsurf>
Subject: Re: [Buildroot] Analysis of runtime test failures
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

SGVsbG8gVGhvbWFzLAoKTGUgMjAvMDIvMjAyMiDDoCAxNzowMiwgVGhvbWFzIFBldGF6em9uaSB2
aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gSGVsbG8sCj4gCj4gU2l4IG9mIG91ciBydW50aW1l
IHRlc3RzIGFyZSBmYWlsaW5nLCBzbyBJIHdlbnQgYWhlYWQgYW5kIHF1aWNrbHkgbG9vawo+IGF0
IHRoZSBlcnJvciBtZXNzYWdlcy4gSGVyZSBpcyBteSBzdW1tYXJ5Ogo+IAo+ID09PSB0ZXN0cy5w
YWNrYWdlLnRlc3RfaXB5dGhvbi5UZXN0SVB5dGhvblB5MyA9PT0KPiAKPiBodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzIwODg2ODQwOTEKPiAKPiBFcnJv
ciBpczoKPiAKPiAjIGlweXRob24gLWMgJ2ltcG9ydCBtYXRoOyBtYXRoLmZsb29yKDEyLjMpJwo+
IC1zaDogaXB5dGhvbjogbm90IGZvdW5kCgppcHl0aG9uIHVzZSBhIHdyb25nIHNoZWJhbmcgb24g
dGhlIHRhcmdldDoKCiMgaGVhZCAtbiAxIC91c3IvYmluL2lweXRob24KIyEvaG9tZS9rdWJ1L2J1
aWxkcm9vdC90ZXN0c3VpdGUtbWFzdGVyL1Rlc3RJUHl0aG9uUHkzL2hvc3QvYmluL3B5dGhvbgoK
VGhlIGlzc3VlIGNvbWUgZnJvbSBweXRob24zLXNldHVwdG9vbHMgNjAuMC4wIHRoYXQgY2hhbmdl
ZApTRVRVUFRPT0xTX1VTRV9ESVNUVVRJTFMgWzFdLiBUaGlzIGlzIGFjdHVhbGx5IGEgImJyZWFr
aW5nIiBjaGFuZ2UgWzJdLgoKV2UgaGF2ZSB0byBvdmVycmlkZSBTRVRVUFRPT0xTX1VTRV9ESVNU
VVRJTFMgdG8gdGhlIHByZXZpb3VzIHZhbHVlICJzdGRsaWIiIHRvCmZpeGVzIHRoZSBpc3N1ZS4K
ClsxXQpodHRwczovL2dpdGh1Yi5jb20vcHlwYS9zZXR1cHRvb2xzL2NvbW1pdC9iNmZjYmJkMDBj
YjZkNTYwN2M5MjcyZGVjNDUyYTUwNDU3YmRiMjkyClsyXSBodHRwczovL2dpdGh1Yi5jb20vcHlw
YS9zZXR1cHRvb2xzL2Jsb2IvdjYwLjAuMC9DSEFOR0VTLnJzdCNicmVha2luZy1jaGFuZ2VzCgo+
IAo+ID09PSB0ZXN0cy5wYWNrYWdlLnRlc3RfcHl0aG9uX3B5eWFtbC5UZXN0UHl0aG9uUHkzUHl5
YW1sID09PQo+IAo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2pvYnMvMjA4ODY4NDA5MQo+IAo+IEVycm9yIGlzOgo+IAo+ICMgcHl0aG9uIHNhbXBsZV9weXRo
b25fcHl5YW1sX2RlYy5weQo+IFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKPiAg
IEZpbGUgIi9yb290L3NhbXBsZV9weXRob25fcHl5YW1sX2RlYy5weSIsIGxpbmUgNSwgaW4gPG1v
ZHVsZT4KPiAgICAgZGF0YSA9IHlhbWwubG9hZChzZXJpYWxpemVkKQo+IFR5cGVFcnJvcjogbG9h
ZCgpIG1pc3NpbmcgMSByZXF1aXJlZCBwb3NpdGlvbmFsIGFyZ3VtZW50OiAnTG9hZGVyJwoKIlB5
WUFNTCA2LjAgbG9hZCgpIGZ1bmN0aW9uIHJlcXVpcmVzIExvYWRlciBhcmd1bWVudCIKaHR0cHM6
Ly9naXRodWIuY29tL3lhbWwvcHl5YW1sL2lzc3Vlcy81NzYKCiJXYXJuaW5nOiBJdCBpcyBub3Qg
c2FmZSB0byBjYWxsIHlhbWwubG9hZCB3aXRoIGFueSBkYXRhIHJlY2VpdmVkIGZyb20KYW4gdW50
cnVzdGVkIHNvdXJjZSEgeWFtbC5sb2FkIGlzIGFzIHBvd2VyZnVsIGFzIHBpY2tsZS5sb2FkIGFu
ZCBzbyBtYXkKY2FsbCBhbnkgUHl0aG9uIGZ1bmN0aW9uLiBDaGVjayB0aGUgeWFtbC5zYWZlX2xv
YWQgZnVuY3Rpb24gdGhvdWdoLiIKCmh0dHBzOi8vcHl5YW1sLm9yZy93aWtpL1B5WUFNTERvY3Vt
ZW50YXRpb24KCldlIGNhbiBzaW1wbHkgZml4ZXMgdGhlIGlzc3VlIGJ5IHVzaW5nIHlhbWwuc2Fm
ZV9sb2FkKHNlcmlhbGl6ZWQpCgo+IAo+ID09PSB0ZXN0cy5wYWNrYWdlLnRlc3RfbHVhc3lzbG9n
LlRlc3RMdWFMdWFzeXNsb2cgPT09Cj4gCj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy8yMDg4NjgzOTAzCj4gCj4gRXJyb3IgaXM6Cj4gCj4+Pj4gbHVh
c3lzbG9nIDIuMi4wIEJ1aWxkaW5nCj4gUEFUSD0iL2J1aWxkcy9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC90ZXN0LW91dHB1dC9UZXN0THVhTHVhc3lzbG9nL2hvc3QvYmluOi9idWlsZHMvYnVpbGRy
b290Lm9yZy9idWlsZHJvb3QvdGVzdC1vdXRwdXQvVGVzdEx1YUx1YXN5c2xvZy9ob3N0L3NiaW46
L3Vzci9sb2NhbC9zYmluOi91c3IvbG9jYWwvYmluOi91c3Ivc2JpbjovdXNyL2Jpbjovc2Jpbjov
YmluIiAgL3Vzci9iaW4vbWFrZSAtajMzICAtQyAvYnVpbGRzL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290L3Rlc3Qtb3V0cHV0L1Rlc3RMdWFMdWFzeXNsb2cvYnVpbGQvbHVhc3lzbG9nLTIuMi4wLwo+
IC91c3IvYmluL21ha2UgIGFsbC1hbQo+ICAgQ0MgICAgICAgbHN5c2xvZy5sbwo+ICAgQ0MgICAg
ICAgY29tcGF0LTUuMy5sbwo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBsc3lzbG9nLmM6MTE6Cj4g
Y29tcGF0LTUuMy5oOjQwMjo0OiBlcnJvcjogI2Vycm9yICJ1bnN1cHBvcnRlZCBMdWEgdmVyc2lv
biAoaS5lLiBub3QgTHVhIDUuMSwgNS4yLCBvciA1LjMpIgo+ICAjICBlcnJvciAidW5zdXBwb3J0
ZWQgTHVhIHZlcnNpb24gKGkuZS4gbm90IEx1YSA1LjEsIDUuMiwgb3IgNS4zKSIKPiAgICAgXn5+
fn4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gY29tcGF0LTUuMy5jOjc6Cj4gY29tcGF0LTUuMy5o
OjQwMjo0OiBlcnJvcjogI2Vycm9yICJ1bnN1cHBvcnRlZCBMdWEgdmVyc2lvbiAoaS5lLiBub3Qg
THVhIDUuMSwgNS4yLCBvciA1LjMpIgo+ICAjICBlcnJvciAidW5zdXBwb3J0ZWQgTHVhIHZlcnNp
b24gKGkuZS4gbm90IEx1YSA1LjEsIDUuMiwgb3IgNS4zKSIKPiAgICAgXn5+fn4KPiBtYWtlWzNd
OiAqKiogW01ha2VmaWxlOjcxMDogbHN5c2xvZy5sb10gRXJyb3IgMQoKRml4ZWQgYnk6CgpodHRw
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjAyMTcw
OTQwNDguMjc1NjI5My0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tLwoKPiAKPiA9PT0gdGVz
dHMucGFja2FnZS50ZXN0X2x4Yy5UZXN0THhjID09PQo+IAo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMjA4ODY4MzkwOAo+IAo+IEVycm9yIGlzOgo+
IAo+ICMgbHhjLXN0YXJ0IC1sIHRyYWNlIC1uIGx4Y19pcGVyZjMgLW8gL3RtcC9seGMubG9nIC1M
IC90bXAvbHhjLmNvbnNvbGUubG9nCj4gbHhjLXN0YXJ0OiBseGNfaXBlcmYzOiBseGNjb250YWlu
ZXIuYzogd2FpdF9vbl9kYWVtb25pemVkX3N0YXJ0OiA4NjggUmVjZWl2ZWQgY29udGFpbmVyIHN0
YXRlICJBQk9SVElORyIgaW5zdGVhZCBvZiAiUlVOTklORyIKPiBseGMtc3RhcnQ6IGx4Y19pcGVy
ZjM6IHRvb2xzL2x4Y19zdGFydC5jOiBtYWluOiAzMDYgVGhlIGNvbnRhaW5lciBmYWlsZWQgdG8g
c3RhcnQKPiBseGMtc3RhcnQ6IGx4Y19pcGVyZjM6IHRvb2xzL2x4Y19zdGFydC5jOiBtYWluOiAz
MDkgVG8gZ2V0IG1vcmUgZGV0YWlscywgcnVuIHRoZSBjb250YWluZXIgaW4gZm9yZWdyb3VuZCBt
b2RlCj4gbHhjLXN0YXJ0OiBseGNfaXBlcmYzOiB0b29scy9seGNfc3RhcnQuYzogbWFpbjogMzEy
IEFkZGl0aW9uYWwgaW5mb3JtYXRpb24gY2FuIGJlIG9idGFpbmVkIGJ5IHNldHRpbmcgdGhlIC0t
bG9nZmlsZSBhbmQgLS1sb2dwcmlvcml0eSBvcHRpb25zCj4gIyBlY2hvICQ/CgpTZWU6Cmh0dHA6
Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjItSmFudWFyeS82MzUy
NTEuaHRtbAoKV2UgY2FuIHVwZ3JhZGUgdGhlIGtlcm5lbCB1c2VkIGJ5IHRoZSB0ZXN0IGJ1dCB1
cHN0cmVhbSBhZGRlZCBhIHJlZ3Jlc3Npb24gd2hpbGUKYWRkaW5nIGZlYXR1cmVzIGluIHRoZSBz
dGFibGUgYnJhbmNoIDQuMC54CgpodHRwczovL2dpdGh1Yi5jb20vbHhjL2x4Yy9jb21taXQvYmU2
MDZlMTZmZDBmYTk2NzIxOWQ4OTA3NDVhNDI1NjI1ZWFmZTI1MQoKPiAKPiA9PT0gdGVzdHMucGFj
a2FnZS50ZXN0X3J1c3QuVGVzdFJ1c3RCaW4gPT09Cj4gCj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vcGlwZWxpbmVzLzQ3MDE4Mjc1OC9mYWlsdXJlcwo+IAo+
IEJ1aWxkIGlzc3VlIHdoaWxlIGJ1aWxkaW5nIHRoZSBleGFtcGxlIFJ1c3QgYXBwbGljYXRpb246
Cj4gCj4gICAgICAgICAgIC91c3IvYmluL2xkOiAvdG1wL3RtcGRnZ3Bsa3RvLWJyMi10ZXN0aW5n
LXJ1c3QvaGVsbG8td29ybGQvdGFyZ2V0L2FybXY3LXVua25vd24tbGludXgtZ251ZWFiaWhmL2Rl
YnVnL2RlcHMvaGVsbG9fd29ybGQtZTAzZjkzZmVmMTA1NjdjMy4xYWpxN2F1ZDJ6OWZ4aGU1LnJj
Z3UubzogZXJyb3IgYWRkaW5nIHN5bWJvbHM6IGZpbGUgaW4gd3JvbmcgZm9ybWF0Cj4gICAgICAg
ICAgIGNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1cwo+IAo+IENvdWxk
Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8y
MDIyMDIxNzIzMDYzOC45ODc0OC0xLW1vcml0ekBoNnQuZXUvCj4gYmUgcmVsYXRlZCA/CgpJJ20g
bm90IHN1cmUsIGJ1dCB0aGUgdGVzdCBkb2Vzbid0IHVzZSB0aGUgY2FyZ28gcGFja2FnZSBpbmZy
YXN0cnVjdHVyZS4KSSBzdWdnZXN0IHRvIHJld29yayB0aGUgdGVzdCB0byB1c2UgYmF0IG9yIHJp
cGdyZXAgcGFja2FnZS4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiA9PT0gdGVzdHMucGFj
a2FnZS50ZXN0X3J1c3QuVGVzdFJ1c3QgPT09Cj4gCj4gU2FtZSBlcnJvciBhcyBhYm92ZS4KPiAK
PiBCZXN0IHJlZ2FyZHMsCj4gCj4gVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
