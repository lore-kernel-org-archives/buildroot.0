Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABDACA5FE6
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 11:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F0C80CCB;
	Sun,  4 Oct 2026 11:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrGMW-WMp1N2; Sun,  4 Oct 2026 11:37:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 63F3780BF3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791113874;
	b=TSfwi36Nz2ByYOwD628L/mS/TzyFHwNO77cHWI5vocI3nkjn0faSIIG07vptME1vDIiP
	 uRp63d2RWV+r+JDibPyVuDtcDzNfyUEhU6Gfgv0kzUkgqGSjzKtqqzX5rVVWxcrIZ/aAR
	 BHTrtCSAxeraxyUbiuo2NBnQEWGEG5jbbIWMRaDyKPbbwBa+qeoRW3KnA4kuHKu3l+6qr
	 1fuX5kjMBtCMdiiqpWngM9yIbSI0EVgABIZxKU4f2YS9N2JDaJWUCleZ4f6ImA5cDDUtm
	 3CIs17FWRDcHdCNTgZVI9kb4cet/+dFyhgnjs3svgrDaHEYWX9kWAIr1WsqnGJrOP3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791113874;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9JtSi48OlZCRpwspzUvt9QeqX9pP+aUA0fjN9LJz2jQ=;
	b=AQcziWs+e7oPzO+DlxXM/fl7Ql/iGhVSuEx9Sn3ZOqbSiU0dhRk9p7pprfZnu2lYVO/7
	 1o6WPIuBGuWaByEU5DkfvVxTbxrQR0gb6ckMVz0q4tVFwL/WfcXngWKZGVpf3RyepmjJt
	 GSDGjjAJCQy9IUIWkbIXoALX8lMmEyAQv6qw87tYEx6jLVrWu43t6gt82xfYIstdqzAZu
	 EQp1A7C7RoPVvgPxQ+6LT6HsCRl7eoUNAQl1YiwfcnnosQMhD6Wuwjpe5uPp/X6asKl9H
	 8Hqr3eNR5nVnSgjhVPd4M3U1IUIgEZ5p606I9U8qe7f/BiqGehCFEGRRT7lJigZPSvw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791113874;
	bh=9JtSi48OlZCRpwspzUvt9QeqX9pP+aUA0fjN9LJz2jQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=PPeNWaocowAxpkBRWtszJ9VhE8n0wai2BVUGgusSxD1YSUeoVvS0SROC1LIlJ3dH4
	 i0gTieCGgTyhYM6v1AStJvHXig2CWEumUqEw93iuABDf+0v2CTDwt9AGnHgrYd6zkm
	 9fa7ZRQRzamB7mj1Xp+rUH8r7G/Eu+JZl+iX9guaUvfONFdbjhpIhDeqxAaYA0ShtU
	 sdyxNLm1DohotqS1L16zBM08YE5oWOv+iVuycMeqb612NClcpP/H0jwF9wFlswATRG
	 8ZpgZmFpDuFyXlv7kaQDziFpNRk1FEeGcy8eLMFdTohnHQu1PFiAlMnA1il04+Zpff
	 2MaywFgzUN8gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63F3780BF3;
	Sun,  4 Oct 2026 11:37:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96CFE1A6
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 11:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C4F2400C8
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 11:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id thlJRYntaO_y for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 11:37:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 26E9940049
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791113872;
 b=f4zt1t5Du6WM+9gYjGGhecjShlIEmLfzc8gwOY/WVlUo93qixrmeqschE7/uuLZVzjfp
 pH0n30HvGIiaNcYs9HTo/h5GuUP0jdsMEHK+f+RJ2BFSnlrkhwMWAOJBt++qUDmXD7kxm
 Cq4KVQ3iEwNrkmA5NjQXAyjGsyoY6jSgSJ7pe1iNB/j9gHzj2z2j2fn66OhL5kcmJtKh9
 7auS+6GfDwyCsQ0MgdwqeCuAnzEyash+/Mb1xTP2HNfKcpQT1ufPfhlzf5fKzG2Ul3YDS
 yYVOOtvaL1CJh2OUmJawwVmuogWbvXI2flO0v1Cmdn9FbO7+X66UFa6xQabzyhFOeqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791113872;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mMsCixwlI3hcYcX2p1B7RKgEsnM/lewbhsEqhPBq1LA=;
 b=Pfla/50hnKFdvr6P4dVhYlxEzV4F/GhmTNVAGi2DM6sZFIVodhqin0NOKU0RvvzlPke1
 AUy9YZgCyDDwzfFdPNEfzP8m2oMyjDrH5z0bp3ZYurDjHQhItp4xoXyxdf9mA0vP4WJQZ
 Wk67IWAK+7iVp8itSTui2+MhSL7jqKrr1piaVFjyAgbSSPM04phOCuSkNLMDFA6WsMMLx
 4t1mund1W9qP4ouYszqH1ew/TzhM58anqX4XCQymWbxhFbXSAsONNbB7mCz9Qprgu3zCx
 2OH3w5x8qU1iAU2mbsDeVaCA1BSthec7nyp8Vi84or7RTKpEcWwR47Cmd4M3q/4f2Hw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qqMaUmxJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qqMaUmxJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26E9940049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 11:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791113866;
 bh=mMsCixwlI3hcYcX2p1B7RKgEsnM/lewbhsEqhPBq1LA=;
 h=From:To:Cc:Subject:Date:From;
 b=qqMaUmxJmIevIssc9zuiy2ZqBfBltBdr7v5uvnKWpY4rBrw8/KaUqcII8Bla+jvIL
 WT9hp9CIk+AKpe1w0m4Ic833xUElxseYHuNq0HKCA/HM+ZfrDR8k6qk00SrhOLMQjL
 owaPvKobhmPfwHDa2/e9uLYxevAy3eQOlerH0RHBgzm5J1KwReC5LsuqlxYXOFeMXC
 XzpxTdTocxCKGjMdiajBFp632wjnUGYrAaJ9sPRYkN9hGbHYybBASqkspHEAe3Dy6U
 20c9IAxFgH3PxLjlfsjwFtyUbywYvTFznaPKRrgX4HC0MtOQB1AkKsvK7pNkj5l8X8
 87B2HMCTbfcSw==
X-KAS-Sym: v3:f51bdf72230551df:OoILjybwGXZoHqZ4KV9wodndrHO0bxE29PO1Ov55Hz3Iw
 N5xFMGRAkGC8oFbvvu46jEzsS8ggTln085N6SJtLfKEJ+zhDM609G9nwCaEf/C0LIRYWzYpdINT
 KtZkfsxodSz7vusLAJF2qJhv7JVephcxz4sXPxxFK4633Y7JRqA1Zlv3oi8Bd+ZXXXuYxnQA+ON
 YSCRL8UGvoCJDYN607CAXmy5KUTFCVk0C149r/r9DyySf/akhjHWhw3B5PgsyIO4upF4j3IcMJe
 VaxNMz4z3WH0jOVs4AHdVkhyeKS1oFoP4hG+fZVCppjTAPcGGLLvEzfKFrmB3JRZsgbjWmlg==:
 3Zi+ia4rMqcjYu11x3ymIqFSM1AiWaoIfBJYusxvCAvC+3kx8OtnkzTTbHLI2Lpzzv1JRaju0cW
 6o1nEtQTxPfE60OjmWBCmB94mjQTdLU3/qtrAOuQcX/maMkVOPi8nRMYY1XxhzgcUJuSqS/Rgxn
 U+/vGznAASnPL7KXxrkPuTzPpjsDQVPAHaoidSx/R8sQnm+PmTPtum/LO0JzHY+cOM9mxh9sEeT
 BgbawBdToyQy2Jeq27/tUpCav23JAs3FQUNTxuZYXc11azS7SnoWYR2Hofjd0NKu4/zzIpWY4qo
 +c3TXFVYYIbQxckfhHr+LiCGZRdjZLre+ijpBhXdfkLQZK4uZMKfDhsQ3Ozp8fGpwrIbMbI25nW
 0TMnGwqp3QZ/g2iNtUTzIE6dBzTjihYuJ7KXNnPeWf0nFgdwYTqyxVve0W8ppWi0fh1L2QlbiKc
 fYoXUVO67nHGYSh3hdwL3dVFhrN9d8xttfsezssQYHHlSsz+fCoq/XOQMbndU358/3sdgzEcjsU
 Iu2VT2j5TRwhazslXXlZpBejARxop14s+mgelCG4g7GArWGIkScYmR418V7XX+XXQ/n6sS6kFJn
 pGlx0nywhuWqAIFC2PXsOPxlumCUgvFyU5nHjgUW8g6LXHARIoHW34WoY/l+AN0pq7mZvRwNm7Q
 x0puZsAlyGbSFKYVIHA==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BC8C5A4C0598;
 Sun,  4 Oct 2026 13:37:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34504)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xDKXK-00000000817-2qsO;
 Sun, 04 Oct 2026 11:37:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 13:37:46 +0200
Message-ID: <20261004113746.1547816-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/python-sip: fix build with
 python-3.15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0003-Added-support-for-Python-v3.13.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/python-sip/0003-Added-support-for-Python-v3.13.patch

diff --git a/package/python-sip/0003-Added-support-for-Python-v3.13.patch b/package/python-sip/0003-Added-support-for-Python-v3.13.patch
new file mode 100644
index 0000000000..d05e5d8a84
--- /dev/null
+++ b/package/python-sip/0003-Added-support-for-Python-v3.13.patch
@@ -0,0 +1,56 @@
+From 7a345846465304d311c717c27940223700aef0ef Mon Sep 17 00:00:00 2001
+From: Phil Thompson <phil@riverbankcomputing.com>
+Date: Fri, 24 May 2024 14:08:26 +0100
+Subject: [PATCH] Added support for Python v3.13
+
+Eliminated all compiler warnings on all platforms when building the `sip`
+module.
+
+Removed calls to all deprecated parts of the Python API.
+
+Resolves #22
+
+Upstream: https://github.com/Python-SIP/sip/commit/51f3e60007f54fb5a96d649d16e36195022c00a8
+
+[Bernd: backported to 4.19.25]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ siplib/qtlib.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/siplib/qtlib.c b/siplib/qtlib.c
+index e166529f..258aae09 100644
+--- a/siplib/qtlib.c
++++ b/siplib/qtlib.c
+@@ -132,11 +132,26 @@ PyObject *sip_api_invoke_slot_ex(const sipSlot *slot, PyObject *sigargs,
+         Py_INCREF(sref);
+     }
+     else if (slot -> weakSlot == NULL)
++    {
+         sref = NULL;
+-    else if ((sref = PyWeakref_GetObject(slot -> weakSlot)) == NULL)
+-        return NULL;
++    }
+     else
++    {
++#if PY_VERSION_HEX >= 0x030d0000
++        if (PyWeakref_GetRef(slot->weakSlot, &sref) < 0)
++            return NULL;
++        if (sref == NULL)
++        {
++            sref = Py_None;
++            Py_INCREF(sref);
++        }
++#else
++        if ((sref = PyWeakref_GetObject(slot->weakSlot)) == NULL)
++            return NULL;
++
+         Py_INCREF(sref);
++#endif
++    }
+ 
+     if (sref == Py_None)
+     {
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
