Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016CCCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B224A605D9;
	Sat,  3 Oct 2026 07:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzBhmcExXUUo; Sat,  3 Oct 2026 07:19:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CDEA860DAD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011961;
	b=eqmKFxgGL5bzZketretuZOzwPONIjaqoQkDptq4276EaI8gGsq3CdRHaznNxcmM3rYPl
	 ssETWXetQJ9N/HPKlUZrEcJQ16shJRq8J5kDS+j+RZVYvEycB89DzigG2D4fq8YBxn/kx
	 5Iem2XHIuFRDocJ8VbY6SQb7PyB9m4gpwHP9wufKZY13tGJxFl0mU8jChbVipWLdDw5KF
	 eiLDW3quB0J/YAAV7BfYs8uOAOYRoy9PemH42nsNXxOD/NIiq4eDwhe+uTDhL4KtGX1AJ
	 rxZ0MqlaAqK5yzcaB9Pcid19Sw2oxKMB6ed7ns8riFgsa+FHbmL3ifJ3NfhntW7WCKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011961;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QlCxAPBjdhMgcWuNlpsU/erGB2QADGu0KkntQd9iylU=;
	b=tdRbtmZsTDfbtbctsQwfZY59mHbPtO7BmpiWBkpJo3ZTUl5rdt/jVZjKraQEr1S1UzCk
	 WC0vN3IRqOH0UdaCpT9xVcND6EfVAqQV8/Rp9nTtLp+S1laOrU1oUCaHvldkA06ju3lQ9
	 Dt7vWuUWoyStaEr4TJMljgPkPnVWzZxPzyaSRq/8U7D4XGnPvMGJjg+PLPOyJyI54tJ7C
	 O4twsJ/z4Og4iPzwOBo/JKewfK4HYkyXuiW5jMrTX1oxx+F4IU9F8ghl5Xp2uw65gaPtL
	 52BKiyzZF7lAwABw4m0HDNdHNtyPGCx4V4jWQjfTJF/06QF89hza7AxCytZTPiyZQIw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011961;
	bh=QlCxAPBjdhMgcWuNlpsU/erGB2QADGu0KkntQd9iylU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Vr17o7uIPbwb2o1jtH13etKCTrpw/D3lIQijaq/q8t1PKmJ0pwfOcPQhh8njhQpLs
	 OpSK5mk3DqJbJxDq/DznjD7MSaH0dXT5DBwbr+6Ez5IEqNEM4w0GRGnacCKiSmaG/F
	 mXGuvtVKy67cG9pbsexXsMCp9Pd9QntptUSsbwHwZYVioBp67qSvntZXk+PGAs2GuX
	 yQg6oqEAng6iYCKEAJrRxGWpvjbx6TN9wUPD8ot9CyAarh0OClMHzZaB0GDK76UoPe
	 alcimTFleuKLUoZ/IMKbYkhkKTABcRlrW10ZNKRxcDHoE4ZZ//ZnfUElHWRDEAzM0d
	 QPf3v0YMXWuQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDEA860DAD;
	Sat,  3 Oct 2026 07:19:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D6F81D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F70C81183
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XuQtoUfvwuWE for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:19:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7523A81149
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011959;
 b=bOaBeC3/F4UhngmAellj3MhgvCpnGn+4TbC1PZt7QDZQP9ujLlNtCrVM33ULkPWKFS5u
 pApgAzTgAO4rYBIMKfUYeo3EhGiGSZL799abTVVShBIZF6pp6NnDLTXO/7u6funLxnWoc
 Bu0DlJkNadGeBttw+VjruorLfIEVfvrHAWAFcLE3HJvyuTvdpL530DvtMPFuGn4e+sBS3
 3ISV5u88VubysH2OOivZ9oNPdgXRhDky00aLtZFOtrrWpnXMOCQ3Hn4kIRwhrlcXOEr41
 Hmx1JTjSDdun495t7qtYryB7ABeaqszAJbrArJVL9VFLvgqsD8LsjBq3z0gYJn0Z6bw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011959;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ydlPjayEZYxH7HsGzbUjPoUNq/IDAp1XSDh+wQjdWXg=;
 b=QRP90B8ZR2ZTGReoAysN+zNP3CkYjVcmheGbXxw0lXLdwsPYG5aRnhDfgWMgkH+jqUX7
 ee3tB+/ph5SMTd1U8y6HHpRhGBaricbEXDWk2Y9FBFUagRfzFK4bAkTZ1hoR74gwik8zO
 yOiuResOMwimhJSebTIEHaUlF6uND88aSUECTvuF6Y6B1jw/Rvbz9lQG4ttqF/+QUdZG2
 3aRsiHS94dN3o257a9/1soBHiYW5j85B58a+CbKLZllWJNnOYaymmZWq/R8/OLBe6b0LG
 r8VGSHrNtjwdqQEXih/PPyqP7KRT78VR3dULabG0W8k80888CHRIpK9cCgc29X0PjTg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Bb9aYjBk; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Bb9aYjBk
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7523A81149
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010938;
 bh=ydlPjayEZYxH7HsGzbUjPoUNq/IDAp1XSDh+wQjdWXg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Bb9aYjBkSkQpBlRPJXu3N3CFXc+mKNii7LZi1d/M1Rs40uwTCGJeCwKfqQSSXchAf
 BkpqZ9gqWMB1+GtTC7ey04wJTfg3fbTuRXAlEaQFL1vNqwMMl7wyHI7AWQA4UMcuOJ
 8JkA/HVmNblr9wrSQff4j8u/gYLMEDQ9nxgvISJWSiSbFXngD7hy5KrVgPcYnefpxm
 Judt3h3QvtxaS4B9hogETQeFoCqs8hy+gzPv4U0FOW1nuDQ6idToB3gRF8RVRQBMcc
 PJtHg+e+Yy/lKKdblys6Kk5PWqqsC37/88SeD3cRYcpWuWgfpn8umu2BLWPzfb3q6L
 gVEvwPx8npiKA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 mUCMqC9XIw7kdN3HjdW0vYBJxn6tyCNPWAcHGYMfKus2MC7huziWRmgwV5o9MDpx+olNKNsoz/P
 szggR0PCtmhGPu7uJhyqqUBdem6XYuIvVHOAkNtORq2S7c6hUFlgnlVuXiJKUJtJYKuICryKsR8
 LKQG38CChhAg53/DpjkufCCNJqiEbtZ+qRcDspFnkbOxiM87VKgPOZGl0kIIBzUTd8bJJaEbf2h
 DbsS99eqmaDnIazS9A98KbrpPT7Jdj33Es7b0ZNGzF1r01l4J5qdvGFdUExEGS0z+wXLSSgETm3
 dfoQnX3b23LIsrN5uR/SIdJN31ESs8d/ugImiN7WrtpcCZiwcwi5lZMDsCdc3Ov7hqnZ/YTHnSo
 vbAfMRbWQfAxNpMAcFW/DkqVKLO7jCf73u3Oc9yZ1+D55Ab6c/M8t+5zex2OalXe04hBbENwP0p
 5oQt3D5B5P1ZiNHSGGrst1X3bp+bt+Sa243cKqNCzxLfckSYvLdciE8QK4plLAo0JGZB3MBhY2l
 V6XP4ir6FYbrBYqZYh6GxhlKQaSXoTivbuYda7p4YOhUlz8r09kyIkiOJw7GeWm/sjek0dMDONC
 nkZ/wVr34btZ1Zh8izXiSdpcjMfQpkmSc7Swpp0rs48LKxRVnSJ1Q01C+4gvyi/B
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3FCCDA4C5482;
 Sat,  3 Oct 2026 09:02:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkc-000000007Zo-3hAs;
 Sat, 03 Oct 2026 07:01:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:56 +0200
Message-ID: <20261003070128.1295458-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 024/114] package/python-filelock: bump version
 to 4.0.4
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
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 8b32611fc2..302664deb8 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  85c7195c8c6455fd212d74717cc6a62b  filelock-3.29.0.tar.gz
-sha256  69974355e960702e789734cb4871f884ea6fe50bd8404051a3530bc07809cf90  filelock-3.29.0.tar.gz
+md5  7ad81dd59ab8b9af8af536bce90b37e3  filelock-4.0.4.tar.gz
+sha256  90999ed63a26ccf86b93b959ab10cf1017f422d816be454ed54cbed263e71ab5  filelock-4.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index b7a4638775..97d0cc96dd 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.29.0
+PYTHON_FILELOCK_VERSION = 4.0.4
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/b5/fe/997687a931ab51049acce6fa1f23e8f01216374ea81374ddee763c493db5
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/c8/d7/37691dc5063438a448b646f6f2442b4beebf16cc0e18d8cdfa7aeec60b8c
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
