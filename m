Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A6A606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=feBoT1gC
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DEA340A68;
	Thu, 29 Oct 2026 21:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bK5eYWs2SEHl; Thu, 29 Oct 2026 21:50:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2EDD440A6B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793310619;
	b=Gs8NUxCSINoYSXK2TQVrbXIBZbpksYZhPRk2wOk64mhTEY/3/6UpfPTpsdbuTnLF2bDy
	 Uv/OjRWhgIgYc+VdZaNi0/c1me8T7zsI8EMCxJrvT1X5A255+WB33Z13jKogGX9uxIEfu
	 XVYFO83ohxBj+gNFeJNl+xOLLORmUctua419LZ9Unx/CoO/Lb3PR7ByFRhGsOX08H5amp
	 n6i1M9/zl+oekf6eB386cxxSQtUrpGruo1sg1orVyF6HZ4plcIiCiAzmeS5LD6CBoxa6L
	 l7m/15TwhnTDfiVncXbS69OrAo8iIShphDuZEvwu2/V3rVjVJMRM4oKXoSjWhRUtofQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793310619;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LtmGzqbNNlP7PYw7LElZ7DWtZdq96Q4hrfMHLUBUN3Y=;
	b=EBFfFVzmm32AkaI3aBBQgMhEJyLUSpTD7VOFF5pgFkdMiLtvV9X15Hb8+C1YOHY38BTe
	 NxkaRVJBlMNL9lIMu37BLsl8kKfq+rPC+gmBDjWn70+lI8R/Sl1tiOS0fwEx/HrXb8lOp
	 69ezPF7i+ctOauHVh4IoVMYVELsi3LZOmZgDTWSDuBxEBn+o7eW8C8UcTrGOZyUQZOhAA
	 1MnFy/l2d40BWgTslm28DHAtCBoXq7RN+PRVt27JRb8lv43nkW3cKjrv6dWS9zm1Ny8j3
	 T8ysiqpSNJQ2ZSyWNcRnUTPoPzvYzOoLCa0KXi3frZP3CZFRVhtqgu8thdQ813M6GVw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793310619;
	bh=LtmGzqbNNlP7PYw7LElZ7DWtZdq96Q4hrfMHLUBUN3Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=feBoT1gCJ+LTX/ey3V1Z05F+mAGqUySMv+2xKsAHNQaOtHbE6adIww3deZZToVDjN
	 hhaF0imNjX5WqrwDNP7/ceqydOXsh7junM8Riw07tJVEcmiCXdj/MPryeobyHLv5yL
	 iraKR1SGRm3Rn6bfbIr/wj8eYzUrEa6T/qy5kFWKTeCANkKJrfXfZkgsEsPbbWt0ou
	 Avluvl/rHzMT+woBKEKqQsWrlGKymtnUMH+vfdCGWZOFr7djGHR/5jsMkjIsnxOkUK
	 mZw0pcm9t9caf+h5lt0D+y7T2E97NjLvmUOyGoPvuRERI/5zhZYKPLKNNqf381IyoQ
	 knQa6OdJ3tCng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EDD440A6B;
	Thu, 29 Oct 2026 21:50:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38F4D1DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EE7840176
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AsVQ1scfrSmv for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:50:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D8F3D40276
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793310616;
 b=buMLMGEhPr3IbZFjd2egpR5D+oWpruy4/ft4I9cl84Ag/bP73of/FaLrWFMoszuPmD9L
 xH70Gz0NskWkBApntRtef1Dc6EwVDPgQ2jPbuRxUIvzzsuFZe6Z3hUHbAKLIAmBjCurvP
 o7EkCT1Oc4Np5sxOiYKyhRI062x7fD97dh5MmCrltqsqjO0jXWdQmajVZOoXAM3zUS79e
 ATVJkV2I+cVIpy5mE+5UjuocxSCQB3IWI+QPd8Ve4ehXQ6JNhfb/gq3/irgol4jWf2/xg
 aSOT8iAMU84EY/PYWhH9EsWjr6cGME4ppcASDtQpmkssiNWzSdyp1IE9StDPUbgp09A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793310616;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=VrmcPhjgk7zYaKamsZxpSPT+EtCeqKD7/Omg/nbkkuo=;
 b=C6QyesLnaj2Yr+jbdvy+37pQtorQvDfavBNwXROFw4DPo36TLYbfCJfrsWVNN/+QpdpI
 dZ9khCvcEkG/QYregTiJufnR/yd1GJrMtGKXSuWpzqkwRpXS9pFaruJglk6lIVt2BjMwp
 YJ+T5pGzROR0j9b3G6AEEXhZL7snEbtTpuH3gW73cpU9cm7L+ACZF3Fn3CJx+00595Vvo
 pDHMmldwQCWWPdjfBMGGy97zI+31cuxvThYF5KP2Rjqp7mS7F4TTuIkS5jDC+CKorv8v+
 RLAxJhgtvbtm2L5iVfDu8z26Hboe3Wh6LetUi5mFeUjbSfSy8ELMOV8iJ27gJNcf4Ng==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HRhlWHlb; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8F3D40276
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:50:15 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so267865e9.3
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793310613; x=1793915413;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VrmcPhjgk7zYaKamsZxpSPT+EtCeqKD7/Omg/nbkkuo=;
 b=voEzpz07f3VG2yICfT3x2z2jJQm5vLoeS5nOdtLsI2+dFS3RiPI5yvQ6vIOT41eq9h
 GcxqKNvHF2a7dVXZUtK0N6P7DJ+bgzdn8BVYNXp2RpEgBVnTXwjbtk6WNfiCQHu715uq
 IlqZSDVoS3m6JxMn4YBdJJUJTTx8aRxk7gmUq6lIygF4FVvesesy6s10BaDrgC/dTzsP
 yNM4GoTHCulmBPseHKKtZZG5w0opy5Clqo9nrzNum0VMvWq14rWykd0Fem9WuRAjgta3
 uaClkPdWqlsV7tO4FN8jzpHQNl8LfPmfAy7jMjoQCbNI3zKXba9w5j5zpLXFVmnRJvmB
 XI1g==
X-Gm-Message-State: AFq9FYIKseiXiQUUwdjgDQ+RZZJqVAt0e+gVTmu9YrVrjfw/+/2GPmYE
 B+zWa59gcRoKKKflt/EcwOmQfyBpCbTM85emPLdIf0wpeOq9upQEqWw7GPcXVAy4o7zMd+0EMrd
 GFEACVoo/TA==
X-Gm-Gg: AYBFou2Hwfiv4SrgkODLM2VUAbP4MpOZrNq1wUm8WSc6eUJR4dfLxsRi0cPuee0ljPA
 bW8QKtdrZ3MmJU7mGIpVjd+FNy6htN/xsLSFuQhLf6aGY+5WTVF1QYtYVaTQgwRLbMvMUF9HFaD
 JQ/BLrBWy1qk88LQ/9o3UTyg97Ol+y4XFg//X7uXxBTNaRcdK3QI33aXvHMZIusAUkUNd4Jyl+Z
 OFeHGR1B4YPhCW1iqMKIJidXRUVL8xVVSq+X3ieQWTjO//XduirSGL5JvQrxLEmepSCl8+clVJE
 RSxCXlUBxIVQKcvXdwFHkUkC7hkFqauEZHo6UwGv4MvYLsTp1D5fDHauULB6ceE7ODW21Hbev0B
 BKDWd7O5HrP5IyJWHymcHuIMn0DsoKnF+HHD3p5Zxv3ute40jnS9FFK1aGsf+84fdSZPHibtV9t
 bRxZXbbfRyGVQQjKd4HzLzoyyXMsRZbn3t/wAfCvQ5ruTvw1QU7vJPz9CCfFzVakD7VlgfQMEjV
 sYpMEEj2NMWy+W/hhw8KoVmunlG6RNKzfJAisOT8G9n3487rUI/6XNAxvOr4UTJT1bTEMMWKFC1
 zBRdE1HaBCXIhGvvQQdyukVAO04XW4Cr6JkgGbJ6O2Xv
X-Received: by 2002:a05:600c:8119:b0:4a1:cef3:fb3a with SMTP id
 5b1f17b1804b1-4ac17a36a28mr5014115e9.9.1793310613272; 
 Thu, 29 Oct 2026 14:50:13 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf396dfdbsm14406245e9.1.2026.10.29.14.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 14:50:12 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu, 29 Oct 2026 22:50:00 +0100
Message-ID: <20261029215007.1788801-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029213546.1783883-3-raphael.melotte@mind.be>
References: <20261029213546.1783883-3-raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for, 2025.02.x,
 2026.08.x 1/4] package/mupdf: add upstream security fix for
 CVE-2025-46206
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIHVwc3RyZWFtIGZpeCBkb2VzIG5vdCBhcHBseSBvbiAxLjIzLjkuIFRoZSBwYXRjaCBpcyBh
IGJhY2twb3J0CnRoYXQgY29tYmluZXMgdGhlIGZpeCB3aXRoIGEgZm9sbG93LXVwIGNvbW1pdCB0
aGF0IGZpeGVzIGl0cyBjeWNsZQpkZXRlY3Rpb24gaW4gcGRmX3JlYXJyYW5nZV9wYWdlcygpLgoK
U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIC4uLnJzaXZlLWN5Y2xlLXdoaWxlLXN0cmlwcGluZy1vdXRsaW5lcy5wYXRjaCB8IDEw
OCArKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvbXVwZGYvbXVwZGYubWsgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMyArCiAyIGZpbGVzIGNoYW5nZWQsIDExMSBpbnNlcnRpb25zKCspCiBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9tdXBkZi8wMDAyLWJ1Zy03MDg1MjEtYXZvaWQtcmVj
dXJzaXZlLWN5Y2xlLXdoaWxlLXN0cmlwcGluZy1vdXRsaW5lcy5wYXRjaAoKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbXVwZGYvMDAwMi1idWctNzA4NTIxLWF2b2lkLXJlY3Vyc2l2ZS1jeWNsZS13aGls
ZS1zdHJpcHBpbmctb3V0bGluZXMucGF0Y2ggYi9wYWNrYWdlL211cGRmLzAwMDItYnVnLTcwODUy
MS1hdm9pZC1yZWN1cnNpdmUtY3ljbGUtd2hpbGUtc3RyaXBwaW5nLW91dGxpbmVzLnBhdGNoCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmJiZjI2MTJhOGUKLS0tIC9kZXYv
bnVsbAorKysgYi9wYWNrYWdlL211cGRmLzAwMDItYnVnLTcwODUyMS1hdm9pZC1yZWN1cnNpdmUt
Y3ljbGUtd2hpbGUtc3RyaXBwaW5nLW91dGxpbmVzLnBhdGNoCkBAIC0wLDAgKzEsMTA4IEBACitG
cm9tIDhmZjQyMmY4MTIzMGZmNDY4NzhmMzZmYzg3ZGRiY2JlNjBkMjgyNDMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tOiBTZWJhc3RpYW4gUmFzbXVzc2VuIDxzZWJyYXNAZ21haWwuY29t
PgorRGF0ZTogU2F0LCAxMCBNYXkgMjAyNSAyMzoyNjo0NyArMDIwMAorU3ViamVjdDogW1BBVENI
XSBCdWcgNzA4NTIxOiBBdm9pZCByZWN1cnNpdmUgY3ljbGUgd2hpbGUgc3RyaXBwaW5nIG91dGxp
bmVzLgorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNl
dD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitUaGlzIGlzIGEgYmFj
a3BvcnQgdGhhdCBjb21iaW5lcyB0d28gdXBzdHJlYW0gY29tbWl0czoKKy0gMGVjN2U0ZDIyMDFi
YjZkZjIxN2UwMWMxNzM5NmQzNjI5N2FiZjlhYworICAoIkJ1ZyA3MDg1MjE6IEF2b2lkIHJlY3Vy
c2l2ZSBjeWNsZSB3aGlsZSBzdHJpcHBpbmcgb3V0bGluZXMuIikKKy0gZjg0YmI5ZmJlOGFiZWEw
MTFkNTAwZDI4ZDkwZTNjMzFjNTc2YTIwOQorICAoIkJ1ZyA3MDg1NDE6IEZpeCBjeWNsZSBkZXRl
Y3Rpb24gaW4gcGRmX3JlYXJyYW5nZV9wYWdlcy4iKQorCitbQmFja3BvcnQ6IHVzZSBGWl9FUlJP
Ul9HRU5FUklDLCBhcyBGWl9FUlJPUl9GT1JNQVQgZG9lcyBub3QgZXhpc3QKK2luIDEuMjMueDsg
a2VlcCB0aGUgZnpfcGFnZSBkZWNsYXJhdGlvbnMgdGhhdCB0aGlzIGJyYW5jaCBzdGlsbCB1c2Vz
Ll0KKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9BcnRpZmV4U29mdHdhcmUvbXVwZGYv
Y29tbWl0LzBlYzdlNGQyMjAxYmI2ZGYyMTdlMDFjMTczOTZkMzYyOTdhYmY5YWMKK1Vwc3RyZWFt
OiBodHRwczovL2dpdGh1Yi5jb20vQXJ0aWZleFNvZnR3YXJlL211cGRmL2NvbW1pdC9mODRiYjlm
YmU4YWJlYTAxMWQ1MDBkMjhkOTBlM2MzMWM1NzZhMjA5CitDVkU6IENWRS0yMDI1LTQ2MjA2CitT
aWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+
CistLS0KKyBzb3VyY2UvcGRmL3BkZi1jbGVhbi1maWxlLmMgfCAxOSArKysrKysrKysrKysrLS0t
LS0tCisgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCisK
K2RpZmYgLS1naXQgYS9zb3VyY2UvcGRmL3BkZi1jbGVhbi1maWxlLmMgYi9zb3VyY2UvcGRmL3Bk
Zi1jbGVhbi1maWxlLmMKK2luZGV4IDIwZWJmYTBmMC4uZDAwZWM1OTVmIDEwMDY0NAorLS0tIGEv
c291cmNlL3BkZi9wZGYtY2xlYW4tZmlsZS5jCisrKysgYi9zb3VyY2UvcGRmL3BkZi1jbGVhbi1m
aWxlLmMKK0BAIC0xMjksOSArMTI5LDkgQEAgc3RhdGljIGludCBzdHJpcF9zdGFsZV9hbm5vdF9y
ZWZzKGZ6X2NvbnRleHQgKmN0eCwgcGRmX29iaiAqZmllbGQsIGludCBwYWdlX2NvdW4KKyAJfQor
IH0KKyAKKy1zdGF0aWMgaW50IHN0cmlwX291dGxpbmVzKGZ6X2NvbnRleHQgKmN0eCwgcGRmX2Rv
Y3VtZW50ICpkb2MsIHBkZl9vYmogKm91dGxpbmVzLCBpbnQgcGFnZV9jb3VudCwgaW50ICpwYWdl
X29iamVjdF9udW1zLCBwZGZfb2JqICpuYW1lc19saXN0KTsKKytzdGF0aWMgaW50IHN0cmlwX291
dGxpbmVzKGZ6X2NvbnRleHQgKmN0eCwgcGRmX2RvY3VtZW50ICpkb2MsIHBkZl9vYmogKm91dGxp
bmVzLCBpbnQgcGFnZV9jb3VudCwgaW50ICpwYWdlX29iamVjdF9udW1zLCBwZGZfb2JqICpuYW1l
c19saXN0LCBwZGZfbWFya19iaXRzICptYXJrcyk7CisgCistc3RhdGljIGludCBzdHJpcF9vdXRs
aW5lKGZ6X2NvbnRleHQgKmN0eCwgcGRmX2RvY3VtZW50ICpkb2MsIHBkZl9vYmogKm91dGxpbmVz
LCBpbnQgcGFnZV9jb3VudCwgaW50ICpwYWdlX29iamVjdF9udW1zLCBwZGZfb2JqICpuYW1lc19s
aXN0LCBwZGZfb2JqICoqcGZpcnN0LCBwZGZfb2JqICoqcGxhc3QpCisrc3RhdGljIGludCBzdHJp
cF9vdXRsaW5lKGZ6X2NvbnRleHQgKmN0eCwgcGRmX2RvY3VtZW50ICpkb2MsIHBkZl9vYmogKm91
dGxpbmVzLCBpbnQgcGFnZV9jb3VudCwgaW50ICpwYWdlX29iamVjdF9udW1zLCBwZGZfb2JqICpu
YW1lc19saXN0LCBwZGZfb2JqICoqcGZpcnN0LCBwZGZfb2JqICoqcGxhc3QsIHBkZl9tYXJrX2Jp
dHMgKm1hcmtzKQorIHsKKyAJcGRmX29iaiAqcHJldiA9IE5VTEw7CisgCXBkZl9vYmogKmZpcnN0
ID0gTlVMTDsKK0BAIC0xNDQsNyArMTQ0LDcgQEAgc3RhdGljIGludCBzdHJpcF9vdXRsaW5lKGZ6
X2NvbnRleHQgKmN0eCwgcGRmX2RvY3VtZW50ICpkb2MsIHBkZl9vYmogKm91dGxpbmVzLAorIAor
IAkJLyogU3RyaXAgYW55IGNoaWxkcmVuIHRvIHN0YXJ0IHdpdGguIFRoaXMgdGFrZXMgY2FyZSBv
ZgorIAkJICogRmlyc3QvTGFzdC9Db3VudCBmb3IgdXMuICovCistCQluYyA9IHN0cmlwX291dGxp
bmVzKGN0eCwgZG9jLCBjdXJyZW50LCBwYWdlX2NvdW50LCBwYWdlX29iamVjdF9udW1zLCBuYW1l
c19saXN0KTsKKysJCW5jID0gc3RyaXBfb3V0bGluZXMoY3R4LCBkb2MsIGN1cnJlbnQsIHBhZ2Vf
Y291bnQsIHBhZ2Vfb2JqZWN0X251bXMsIG5hbWVzX2xpc3QsIG1hcmtzKTsKKyAKKyAJCWlmICgh
ZGVzdF9pc192YWxpZChjdHgsIGN1cnJlbnQsIHBhZ2VfY291bnQsIHBhZ2Vfb2JqZWN0X251bXMs
IG5hbWVzX2xpc3QpKQorIAkJeworQEAgLTE5NSw3ICsxOTUsNyBAQCBzdGF0aWMgaW50IHN0cmlw
X291dGxpbmUoZnpfY29udGV4dCAqY3R4LCBwZGZfZG9jdW1lbnQgKmRvYywgcGRmX29iaiAqb3V0
bGluZXMsCisgCXJldHVybiBjb3VudDsKKyB9CisgCistc3RhdGljIGludCBzdHJpcF9vdXRsaW5l
cyhmel9jb250ZXh0ICpjdHgsIHBkZl9kb2N1bWVudCAqZG9jLCBwZGZfb2JqICpvdXRsaW5lcywg
aW50IHBhZ2VfY291bnQsIGludCAqcGFnZV9vYmplY3RfbnVtcywgcGRmX29iaiAqbmFtZXNfbGlz
dCkKKytzdGF0aWMgaW50IHN0cmlwX291dGxpbmVzKGZ6X2NvbnRleHQgKmN0eCwgcGRmX2RvY3Vt
ZW50ICpkb2MsIHBkZl9vYmogKm91dGxpbmVzLCBpbnQgcGFnZV9jb3VudCwgaW50ICpwYWdlX29i
amVjdF9udW1zLCBwZGZfb2JqICpuYW1lc19saXN0LCBwZGZfbWFya19iaXRzICptYXJrcykKKyB7
CisgCWludCBuYzsKKyAJcGRmX29iaiAqZmlyc3Q7CitAQCAtMjA0LDExICsyMDQsMTQgQEAgc3Rh
dGljIGludCBzdHJpcF9vdXRsaW5lcyhmel9jb250ZXh0ICpjdHgsIHBkZl9kb2N1bWVudCAqZG9j
LCBwZGZfb2JqICpvdXRsaW5lcywKKyAJaWYgKG91dGxpbmVzID09IE5VTEwpCisgCQlyZXR1cm4g
MDsKKyAKKysJaWYgKHBkZl9tYXJrX2JpdHNfc2V0KGN0eCwgbWFya3MsIG91dGxpbmVzKSkKKysJ
CWZ6X3Rocm93KGN0eCwgRlpfRVJST1JfR0VORVJJQywgIkN5Y2xlIGRldGVjdGVkIGluIG91dGxp
bmVzIik7CisrCisgCWZpcnN0ID0gcGRmX2RpY3RfZ2V0KGN0eCwgb3V0bGluZXMsIFBERl9OQU1F
KEZpcnN0KSk7CisgCWlmIChmaXJzdCA9PSBOVUxMKQorIAkJbmMgPSAwOworIAllbHNlCistCQlu
YyA9IHN0cmlwX291dGxpbmUoY3R4LCBkb2MsIGZpcnN0LCBwYWdlX2NvdW50LCBwYWdlX29iamVj
dF9udW1zLCBuYW1lc19saXN0LCAmZmlyc3QsICZsYXN0KTsKKysJCW5jID0gc3RyaXBfb3V0bGlu
ZShjdHgsIGRvYywgZmlyc3QsIHBhZ2VfY291bnQsIHBhZ2Vfb2JqZWN0X251bXMsIG5hbWVzX2xp
c3QsICZmaXJzdCwgJmxhc3QsIG1hcmtzKTsKKyAKKyAJaWYgKG5jID09IDApCisgCXsKK0BAIC0y
MzgsNiArMjQxLDcgQEAgc3RhdGljIHZvaWQgcGRmX3JlYXJyYW5nZV9wYWdlc19pbXAoZnpfY29u
dGV4dCAqY3R4LCBwZGZfZG9jdW1lbnQgKmRvYywgaW50IGNvdW4KKyAJaW50IHBhZ2Vjb3VudCwg
aTsKKyAJaW50ICpwYWdlX29iamVjdF9udW1zID0gTlVMTDsKKyAJZnpfcGFnZSAqcGFnZSwgKm5l
eHQ7CisrCXBkZl9tYXJrX2JpdHMgKm1hcmtzID0gTlVMTDsKKyAKKyAJLyogS2VlcCBvbmx5IHBh
Z2VzL3R5cGUgYW5kIChyZWR1Y2VkKSBkZXN0IGVudHJpZXMgdG8gYXZvaWQKKyAJICogcmVmZXJl
bmNlcyB0byB1bnJldGFpbmVkIHBhZ2VzICovCitAQCAtMjUyLDYgKzI1Niw3IEBAIHN0YXRpYyB2
b2lkIHBkZl9yZWFycmFuZ2VfcGFnZXNfaW1wKGZ6X2NvbnRleHQgKmN0eCwgcGRmX2RvY3VtZW50
ICpkb2MsIGludCBjb3VuCisgCWZ6X3ZhcihhbGxmaWVsZHMpOworIAlmel92YXIocGFnZV9vYmpl
Y3RfbnVtcyk7CisgCWZ6X3ZhcihraWRzKTsKKysJZnpfdmFyKG1hcmtzKTsKKyAKKyAJZnpfdHJ5
KGN0eCkKKyAJeworQEAgLTM5NiwxMyArNDAxLDE1IEBAIHN0YXRpYyB2b2lkIHBkZl9yZWFycmFu
Z2VfcGFnZXNfaW1wKGZ6X2NvbnRleHQgKmN0eCwgcGRmX2RvY3VtZW50ICpkb2MsIGludCBjb3Vu
CisgCQkJCXBkZl9kaWN0X2RlbChjdHgsIGYsIFBERl9OQU1FKEEpKTsKKyAJCX0KKyAKKy0JCWlm
IChzdHJpcF9vdXRsaW5lcyhjdHgsIGRvYywgb3V0bGluZXMsIHBhZ2Vjb3VudCwgcGFnZV9vYmpl
Y3RfbnVtcywgbmFtZXNfbGlzdCkgPT0gMCkKKysJCW1hcmtzID0gcGRmX25ld19tYXJrX2JpdHMo
Y3R4LCBkb2MpOworKwkJaWYgKHN0cmlwX291dGxpbmVzKGN0eCwgZG9jLCBvdXRsaW5lcywgcGFn
ZWNvdW50LCBwYWdlX29iamVjdF9udW1zLCBuYW1lc19saXN0LCBtYXJrcykgPT0gMCkKKyAJCXsK
KyAJCQlwZGZfZGljdF9kZWwoY3R4LCByb290LCBQREZfTkFNRShPdXRsaW5lcykpOworIAkJfQor
IAl9CisgCWZ6X2Fsd2F5cyhjdHgpCisgCXsKKysJCXBkZl9kcm9wX21hcmtfYml0cyhjdHgsIG1h
cmtzKTsKKyAJCWZ6X2ZyZWUoY3R4LCBwYWdlX29iamVjdF9udW1zKTsKKyAJCXBkZl9kcm9wX29i
aihjdHgsIGFsbGZpZWxkcyk7CisgCQlwZGZfZHJvcF9vYmooY3R4LCByb290KTsKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsgYi9wYWNrYWdlL211cGRmL211cGRmLm1rCmluZGV4
IGMwM2U3MzdiY2QuLmY3ODBkYTJlYjUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbXVwZGYvbXVwZGYu
bWsKKysrIGIvcGFja2FnZS9tdXBkZi9tdXBkZi5tawpAQCAtMzAsNiArMzAsOSBAQCBNVVBERl9J
R05PUkVfQ1ZFUyA9IFwKICMgMDAwMS1GaXgtaW5jb3JyZWN0LWVycm9yLWNhc2UtZnJlZS1vZi1w
aXhtYXAucGF0Y2gKIE1VUERGX0lHTk9SRV9DVkVTICs9IENWRS0yMDI2LTI1NTU2CiAKKyMgMDAw
Mi1idWctNzA4NTIxLWF2b2lkLXJlY3Vyc2l2ZS1jeWNsZS13aGlsZS1zdHJpcHBpbmctb3V0bGlu
ZXMucGF0Y2gKK01VUERGX0lHTk9SRV9DVkVTICs9IENWRS0yMDI1LTQ2MjA2CisKICMgbXVwZGYg
ZG9lc24ndCB1c2UgQ0ZMQUdTIGFuZCBMSUJTIGJ1dCBYQ0ZMQUdTIGFuZCBYTElCUyBpbnN0ZWFk
LgogIyB3aXRoIFVTRV9TWVNURU1fTElCUyBpdCB3aWxsIHRyeSB0byB1c2Ugc3lzdGVtIGxpYnJh
cmllcyBpbnN0ZWFkIG9mIHRoZSBidW5kbGVkIG9uZXMuCiBNVVBERl9NQUtFX0VOViA9ICQoVEFS
R0VUX01BS0VfRU5WKSAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgXAotLSAKMi41NC4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
