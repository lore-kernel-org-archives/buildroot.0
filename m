Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03CD606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=J/DTVTIM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB31C60A70;
	Thu, 29 Oct 2026 21:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1yWfJgZlJvI; Thu, 29 Oct 2026 21:36:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 750F460A79
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793309774;
	b=P0HvNTF63vm+6ioI0COE5mgDWV5W57rM5WLigCZ3CTNDLXcpPp4z++4YhhIn2zOf5aYH
	 B62fLBYYeIEI4LBbSxrpmuPzftuKeat7PDiZ/oJsB0E7AdE3/wfeJgPdivDR6KdCl1esJ
	 w+JglbGi5f3LeE4U0SMAPF8Twc4MBv0SvRDPGCX4UBUbgVoqZDdzTzdfvdSZKSuyAzeH3
	 OKE7+jBzYnnCjBrf0W2RLdsypwb4PSviOx9nxDKE1NmczXZCqPzc8AKOgK4JsWNA3uNru
	 g1EpFm1ifEe8B100iBzibrB/1hslpuBmGmpnX2tpiRxeeZhw71yz/MC1HR5YWyHOw8A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793309774;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LtmGzqbNNlP7PYw7LElZ7DWtZdq96Q4hrfMHLUBUN3Y=;
	b=AZ8LBeY0VgSoP2g0sE+WPPouyGZvS9qDb4Ag2pAMfqv7nJ2hwArjD3AlrSqJ3VNdaVit
	 He44yzUH/U0gqNWg7jkm9g1Www6r7GAdiEpz3/z4EX/N3BTFxwK5V49OeY+BiYPkStdVn
	 h9kTdcOL/rafTj9tagjs7sddm0F95Ga9Zb94UxZPrWEzsFrBPkqMBvs8q5dbSeAH3y4Xx
	 h9W11OKDDFwRt+tgu6TKx4i8rJrDXUaomNG8SEMwnDMDLbts/nQi3PqzM3mE61WZIMY8Q
	 DZt5TxRxmlBaUI3+XJ72XTspm+9JnluVtqwT4Qh1dCcOxSAp8z4t85h+Nsegv6EazeQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793309774;
	bh=LtmGzqbNNlP7PYw7LElZ7DWtZdq96Q4hrfMHLUBUN3Y=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=J/DTVTIM4U75LPQQ1yNxxy4ZPBKsLz1202ZgNEHm1fG64+Gz0XOhi2FGoTAKm9LQh
	 rT+AQCY9S21smYFiMxA+PGXeIuQw+gFrphXQEKVmAD4Vg4GUwo/CPdTZXBaEj54P9T
	 ZVqMVrQSub8YNk3om2NRIkc+rbrowuOGOpZdytU6qhxJBK8dWuwiuXEerLM8lHaQjF
	 JZTEXmlsrm3nvtu4D3XD8V2fCod05wBTCSIERRUOHSo09KWg+rtu+Q9qkfNHa75kqm
	 jaAT2UaxHAsG/gBaE5n5Smy4HQJZT0rmuMCkZcVBWeTs+e8UrqFHAzSQky3vuX6RyI
	 mldUIBTyKllfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 750F460A79;
	Thu, 29 Oct 2026 21:36:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BFC091DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0AA960A79
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id On8J0791FdQh for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:36:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6528160A70
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793309772;
 b=cbY5JtpBW2YpbuSUd6MU0pJqg3BDGgOun7cW0rrrpsqB9IcHdFOwXNsfTgjlW4B8vZ3e
 jerh3iy5ShvPeS7LfZHUzcTVU8TsCy+qnCDgDSnYXjzC5E65DEGgeuwuAvR/tCRTKxNt9
 a3BxB8DpkOiEDDWPuih7o8Pe2Zq9CUQyy+u8jV3VVHACNkayUMtG22V1EBeuCovekVGCi
 c1FlROLdeSQ2PwlsCkpgo8184YkXpYEg6DR06VID7u9w/IfVSEU1cFxQEl3iOWG+Zo9TX
 aZ7/1Np4VhN57AD0ZNaLxb6/gwWSDTMC6g9PnQ4jtPPvgfklSt21PccyyUOaf8MJ5Qw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793309772;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=VrmcPhjgk7zYaKamsZxpSPT+EtCeqKD7/Omg/nbkkuo=;
 b=UWWkTQs7BWRt3Ir7q8gHIC9nKbC4+CcO7XdL0K6nTOZFu/P5VYU/GJaloPeL3rSnv6ke
 C3xNEhNfl8c/9WsqHX9XfMoECHh1nAB9z91lQKqNF/sldU9eq9JCYrNNZ3xNWWbe4FDho
 0fH78aTAXThnIJ9GtbJUFjLfmfqLZGG6E7SKwIh5d57ke8lG8FVHJ5tq3bikMYbgqwOzn
 yVvNFB5Q3yXGwG9sadmA2BH3kI1XRf4u6ptFpQtPLW4a2Baw/8DmJbn+DilQipWwoe5+7
 gQtBbOYAjgdnJyEB0nC92xZelCwbHi7d4lPOOe3OFZtz7ghOkKFqQC0JMIMQVRmCfrg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=c8SFvgxt; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6528160A70
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:36:10 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so62259f8f.0
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793309769; x=1793914569;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VrmcPhjgk7zYaKamsZxpSPT+EtCeqKD7/Omg/nbkkuo=;
 b=PRpX9UX6OMuK1zNCGI5m10OCteIAkLafINB5srgLfRDb8NOtTMlPl5cW0ZHxjo+dt5
 ExdJKlQ0/KoLVGFwACoHAceOBtWDUaZwhblb4OVgNNLlzwjaSj1ShANzK+Bv6xSlFLL4
 729+MolWgk2E1W3uIH6vuS8hpzJcK+HtU5eji1logwgpj8CzHl/OXndx6dJBeMfd+2A5
 /W2xJIqFRnJ8MhQxyYx1pmHybfy79DHJT+Wt4v679jxuuOKc73Ul99Hp6AzthiEyjC9q
 BZ70V6Pn6RAtfpShDtR1t/4/EQ8it/V2kxeMgYmgm1MzUqMY0oOTy3lMOETt3kl6dJPW
 p+tQ==
X-Gm-Message-State: AFq9FYIBLdSYAPqWKgRXjdf+dM4ovuM6I2SKRL5X+8LAwypfiPeuNbG0
 fxsKvyggbG9M+YrsGhUMURF+2uYp+rjMp6MT1FPQd0ODdaY7slOpVgRoEl/95vCAKXt9r8OoHzR
 oUMb4QV3VaQ==
X-Gm-Gg: AYBFou1KkCb30zMRQi9Fr+KuM14KrT8YR+vB+y3L42TmhTe1hquK8r3H4Gbw/E7zc4X
 YyRljW8AYTuBNxMt90dN14VlEP8SFpZxDfFYgnJ/KD23M+RNHek7csb77lZ2Cmdp0mjhbFZPo3M
 Wbe6S8mnCOvTWyBF7AB1ZfxhWhVUHY3jHEd+w7bt3ESJqhQPPORkMHQtlSgRVooK2O8QbMbuPwM
 88fcV4+yJUqipnjJKefy2MJok0M7wwMl8uBjNFkc4ZMzjRD+VwWcEtq5AKCM9PTaAs7kZ9wnt1q
 iRtWtL0jvH/3/0+6CjC298kpQK1xSxK8GwFyVdTiau3EpAClJiv/4zjiXEFi1UO/zYz+FVKbT4T
 XtqK/u8paqXedJl7Tl0kJBoalX/uza7Gbk19Xssf8wTDLiEfbMfQ30fwnRKHVSRBnR/5lgxkT5d
 ZL1vX85DAY9mPb6fuk3dhqSvvc9rr4FmaxNAr+M51JiQjru0s9iDN7uR1ISE2rQMVnp+wvgTv51
 JSgZERK2TZuLs3joBLeqmRQY9mjVDbulwGQcCRmBHTdd7mIbTC8hHUl3LTWsxdQQzpBtwDIbbna
 a45FOhabx/cTLKhclJcJ4tk2WtUJQKgIlxUjSEOuMwzO
X-Received: by 2002:a05:6000:2805:b0:48b:4c8:7b07 with SMTP id
 ffacd0b85a97d-48e6e306d31mr1000393f8f.52.1793309768903; 
 Thu, 29 Oct 2026 14:36:08 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e6eb25dbbsm858997f8f.2.2026.10.29.14.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 14:36:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu, 29 Oct 2026 22:35:40 +0100
Message-ID: <20261029213546.1783883-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for, 2025.02.x,
 2026.08.x 1/3] package/mupdf: add upstream security fix for
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
