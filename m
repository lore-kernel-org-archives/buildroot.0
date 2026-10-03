Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9A9CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 166726064C;
	Sat,  3 Oct 2026 07:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GG2Vu0-S7__k; Sat,  3 Oct 2026 07:14:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2BE4A6062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011667;
	b=L/qPzi4Q2Ss5+G5i39HKF6bO/8xmIIAcrD3VYxY9/BJ/piQKbsazixk35aLBQwugs2ZI
	 j/OJgJIWFGipT1CoIzIvGeIgTVPpOJpizQuVYl+HP2366xF9V8N90JnPbZSAz+Zm/UhuQ
	 0ULVOYV8m4jBNsRANyavW8ia6lHZSCzZtjgGggvKH0QigcMZFhzxAGGnAolkgIkUAhYfP
	 TH+GBdk91AmeN5oYPEPZoLuV8XJiPY+IyThhkGJDEmNDgoVwfrlKpMuwleynAFg6dnYI4
	 3Fywg8O+vPWp3n4Yq/8rbvQYTdlFOi/cIY8vorfQ9PpWYmvTJRVB9kNGI0Sj6ubIlYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011667;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=D61FdCyW05t4DRtE7TYDULyK7jO31jnJ2z2Lep9fFdU=;
	b=JGv92Jtgy6Ilkn1JEI8hdt3AVU2pMYmQO6xbO4kL9tH3brs4O/sESSDpdgyGmnQzC8+e
	 8japouMqlFkt6as4WJKArSTVZt9qKdLfEKMQiJSNv9+DejNwok6jZOX9jQY13QULRwAcx
	 BNL+FuaLjlPru7D2X06zkWOy7lVqrdjLR4dz/vR1E1rgJ6hshNkMY6JLZNIul3AITrnOM
	 IeI2LqbK7Tp0fdf7kyRgN9GbM6tPgKt0nO790eEQQZYFd+u/BiDo9zXrdjvmheidWudvh
	 mnzScWiLbhd+nqbOdgGmqnwXw9anK30YfhOOvr4NQTV7XCBgrXIbAl3TG6ancszJM5Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011667;
	bh=D61FdCyW05t4DRtE7TYDULyK7jO31jnJ2z2Lep9fFdU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pE9npvEOQovpHNG7QjD863gCEJAamzbTxdk/sJ+DW4WIjYTofVrxHPT+kqfxiDyEB
	 egXRJ00kDQBe41DUZ3bc4adB2KPTLxe5CwnIzbuJc3AdmACSbuiz5FAcbh3ZDClT9h
	 EiEREX5QOCACBbJWG80KL3po1IUMVSySiVMsAcO18AWs/sXndybASXWzTG8O3eW9qM
	 O6IQj//ZALNvBeO+02sARXnc+gwGnMPjxcJmOIkzNAtoKRp8a/urBjgnnS4tD/4KVu
	 psWrKlHA/HJ3pe9IXu9MErSDkgwkhSSn3zILDFKERdxaO848t87FSnw8Zp7PlxtGHy
	 73yJO6/0QBRNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BE4A6062C;
	Sat,  3 Oct 2026 07:14:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0401F1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE3CE40059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSIyzyCqMxNa for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:14:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 03C5440050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011665;
 b=Y7sJFo9w83DKtakWlNxkmoRK810D7HE7T5TrM5Mzd6xqvPpa/VCjs5UcvTed193b4Rko
 1OHUV8lkpu0f+9j+p+9rzczkBi3qSfPulfu12xiLB0gjdGcPUk3W+sDqUKlKmm+cJwroH
 LgXzy0xF9ZYxxFeBdpWgxHP0BFuEtbDJynzPxIf4KbV9BhzsvFvn34rVR1DR3n/8y3mlp
 HRWOHMcOlm/Pb+Gk4SHx59k/kmB4VZTOXzb5/axT3SWpvcxRgqYtjLBL7XtE9kk8HyP/h
 LCtM5zpsJEcsWbUL/qgFjPCqnQ/T+OItS02PvpJ6e+A17aEpR048rFVWRaJ+2uooOeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011665;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=SVhtiBYrWpQ77Sl49+rEdRff9ZnnTk7Qi9/v1IZ7PUY=;
 b=SDsBhpWahqQUMfV9nD4xf55ObNT4t3iBwBvv9ze2FuWsB5BuFJy7CjAEuMc9XlsPJS8K
 Meq1GLi0ekMtpGueLHgITpWLcO39jVTsoGyYNVP4XPhvrVlq6tARcmkGVA5iHv5haeZuo
 YpBrqIPm4AIlUWxXGOZ1O19fovA+o+219K27aUv+sSxvMbx9Wbz9jrGMQz5hJrYXceStN
 FhbV5FmDAZDdAu1wqd1J68dcVl5ialr+CWNE0o+Yj5HMLSP6kqWOv6vbSWyIyaEPugUTA
 zvagYZAtBHq3HwIprk2Dra061qCZge53aeTjCIpHyv1QKJuF7pimSTpW+Ucn8qDAZ9Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qivN8v1D; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=qivN8v1D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03C5440050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010933;
 bh=SVhtiBYrWpQ77Sl49+rEdRff9ZnnTk7Qi9/v1IZ7PUY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qivN8v1DhOoIl/xw2RY27wE2Vbl6kXii2cHoNcnErnNaWNS7s02W2lRpEzNUjJ9ua
 PMZtF5BUUphBQjtQTpvDfm12Jd+JBJmDOeVpDXgJo57+E6oVTpSoqf7L1eAzDhwBxb
 OOrGXrRKNSx2bVDNhOOR/oYnaDwqE/iKN7OW94pEOi4nNf1ZYiPZ0/dqyz+/8ykiWJ
 2EwXaYsfurJu8thXnSQ1KYV6NqsRTcgwQw/J/LbfCtp2i2dUNtKNnujT57AIlnANrX
 bMtP0vm1Z8jOSXP7G3yUtavNu8M/LiyJHgbOcOeRc2ulatlVVCxpf6ce7KfP1veNiJ
 D/177byqs8Fbg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 KkTbCHlPlQaTt1XYx7TJNw0t3QIN4xcINEDOlw5wle9vSjleSOCRutnp6SfD3Tg8gbcpI5cZ7fo
 /JoIJDAO3k7Ov39OI6UZWvRizLu0eOcGtnI9HossdGIqY4XzX1Za8fBWg2BZpYJfgUlHi5pEhHc
 F1M90boJ8Mi7S1OLnZnsq/qL+lPXH5yK2bmG7QWmC+v8EGRSBxM7z1cuberOic+CWGY9LWmUL9c
 MiZJXGP/Ug+mksscY9zm+OuAuUxVVl5JZb7qJaagQWBsvbl1mAwksNG6A79nB8COf0BrJuR4Eo+
 8zeSQqxFZalgejfBtjQ+07Y7XOV94S0VRmsXgZ0OiWYQMjeMkY3rP6fc76l4hQrLaWfTgOA6FOl
 JMebGru+ndEQ2J0hCE22SoA9bsKY2n3i5UOe0fsMrXhb+I0hBt7k2psUttlVHOVe/fbJxAOosVG
 xIIJ8p8ZAa9t96ARpkKB7IF9oGGhoKoaoPZus5XXKstyclo8y+fIj+I7LmDtVILt7bkAAxVlfB7
 Z5+EJ3RcT3yD5QhCirj5w3vJrv3OTb50Tmr8acqzUv2pTEG1YIJMOWMEpqS74ztunpMtN5iS/ly
 P7D7AJEeDRVJqd9GgJhYFowMIsXSbDanXCzj8ujyrLWoWBE8H35b3k9FqBQQaiBy4g==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 746F6A4C5449;
 Sat,  3 Oct 2026 09:02:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtki-000000007Zo-3bf8;
 Sat, 03 Oct 2026 07:01:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:12 +0200
Message-ID: <20261003070128.1295458-100-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 100/114] package/python-typepy: bump version to
 2.0.0
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
 package/python-typepy/python-typepy.hash | 4 ++--
 package/python-typepy/python-typepy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typepy/python-typepy.hash b/package/python-typepy/python-typepy.hash
index 5cf3daded9..c82ecff02f 100644
--- a/package/python-typepy/python-typepy.hash
+++ b/package/python-typepy/python-typepy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typepy/json
-md5  f7ba433b3ea79aa36699be634b36aef1  typepy-1.3.4.tar.gz
-sha256  89c1f66de6c6133209c43a94d23431d320ba03ef5db18f241091ea594035d9de  typepy-1.3.4.tar.gz
+md5  f8b931aa306831b6291380fab863656f  typepy-2.0.0.tar.gz
+sha256  413fec52a54a010e2e20d6e18eef68840ebf13b95b719e17b5e2e81c6e85e4a6  typepy-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4434f353a12dd0236a99e5d3fd07fe3b3a453f9164fe10c57a11d6ca86b50c08  LICENSE
diff --git a/package/python-typepy/python-typepy.mk b/package/python-typepy/python-typepy.mk
index 03760f1d5f..d80cf2f0c1 100644
--- a/package/python-typepy/python-typepy.mk
+++ b/package/python-typepy/python-typepy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEPY_VERSION = 1.3.4
+PYTHON_TYPEPY_VERSION = 2.0.0
 PYTHON_TYPEPY_SOURCE = typepy-$(PYTHON_TYPEPY_VERSION).tar.gz
-PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/79/59/4c39942077d7de285f762a91024dbda731be693591732977358f77d120fb
+PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/28/c3/0c4382a6c70d0aa119bbf45c56340609c3f206b68756e7ff6b91abf83cd9
 PYTHON_TYPEPY_SETUP_TYPE = setuptools
 PYTHON_TYPEPY_LICENSE = MIT
 PYTHON_TYPEPY_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
