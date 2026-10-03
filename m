Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC510CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 965554086E;
	Sat,  3 Oct 2026 07:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnrN4S8hE3be; Sat,  3 Oct 2026 07:07:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B53994083E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011257;
	b=WxzlQI4PvuMyDwj6ElBbFc7aZc+nYzYoc9/HvWYMjkzJvFK98plkkQ4SqTrVJ3SFFaAM
	 Bm3tmLYZKzWDE7IEvgeiq1wSk1UydPsuyueAL3ryC0eCca6Dcw/2XHdZOs9oyu3s0Qlop
	 MGiIIGynkhzsL1HGnJqzmRkV9dQvkRvWPAh+KRoVeQJ1pqZBqY5bLgqvExH/WZ0ntDmyr
	 GP0H5z2yU1sr4xvqtB/nE9Fs8xcSwXcne141JnZ8utMyGuwSN1umwSjNlSysd8Xuv3KLp
	 dudWRMrpcPE9CnG5sxoKfYiOHl7MnETtMZ6TEq/qz0VSuNlbLOJ/PDc4ASrpLyf3v/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011257;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0vD/weyrpctRKgasMwr2M+ItCGjySaO3oUyqvjrJHjE=;
	b=ElLpSe4G22LqmFqE5Oj1B2XAy9JNSrmUwnboyKueCWjz+eK7+CoV7WgvWjKUfP9SierL
	 frflMXDEg07LnM0MIJzgp4jo3Sta+ix9Zcnfu8in1Xo831HPL6VbypjASvOup3toxB+9g
	 7samVBuo8UKlcVFKxEWzvCip5wzXGorFQqdiKNCotjYrSxi6h6M7GTxhkGRSZ98U67ZKx
	 F+WbfyjjAWETcG44WaKGAoOWryG68P7/UJWtfBIM2Thk7CBTe2lKaQXCzKMnswDytH59W
	 tKHv3uKpZk+qzP61gseSMXIppwPMic5VilCV/NwMBg49wohD19BGV3yZyEveUmEJc1A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011257;
	bh=0vD/weyrpctRKgasMwr2M+ItCGjySaO3oUyqvjrJHjE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DiL2yaI5XxPd2np3/fU0ofzQTVn20LuajpeQO9+uMoAyymcJ8KdBqcEabSeF2JxDq
	 giHURQxq4o1p4CyBtvIAjyDfqi1jaZHClHebWrBLyEnEcyAQjIYS6pWKoctM/BbbfV
	 jQvXpZ0RWaZx9LCLbUiWUIjblz09yGsKQ/FZNUT+MWnsfPURuvyQUjLsSfuGkm23ga
	 R7H67+fBw7GgchVkCplVBHZeNCm5RptBlxQG4otXWCUWwEnP7VCiakPah8+KBk02Pf
	 0T3MX+xd17zuRlvmb6bz5b4+mbAdDucv/1EJBPXVJjJRqsrR11cAQBxwH78Oie2BE6
	 h72j4wGzFsR1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B53994083E;
	Sat,  3 Oct 2026 07:07:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CF2B263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F57D40050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6UhwePNWo2x for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:07:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6ADEE40059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011255;
 b=DYVRK3/wZGf2oF3LVjEWwnBS6UmYMg3QMMvHKUrVt2IUz4+A3Dmj38SqNtU5jrJf7oIn
 G4dCDh4Gigt3Ms0PTfNfRv50bkZQ2WhHu2drLk6wnxDy+8f6HO9CLnw/3/FJJvK6Qo865
 dx/HkTlBrTEd0YKkNMRUYfYmxFnUdTAQ+MF012ZOMw+PRelLjJP24QjbdTArkduDWaB3M
 StpMDGAMJGQeIXedD/ikHS7RMFbiunnMFkHxKOSeAqpg0+h21m+/LWX95ImUDSUziMjoK
 vgkQZ0dk78iaZ00DvipOzMc9TTerwymWaObJcW8E2JUpSGRFdal8nTku0J3pHyMfFTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011255;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0eOzBO3T1N8zpiNjb0KPojzt//muRgK8j6YyqRjXfuQ=;
 b=F696Zp7Wupa/RoXcBmOjpsEJGJIO32VBU/U3aqmO6WtbHU6QcbRV1N9j0QfTlA8+LyZx
 QH9MZqO/QGjg9FSg/K8Zf0+KNlOQFLvqb6jxJhwcjqWAA4sXAGLCZ8RceuSJIiLr5ja5B
 IBmaiZLxwM0QaGOqrvQR8/1CmP65V9KOKGP53WUfaSR2FBhOB2HDkHQBrTrOSi/Nh58px
 L2rpm/k8EQISIZVR10iBs4yWp05gN8BvgHAcEgPsKZyLdtBObOTVZKxDpRAwSDsDjEBMG
 TgGwvkvTq3f/xE1ldWPi8wdzwV9uIRLCprCAiQuCPCftxhtBGpSq4aPp3Sd58enbYiQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gD3FqeEE; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gD3FqeEE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6ADEE40059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010927;
 bh=0eOzBO3T1N8zpiNjb0KPojzt//muRgK8j6YyqRjXfuQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gD3FqeEEBXC32N+mQOmwSO566DluUeLeuq2coHwKakkBXQpRIF8Ndq3vaeUjbiBYv
 /LzGZ+Okg3zKLVWouoaNlngZ93H2NwtsenYU03CQi2Z3bLjfLVZvurBLK3X+lz3PVT
 7BQxhDzWMvlRV5sX7XT7mGz1qtcArCn6VHl8kyfAoIbQewPWaRJs1yV6zUXwvnsQsN
 HvRmgQgu+fBBslcnhh+SRMgS3bMcM4s3ATa1M051Ku9vXCAOUWTiZV/MOc6GZZEgt9
 x7+pj9+PEiXG3JJyNZ5IHeyVuvV0Y1O3RmrGvAJdtmxgC/qZl2T0F6Wdn0V9/2BC6k
 GnVjM1seGJvPA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 qf3xVTWURpDZzN9Sq4ZnYFEIMaIqRNY9UhIcsX6FWXVHjm65EgcKafiEQERdCpDEvtzSnRhN2dl
 4MhIcLsbq1CWSVONu07M6X2LA/KN/R5/8eSInRFXh54Y/pXUT3C4tfQKGjqRVdcM/+Q857+/cge
 /KEKmVS0aVA4B3I0HEqHKGgPdsAEfdZ2OifDT9CUE7ykFu+Xn7Vw/FDz+XPu3sJ1xQd/r9aGu5U
 08uPqZcuxIGN9NZKhg0Lbv+f4pwbaixKx1D/MXLJd28rJuJgMqV1ME2jiTbGFl+33zmGcELeJNo
 VbuXRh9DEJKte82C29bBnQk8MUW+5PfMWyWlD4w9eHbIhvsLPdkt4/eivreWd7kBqQx1oQ+Occk
 68bXyKJCFqHxwSwlylcujNURP3XJvkuB5Qkk8gI9VVnhhKJHgfg43/c6fGUbhSUDOaSQLh6ecyO
 PT07fMCO1qqk22DfRm9F8TePsUyZIPUOrjdaQMBRPO0M0CPuvXfrf2ntXEU1iLu0QMKfLwdH4Kx
 S4E4thieK4uaym6UoPY3hwXMqrIMmosCwDMVvePddDnnLQZVYU8D9pniom3kIaVSHepn9+yWNjS
 yN1V/mJmO+r2YPuRAqgdYcl260qBoK471Ek/DHV87L53KO0qLx8ZVn4hdo6aYvT2
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 23218A4C5426;
 Sat,  3 Oct 2026 09:02:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkg-000000007Zo-1Ltf;
 Sat, 03 Oct 2026 07:01:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:39 +0200
Message-ID: <20261003070128.1295458-67-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 067/114] package/python-pyproject-metadata: bump
 version to 0.12.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../python-pyproject-metadata/python-pyproject-metadata.hash  | 4 ++--
 .../python-pyproject-metadata/python-pyproject-metadata.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.hash b/package/python-pyproject-metadata/python-pyproject-metadata.hash
index e107c11327..2f67cd111c 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.hash
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproject-metadata/json
-md5  f5f54a0951177667dfd7eefdfaa11372  pyproject_metadata-0.11.0.tar.gz
-sha256  c72fa49418bb7c5a10f25e050c418009898d1c051721d19f98a6fb6da59a66cf  pyproject_metadata-0.11.0.tar.gz
+md5  d44c15fd176128acd9497af2512085a0  pyproject_metadata-0.12.1.tar.gz
+sha256  8809a4df6fe08279b39a8890669506ed3158e0617855ac9aff098fcbe772ae4c  pyproject_metadata-0.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.mk b/package/python-pyproject-metadata/python-pyproject-metadata.mk
index 8e234f9be5..1be6856bcc 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.mk
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPROJECT_METADATA_VERSION = 0.11.0
+PYTHON_PYPROJECT_METADATA_VERSION = 0.12.1
 PYTHON_PYPROJECT_METADATA_SOURCE = pyproject_metadata-$(PYTHON_PYPROJECT_METADATA_VERSION).tar.gz
-PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/83/fa/8bf4fa41adfebd95dce360afe3f5fca243a17932089d3d5486e95ca44c57
+PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/4f/76/1cae539918a7b1746d624c2f01560b793c22cd8c081157505bb9bbf0e34d
 PYTHON_PYPROJECT_METADATA_SETUP_TYPE = flit
 PYTHON_PYPROJECT_METADATA_LICENSE = MIT
 PYTHON_PYPROJECT_METADATA_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
