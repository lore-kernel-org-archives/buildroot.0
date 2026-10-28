Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF668606A320
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XtKoi4be
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 905FB40A59;
	Wed, 28 Oct 2026 21:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9QgaBZlSYE2; Wed, 28 Oct 2026 21:41:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6E76440A65
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223676;
	b=iZOICHkFxIozdy/wCxLfyJhVPO78Q7dyInSRKwDEYZbh2RYCWBr9V40vSObw3kZEd6/5
	 6r2olxIZ7Qxb/OB0XNZruIkP1Q0SCdT0N2lYMU7gjgaLQEEBiG8e+JsQHBJ43muyrbXlt
	 8jcnTRnDcDevbvw/p0l9FR9swFWBdWvC7ov81NHbYAAX0yMw3KReg7IkZzKepXIIpDewN
	 WgWRrfJZOuM326aubbY29tH1Azs3vt1v/mzOPHknaxESCXGqsWk0FHpLQPNZwlEr9dp2e
	 W5T04QwFEbmnaykcITi7QOVRyW2xNsyJqbd2tt1rntFOX/ZZLPHslc/9CRDZBGBaMCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223676;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1cMkui2xcICpi6ReVxn8N9NjyXAnFo9hAFA57sUqa68=;
	b=UAaJB7HCVtmKTj24RUHHXVYLcNwY5gNRlMnFG3ZSYpaKfiK3Uji4z05gklrCoSUABpeD
	 8rlejdECQCKvDHjdSdBlCf9xu3w3k8ks35edNMAGRcJKtdCBNkTMdHCN43QPFfbW0rRsn
	 ZifYMRZMOMVLl4u5Hmqn6x+rWFmeQvCoqkot4FNH6QtraghnTKg1Io6ZRect99Z+Nyxci
	 36POaeHIucJRptbDfjgSP+f20YYcP9CxbPjnRtdHW5VK97Dppc8HhZwPTCazi9F/qogOK
	 UUJIu5sb6qp0EnCRHK8ar+rWRhLtSnQ+qjAeHxDXyXZrQKrFHsTS5VxrZVm3BcpGjFg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223676;
	bh=1cMkui2xcICpi6ReVxn8N9NjyXAnFo9hAFA57sUqa68=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=XtKoi4beAkfAdpCzl0FkUG4OQr26XJJVKK5eLJTsestHrZkjSiBb9BF2xMf92CXVU
	 LABXIb3N2eVAfEa8u6WbJDcnyI78lMd1dppfoxd0CSlR03IHZBvSKsUkFaob7xT6um
	 /yoLN83QufQOob+p+MLfhe9df+FQ4v+FmnFcN0RU3H+Ca/Opdppn3lNHjL1+lzzFCD
	 SJWR++WAvBwrFRNpL7A0zIbDxYWY7DQrXHlpnTk9/13W2eG64HLLKErwRcUBUeEpMF
	 M8twLPiCYAK+DN5NkwH/YebBrP956PYEd7/8EzsdP54/ej7ltJ6her5IpX119l1FTI
	 79EsG9Q/IC+sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E76440A65;
	Wed, 28 Oct 2026 21:41:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D6C52E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AEB260725
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8Qd-05UVvUw for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:41:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 859A260748
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223674;
 b=MaewE8QJniT+MwMrv3pKGaNLhe41gK23uKiKFe5qMoq19reVLy+ASiq76XfxBsWRTLnA
 z01tSWsvnywdEIkdQz5SOH/3rzuLEljnq17E74fljU5EbW0RhOI0q9l2ovOOi6cUvVh9K
 4494y3UPZIULPyWoYoCvJzA65+06DIj1bCF7HUI9IZ/u/eERMifuU44uCJqhJpObb5LR2
 mZhn7MwfEIXoh9NLesxPYdCYU+OKy6yO9ZVD7tQphj8du4/igeqYZ2MTLgskpb+jK3t1R
 7Qa3zC7VXPNXVwVJrvowviUc8L4Ph3yQGaeFKI4sCLvyeDP2TmrIlDDw8dHJ3W4sSeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223674;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=wS3tnouS+VSo9HOmbhVkCPTNw24OJSJZ4DVsBF6/7LY=;
 b=m9D50uS23SSo3w6BG1sWatGYz1w89R0UpY8HowwDXWqezPy6mUupZGB+Z8ozNUCAd0zg
 HEnyyMdHeF8Gb6gycYFHaDBUQV4aK70i4Ip0CM9BEz7tZZAAGK6N21+uh4SsATOnyVufT
 VoGDlE93f6g2xpQL0vQw/iwRe2OuHQiy/yX9gxqzCZTJKvY50+auyw3GAB+69bAn4JqTe
 lt5iO/CBqRr1gsZFfbEYW3XlAKOAHbgVXYYsGPvh2ZkUA9NRW5GAiwL+ajdEK/Ut1w9Ja
 cG3aRcAEwtVnFYFMqhklbx/j32rl2H85oHIHobRabf4zbpnrlDOjAKRwXWjk3dDnTng==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=HvWIpa4X; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1062"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1062; helo=mail-pj1-x1062.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1062.google.com (mail-pj1-x1062.google.com
 [IPv6:2607:f8b0:4864:20::1062])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 859A260748
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:41:13 +0000 (UTC)
Received: by mail-pj1-x1062.google.com with SMTP id
 98e67ed59e1d1-3ac77270fbfso846587a91.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223672; x=1793828472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wS3tnouS+VSo9HOmbhVkCPTNw24OJSJZ4DVsBF6/7LY=;
 b=TfoiSR4TXxUxafi/WNAIebMWR4PPCTRrN3OvU7O/zfTTHOUHBtZRtBdbRYhujU6uxQ
 VlWdaj9huz3yVVv+PyOVL0mO/i/j8GyUh6/gzvDdai/4t3rSCHny8xdzq29Gmwy1O40s
 kFK+QuL+UV2RutHi0cW43G6RmueMcwP7Ho5uF9WbIssN3T5kNuqOOVkTW1bD+TcKgiVY
 FOxULLQ10iSntUqJlx9U0GTsSy2ifOKzz013O4Or/fF1fRodlQPYdJpaMa2kvO7uKlq2
 Mz4e2jcrkttFjykZVfzreWShHrfHSRobD/VNjMAsKoUL5iDAEa43XIpG28qsCCYWz08z
 dBVg==
X-Gm-Message-State: AFq9FYI5NU4a3O/m8H+U50Ii5PqpAyncmNFhfpyYJlIQ/uHGDIw4J8Qg
 eSXs1kAK+2kI/qqZo2llkTRcDDocQW6/WNcnROjjg8ykuDbSXxqPiwrk76qGJVHVadgAKHoES1/
 8APtci2Y2t0V+TPclJ78tNNIhJLqKWeaTv4mfEkaNJj2ZJG2NgvXskhngxpBuC1LGubP7W9f+Ww
 tTUBkn488YzXulLXFrb9Dgort8p2okMN+6lzeiw5xFmPFW6uYHvtRsmHW0xqT9svD5B1jwGZCV0
 +0mzRa0D6ZOrMTJYg==
X-Gm-Gg: AYBFou2Vx2Vwgf4dNf/NmBkrghh8IbvJCBEMGjVMobaltvj2hZJl+kKe7U7BnpwcPir
 VrwbY5AYQ4NkC3bAdDdlvzYwyt0AkZ0g/Fq14Gw+OgqRTrzTs3kKuQJIlVR3Q7yr96/4LSLllm9
 z+87LD7N2eFUygyNJJVL0UyrNmD6Uli//WY9yVq1oBDWVxqvMxUBAjzrlXFyknen0fzhxvty81A
 xJ7G8OchZfNp5gptPyb70pP5UJYQf/3yD2HAEnMsfp2uVRPCyjb4vZjDV9uXXT7WpqnGBV9hgB6
 sqhHYXUn6Sp/VDUnF92ahTRgtbI6Bxt9rJknn5Xulca6TaBzf0vajR1oM+eiVbyer7s3iUMU9Of
 CxDDB+UPg8wqYR5I0/eXjt5RqaYAYQWRhNbRaVszyyTQIetvO+666HVkbShkQ5euez5oEiKyFwL
 G0IcLeDEqM+EI3mac9g+HycCSwp4GPaDIcZp6sBBxqVRs=
X-Received: by 2002:a17:90b:264d:b0:3a8:1a1a:7895 with SMTP id
 98e67ed59e1d1-3ae580ab0e2mr2081680a91.18.1793223672372; 
 Wed, 28 Oct 2026 14:41:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 41be03b00d2f7-cd8cccce3d6sm198701a12.22.2026.10.28.14.41.10
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:41:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-534f3fe0236so27341681cf.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:41:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4d3:b0:537:dea7:adb1 with SMTP id
 d75a77b69052e-53fc8db64e0mr64778771cf.4.1793223669903; 
 Wed, 28 Oct 2026 14:41:09 -0700 (PDT)
X-Received: by 2002:a05:622a:4d3:b0:537:dea7:adb1 with SMTP id
 d75a77b69052e-53fc8db64e0mr64778271cf.4.1793223669390; 
 Wed, 28 Oct 2026 14:41:09 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-538394c518csm114745971cf.8.2026.10.28.14.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:41:07 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:44 -0700
Message-Id: <20261028213744.511429-24-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 23/23] docs/manual: document out-of-tree
 package builds and the new srcdir variables
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 docs/manual/adding-packages-generic.adoc     | 12 +++++++
 docs/manual/using-buildroot-development.adoc | 38 ++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index e7547460fd50..5b020d78a214 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -666,6 +666,18 @@ In the action definitions, you can use the following variables:
 * +$(@D)+, which contains the directory in which the package source
   code has been uncompressed.
 
+* +$(LIBFOO_SRCDIR)+ is the directory containing the package sources,
+  +$(LIBFOO_SRCSUBDIR)+ is the same directory with +LIBFOO_SUBDIR+
+  appended, and +$(LIBFOO_BUILDDIR)+ is the directory in which the package
+  is built. By default, these all point to +$(@D)+, but they can differ:
+  build systems that build out of source set +$(LIBFOO_BUILDDIR)+ to a
+  sub-directory, and a package that supports being built out of tree has
+  its sources in +output/source/+, or in the directory given by
+  +LIBFOO_OVERRIDE_SRCDIR+ when it is set. A
+  recipe that only reads the package sources (for example to copy a header)
+  should use +$(LIBFOO_SRCDIR)+ rather than +$(@D)+, which is the build
+  directory. See xref:outoftree-build[] for more details.
+
 * +$(LIBFOO_DL_DIR)+ contains the path to the directory where all the downloads
   made by Buildroot for +libfoo+ are stored in.
 
diff --git a/docs/manual/using-buildroot-development.adoc b/docs/manual/using-buildroot-development.adoc
index 72628e0a6f99..de62c0a89ed4 100644
--- a/docs/manual/using-buildroot-development.adoc
+++ b/docs/manual/using-buildroot-development.adoc
@@ -119,3 +119,41 @@ cost of a slower speed, add these directories back:
 ----
 LINUX_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS = --include .git
 ----
+
+[[outoftree-build]]
+===== Building out of tree
+
+A package can opt in to being built out of tree by setting
++LIBFOO_SUPPORTS_OUT_OF_TREE = YES+. Such a package is always built out of
+tree: its sources are extracted and patched in
++output/source/<package>-<version>+, and only the generated files, including
+the stamp files of the configure, build and install steps, are stored in
++output/build/<package>-<version>+. Other packages are not affected: their
+sources and generated files are both in +output/build/<package>-<version>+.
+
+When +LIBFOO_OVERRIDE_SRCDIR+ is set for such a package, Buildroot does not
+_rsync_ the sources to +output/build/<package>-custom/+. Instead, the
+package is built from the overridden directory, with all the generated
+files, including the stamp files, stored in
++output/build/<package>-custom/+. The overridden directory is therefore not
+modified by the build. The +<pkg>_PRE_RSYNC_HOOKS+ and
++<pkg>_POST_RSYNC_HOOKS+ hooks are still run, but +$(@D)+ then does not
+contain the sources: hooks should use +$(LIBFOO_SRCDIR)+ to access them.
+
+Currently the +linux+ package supports this. When the sources are overridden,
+the kernel source tree must be clean (no +.config+, +include/config+ or
++arch/*/include/generated+, as required by the kernel when using +O=+); run
++make mrproper+ in it if needed. The kernel is configured and built with
++O=+ pointing to +output/build/linux-<version>/+ (or
++output/build/linux-custom/+ when the sources are overridden).
+
+When a custom logo (+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH+) or custom device
+tree files (+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH+) are used, or when
++linux-tools+ are enabled, Buildroot has to add files to, or build inside,
+the kernel sources. To avoid modifying the overridden directory, it then
+builds from a _shadow_ copy: a tree of real directories containing
+symbolic links to the files of the original tree, created by
++support/scripts/symlink-tree+.
+
+Packages that read files from the kernel sources, such as headers, must use
++$(LINUX_SRCDIR)+ and not +$(LINUX_DIR)+.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
