Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632D5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 21:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C4A260AF1;
	Wed, 12 Jan 2022 21:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVrb110YYPe7; Wed, 12 Jan 2022 21:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D6E760AE5;
	Wed, 12 Jan 2022 21:30:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D92461BF2EA
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 21:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6C83415DC
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 21:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 62hASZ7p4YHY for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 21:30:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A022D415D6
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 21:30:22 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so2436982wmf.3
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 13:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v7/m1gMOAjM6FoH+wyv4twutYkLgxzvj/iV7nwE/gcU=;
 b=bQYaCu0Kx+FWc9j50HyTi2ojd088wpW1IREIX9wGfftRlKHuBilQssLrd+3cncJjkf
 DQzyTZj4ch0iVy8Ghu+dHfgFzXU2K6aOlp59OEnRChZBX/rz6zkrayf6EIP9JqfOIROy
 MpEGijIe99YHUgnyscXUbk3rC8HhWgYVdLZWq0PuQHLbWkaszf43KZLiE4GeJBvGpV9a
 p4bsB7ko0s5KNDQpIUtt4YDdqS1kc8vsuzvlyOLJQemyJFtKAMtGnRPXgNrJGC4IuptG
 xnVIKQSOLksYXTw4kCL6Ti/DUAodirZdlxoFcUiYZstPJFF6xBE7m+HY49xd4OShhTw5
 eSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v7/m1gMOAjM6FoH+wyv4twutYkLgxzvj/iV7nwE/gcU=;
 b=7faBDeya37vp/1HuipgpMGt+8CbvXV6u7SQuh4gEF94PTnoAviaVgVRVCizN5MUOQ5
 inFm7fgGSRSOue4Wn9FYSRuFOi0v8pQQ/ely6oD8FdbduX5GJR5j2HfdEEN3s71XQVV2
 T/neclwzTqiSJRIumXK9eWIbJ/0ErRkG6ANumrN7Bzwsfe/a86ryX3reeund+0+J9JzL
 Bzr5KgY1Ifd02vJ4fUU6gXobCOP4XKfM85qfk6KK3zdye+L7MI7yDlyC9ACeK1KPwcZn
 sHg7X1Q6nqYkqzVrCosHQu+haBtI5cXlVuxSPQffKf6xhXzEJihkYohfstayyQGDBCFS
 TIxQ==
X-Gm-Message-State: AOAM530s8MoneY3swbAwkSoy0XyC3otoYw4hk6zULmRrljs9M1lI2MRq
 O1//rpPtidU0OXldPDo1bh94ree/YJ0=
X-Google-Smtp-Source: ABdhPJzRP75hXPUPLbPUqcrPSroDZd+wVAI95yo1tLe8EGgNlkVCaV8DO7cI+KhfZbAGAj2+MEL2hg==
X-Received: by 2002:a05:600c:3ba3:: with SMTP id
 n35mr1217778wms.116.1642023020673; 
 Wed, 12 Jan 2022 13:30:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id v13sm725654wmh.45.2022.01.12.13.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 13:30:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 22:28:46 +0100
Message-Id: <20220112212847.3166081-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112212847.3166081-1-fontaine.fabrice@gmail.com>
References: <20220112212847.3166081-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/python-hpack: bump to version 4.0.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBEcm9wIHBhdGNoIChISVNUT1JZLnJzdCByZW1vdmVkKQotIFVwZGF0ZSBzaXRlIGluIENvbmZp
Zy5pbgotIHB5dGhvbiAyLjcgaGFzIGJlZW4gZHJvcHBlZAotIFVwZGF0ZSBpbmRlbnRhdGlvbiBp
biBoYXNoIGZpbGUgKHR3byBzcGFjZXMpCgpodHRwczovL2dpdGh1Yi5jb20vcHl0aG9uLWh5cGVy
L2hwYWNrL2Jsb2IvdjQuMC4wL0NIQU5HRUxPRy5yc3QKClNpZ25lZC1vZmYtYnk6IEZhYnJpY2Ug
Rm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgotLS0KIC4uLlNUT1JZLnJzdC1m
cm9tLVVURi04LWZvcm1hdC10by1BU0NJSS5wYXRjaCB8IDQwIC0tLS0tLS0tLS0tLS0tLS0tLS0K
IHBhY2thZ2UvcHl0aG9uLWhwYWNrL0NvbmZpZy5pbiAgICAgICAgICAgICAgICB8ICAzICstCiBw
YWNrYWdlL3B5dGhvbi1ocGFjay9weXRob24taHBhY2suaGFzaCAgICAgICAgfCAgOCArKy0tCiBw
YWNrYWdlL3B5dGhvbi1ocGFjay9weXRob24taHBhY2subWsgICAgICAgICAgfCAgNCArLQogNCBm
aWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWhwYWNrLzAwMDEtQ29udmVydC1ISVNUT1JZLnJzdC1m
cm9tLVVURi04LWZvcm1hdC10by1BU0NJSS5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0
aG9uLWhwYWNrLzAwMDEtQ29udmVydC1ISVNUT1JZLnJzdC1mcm9tLVVURi04LWZvcm1hdC10by1B
U0NJSS5wYXRjaCBiL3BhY2thZ2UvcHl0aG9uLWhwYWNrLzAwMDEtQ29udmVydC1ISVNUT1JZLnJz
dC1mcm9tLVVURi04LWZvcm1hdC10by1BU0NJSS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDE1YjhhMjRkYS4uMDAwMDAwMDAwMAotLS0gYS9wYWNrYWdlL3B5dGhvbi1ocGFj
ay8wMDAxLUNvbnZlcnQtSElTVE9SWS5yc3QtZnJvbS1VVEYtOC1mb3JtYXQtdG8tQVNDSUkucGF0
Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0MCArMCwwIEBACi1Gcm9tIDNkMTk1ZjRmNTk5ZjM3Yzg5
NDE5ZjFkYjEzMDJmOTRhY2IzOGMyNjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBZ
ZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Ci1EYXRlOiBUdWUsIDEg
QXVnIDIwMTcgMTA6MTU6MzMgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gQ29udmVydCBISVNUT1JZ
LnJzdCBmcm9tIFVURi04IGZvcm1hdCB0byBBU0NJSQotTUlNRS1WZXJzaW9uOiAxLjAKLUNvbnRl
bnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAotQ29udGVudC1UcmFuc2Zlci1FbmNv
ZGluZzogOGJpdAotCi1VVEYtOCBmb3JtYXR0ZWQgZmlsZSBicmVha3MgaW5zdGFsbGF0aW9ucyBv
biBzb21lIHN5c3RlbXM6Ci0KLVRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKLSAg
RmlsZSAic2V0dXAucHkiLCBsaW5lIDM0LCBpbiA8bW9kdWxlPgotICAgIGxvbmdfZGVzY3JpcHRp
b249b3BlbignUkVBRE1FLnJzdCcpLnJlYWQoKSArICdcblxuJyArIG9wZW4oJ0hJU1RPUlkucnN0
JykucmVhZCgpLAotICBGaWxlICIvaG9tZS9wZWtvL2F1dG9idWlsZC9pbnN0YW5jZS0xL291dHB1
dC90YXJnZXQvdXNyL2xpYi9weXRob24zLjYvZW5jb2RpbmdzL2FzY2lpLnB5IiwgbGluZSAyNiwg
aW4gZGVjb2RlCi0gICAgcmV0dXJuIGNvZGVjcy5hc2NpaV9kZWNvZGUoaW5wdXQsIHNlbGYuZXJy
b3JzKVswXQotVW5pY29kZURlY29kZUVycm9yOiAnYXNjaWknIGNvZGVjIGNhbid0IGRlY29kZSBi
eXRlIDB4YzIgaW4gcG9zaXRpb24gMTEyNTogb3JkaW5hbCBub3QgaW4gcmFuZ2UoMTI4KQotCi1U
byBmaXggdGhpcyBlcnJvciBqdXN0IHJlcGxhY2UgJ8KnJyB3aXRoICdTJyBtZWFuaW5nICdTZWN0
aW9uJy4KLQotU2lnbmVkLW9mZi1ieTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2ds
ZW1haWwuY29tPgotLS0tCi0gSElTVE9SWS5yc3QgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9ISVNUT1JZLnJzdCBi
L0hJU1RPUlkucnN0Ci1pbmRleCAzN2IyZDljLi5iOTMxMGY1IDEwMDY0NAotLS0tIGEvSElTVE9S
WS5yc3QKLSsrKyBiL0hJU1RPUlkucnN0Ci1AQCAtMjcsNyArMjcsNyBAQCBSZWxlYXNlIEhpc3Rv
cnkKLSAtIEhQQUNLIG5vdyB0b2xlcmF0ZXMgcmVjZWl2aW5nIG11bHRpcGxlIGhlYWRlciB0YWJs
ZSBzaXplIGNoYW5nZXMgaW4gc2VxdWVuY2UsCi0gICByYXRoZXIgdGhhbiBvbmx5IG9uZS4KLSAt
IEhQQUNLIG5vdyBmb3JiaWRzIGhlYWRlciB0YWJsZSBzaXplIGNoYW5nZXMgYW55d2hlcmUgYnV0
IGZpcnN0IGluIGEgaGVhZGVyCi0tICBibG9jaywgYXMgcmVxdWlyZWQgYnkgUkZDIDc1NDEgwqcg
NC4yLgotKyAgYmxvY2ssIGFzIHJlcXVpcmVkIGJ5IFJGQyA3NTQxIFMgNC4yLgotIC0gT3RoZXIg
bWlzY2VsbGFuZW91cyBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudHMuCi0gCi0gMi4zLjAgKDIwMTYt
MDgtMDQpCi0tLSAKLTIuMTEuMAotCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1ocGFjay9D
b25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1ocGFjay9Db25maWcuaW4KaW5kZXggYjBlYTAzYmM0
Mi4uMDYwOGY5NzI4MSAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24taHBhY2svQ29uZmlnLmlu
CisrKyBiL3BhY2thZ2UvcHl0aG9uLWhwYWNrL0NvbmZpZy5pbgpAQCAtMSw2ICsxLDcgQEAKIGNv
bmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fSFBBQ0sKIAlib29sICJweXRob24taHBhY2siCisJZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9QWVRIT04zCiAJaGVscAogCSAgUHVyZS1QeXRob24gSFBBQ0sg
aGVhZGVyIGNvbXByZXNzaW9uLgogCi0JICBodHRwOi8vaHlwZXIucnRmZC5vcmcKKwkgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9weXRob24taHlwZXIvaHBhY2sKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0
aG9uLWhwYWNrL3B5dGhvbi1ocGFjay5oYXNoIGIvcGFja2FnZS9weXRob24taHBhY2svcHl0aG9u
LWhwYWNrLmhhc2gKaW5kZXggNzI4ODZiMGVkZC4uOTg4Y2JhYWUwYiAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9weXRob24taHBhY2svcHl0aG9uLWhwYWNrLmhhc2gKKysrIGIvcGFja2FnZS9weXRob24t
aHBhY2svcHl0aG9uLWhwYWNrLmhhc2gKQEAgLTEsNSArMSw1IEBACi0jIG1kNSBmcm9tIGh0dHBz
Oi8vcHlwaS5weXRob24ub3JnL3B5cGkvaHBhY2svanNvbgotbWQ1CTU1NmIwYWU2NjE4MGY1NGMy
Y2U4MDI5YTA5NTIwODhiICBocGFjay0zLjAuMC50YXIuZ3oKLSMgTG9jYWxseSBjb21wdXRlZAot
c2hhMjU2CThlZWM5YzFmNGJmYWUzNDA4YTNmMzA1MDAyNjFmN2U2YTY1OTEyZGMxMzg1MjZlYTA1
NGY5YWQ5ODg5MmU5ZDIgIGhwYWNrLTMuMC4wLnRhci5negorIyBtZDUsIHNoYTI1NiBmcm9tIGh0
dHBzOi8vcHlwaS5vcmcvcHlwaS9ocGFjay9qc29uCittZDUgIDI3ZTAxNTE0ZWYwNmRjOWZhMDc5
OGQzZGNiN2RlNDdjICBocGFjay00LjAuMC50YXIuZ3oKK3NoYTI1NiAgZmM0MWRlMGM2M2U2ODdl
YmZmZGU4MTE4N2E5NDgyMjEyOTQ4OTZmNmJkYzBhZTIzMTI3MDhkZjMzOTQzMDA5NSAgaHBhY2st
NC4wLjAudGFyLmd6CisjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwogc2hhMjU2
ICA3NjNhOTM0MmEwNGRmNjIwNDZjOWRjNzQ4YTUyODc5MzRlYjBhNTMzMWM2ODYzYjNjYTBhZWUy
MGUxOGNiNGVkICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1ocGFjay9weXRo
b24taHBhY2subWsgYi9wYWNrYWdlL3B5dGhvbi1ocGFjay9weXRob24taHBhY2subWsKaW5kZXgg
ZDZiOTY2NDllOS4uM2NmNTM0ZDA1NSAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24taHBhY2sv
cHl0aG9uLWhwYWNrLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLWhwYWNrL3B5dGhvbi1ocGFjay5t
awpAQCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVBZVEhPTl9I
UEFDS19WRVJTSU9OID0gMy4wLjAKK1BZVEhPTl9IUEFDS19WRVJTSU9OID0gNC4wLjAKIFBZVEhP
Tl9IUEFDS19TT1VSQ0UgPSBocGFjay0kKFBZVEhPTl9IUEFDS19WRVJTSU9OKS50YXIuZ3oKLVBZ
VEhPTl9IUEFDS19TSVRFID0gaHR0cHM6Ly9weXBpLnB5dGhvbi5vcmcvcGFja2FnZXMvNDQvZjEv
YjQ0NDBlNDZlMjY1YTI5YzBjYjdiMDliNmRhZWM2ZWRmOTNjNzllYWU3MTNjZmVkOTNmYmJmODcx
NmM1CitQWVRIT05fSFBBQ0tfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9w
YWNrYWdlcy8zZS85Yi9mZGE5M2ZiNGQ5NTdkYjE5YjBmNmIzNzBlNzlkNTg2YjNlODUyOGIyMDI1
MmM3MjljNDc2YTJjMDI5NTQKIFBZVEhPTl9IUEFDS19TRVRVUF9UWVBFID0gc2V0dXB0b29scwog
UFlUSE9OX0hQQUNLX0xJQ0VOU0UgPSBNSVQKIFBZVEhPTl9IUEFDS19MSUNFTlNFX0ZJTEVTID0g
TElDRU5TRQotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
