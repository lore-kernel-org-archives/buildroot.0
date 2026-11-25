Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD602606A321
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 17:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=djOAUZVI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=lMSqTFjj
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0541980E31;
	Wed, 25 Nov 2026 17:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6_oyGtOFlFL; Wed, 25 Nov 2026 17:07:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BCCB980C23
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795626444;
	b=L4MePpVqmG9Ut2JWs8qJu8MNV5ODCPiiCvAX9zPz6NPWZKsDmhA1QPl0Tm9mwpgogzRO
	 AurOdr+6ajRcKumWLVYYCTeg12fGYTAwbcUYzg2++cAH0cydP3Sr3Pa/xP/xynuu5JiCb
	 OgnWLNAiUwkLRftO515nKc5CBSPWIZRMUQfAI5DJaMPuSFfdxZP1k2/PQzueBA7sekNs7
	 Hi0KhZP+U4Ltjy3yqKUKC/CxU96MSknUFidnodHD2CAnqnSAcHGxK4Jpt0/4jm8MD7mjF
	 5a9+79Ej4pOqOOAN4+9pc0x0pagih+9YS8l11Sv+lvYx4D0IBXCtgHaCj3Q764c8PIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795626444;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=+gxcRwdHT7KUo9ZiV/52v2flKxaEFLjc1OwrN7QbjR4=;
	b=S0Ehaml3+5AnWt09ReroWlCXal6dtUkcfQnqwVxb9sab9CzX3AL8BYz03KW/sX13mvSN
	 RKJFDw/LTW/CZISf91cWB6mRP5HAiql2KOw0M3eA3P19+NYOX/epW63ID4PKlyuqpC/xQ
	 gNR3og06L9CzIOwr+XQBFGV4OQby6XKDxiQAvm4Vl3baTgoIo/XcLwRyWzJz9kj4ULLSs
	 RNb/qFziqHY1Ju8zEtSI9am6oEXXSuuBqbUPSmSZiCMTyJkgTg7EojO4X3QdXV0kiTx2y
	 bEhbtrwBxN9b7cofa7uhOoIlN4+aufFG4GOzI2wIzrkX+6GnmKNQxNm98mlYJsf1G/Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795626444;
	bh=+gxcRwdHT7KUo9ZiV/52v2flKxaEFLjc1OwrN7QbjR4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=djOAUZVIp6DdNp1j67rJD+GwMeHWmrNUy+ODXxmrJo2N1X/V7aalrTa2PFikt/3MR
	 CL9iSY0CHopKuQLpmT7pdI/BawSmzpMVFZhbmSjTIhVlZgKZfHx/lySw44Sj4iuXmD
	 XD15gX9OBT5prp3nMj/z97oFrOAVJXH9U+qr66+hPQHx64Lzc1XdUoEoPErISNeZmZ
	 XwpquF2vkrPc0XnCMjyeo7Bwi5LQ1awqD4wf5aC/s5DtcQUkhzQMf8BcF/O3G8BFm7
	 SuuBwAaR82PXy2SdvQXgO19OgBw9NNlu9jFEK5WbdR2fa3gaJ5wacH2S0Kw17Uwr2z
	 s5qq1Lm8P09Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCCB980C23;
	Wed, 25 Nov 2026 17:07:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 023F31C9
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 17:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8309400CB
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 17:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A71C_UoK1IOV for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 17:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4032840050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=62.149.156.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=lMSqTFjj
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4032840050
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 17:07:17 +0000 (UTC)
Received: from localhost.localdomain ([95.249.253.35])
 by Aruba SMTP with ESMTPSA
 id WGSgxvLYzkbYcWGSgx56p6; Wed, 25 Nov 2026 18:07:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795626435; bh=zTq4jo04Xw980DlLD75GtUIcPRzzJ0lyPW2GzaRIkpM=;
 h=From:To:Subject:Date:MIME-Version;
 b=lMSqTFjjq8278uyddVnuYfghNnBUVs+oij4pYqW8jGobQkl/ENbShzhumN1zW7XOC
 Pz8jfDaPo2YuLxQq9JzlY6SpUifF4mA0XzHFOcB6K2eKjtR1TinLZwpxGAXrmruOuS
 PENATX71D8zpc1HtUWRiKxz7vQwN9rxcuCBO3NfWSjX30ub0fOTG7mjt8kDucnKfaN
 ihVAE7wxngxmER95q2fWIpBB0A8vkyih7WaRocObtTR8f3RGVnh0SWtfJG6hTuhs5E
 rx12SserwF1dmFrLvKbKq0U0qV/1KnH2N2CduV7R0Xlou/k3cRxRdHJAZcMowbYeuX
 cw69uT2LOKzfQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jim Reinhart <jimr@tekvox.com>, James Autry <jautry@tekvox.com>,
 Matthew Maron <matthewm@tekvox.com>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Date: Wed, 25 Nov 2026 18:07:13 +0100
Message-ID: <20261125170714.3924860-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfORTzanCHl32wHmJXJgV8IGWDcZYZER8DCIa6moUjXGXkFkH/HLIX+VvoMVtmYnSzMzXQT/xTfOOlzTT/KaOuB6nYSl0VyeOP+1mYgScr2kJnncOXYvG
 6DbSb9qR+y9QxvsYS3VKCfOEXjvn+WlNqd3jwXP4C9yh2cZQv3UsI/1hIU2GcIFhqaywzvzUYMrFRa+12f34UdZ36faLpbQuSms+fNEbLERxXqJ2CDhzl9Mn
 t/IbIdXZvbYa4aMTbWqrd8Es9kE8y1BroKmMWb4gkF0aMJApp4GjmceYW509YU9bt1ZLpKXNu9Ao/H9Hq2qqsyRSssi1w7QkOmkhjD/SBmOx9uCQfs110dZt
 4GFM+39HvkPY+ELrE/mI3y4NomniN8mBhdBKY/EdXplbwZzsGddS1GHZfjjV4D6vHDd/x+h5l2DjVmqRXrtqD9mOkAOjgw==
Subject: [Buildroot] [PATCH v4 1/2] package/dotnet-runtime-bin: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the pre-built .NET runtime provided by Microsoft, to execute .NET
applications. The tarballs for aarch64, arm (ARMv7-A, hard-float, at
least VFPv3-D16) and x86_64 are available for both glibc and musl.

The latest release of the 11.0.x (STS), 10.0.x and 8.0.x (LTS)
versions can be selected. 8.0.x is end of life, but it is still used by
existing applications.

Also add a dotnet-runtime virtual package, so that a variant built from
source can be added later, like for rust and go. dotnet-runtime-bin is
its only provider for now, so there is no variant choice yet. The
version choice and the architecture dependencies are in the
dotnet-runtime package, so that they are shared by all the variants.

The runtime is installed in /usr/share/dotnet, which is its default
location, so neither /etc/dotnet/install_location nor environment
variables are needed. A /usr/bin/dotnet symlink puts the dotnet host in
the PATH. The runtime loads its native libraries from its own
directory, so LD_LIBRARY_PATH isn't needed either.

The only library linked by the runtime that doesn't come with the
toolchain is libz.so.1, and only for 8.0. ICU, OpenSSL and libkrb5
are loaded at runtime only when an application needs them, so they are
installed with the ICU, OpenSSL and Kerberos options of the
dotnet-runtime package. They are enabled by default, so that
applications work out of the box (without ICU, they even fail to start
unless they use the invariant globalization mode), and can be disabled
when they are not needed.

libcoreclrtraceptprovider.so, only used for LTTng tracing, is removed.
Before 11.0, it needs liblttng-ust.so.0 while Buildroot provides
liblttng-ust.so.1.

Cc: Jim Reinhart <jimr@tekvox.com>
Cc: James Autry <jautry@tekvox.com>
Cc: Matthew Maron <matthewm@tekvox.com>
Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
---
Changes v3 -> v4 (addressing Arnout's review):
- rename to dotnet-runtime-bin and add the dotnet-runtime virtual
  package, without a variant choice since dotnet-runtime-bin is its
  only provider
- add a choice between the 11.0.x (STS), 10.0.x and 8.0.x (LTS)
  versions, in the dotnet-runtime package, bump to the latest releases
  and use the sha512 hashes published by Microsoft, drop 6.0.x
- depend on !BR2_TOOLCHAIN_USES_UCLIBC, drop the redundant threads
  dependency, fix the comment and add "dynamic library" to it
- drop all selects but zlib (BR2_PACKAGE_ZLIB +
  BR2_PACKAGE_ZLIB_FORCE_LIBZLIB, only for 8.0)
- add ICU, OpenSSL and Kerberos options to the dotnet-runtime package,
  enabled by default, to install the libraries loaded at runtime
- require ARMv7-A and at least a VFPv3-D16 FPU on ARM
- use the upstream homepage in the help text
- add ThirdPartyNotices.txt to the license files and the licenses
- simplify the tarball name with _LIBC and _ARCH variables, drop
  AZURE_FEED and the copy-paste leftover, use the new download host
- drop /etc/dotnet/install_location and the profile.d script, add a
  /usr/bin/dotnet symlink instead
- only install dotnet, host and shared (not the .stamp files)
---
 DEVELOPERS                                    |   2 +
 package/Config.in                             |   1 +
 .../10.0.15/dotnet-runtime-bin.hash           |  10 ++
 .../11.0.0/dotnet-runtime-bin.hash            |  10 ++
 .../8.0.34/dotnet-runtime-bin.hash            |  10 ++
 .../dotnet-runtime-bin/dotnet-runtime-bin.mk  |  55 ++++++++
 package/dotnet-runtime/Config.in              | 117 ++++++++++++++++++
 package/dotnet-runtime/dotnet-runtime.mk      |   7 ++
 8 files changed, 212 insertions(+)
 create mode 100644 package/dotnet-runtime-bin/10.0.15/dotnet-runtime-bin.hash
 create mode 100644 package/dotnet-runtime-bin/11.0.0/dotnet-runtime-bin.hash
 create mode 100644 package/dotnet-runtime-bin/8.0.34/dotnet-runtime-bin.hash
 create mode 100644 package/dotnet-runtime-bin/dotnet-runtime-bin.mk
 create mode 100644 package/dotnet-runtime/Config.in
 create mode 100644 package/dotnet-runtime/dotnet-runtime.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 59fad7f26b..73b3f6cbef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1331,6 +1331,8 @@ F:	package/bind/
 F:	package/binutils/
 F:	package/cryptsetup/
 F:	package/dash/
+F:	package/dotnet-runtime-bin/
+F:	package/dotnet-runtime/
 F:	package/erlang-jiffy/
 F:	package/esp-hosted/
 F:	package/gcc/
diff --git a/package/Config.in b/package/Config.in
index 49659b007e..3c4b47ff05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -667,6 +667,7 @@ endmenu
 menu "Interpreter languages and scripting"
 	source "package/4th/Config.in"
 	source "package/chicken/Config.in"
+	source "package/dotnet-runtime/Config.in"
 	source "package/duktape/Config.in"
 	source "package/enscript/Config.in"
 	source "package/erlang/Config.in"
diff --git a/package/dotnet-runtime-bin/10.0.15/dotnet-runtime-bin.hash b/package/dotnet-runtime-bin/10.0.15/dotnet-runtime-bin.hash
new file mode 100644
index 0000000000..af90ab0f25
--- /dev/null
+++ b/package/dotnet-runtime-bin/10.0.15/dotnet-runtime-bin.hash
@@ -0,0 +1,10 @@
+# From https://builds.dotnet.microsoft.com/dotnet/release-metadata/10.0/releases.json
+sha512  ebf84de352f3e390888266e75ce4057dee1cd0fc57dc0cb0fecc850e1bc9e3b7bdbf955cb4b20f997ee59260a878926f9149b6d637850ccfe050cba5312fd678  dotnet-runtime-10.0.15-linux-arm.tar.gz
+sha512  e2e8b907d9eb6c239cccf5c1fe67fd9a72c56fddccedca9ba41c8a53ff034293b335fdd9f7ab504f09bf7b3f165e0d14e34fc9ea1f06cc0e86d0dfb06d274b6a  dotnet-runtime-10.0.15-linux-arm64.tar.gz
+sha512  ec06ce564e594c2d403999ebd29d2c07d7fc6d570a9b1ab76d0768187a3b1bff384703f9edabf9a5ed226619a5fa5a831bbe996bf10c8857b9f5afaac9d434e8  dotnet-runtime-10.0.15-linux-musl-arm.tar.gz
+sha512  847e3d3992148fa451f720a220776957c57641ddf2d7833eb9552ec266361e3c21f103867a6780796c50bbadbf8cec21c421d3bacd9f93da73d3b1e71f11b8af  dotnet-runtime-10.0.15-linux-musl-arm64.tar.gz
+sha512  dca559d4265deac0a1f16f9f4e31a75f2210a71ff6f62b0131cf0dabdececca193c8a7eaf5a1bf4291b44b0afb13953b24ba1d8e58acd0bf80eb3f148c23594e  dotnet-runtime-10.0.15-linux-musl-x64.tar.gz
+sha512  a90177d75bc891f71aa814dde3bcf76a356f5a506824669f1891754457954a3d13b72f3ca04c98fa0fe588514a5a781f8a87b17930ee802105c14f9edb28318a  dotnet-runtime-10.0.15-linux-x64.tar.gz
+# Locally computed
+sha256  cfc21f5e8bd655ae997eec916138b707b1d290b83272c02a95c9f821b8c87310  LICENSE.txt
+sha256  2dc8f8c5a39401e928b5784ab564eb8b3ceb99ead3df8f260e0cab7e0bbecc7a  ThirdPartyNotices.txt
diff --git a/package/dotnet-runtime-bin/11.0.0/dotnet-runtime-bin.hash b/package/dotnet-runtime-bin/11.0.0/dotnet-runtime-bin.hash
new file mode 100644
index 0000000000..e92973dfb0
--- /dev/null
+++ b/package/dotnet-runtime-bin/11.0.0/dotnet-runtime-bin.hash
@@ -0,0 +1,10 @@
+# From https://builds.dotnet.microsoft.com/dotnet/release-metadata/11.0/releases.json
+sha512  4857a8f2c4ec2f21381916923b2c6a0e94d69ad0380abff9a53f7f99a80b52a00b2a2438c86500b27551047233b1d416ada85ead25b9637c80e9b822274008ee  dotnet-runtime-11.0.0-linux-arm.tar.gz
+sha512  b624e647c72e8f62a0d186aa96aad1b113732e8c39f010be6f95ec026feb2633187e33f24c3af5168daaa1d9b4bb0bb9c396f6d172d18660b9673bb507fa9f45  dotnet-runtime-11.0.0-linux-arm64.tar.gz
+sha512  dbca05e02a6c206c93d02fe7acb6ca9f8025aacca3d17b1383f25dc18b7a3c09cc2c2105d0be92b6a11273a5bb370ff6d56caeca5de0805d12a251f4a44895ca  dotnet-runtime-11.0.0-linux-musl-arm.tar.gz
+sha512  7b32d53ee1c98078f71e73b510332aeca7a70b974f38d93201857ba8b8870e0d175f1d206b15cde03fd145e130bcf86e7c5749e67efec20ff62de0132119f7e3  dotnet-runtime-11.0.0-linux-musl-arm64.tar.gz
+sha512  85e1d28610719a44119ff706bb09f17487380a47d6d0400adad72888ba2cef55e80e2566d15b2812af442ecde469d05d272e15ded04d515f628b40a5345c7854  dotnet-runtime-11.0.0-linux-musl-x64.tar.gz
+sha512  d0846e7ad4a6b07fe3fb7c033a381e6938ec16afbe0b7f7454ff2f9b58247cbbc35758cc785af424385c4572c801060cbd656a822ef624f4907d3cc10a16a080  dotnet-runtime-11.0.0-linux-x64.tar.gz
+# Locally computed
+sha256  cfc21f5e8bd655ae997eec916138b707b1d290b83272c02a95c9f821b8c87310  LICENSE.txt
+sha256  d30078edf6426ec7ef9427b3048b407fee214d1eb7834a681a3a09290387d591  ThirdPartyNotices.txt
diff --git a/package/dotnet-runtime-bin/8.0.34/dotnet-runtime-bin.hash b/package/dotnet-runtime-bin/8.0.34/dotnet-runtime-bin.hash
new file mode 100644
index 0000000000..c97efa4ba2
--- /dev/null
+++ b/package/dotnet-runtime-bin/8.0.34/dotnet-runtime-bin.hash
@@ -0,0 +1,10 @@
+# From https://builds.dotnet.microsoft.com/dotnet/release-metadata/8.0/releases.json
+sha512  14414e089ca0d89b9bd9eb763acdeb54ad0dda9a2d4fc424811dc461d2380969f08d56c0148773956df1432812abe9fc05da1ea582887ebcdd28bacd3ecec11a  dotnet-runtime-8.0.34-linux-arm.tar.gz
+sha512  55a87aaf098481bc73082422a6bbbea0f796347076cfb74c8992685cb75d9a1d334313c9b013d726886086c22be11a234596edc43ecbb5057f585042acbc621d  dotnet-runtime-8.0.34-linux-arm64.tar.gz
+sha512  7a47a299e1ce466147e2b16b00cda326b289fd42e9781c75023e44ed7a4217d0ddac51e8490778b0366446451aac5999082f68e957967d30040b120311690704  dotnet-runtime-8.0.34-linux-musl-arm.tar.gz
+sha512  c792e1092c4a4a4857a797442f3980982ce278a71beca46ee2e53a279416677a48eac14297264081d9373642a2b0e0ce7d1b5f3a4c8c13487f6fa7be49f95ba7  dotnet-runtime-8.0.34-linux-musl-arm64.tar.gz
+sha512  8975f7058504af8800174b7f4b964f336b7f837237fe8111f9830389c2ed1b76b301df6443b5e6e5512af6dac611cfa087af70bb72af077f6cd1a13ebcda32b9  dotnet-runtime-8.0.34-linux-musl-x64.tar.gz
+sha512  3949c533b04b0f2b8ed7f6a595409806857891de07eca5ff2795c3ffecc5c373c8977ce296ea1124cef0890f8afeb3365a3bb8514d11a91ba79adb5c47c27ddb  dotnet-runtime-8.0.34-linux-x64.tar.gz
+# Locally computed
+sha256  cfc21f5e8bd655ae997eec916138b707b1d290b83272c02a95c9f821b8c87310  LICENSE.txt
+sha256  fb47c97d2919d9584f25564058f973de424da8b500d51b46e406391c6e9adca6  ThirdPartyNotices.txt
diff --git a/package/dotnet-runtime-bin/dotnet-runtime-bin.mk b/package/dotnet-runtime-bin/dotnet-runtime-bin.mk
new file mode 100644
index 0000000000..889d332179
--- /dev/null
+++ b/package/dotnet-runtime-bin/dotnet-runtime-bin.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# dotnet-runtime-bin
+#
+################################################################################
+
+ifeq ($(BR2_PACKAGE_DOTNET_RUNTIME_11_0),y)
+DOTNET_RUNTIME_BIN_VERSION = 11.0.0
+else ifeq ($(BR2_PACKAGE_DOTNET_RUNTIME_8_0),y)
+DOTNET_RUNTIME_BIN_VERSION = 8.0.34
+else
+DOTNET_RUNTIME_BIN_VERSION = 10.0.15
+endif
+
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+DOTNET_RUNTIME_BIN_LIBC = musl-
+endif
+
+ifeq ($(BR2_aarch64),y)
+DOTNET_RUNTIME_BIN_ARCH = arm64
+else ifeq ($(BR2_arm),y)
+DOTNET_RUNTIME_BIN_ARCH = arm
+else ifeq ($(BR2_x86_64),y)
+DOTNET_RUNTIME_BIN_ARCH = x64
+endif
+
+DOTNET_RUNTIME_BIN_SITE = https://builds.dotnet.microsoft.com/dotnet/Runtime/$(DOTNET_RUNTIME_BIN_VERSION)
+DOTNET_RUNTIME_BIN_SOURCE = dotnet-runtime-$(DOTNET_RUNTIME_BIN_VERSION)-linux-$(DOTNET_RUNTIME_BIN_LIBC)$(DOTNET_RUNTIME_BIN_ARCH).tar.gz
+DOTNET_RUNTIME_BIN_STRIP_COMPONENTS = 0
+DOTNET_RUNTIME_BIN_LICENSE = MIT, Apache-2.0, BSD-2-Clause, BSD-3-Clause, \
+	Zlib, CC0-1.0, Unicode-DFS-2016, Public Domain
+DOTNET_RUNTIME_BIN_LICENSE_FILES = LICENSE.txt ThirdPartyNotices.txt
+DOTNET_RUNTIME_BIN_PROVIDES = dotnet-runtime
+
+# 8.0 is linked against the system libz.so.1
+ifeq ($(BR2_PACKAGE_DOTNET_RUNTIME_8_0),y)
+DOTNET_RUNTIME_BIN_DEPENDENCIES += zlib
+endif
+
+# /usr/share/dotnet is the default install location, where both the
+# dotnet host and the application hosts find the runtime. The runtime
+# loads its native libraries from its own directory.
+#
+# libcoreclrtraceptprovider.so is only used for LTTng tracing and the
+# runtime doesn't need it: remove it. Before 11.0, it is linked against
+# liblttng-ust.so.0, while Buildroot provides lttng-libust 2.13+
+# (liblttng-ust.so.1), so it could never be loaded anyway.
+define DOTNET_RUNTIME_BIN_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/dotnet $(TARGET_DIR)/usr/bin
+	cp -a $(@D)/dotnet $(@D)/host $(@D)/shared $(TARGET_DIR)/usr/share/dotnet/
+	rm -f $(TARGET_DIR)/usr/share/dotnet/shared/Microsoft.NETCore.App/$(DOTNET_RUNTIME_BIN_VERSION)/libcoreclrtraceptprovider.so
+	ln -sf ../share/dotnet/dotnet $(TARGET_DIR)/usr/bin/dotnet
+endef
+
+$(eval $(generic-package))
diff --git a/package/dotnet-runtime/Config.in b/package/dotnet-runtime/Config.in
new file mode 100644
index 0000000000..8294835cbf
--- /dev/null
+++ b/package/dotnet-runtime/Config.in
@@ -0,0 +1,117 @@
+config BR2_PACKAGE_DOTNET_RUNTIME_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	# The official ARM binaries are built for ARMv7-A with the
+	# hard-float ABI. The CoreCLR JIT also needs at least a VFPv3-D16
+	# FPU.
+	default y if BR2_arm && BR2_ARM_EABIHF && \
+		(BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A) && \
+		(BR2_ARM_FPU_VFPV3 || BR2_ARM_FPU_VFPV3D16 || \
+		BR2_ARM_FPU_VFPV4 || BR2_ARM_FPU_VFPV4D16 || \
+		BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4 || \
+		BR2_ARM_FPU_FP_ARMV8 || BR2_ARM_FPU_NEON_FP_ARMV8)
+	default y if BR2_x86_64
+	depends on BR2_USE_MMU # fork()
+
+config BR2_PACKAGE_DOTNET_RUNTIME
+	bool "dotnet-runtime"
+	depends on BR2_PACKAGE_DOTNET_RUNTIME_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	help
+	  The .NET runtime, needed to execute .NET applications.
+
+	  ICU, OpenSSL and libkrb5 are loaded by the runtime only when
+	  an application needs them. Use the options below to install
+	  the ones needed by your applications.
+
+	  https://docs.microsoft.com/dotnet/core/
+
+if BR2_PACKAGE_DOTNET_RUNTIME
+
+# The pre-built runtime provided by Microsoft is the only provider
+config BR2_PACKAGE_DOTNET_RUNTIME_BIN
+	bool
+	default y
+	select BR2_PACKAGE_HAS_DOTNET_RUNTIME
+
+choice
+	prompt "dotnet-runtime version"
+	default BR2_PACKAGE_DOTNET_RUNTIME_10_0
+	help
+	  Select the .NET runtime major version. The latest release of
+	  the selected major version is installed.
+
+	  LTS (Long Term Support) versions are supported for three
+	  years, the other ones (Standard Term Support) for two years.
+
+config BR2_PACKAGE_DOTNET_RUNTIME_11_0
+	bool "11.0.x (STS)"
+
+config BR2_PACKAGE_DOTNET_RUNTIME_10_0
+	bool "10.0.x (LTS)"
+
+config BR2_PACKAGE_DOTNET_RUNTIME_8_0
+	bool "8.0.x (LTS)"
+	# The runtime is linked against the system libz.so.1
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
+
+endchoice
+
+config BR2_PACKAGE_DOTNET_RUNTIME_ICU
+	bool "ICU support"
+	default y
+	depends on BR2_USE_WCHAR # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
+	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
+	select BR2_PACKAGE_ICU
+	help
+	  Install ICU, needed by the globalization features (cultures,
+	  string comparison and casing, time zones, ...).
+
+	  Without ICU, applications fail to start, unless they are
+	  built with InvariantGlobalization set to true, or run with
+	  DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1.
+
+comment "ICU support needs a toolchain w/ wchar, threads, gcc >= 7, host gcc >= 7"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_HOST_GCC_AT_LEAST_7
+
+config BR2_PACKAGE_DOTNET_RUNTIME_OPENSSL
+	bool "OpenSSL support"
+	default y
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	help
+	  Install OpenSSL, needed by the cryptography and TLS features
+	  (System.Security.Cryptography, SslStream, HTTPS with
+	  HttpClient, ...).
+
+config BR2_PACKAGE_DOTNET_RUNTIME_KRB5
+	bool "Kerberos support"
+	default y
+	select BR2_PACKAGE_LIBKRB5
+	help
+	  Install the MIT Kerberos GSSAPI library (libgssapi_krb5),
+	  needed by the Kerberos (Negotiate) authentication
+	  (NegotiateStream, HttpClient with default credentials, ...).
+
+	  NTLM authentication also needs the gss-ntlmssp plugin, which
+	  is not available in Buildroot.
+
+config BR2_PACKAGE_HAS_DOTNET_RUNTIME
+	bool
+
+config BR2_PACKAGE_PROVIDES_DOTNET_RUNTIME
+	string
+	default "dotnet-runtime-bin" if BR2_PACKAGE_DOTNET_RUNTIME_BIN
+
+endif
+
+comment "dotnet-runtime needs a glibc or musl toolchain w/ C++, dynamic library"
+	depends on BR2_PACKAGE_DOTNET_RUNTIME_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || !BR2_INSTALL_LIBSTDCPP || \
+		BR2_STATIC_LIBS
diff --git a/package/dotnet-runtime/dotnet-runtime.mk b/package/dotnet-runtime/dotnet-runtime.mk
new file mode 100644
index 0000000000..4bed1f9439
--- /dev/null
+++ b/package/dotnet-runtime/dotnet-runtime.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# dotnet-runtime
+#
+################################################################################
+
+$(eval $(virtual-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
