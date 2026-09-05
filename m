Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54637C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 12:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B472640C9B;
	Sat,  5 Sep 2026 12:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xb7XXDs4EJuZ; Sat,  5 Sep 2026 12:21:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7A53C40C9C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788610896;
	b=f/M/c3kAtIvoA/FbmQf4a2h9k2OQr0MxdWJmVrkjxj6Q9MLQFDZo9Vqr5+iYCcEZxCEs
	 YKgwYFSa84z4JP7z66TI0C/7oukcXo9jgkVSS8t2Etq9NFpL0wM/E7GUZCQZ/Ee32kDPW
	 LDvKITw/cHzV2eWc9/QSOGAxTrbaQ9kjPj4rgWLI9/1vrAzxkIdhAFSbUkVpKPKMYQSIJ
	 YtabMV/tZ0hedEJZkY1lvKNJ484HzoJqKvhEKxNO0NXmmFXcWW7M60KMgiF+A+7gEtHe6
	 wGV9TE827Jnk3lyH47FXo+XVWpGb9FQGJr24P90ZnyUrOzE9Ry4wNlt+BkPDXRJVCgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788610896;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IhSEP0vxKzAvejusRBklghM7TUrnZpiGyKUbWcILKic=;
	b=F7qU1FSA1RJM+laJ85ubLH72wp9laPIMN8NWRhmyc+xOO6NoUaRoj40ghVLuq5GCRP+y
	 rAnGqbxWyziXp6onwFc2P+EBLAcnEajUaIe3JLoUtzUOMYxQAx5yc/UbcijRCcWQ13l0J
	 CSvhZq3VaPIGfn/12lUyJIDI8SKd9aRLLZFR1EyRxsJRFvs+fbWhepwtTs0n4y+nRVywA
	 of+VaQTzO4auJxM9OLgxpNqgzdIUBR1KMtNi9xN8QeyB48sSOs7LAVXUzF4xht9NUfkVR
	 l4N7q0eX7aoWkYgCnERg5F1nVHelR9kesWbc2a8NC/0IkzCEZ01xWItLSZFfN40OQtQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788610896;
	bh=IhSEP0vxKzAvejusRBklghM7TUrnZpiGyKUbWcILKic=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=di/XJqlNzg+4P5tYDNAb1dbQ6ANEw6ADcfwuQAjHpPCoC/uitq99p790m1VlmKr0v
	 eOKNuf65+oznIxOvkky1xtw9jfSkcnmAEprMgy6B76zsnImmk4S0wTiieu1FOU+SCp
	 5mgFTP2oUrhU2CJRVyq924Fc4oscnQgWD+JV6bhZS8EAUH5sp36bpFeiZmQ7PVt1E6
	 BblnVNkZNipId61VDw7UIgRznaCh4e/h/u7jJlKzc1Wq+DSe4S7huA01mH7Rq75Gv8
	 q/G0sVaTzcK/3wcq/JO6hgzMgrMr6TyFfw8+OjBEGyjTywpPn7NmEp9ALBC/dvcAd3
	 hN8p7xAnxfSSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A53C40C9C;
	Sat,  5 Sep 2026 12:21:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 918AE49D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 815B78111C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_KoCoAaKxKg for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 12:21:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 94169809E7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788610894;
 b=FqxgrOXO+nIfZ5Vb9EKBVGeAqgYCS5anZOJWi5jkTloGlymW+XGI1V501/b78jqXS1OK
 L/42XloLL8vCtyTPFoE/P3nOe+/0+4F8vTFpN3daJs+8wCYgRKbKacpKUW5Fpt9D1rrpO
 SCMjQJnaXHpWIprL0KGTeRfIltx+pQ7YxL0rWXOHM+b9TKrljMPTOMzsxdKlLDiVyyLdL
 PHC4j3h2hdgRak/Cd1ceHAbgwu/YGAfBAJWqrFY1FB62+mlbnVXnUCCvU6nmSOM2o6k+b
 fSQJCUy1HdQIOH376uEWB0ZVx3OEZ7twgMU2QTjQTQRA9UMIUhtZhStgvMYF8IJ6y1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788610894;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=xuaeO0XsyCi+2ovs6NMD6l3G2qF37UEbSQsfKLULbN8=;
 b=EgYkGppc4mpgt69cUA41k/PuMM+m3KWbHSPmJnWZtP6muRtemg2XUgXU1y0UznZAizX2
 ZBqKqf5q/UpmY8gUFLeV612dlN7kp2/ObmlTqa4dJOKYAPpiSlEL7ZtZs4boNSp37rJQs
 m25OIMdnyQzwrsdUbT3rJT2JJE71sG9tyZ5ClB3OgnzGf8gXjqDatWZimjsLrwewJuF8N
 LpAe6DyKZ5Cx+b+jeYqDqg00C8ZX8bkRRlEnkL3Ch3kksw8BPU/1voPITOkBbIXWTQQk6
 64gHsnRYnnC+kZ/prZqrvXm2WJV8zR2+o6nhVM//bzi9nfQhderiRB31IZfesFif6Fg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dbodL7D5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=dbodL7D5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94169809E7
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788610862;
 bh=xuaeO0XsyCi+2ovs6NMD6l3G2qF37UEbSQsfKLULbN8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dbodL7D50VYJby/owf1F3g1oN7ba9PvNOEr20J/qVnTqW4naZJnF10vMC8sCbcGjW
 763dErjXZePTWPQFzUIvq/ahxxbBmjRy20Mx3epwHv8cQVQd20nJenft0zlwY0wr4r
 o2KScvOt5T3FD71D5lFadIGooNdyCjSDJlABdB4sMerncTJtUHDWBlnJlK3rmUB/Xi
 OIK/RhgD3o73y7R32r+rSj3vzz4CWBfSp+aVBrDqRidxAxTbIIyUPD/aHoCRuOfEZw
 /awyxT2yVr0SY/ZkpQQVeBEnN/7ytVuHBCCHMKi1a7e0qiepGawmMGeWTWtij11KvU
 Sdw9QAsv2wiEg==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0C4E2A4C3355;
 Sat,  5 Sep 2026 14:21:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60364)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2pNx-000000006UX-1CZd;
 Sat, 05 Sep 2026 12:20:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 14:20:38 +0200
Message-ID: <20260905122040.2054789-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905122040.2054789-1-bernd@kuhls.net>
References: <20260905122040.2054789-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 6/7] package/trace-cmd: fix build with swig >=
 4.5.0
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Daniel Sangue <daniel.sangue@sangue.ch>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...Python-2-C-API-macros-for-SWIG-4.5.0.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/trace-cmd/0001-Replace-removed-Python-2-C-API-macros-for-SWIG-4.5.0.patch

diff --git a/package/trace-cmd/0001-Replace-removed-Python-2-C-API-macros-for-SWIG-4.5.0.patch b/package/trace-cmd/0001-Replace-removed-Python-2-C-API-macros-for-SWIG-4.5.0.patch
new file mode 100644
index 0000000000..5f792c9194
--- /dev/null
+++ b/package/trace-cmd/0001-Replace-removed-Python-2-C-API-macros-for-SWIG-4.5.0.patch
@@ -0,0 +1,32 @@
+From 797a541398bbbd55a29ac22ca3fc7271d6627aa5 Mon Sep 17 00:00:00 2001
+From: Jitka Plesnikova <jplesnik@redhat.com>
+Date: Sat, 5 Sep 2026 09:34:04 +0200
+Subject: [PATCH] Replace removed Python 2 C API macros for SWIG 4.5.0
+ compatibility
+
+Downloaded from Fedora:
+https://src.fedoraproject.org/rpms/trace-cmd/c/eff667a072e69238efc469775585b1b30c056187
+
+Upstream: https://bugzilla.kernel.org/show_bug.cgi?id=221966
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ python/ctracecmd.i | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/python/ctracecmd.i b/python/ctracecmd.i
+index 38564601..2525309e 100644
+--- a/python/ctracecmd.i
++++ b/python/ctracecmd.i
+@@ -218,7 +218,7 @@ static int python_callback(struct trace_seq *s,
+ 	result = PyObject_Call(context, arglist, NULL);
+ 	Py_XDECREF(arglist);
+ 	if (result && result != Py_None) {
+-		if (!PyInt_Check(result)) {
++		if (!PyLong_Check(result)) {
+ 			PyErr_SetString(PyExc_TypeError,
+ 					"callback must return int");
+ 			PyErr_Print();
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
