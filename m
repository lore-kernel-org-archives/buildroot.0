Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7E7C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D75A640D15;
	Sun, 20 Sep 2026 14:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwcFwrxKFr7i; Sun, 20 Sep 2026 14:53:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ED60540E05
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916003;
	b=knPDSg0nJRLjCFrmhuXV76rET0UhnuN9zkZojOM/NQqr4T37cJ+L+esrPBDnq4JKTbbF
	 XwKpjg/f+Q4ZjE4lu+Zgl+5arU8G50FGXscglAaIuF545cMzUd00z4J0Obry2trZ0bAZY
	 ux5ihw+gvHAZCzW1XYRPvN0CxNB+HC7KNwyTXaumdbq3Atb5jj6pBx/awcVOesox5YAHa
	 ojZfrKtoF9OlBsA+k7gacct6GWNK20DBdeoDWquq+wTOnmqkIgEVTyW2vuRC6LmRfx5m+
	 h3Pa2x/uBaaLfSd2C9ALjZNtAH3y8M/yEHbvMMDPvaDXn2c3aHHTJDbIjk3uyzS4QuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916003;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=guRaCbPWBF0MBPBHpqYbP9VcShwEfgdgODXqZv7pj+A=;
	b=M5A+4xOsGNjjbpi4KlUT8wKQjmjPVMDKj7hHouAPfmFHoaN1bclKSim9mFFaLGWKjCu1
	 T1uPzqfjVXnz9yysISYVlHpYSRL2CjNN0V11RlCShKeRV+oJxNRDcdhuoIe7v2P17rQOG
	 Ee8zvAsEepIMo0CKQGR3U0uNP/me//Z9wIJtRwm1nsz/TgVa1JTwk83nPJ8ViKdj+svu1
	 dahINuF7avfwxd2pw8KLST8hRKIB/IWp0ZkZkO+FXHFl0Yzgd2HCRamTjhvgwFzDu6uLP
	 J/L2iVzR2dYQ9qOj2QDTMcjTJ3c1yiQ3ZAwjA1/IYEv3C+l7Xd4dMF5LMSHX6CJZc/Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916003;
	bh=guRaCbPWBF0MBPBHpqYbP9VcShwEfgdgODXqZv7pj+A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ldvl/mF/KZEWzIhThjKOe00hs65H/VTi7EIeI3QE6AVKVd891lnHRUtXNOOe9NrjO
	 IYWb1AOHBlb4t2uIEnGcY7cOKdfswPY8dI9OEWoKJJ+bxFGHzl0CiXqZkH8EN0kF+1
	 PxeX9G4+Tl4FY+hIo795yIGD1pp8FxlcFDhXcbqaa2K/DPo1igbtt7G2jF43Q03NbM
	 dCVJR5HOoDYnQKR/f+sMuK1UY4b0J8ENPh9UQfxsZGLT79VbZxXyiEbMipT4t9B+ga
	 n31MwnnPKFjfm7+P1oGH+z54+UCBjPUaPMePR815+o2DE+Sl0pXD/MDO3SMwbN410N
	 Qys2nxgs+s0JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED60540E05;
	Sun, 20 Sep 2026 14:53:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86EEF3FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D59F4002B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oljFLAJY9xlb for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:53:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 57D5740022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916000;
 b=ilHZuILK2nb6s6af0eWmzcFExpYlpXX8chJiZcjThtaQSEwcrh5NmPInhQKENkv5jqdH
 o+Puy2caHr47NQzgjEoRMKwO1OgCKXvbLYJl7TNsIl9jy3URD13yTDATJ3ShcbXtbnFaF
 NV9aYT59pq3T3Ggg/G4y9acQ85jcnBF8eEvJPOOPaL7S9kNjAC77AsLWHYBPvSFV3UbwJ
 GHcs3C9gsMNcdaOpHFRavLRA4Gd6/hFdD59Y5/NdVKoQe/zjGyssSrO5QmQKNx0RF7n7m
 9AxBA8zO+R3G8pg8bXt9NWarF5qt4T+CcLZWRfiLtqpkKocje9F72eaHwzx5uZHzsdw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916000;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=XhK/dpvVkxLyk/wa3SfzqUeYSLuuQjJ1v8ZuNGsD38c=;
 b=mqGVhE5nWmglT1Xrir++UT/0jGxAB2qpaec3Sp2tn1UfMfAGk8TN6oQT0ZJmGWjzuNCQ
 M8eowVnY0wTwghahZhawlIGYoUjwtKCC/PV8y1K17zPuXcUh5x319MXrmQJeMTRzo5lWM
 0tQc5oPS82e8I2ewAbnoDwIQEvgoIjQaqt4120pqxC35Dr9oaW1LFouwnC3R5qbkP4tBw
 tpqKHtn05C0hnM59w+ams2Ces1Y4t7KicCALWkRdD9p0N5cJuH5fGMexZUT/tH07Uyi5G
 9WfxqSkfBNn/2GXhjLxbZhQP9r6+5OOBnLJzH+OYFpDHiEOkYPX+NAsId+/3s2oVgAQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qcn4XSMN; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=qcn4XSMN
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57D5740022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915504;
 bh=XhK/dpvVkxLyk/wa3SfzqUeYSLuuQjJ1v8ZuNGsD38c=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=qcn4XSMNIR2lM4e1iGU1XlWrlJbdMWXNJZE2mUWL/DxPBZymJ05bLMXwNN/c+OpMW
 dHfEb1dpqm4MZ8yr0ypfYWzLTShIX3Zr2AWlAeO8YPOLDOQD7NYnkY0tpJ7HJrRJ/Z
 N4wDO+LxaRFTTyfovByHCVGu1EH0SvYc0sm0rTdnrOjmVbQXznswF5BmrWrdOLcPge
 XbG0vBPqKT+B+irGt7SeKijbuyo9oi2w7rPf0eKg32wwweKIy+u/6DcoZDnUzLDrj0
 e9v5kjt23oJ4UAk5OeMVhzPq1NB95bHZTpT9FNxXiqhRHAYdPb/nWrZb+V/X7MKqEL
 aoKcrDfnxJKyw==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:gAuyyFiP4ipdLhrgewsiGxeCI/jd9oA8az4LZrqEl/NN6w+gxfp9BUd1gWLa7NBZdj3cr5rEnKaTZpNuywhWgIO02eLv9Py32vhLTcI4iFUxLpUoR1rWM7LNV6UtWFOV9LTzOL2NhLokqpitmpoMibQdxH+J4zd74kJgHwuIvzLUP+825EU4OwDKI26XpM2BTNLKL6XBsu+FR0ZENVucXyzzyPDnKF7urO89nFb4SuGw28znHwCq2gvgN3Ey8bR/eRTc+VfSAgvqPFidYhi8D1pIRmUckG+bhz7yZ6Di+zKHy923nKCAVbAvPyOQCw8qI1w8BCCbALXMYh972RkosjHSZH3YQ4BdnNYoXzhwGfE8GU2N45IE6Rhn7EsdEYqaSK0iYl7JShlpOuH04kCmfR3n1aUPmnSB4Ovl7j3Ol0r+WWcYrxk1C+dsVLx11u2eRISXcnA/zaza8NyXSCzxm6F3Ja3PtagocRUXbdWgpBMnzBXy8jxx1RWM/T1RXuv7/dyLXRaKLWJablgeE3Kflsbmq8koAJTrI8w3hHxX2SSPnhx3f/om020cRZ4LxQj6keZ895eq5IjCEpkUhzgwVqOyb43HoAhDNNYOE8qwLwhhMA
 O1uH4zYVEUH0UIwOxcy2WfC2gs
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5037EA4C489D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imk-000000000hB-1Ep4
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:05 +0200
Message-ID: <20260920144428.3009612-45-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 44/66] package/omniorb: Fix build with
 OpenSSL 4.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/omniorb/0001-openssl4.patch | 63 +++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/omniorb/0001-openssl4.patch

diff --git a/package/omniorb/0001-openssl4.patch b/package/omniorb/0001-openssl4.patch
new file mode 100644
index 0000000000..984d5dab25
--- /dev/null
+++ b/package/omniorb/0001-openssl4.patch
@@ -0,0 +1,63 @@
+From: Colin Watson <cjwatson@debian.org>
+Date: Mon, 1 Jun 2026 11:07:35 +0100
+Subject: OpenSSL 4.0.0 returns const pointers from X509 functions
+
+Origin: upstream, https://sourceforge.net/p/omniorb/svn/6818/
+Bug-Debian: https://bugs.debian.org/1138480
+Last-Update: 2026-06-01
+
+Downloaded from Debian:
+https://sources.debian.org/src/omniorb-dfsg/4.3.4%2Bds1-1/debian/patches/openssl-4.patch
+
+Upstream: https://sourceforge.net/p/omniorb/svn/6818/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/omniORB/orbcore/http/httpConnection.cc | 6 +++---
+ src/lib/omniORB/orbcore/ssl/sslConnection.cc   | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/lib/omniORB/orbcore/http/httpConnection.cc b/src/lib/omniORB/orbcore/http/httpConnection.cc
+index 1e70f93..9da18cd 100644
+--- a/src/lib/omniORB/orbcore/http/httpConnection.cc
++++ b/src/lib/omniORB/orbcore/http/httpConnection.cc
+@@ -2554,14 +2554,14 @@ httpConnection::setPeerDetails() {
+ 
+     int lastpos = -1;
+ 
+-    X509_NAME* name = X509_get_subject_name(peer_cert);
++    const X509_NAME* name = X509_get_subject_name(peer_cert);
+     lastpos = X509_NAME_get_index_by_NID(name, NID_commonName, lastpos);
+ 
+     if (lastpos == -1)
+       return;
+ 
+-    X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
+-    ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
++    const X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
++    const ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
+ 
+     // Convert to native code set
+     cdrMemoryStream stream;
+diff --git a/src/lib/omniORB/orbcore/ssl/sslConnection.cc b/src/lib/omniORB/orbcore/ssl/sslConnection.cc
+index f02f3f0..d29d2b8 100644
+--- a/src/lib/omniORB/orbcore/ssl/sslConnection.cc
++++ b/src/lib/omniORB/orbcore/ssl/sslConnection.cc
+@@ -548,14 +548,14 @@ sslConnection::setPeerDetails() {
+ 
+     int lastpos = -1;
+ 
+-    X509_NAME* name = X509_get_subject_name(peer_cert);
++    const X509_NAME* name = X509_get_subject_name(peer_cert);
+     lastpos = X509_NAME_get_index_by_NID(name, NID_commonName, lastpos);
+ 
+     if (lastpos == -1)
+       return;
+ 
+-    X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
+-    ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
++    const X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
++    const ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
+ 
+     // Convert to native code set
+     cdrMemoryStream stream;
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
