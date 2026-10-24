Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E6D606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 18:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KUSvDedd
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D18B812BB;
	Sat, 24 Oct 2026 18:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eL33DLzsYlIS; Sat, 24 Oct 2026 18:10:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A944C81297
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792865451;
	b=McvOomgciJdDjqEIl4bB/9VxEeEV/eMDmXDWpT4f0479wwdGNgCK41/ft+Ntq1cHQJO0
	 /7T0VBcpfxus7ECS/bhoe3+2Y825icYw0cpnjCmu8f6LIt/ox6gVgqw43JVc9dNeex0w+
	 eyV8xkDnypxfIcSkdpl+rJxqm9THkAWcSc/WJabNRuz/sO1WDdPp6PBRISQzAd8iBSjZH
	 Qf0j0kXZcrnSmnHHzk/Fv5GE3TqWvPhbp0PQGcGdx8KmfPCIMg3tYt06dddmGrWbJ5+vE
	 AiYDPFQO4z4SnMg9KMvItFqiW+YVRIA5z2YIkSLzsteiefcvshYRyEB+AdpRZkONJUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792865451;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wyAkunE2bi3DiaJMbTKRjRIczcUtMsJWefEeJS63FR8=;
	b=jNFwu0AQABD3Wfxee3rvfjNkXprfhXLrXoRXMNhlycXrD9d6YK65YAjmAqSBcNP9nMrH
	 ojjy0bus2WUd2z0713PXqH1oW8GqrFP7PqKjNg/KqDPsxEfKugA06clxJVCQyotAZ8cJd
	 rjhy04ZQA1oXFFc4eeAIbAT3InJoHf+vqjL0JhJquj/r+MlB4COMqzcKXzVX27zlQdTKq
	 CMaxigaVWJ+VsJY4mvYP2mcwLLtEOqX+mlJnYm4RuCkGY4jbsk0MX6P8zgzDOkeaDgBiQ
	 NrFv7u8mQOwnxuTkdqa91q5ZA1TI90vUc5AGeNs4GnZs5vD8lnNqoNYPqomNPnmRsSw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792865451;
	bh=wyAkunE2bi3DiaJMbTKRjRIczcUtMsJWefEeJS63FR8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KUSvDedd8Sf1FDBOx+4L2rq5lP0wnn4nSc5kIZIru8pKYNoiT6xZAofZ1B23IprcI
	 uB1h6ZWw51lAERrCga6WMDUH9kPQr3wgp+6oPvqy9T9QzRnMXx+n+nyIMtuGnA5hDu
	 xMWMgB+i+yC9QdYCmMfZpNYc4EeUh1KeE6tOURBU7BdMekt4avKA7T3R6rJQ2CMc2s
	 HmL9bKSRdlsltWa82Nxugee2R7K1fJo0kRsOMjPJcU8XVmTYpw9OzlwN/gisnDlGqT
	 ymko7Gw/F6ZJncj0n1VpWsKJ45hSpuwlggM0WFxhsKiSTTeyuiw11qk8uVrLdWTGOB
	 kWXbQHYZA+D6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A944C81297;
	Sat, 24 Oct 2026 18:10:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 062763D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E02D34009F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-7irhnuc-mp for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 18:10:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DCBF140049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792865447;
 b=J8f9w3Ex3lFDOY/Dzjg8+JJ9zN6da+FHiF1LErzZUdf05bPjSmpODMnQ8+q2Sgf4FUpc
 coBZ5VaMUHizlWVPBCBORH2n6AzXqnRQBWdW20trk6Rc9tJNGsn9/xTj45wkYqAdmgtdj
 zZukJIfE36Jdt5JuaCeyZPJWqDBzQ3wNnAFqmS7n4/dLDTLYxWe3pa/KEKQs34AVIPfC2
 riEMf8b7jl+Pm8tz90+xPnUGgtB1rCfNd1Oxb5C7pkDvUixFlqpNA/Z1Vj+Cs2TLGI+1n
 +bZx1V+Ub5KD5ewcZGhU2azuSFHdImWT2EY9RMSQsC9TOMxNcEtKzmnVj58k+x1PRjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792865447;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9DCuoMg0YQotyGewazPM6JfY6J/x5Uw4/EIDBF35RRY=;
 b=cuMG3IKZPtEnPlGElJ/LHsxbqy3tpy/SqPdhUew6mjpBpXlq0Ge2LZ9F8TgT2fODypOQ
 O/ZH+Fvl8PQDKPOhwS/52p9fQZXCDDEy2koIwl8guUjaFDDp/nRob1SeWyxGPIHwsCe+P
 fd2F9zg3sUQIjeKMnNF03ewqgGLQtbwnZpyxTX2nVDNpeITZtO8q9/YmpNfddF+Tlb9ko
 UZRHpnVShkxWoWbNXErRhYmbXyDOcYhvF2SXrTJ0Qspv9uu+Ix03nGMLbpovVUqf3W+TG
 Sq4q+QUtt8OL6Pmyb+39QWbTMcJsZxIqIIVfvZVK17CrAzvxImNMccgmGy6KY7fy0xg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCBF140049
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:10:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C05899C8C4; Sat, 24 Oct 2026 18:09:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 19:55:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d149c991835a090557c633e67c1b8d5cedb9c4c3
X-Git-Newrev: d72c97667a38aa9ff6da75b318e62bc86604b9c8
X-Patchwork-Hint: ignore
Message-Id: <20261024180922.C05899C8C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-h2: bump to version 4.4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d72c97667a38aa9ff6da75b318e62bc86604b9c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-h2/python-h2.hash | 4 ++--
 package/python-h2/python-h2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-h2/python-h2.hash b/package/python-h2/python-h2.hash
index 5adfc86f52..e330c1bf21 100644
--- a/package/python-h2/python-h2.hash
+++ b/package/python-h2/python-h2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/h2/json
-md5  b4781bbaaae609aa759565585718e0d7  h2-4.3.0.tar.gz
-sha256  6c59efe4323fa18b47a632221a1888bd7fde6249819beda254aeca909f221bf1  h2-4.3.0.tar.gz
+md5  8ad21558fadb74bc42af25681c9ba7ef  h2-4.4.1.tar.gz
+sha256  4e866ffb1a869ae14dd9b5e6beb5c24a13da0495ad72b65925ded182521c1516  h2-4.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  7a65a5af0cbabf1c16251c7c6b2b7cb46d16a7222e79975b9b61fcd66a2e3f28  LICENSE
diff --git a/package/python-h2/python-h2.mk b/package/python-h2/python-h2.mk
index d9cfbdbf92..38bfb4fb9b 100644
--- a/package/python-h2/python-h2.mk
+++ b/package/python-h2/python-h2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_H2_VERSION = 4.3.0
+PYTHON_H2_VERSION = 4.4.1
 PYTHON_H2_SOURCE = h2-$(PYTHON_H2_VERSION).tar.gz
-PYTHON_H2_SITE = https://files.pythonhosted.org/packages/1d/17/afa56379f94ad0fe8defd37d6eb3f89a25404ffc71d4d848893d270325fc
+PYTHON_H2_SITE = https://files.pythonhosted.org/packages/e7/85/7c366e69d84c17bb778fe41419e1fbcce3033d5b7ce29bbffff0a98b859f
 PYTHON_H2_SETUP_TYPE = setuptools
 PYTHON_H2_LICENSE = MIT
 PYTHON_H2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
