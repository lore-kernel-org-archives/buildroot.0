Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64B1C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72CB0400E3;
	Sat,  8 Jan 2022 18:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HdoK7SWJlP6; Sat,  8 Jan 2022 18:25:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71B7D40127;
	Sat,  8 Jan 2022 18:25:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B72A1BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67C894034F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t92xFllCrBEY for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:25:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7029F4030D
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:25:15 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l25so7092999wrb.13
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 10:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1m8AlhKd6tO05hexf5VHzJ3QqfwYE85QipDrTC/om08=;
 b=XuWVVAgQMbVFVBtOETTX2PcFK32f1VU1wpn7ozUhP+N7D4A+UO8wZUsIgHQTkyw4N3
 guI8vYm0tro9xc33sIDdpQYcT8gHz/YRTAzUHNaSlGd6M6Eh55FLB/dW8UPV29uOufeb
 IydVI2NCe15oVGSy/HlVEqR2S4LphFLKp+TfhlZqBQfIujdj/JvsfitMSQSNS9v/n0nq
 8ffH3G4Z6tOkBKyuHLx+0Rp9ygAPiFHqVjVXv1o1wk92zk/g/xW9uMHP4C3hBpRBGWmQ
 c6owAot1X4axPa80b03YBXYHTzpeoSj54K1JhYpzAVFVrRIqw2mp3zj/qw0WaUkaXrCB
 pP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1m8AlhKd6tO05hexf5VHzJ3QqfwYE85QipDrTC/om08=;
 b=WDDbvf6dEfucv7rJa4cG/4t3HVJA4gbNjF+LTpbryAnDXvrAx+M1onwfkqKipVrBgr
 9bsEagXl7VDBWg6naH8TYxSWAwCDrN8lOowQXq3sFQ9Wx+PS/6x2/kNz8JiobUGJj2kU
 dqO64jJuKV+AiSlPTjBlHHBfILtot8/VHj3IdD+b/HFM0IOsR6FIxMJO+M4nQanre5dF
 3jrxZH+O8KYF0kXBYOGCox0GGXZP8n68zSR7jGvwQOcYLTYnNxgx9e7OC+q1DMI3v+vP
 e8PprhYZtUcqtaM6wAKlFxtx7X6QyPGkhOykt7tHNj1AtRmVvoqjhrVexP/NXBI06WYi
 ZbrQ==
X-Gm-Message-State: AOAM530neb/pyniATdBFSgj/YY/Li+/XzwWFXV3hHY+2Db6fwt4KLHJn
 uDrIV8Uaad0b8eoARWmoAPebHA==
X-Google-Smtp-Source: ABdhPJxCxA88C1ffUi7tTSDYKbbrvwxh1r4uA4BWjK0UHNWWqhe7jPl0puWJEBIRwaXZIiK/0e6zMQ==
X-Received: by 2002:a05:6000:18ae:: with SMTP id
 b14mr56210190wri.358.1641666313645; 
 Sat, 08 Jan 2022 10:25:13 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id q17sm2179446wrx.68.2022.01.08.10.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 10:25:13 -0800 (PST)
Message-ID: <cb85d80c-6f63-85aa-beae-4a065dfe48a4@smile.fr>
Date: Sat, 8 Jan 2022 19:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Juergen Stuber <juergen@jstuber.net>, buildroot@buildroot.org
References: <20210527145118.31373-1-juergen@jstuber.net>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20210527145118.31373-1-juergen@jstuber.net>
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/toolchain-external: Allow
 relative paths in BR2_TOOLCHAIN_EXTERNAL_PATH.
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVlcmdlbiwKCkxlIDI3LzA1LzIwMjEgw6AgMTY6NTEsIEp1ZXJnZW4gU3R1YmVyIGEg
w6ljcml0wqA6Cj4gQ29udmVydCBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX1BBVEggdG8gYW4gYWJz
b2x1dGUgcGF0aCB3aGVuIHVzZWQuCj4gCj4gT3RoZXJ3aXNlIHRoZSBzeW1ib2xpYyBsaW5rcyB0
byB0aGUgZXh0ZXJuYWwgdG9vbGNoYWluIGJpbmFyaWVzIGFyZQo+IG5vdCBpbnN0YWxsZWQgaW4g
aG9zdC9iaW4gd2hlbiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX1BBVEggaXMgcmVsYXRpdmUuCj4g
VGhpcyBoYXBwZW5zIGJlY2F1c2UgVE9PTENIQUlOX0VYVEVSTkFMX0lOU1RBTExfV1JBUFBFUgo+
IGNoYW5nZXMgZGlyZWN0b3J5IGludG8gaG9zdC9iaW4gdG8gY3JlYXRlIHRoZSBzeW1ib2xpYyBs
aW5rcy4KPiBGcm9tIHRoZXJlIHRoZSB0b29scyBhcmUgbm8gbG9uZ2VyIGZvdW5kIHZpYSB0aGUg
cmVsYXRpdmUgcGF0aCBhbmQKPiBhIHNpbmdsZSBzeW1ib2xpYyBsaW5rIGhvc3QvYmluLyQocHJl
Zml4KS0qIGlzIGNyZWF0ZWQgaW5zdGVhZC4KCkluZGVlZCwgdXNpbmcgYSByZWxhdGl2ZSBwYXRo
IGZvciBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX1BBVEggZG9lc24ndCB3b3JrCgokIGxzIC1sIHRl
c3QvZXh0LXByZWluc3RhbGxlZC1yZWxhdGl2ZS10b29sY2hhaW4vaG9zdC9iaW4vKgpscnd4cnd4
cnd4LiAxIHJvbW5hbyByb21uYW8gICAgOTUgIDggamFudi4gMTk6MTgKJ3Rlc3QvZXh0LXByZWlu
c3RhbGxlZC1yZWxhdGl2ZS10b29sY2hhaW4vaG9zdC9iaW4vYXJtLW5vbmUtbGludXgtZ251ZWFi
aWhmLSonCi0+CicuLi90b29sY2hhaW4vZ2NjLWFybS05LjItMjAxOS4xMi14ODZfNjQtYXJtLW5v
bmUtbGludXgtZ251ZWFiaWhmL2Jpbi9hcm0tbm9uZS1saW51eC1nbnVlYWJpaGYtKicKLXJ3eHIt
eHIteC4gMSByb21uYW8gcm9tbmFvIDIxMjg4ICA4IGphbnYuIDE5OjE3CnRlc3QvZXh0LXByZWlu
c3RhbGxlZC1yZWxhdGl2ZS10b29sY2hhaW4vaG9zdC9iaW4vdG9vbGNoYWluLXdyYXBwZXIKCldp
dGggeW91ciBwYXRjaCBhcHBsaWVkIHRoZSB0b29sY2hhaW4gaXMgaW1wb3J0ZWQgY29ycmVjdGx5
IChidXN5Ym94IGJ1aWxkKS4KClJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBzbWlsZS5mcj4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gU3R1YmVyIDxqdWVyZ2VuQGpzdHViZXIubmV0Pgo+IC0tLQo+ICB0b29sY2hhaW4vdG9v
bGNoYWluLWV4dGVybmFsL3BrZy10b29sY2hhaW4tZXh0ZXJuYWwubWsgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3BrZy10b29sY2hhaW4tZXh0ZXJuYWwubWsg
Yi90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3BrZy10b29sY2hhaW4tZXh0ZXJuYWwubWsK
PiBpbmRleCA2ZDkxY2I1ZDFlLi4yYjcwMDA3YTM0IDEwMDY0NAo+IC0tLSBhL3Rvb2xjaGFpbi90
b29sY2hhaW4tZXh0ZXJuYWwvcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5tawo+ICsrKyBiL3Rvb2xj
aGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5tawo+IEBAIC02
OCw3ICs2OCw3IEBAIFRPT0xDSEFJTl9FWFRFUk5BTF9ET1dOTE9BRF9JTlNUQUxMX0RJUiA9ICQo
SE9TVF9ESVIpL29wdC9leHQtdG9vbGNoYWluCj4gIGlmZXEgKCQoQlIyX1RPT0xDSEFJTl9FWFRF
Uk5BTF9ET1dOTE9BRCkseSkKPiAgVE9PTENIQUlOX0VYVEVSTkFMX0lOU1RBTExfRElSID0gJChU
T09MQ0hBSU5fRVhURVJOQUxfRE9XTkxPQURfSU5TVEFMTF9ESVIpCj4gIGVsc2UKPiAtVE9PTENI
QUlOX0VYVEVSTkFMX0lOU1RBTExfRElSID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UT09MQ0hBSU5f
RVhURVJOQUxfUEFUSCkpCj4gK1RPT0xDSEFJTl9FWFRFUk5BTF9JTlNUQUxMX0RJUiA9ICQoYWJz
cGF0aCAkKGNhbGwgcXN0cmlwLCQoQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9QQVRIKSkpCj4gIGVu
ZGlmCj4gIAo+ICBpZmVxICgkKFRPT0xDSEFJTl9FWFRFUk5BTF9JTlNUQUxMX0RJUiksKQo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
