Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF88606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dT30OzFg
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A65668176A;
	Fri, 30 Oct 2026 14:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhZc1xj5uW-Z; Fri, 30 Oct 2026 14:20:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CE77081757
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370017;
	b=Lbj+db9gbmFu+OQnpot+3ut8NfiUuh8sA2G4jjmqr5kNP+26xvTHeIunyKiqC7Mo+HDi
	 xh87edv1HYozbvcnKAlyiebxQqICG25eH1LicjMvyoD/1xJHh4teaNEai6S0MRXq0J16q
	 QHWSDBRDNYpF6/PEEDX46qkVYaOKe7Z0tK2kSbykgrtruHWq0IhiQwTSSUshDVs3Sg+qN
	 7LEmUPrl8uLu0/rxLgEg+JnGBmzEBBKBdSYc12xt4ICgAOMuMIFuKuQ5lvKYs/doRAT1L
	 HJHYxEGtBw7jq/qdXbI2wT2JiolFDhnvkUF8hkSXeyMwkV706o1dKtAYnXL5x31Z/6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370017;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=lDsojkt6tDarql8B5uyrFCYgPJjtMD16goo9f/Xdbpw=;
	b=quE//lJi524Nc5IQNhiVsO0LgPUfRdv97EuhQ3cESWIXB55EFdZYMhwirhBh49g5QWpY
	 z1H0NkyPO7+QyJp4A2MKGULPh8OIvgAvbxy/SDfTJG9Zhk71EzgibfC9+xmrmSo3Nz0nu
	 HwoRVGAo0vdt9/2vstlljgBTfEe+Coevs33pcqOqobhNpvV8NJ+s9Tn4qcHzys97XnE/h
	 HcLhZSlSKUtK5Og+g1qBZrGrNp4OtpGkT+A4uCMmUJ8R5YdFmAd9p5/b6retoFFMkVU9I
	 KQTHdg42mP5qVANzodULHe3FCJ+sj6MFdIXEdsFO5rx9wp0u8oLrIBrENO5ffCflUeA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370017;
	bh=lDsojkt6tDarql8B5uyrFCYgPJjtMD16goo9f/Xdbpw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dT30OzFg6bMdpu0io5Y4JRu6wyR+b4CFN+YFCPJ9JAy1pfW737QFjj2fpeDCzEAn8
	 kftHN+BfN/0Gr01RoYw1Cs+rg3dGAHi2ti48KXXnwOK7rM6YSaIBjQObS7UhCN4OsK
	 37bs+JBOouHEQIG4dYdlyC6DH4txPRJRrXRYRrXK/4IwuPtZGAFWF5AhaXPJpwcpg4
	 HbfmkxwUWTrDHtbKUbwVa4mTN7mo2K2nQljJOo1rjOBhwtyb23mljlgeaqgx3IAo8+
	 RUISDbfF+HTFEf370KkxI/Jy/QY/6bad7muHEyqcFLBF4fXvh0UWAzUMYQHA+Raono
	 g4cvs8ICTT0Nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE77081757;
	Fri, 30 Oct 2026 14:20:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25685712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0012540BCC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzAT0Dq0xkEH for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 399C840BD1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369887;
 b=B/f1ywV2cNMojH8qcdail/aDGRRsehCmgPk/qcOHLZJJL6PN187CvuNgcfKdMinOPozF
 lHrh/Qgaa8dj5OOsbXul/f9jBZRDNWfmjezMto1DDkBPonJnSDEmKeGE2ayzXx78y7BN+
 FDgMW3ZWtwC+2bZIuFgZZgLQ00WBN+MCOUibIUvXxjGOMQT7oeWS5pCPmeckgScKHkcLY
 1r3a6kImML+8OS1BaQN7uA6G5qXJtxzKUpT8inRAehARaejis5/f5ANVgJkzDxP9GjUq9
 OtKj1J/ehTmp+UWdQrp1BKX7LOydXyBYGuVgUqZc4J+dK4DOVo2xZ8jkYapXZzFXD0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369887;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=j0wl0vyR2TG2UvRG1lY3/yubzNlg6SJzmvf5oHTelJk=;
 b=cd/HWJlVniovEFVUV9rmFyy3AIY2kgds6lt8N+4iEgWfD+cH9Kgo7La1q1mRBVbBIgFU
 eU8F2jpgJhTt4LkmqIT7rs81gZl+JxyxW6mpvy1sAi8JEjl2ksdm/H2hskEcmsZ9v3aiM
 xPB/zEecm3QarP+D7W0IAYPDOnTdGLaeW/ovDme84Ro2wnUvfqCKuAXcpmfQ+LQc77SNd
 1Qt29T6n0gMYp5JbDHqg2e91jwLHyck7gQzhsj0SVMoIPREmJoh9x2IyYYZM1G97XlW09
 V//+UWMgNm9Eh7qMxOZWmTwPPyFdpX5JjmB5Je8ss1pRNs0vj3mJHGe0sW8qLp/LUOA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 399C840BD1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45BD09D388; Fri, 30 Oct 2026 14:16:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b5125bfc4fabf7926c1aa5c97a405971bb8eb3ff
X-Git-Newrev: 39221d29e9b99a987c3157b9b68ecdf6e02b8ef6
X-Patchwork-Hint: ignore
Message-Id: <20261030141639.45BD09D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/xxhash: make sure
 installed .pc file is correct
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2903280041567251536=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2903280041567251536==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/39221d29e9b99a987c3157b9b68ecdf6e02b8ef6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The libxxhash.pc installed by our xxhash package is incorrect as it
contains:

prefix=/usr/local

while the library is installed in /usr. This causes for example a
build failure of libplacebo when xxhash is built before:

output/build/libplacebo-v7.360.1/src/meson.build:247:6: ERROR: Include dir /home/thomas/projets/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/local/include does not exist.

The problem comes from the fact that the .pc file is generated during
the build step from .pc.in template, and we don't pass PREFIX=/usr at
the build step. To fix, we pass PREFIX=/usr during the build step, not
just during the install step.

The problem has probably existed since we started installing the
libxxhash library in commit
cc0c90aa83821d817ae2cbe01ad2c8d22ea30ba8 ("package/xxhash: install in
staging"), but we tested in 2025.02.x, and the problem exists so this
patch should be backported to 2025.02.x.

Fixes:

  https://autobuild.buildroot.net/results/344af8504a77ae96e4009d76a77572180cf49b14/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 75a1aea9b420ac97b9dd3058db172e6d0c46a812)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/xxhash/xxhash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 51bf6ce855..fc2084c878 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -31,7 +31,7 @@ endif
 
 define XXHASH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
+		PREFIX=/usr MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
 endef
 
 define XXHASH_INSTALL_STAGING_CMDS

--===============2903280041567251536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2903280041567251536==--
