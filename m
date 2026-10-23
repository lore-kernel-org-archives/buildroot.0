Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D49B606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 20:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nmPFnab8
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5FC1816D6;
	Fri, 23 Oct 2026 20:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBHfSNOX8Mpd; Fri, 23 Oct 2026 20:27:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E00008168E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792787247;
	b=Exgns0LG0hDYbi8bnSkzMrKZJEmiqiHAwkJC0AardFVhByquPAeCmqyJtcyc+0Q9ZJPe
	 BzhWs3oxhB6LAvOY0Oo77dH9RbkAaCsM3vNhPhIrHzf2Q33XSQkEUop2u97D6ia20eKWT
	 FURD4TJtPY7R67z+tgSh22utzRb/Hl+sb8ZZpZ0jRf0uloDjiTqlBR6UCOGWO2m4NOR5v
	 XBK2kaVspNDUEXf/fNTOH9k1Q8gg6693efQznIIWzAr9XgGa2+lhJg9UAXZu5GrMApbHT
	 wDPRJr6EPStbnpa6kmHygkFBQsjxkROpcjOZlJkGyngN/qr50z2VC6UwWRaqUoF7LLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787247;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Hx0tQASMGkJvmIbvRSIfwVuiO9ylCNtV/BlcMw0SOQE=;
	b=eQPBcLNA+qur/LbGCxL0fMiwVuExxSrBic8N7E9M+hm5w6Sby9iXykfYmDlOzzH2MDQD
	 wLFtSgeLAb5pAOEL/5zeRBozk5s/MGja9uqUZpcUzZ5WfM89uNtt14MMeLtL0CsnbTuCt
	 4yIK65fSj1qLnURfXlHJkQOR/wbQV5JntQqJ6XRLe52d3Rz8C+6mbAxIYcVgOpRrbwSM7
	 cDE7TxCVjbZtH1iHuGV0kufysy7/kojfWIVS+cjNEU5ohoVwMHFH9baOHHqhy4SDV+H+T
	 p9hleA/qs0/nXrTNiTLWJrLhf5SSoNVdAM0NEIqRoPPz2i64viWSTdXyVy/N5n2YL9w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792787247;
	bh=Hx0tQASMGkJvmIbvRSIfwVuiO9ylCNtV/BlcMw0SOQE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nmPFnab8ZFd6wQh18WyNX3Kq16ezCRYk7IuUbwajqrTjXvbW4/dgS2MXKu7zL6DOH
	 1HDgQKYXwUusE09Lr5AlgodAkVw6RPcWDs0/NAwoRdGvHtV/1BrEWyaFge28BVk7Mu
	 Yg4KBqRNwMw13Vrf3Ed6rz6efoDYVjGDk8W6OAJNRD47sVRIC3uWwAYwFctFrWzyW+
	 IG/IQ0t4zreMD3x0yy7cHw7t2HHa6Q3tdcXjZ7jin9FAAjT0pU3yKFIAWsWz0cnWXv
	 Nut6fYK5xvVoKeJBdgNyGsaaGW0scBHZ7py+nsyjxRc0qwy/WgBrQdyGmwyaFNVNtv
	 u06CC1mqEpRug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E00008168E;
	Fri, 23 Oct 2026 20:27:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FC00D31
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 556FA60A59
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fDstCtHMLKl for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 20:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7267260652
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792787242;
 b=ioGk0Hj55Yobj0P467B3PC3ELD5GEw9yH2Weti43BlPzD7Wx2Zwnos8Ejes/d4lUPbut
 82EhUSVzXWNnTm/rQhymW2jnSHSSAHXJ6n1o9LQGEsywBDbrcPgVnQUy35bQbx2m6TkuI
 4j3fECtR37O965hrLq+vl2kw71zo6AQ9hZdG5dIL0Gd/6qk0uZzASJVE8LIkOB+rpEb7J
 acq+ut0JIIvozSicYpy56djw4BOJAdjfJx8jyxHCsLa35QIz2r7MnZpuY8hJGqXWD3Hoa
 F+7cB4rUtHiHSqJXnFm/qw56y36+zopTLvoOHhebgEj1pdg6LADhv5FMGhqZ+s6Us/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792787242;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=W4b7eg7wXwxOsMa9P9Zmnya8L+dgTjhYbHIt9z42TB0=;
 b=ek230xnJH1HYKqYRL9Ka3WD0yXUysxLJxAl86l9THbW06xc5CbCYIv3R8GgSQoN9jwKl
 mENPaCV1fmmnw+1ujyuftJQ2nBv3fnN0BXCPu7h/xow3XO16ZENdrqgjTOS4izZCXwHRP
 U5e4IY3d4KFbXQAKzssIK9q45Hy0+5a3rjyXGCJiE3YFPQtwSg5csw7ylL+SKUw4zdRim
 5PpMjlcuv1bo5me82i4o6h3dgm4AXv1vZl4adrr5vlbLm21IJRbvvHTKph5UlOQQbJk5K
 PF/IAhsxgFe23d9rY0Rq0gXLzDv1w71avhbpVRHpgpHLmI3BaugVacKtUNgGXUtpmog==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7267260652
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2E039C6AC; Fri, 23 Oct 2026 20:25:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 21:58:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5aa2345da4f70588a22c1b8aef676abfa12b9968
X-Git-Newrev: a52b7828c6e5c7e7569712fe2ee84716014011c1
X-Patchwork-Hint: ignore
Message-Id: <20261023202557.C2E039C6AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bsdiff4: bump to version
 1.3.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a52b7828c6e5c7e7569712fe2ee84716014011c1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-bsdiff4/python-bsdiff4.hash | 4 ++--
 package/python-bsdiff4/python-bsdiff4.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bsdiff4/python-bsdiff4.hash b/package/python-bsdiff4/python-bsdiff4.hash
index 2ea2e83be6..d9a7bf36cb 100644
--- a/package/python-bsdiff4/python-bsdiff4.hash
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bsdiff4/json
-md5  7150cf7e21905b47f169a27355dfb529  bsdiff4-1.2.6.tar.gz
-sha256  2ab57d01a78b39e29e5accc9cfead4130982ded9dccbc4261bd0e9c51d6b751d  bsdiff4-1.2.6.tar.gz
+md5  43fc56a8c7a6125a01561273a3fdfe9e  bsdiff4-1.3.1.tar.gz
+sha256  75366494bb91cd0fd39be5c297525a60cf853ce6fe601dfa67d6de461aa18d39  bsdiff4-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  44a0326b645fc642428a3978568d3a5c1061b503ce7fb7ef18fbc20be5476e2b  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index 1b10b63913..e7b258df68 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BSDIFF4_VERSION = 1.2.6
+PYTHON_BSDIFF4_VERSION = 1.3.1
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/53/b9/4559ede9a4c8c4451688303544da84654643fdc7f28790aca85be80b4b7c
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/2b/3c/62c66de04e2ff09a3a3d56e4fc8a616177d481ae6c509363d178d2509690
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
