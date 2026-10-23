Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACF2606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kYZT8Tq1
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84BF340AB6;
	Fri, 23 Oct 2026 21:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDpNcwTF4i1w; Fri, 23 Oct 2026 21:52:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8131640ABE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792354;
	b=ehbSKqmlWrRaZ6MDJ3zSvoQh3XCgw6if94Mom78M6NYin3Emlnoweqn2xqegEEUUuATX
	 VkQAfopS/+OJ7RQQKr1gq4QCeqKG2VueyS8EBjj9iNsVYpTEwb1mkrdC+pZF9THAiw0WM
	 tk99cF3PIa6SWNp0rqmQMVPsKkHVXVyDu1S/6gV9O0GlyjnBv06qxaOh4wklXce1q+QKB
	 zS2PozzyasbaA4qOsIeDmA5AQKqsQEgFhlt+sTxQpL+ahe3g2EQrraUiF2/cm1ejv8WV+
	 loxkQd7ZRPvrZfwKnUel+e9S/cAcz/sDmnRM6zwzwY4KaotAg6AUQN+PtBhgqsbcHGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792354;
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
	bh=BZhdh6n5XfVlh28lJ+zBjJf1yzutgbWK4+/q4Ju4k5k=;
	b=Vaa28M3pYmy5d2/vBWIn4O/rziAzLulEvU49ngJhnd7PCMD+fVi+KNuFg3h1CXgB+kQR
	 eqJzxeiKNTX16hs0DaRHz3qVxHrDr1aNFLKQSOQl4HHZhMalbbl2nNG4KuA9Hynf4Qmy8
	 XuuX6obcqISMF7YZVPw7r1VrpM9p0KZdMfE1ORuOuV4T5sdcajyA27W+qdpyq2XUxMr5s
	 oV+HRjaT3z++fE7d/NEI3FyM0UrnE34DTaC/13Pqew79ZCKXsTavgJHclKAJ/C7LLm1VU
	 rtqMJz99b25DQLnPYbutYeM1YxFktC4hkJ8fiZjoXbvGT63Qgy8zyK7hsq9pT2DYuwg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792354;
	bh=BZhdh6n5XfVlh28lJ+zBjJf1yzutgbWK4+/q4Ju4k5k=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=kYZT8Tq1S67KdWRWqH+99jtWUMBxN03i+LvjAoe1TUsR7ngAVLqc5ssPKHKV9ydeM
	 F0Ayj4V4gvhuy45q2M4EBoqrMrKFpfsudrj4hvnCuOe663i9q9BuG1q+wM624KrE5b
	 R2joHNQc7k6M1IQK26r8OhwWHjnCO9eWJAYGRTYMTmZ9CUqPdUOhxBHVWFxD1fo5TN
	 aSjuYc20EZ2cP8Z7P90qPhWdEj+VnxSYlITMPlkjwozoW6S3bv39EbJIcqNmjFCRwk
	 1qz2kav3arkXfVb9ddfs9h3S7in4ZSG9eG7bdvC2fD/BqBgzQptoexoQGCdtOZByZ4
	 Jvv5n0f48pwmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8131640ABE;
	Fri, 23 Oct 2026 21:52:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A29133D9
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 943E940AD3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5hWDnrmq_7H for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:52:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 66CFA40AB4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792348;
 b=aDb1XlBXi1vpZ4LMtjIpg7tIHlXDjdnISgiKqX0jDzQtIKAVUO4fHLenBsURNacZ67Dy
 ZO181+rXDFisOsap245wMJXqod2lYbNbMwrwJfx/9mVm7RdNoYZK5G5Az+F4goExzMl/u
 iROdm/d/ANThBZqXkhwANCzhKWhEQgNB2BhrAaF6vzD91qCpUCXYAjg6i/ltQQ2GcW1hr
 8XW4sBWYgsHg+hrHD1ohxSwQpV+nqColOgTpTdtWj7+QWufrgNukA7hIpkAmzScihIGjp
 pnk47eDhht6/+uYyO3PRK/l5m7Dsm9RVw158y3sE71+rIyMYOPRpxyhO1mbrNgZGA3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792348;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=4o7/yCgsIMEJNgQElGGlp+tY+8FYA0TNkRSn1Q9V+0c=;
 b=gvFaEH1jqWzTQ53Zmc+vKUdmSYwFtm2K40fECQDvvmHHJJzLSG3WnrpiIK9sUlon18V+
 68lFg4wWtdRkTzGPjE3vi0GW83StegFkt6Tixui4LnbByCDih6Jiu3TOlMpvCHIJ0HQmr
 Fy8NTnujYyjhSv7ieO18AYv22avNbfX/oja51IYpMUhtRVM6kdD9HjN5SWtZl6Qyl5sEf
 sg7mi6EnDTTlkv2rd9dviDVWUeJz5+krQIAbKpITdi7tAPgIdtCgIb5HByCCSA/wTpx1R
 oE/5/oZmDTJpnVYG3FcnvebuiL2wDEMGe8CTP4QxDlwXL6tD6Ox+if/FJPOCnY2Lnig==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=JhwT3ggG; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1061"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1061; helo=mail-pj1-x1061.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1061.google.com (mail-pj1-x1061.google.com
 [IPv6:2607:f8b0:4864:20::1061])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66CFA40AB4
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:27 +0000 (UTC)
Received: by mail-pj1-x1061.google.com with SMTP id
 98e67ed59e1d1-398a4dcf289so744776a91.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792347; x=1793397147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4o7/yCgsIMEJNgQElGGlp+tY+8FYA0TNkRSn1Q9V+0c=;
 b=zbYXucOJ3rI7VCZ17T7NdOXhnGE4gEIH8N8DtmuQq5u4boDZrj6Dbzq2iPIFALQ0jv
 9+Xw25s5wsu7tJaq5fLBCwkISHLtRLGmpQr7ELZVqh+FGNHTtwQWeli7jU8Ml9taww5c
 +tY98KuBGAeFmyxd/TDYlVfnagTIZKVl8bm1Wr5/R5sQboyQ8ndEFvL5FkzUiTcgyD+3
 cbgv24uZNCxP8Y6y4ky4VyE9T75uXyrcYRL1ssYjgwZhr4nvnBVLxy0YVeTqF08rCD1P
 kdbPE1ZbTvYjjU5dWcMs2cKwmkcWt7nvAPodUhwxzyRxOjv44ZFZW1KIkHz5RaTRUWYJ
 emSA==
X-Gm-Message-State: AFq9FYJcL5WLsZU+fx5aFPZ6kgnF9LdBFAQVdKfWew5TZ5KYhMZtFYP8
 HYxXRViyCVCZj6T/k2543tPCKSFToJGeae3aBDtJTowS0a06V0XO+48fu8lxhM/8pbBgqsBj7bI
 jc62mwhewZhHyDoKWzgOhxzonR+m2gBfzf9zAvF5TtVBj+sT5fzayeBXDxpsFlk0t0uGDFU6VGQ
 mHXk8xpAdzor2rFVY983Ux7ktQ1LZk2qxr7goKEOzhQ2Ti79BDjlVslYQ6XjhYT+Q/rYZze81Ef
 JLPVltUgPgebZrHJg==
X-Gm-Gg: AYBFou0XqxCjQpYZP0nzaXg5qjyTWt/T+/HxpOIndAuh24nKXMD/nzwNvzwZuELTAh6
 7Av5kcpOwAJqZ5wn3iaQBen69Fo0ZLQMgWG+zTzmvk+QmOLEO+e/PFr22WcVEqqyHSFhkh5JRKZ
 NBu+BFtU9B2zaWpKyMtjifY1it1WeeK+aE70MYUt0GwMj09K968VrUF3/c5KRIXuVdw+/0Vb2er
 nDNOgtmmXYGkplKBzxu8YbdOnzbk67AP3OUbBGjz6QOCDXlZk7DYWTNTH7HG9RMPNEJFGUIYamn
 AeF6XSvm9jl7Tb67FSuclFnZj8HAwGH6XTdVD1kuinEZ8sfo4NRrkYgswR5lHLJ/k6QMcGkbjai
 hDS31Nt94K4cOwu7sMkVWgwn0wL30rJxuRFQ8vGsiUeNvd2oOmZwEzIPPT6hhwy27aH+u+clbyn
 4xROLK7Om+cYZ/6fEIOkQlgIUyvCzJp5xToF8LJqPSnxE=
X-Received: by 2002:a17:90b:1c12:b0:3ac:6e91:3f22 with SMTP id
 98e67ed59e1d1-3adeafca234mr383766a91.52.1792792347104; 
 Fri, 23 Oct 2026 14:52:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adebae5655sm149842a91.2.2026.10.23.14.52.26
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:52:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-351788121cfso4626323eec.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:26 -0700 (PDT)
X-Received: by 2002:a05:693c:20ce:10b0:343:9eb1:9940 with SMTP id
 5a478bee46e88-369e849d12fmr748804eec.26.1792792343773; 
 Fri, 23 Oct 2026 14:52:23 -0700 (PDT)
X-Received: by 2002:a05:693c:20ce:10b0:343:9eb1:9940 with SMTP id
 5a478bee46e88-369e849d12fmr748735eec.26.1792792342651; 
 Fri, 23 Oct 2026 14:52:22 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:52:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:38 -0700
Message-Id: <20261023215138.2301146-17-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 23/23] docs/manual: document out-of-tree package
 builds and the new srcdir variables
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 docs/manual/adding-packages-generic.adoc     | 11 +++++++
 docs/manual/using-buildroot-development.adoc | 30 ++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index e7547460fd50..9c0e9baa117a 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -666,6 +666,17 @@ In the action definitions, you can use the following variables:
 * +$(@D)+, which contains the directory in which the package source
   code has been uncompressed.
 
+* +$(LIBFOO_SRCDIR)+ is the directory containing the package sources,
+  +$(LIBFOO_SRCSUBDIR)+ is the same directory with +LIBFOO_SUBDIR+
+  appended, and +$(LIBFOO_BUILDDIR)+ is the directory in which the package
+  is built. By default, these all point to +$(@D)+, but they can differ:
+  build systems that build out of source set +$(LIBFOO_BUILDDIR)+ to a
+  sub-directory, and a package built out of tree from an
+  +LIBFOO_OVERRIDE_SRCDIR+ has its sources in the overridden directory. A
+  recipe that only reads the package sources (for example to copy a header)
+  should use +$(LIBFOO_SRCDIR)+ rather than +$(@D)+, which is the build
+  directory. See xref:outoftree-build[] for more details.
+
 * +$(LIBFOO_DL_DIR)+ contains the path to the directory where all the downloads
   made by Buildroot for +libfoo+ are stored in.
 
diff --git a/docs/manual/using-buildroot-development.adoc b/docs/manual/using-buildroot-development.adoc
index 72628e0a6f99..bc9ad5d7ab94 100644
--- a/docs/manual/using-buildroot-development.adoc
+++ b/docs/manual/using-buildroot-development.adoc
@@ -119,3 +119,33 @@ cost of a slower speed, add these directories back:
 ----
 LINUX_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS = --include .git
 ----
+
+[[outoftree-build]]
+===== Building out of tree with +<pkg>_OVERRIDE_SRCDIR+
+
+A package can opt in to being built out of tree by setting
++LIBFOO_SUPPORTS_OUT_OF_TREE = YES+. For such a package, when
++LIBFOO_OVERRIDE_SRCDIR+ is set, Buildroot does not _rsync_ the sources to
++output/build/<package>-custom/+. Instead, the package is built from the
+overridden directory, with all the generated files, including the stamp
+files, stored in +output/build/<package>-custom/+. The overridden directory
+is therefore not modified by the build. The +<pkg>_PRE_RSYNC_HOOKS+ and
++<pkg>_POST_RSYNC_HOOKS+ hooks are still run, but +$(@D)+ then does not
+contain the sources: hooks should use +$(LIBFOO_SRCDIR)+ to access them.
+
+Currently the +linux+ package supports this. The kernel source tree must be
+clean (no +.config+, +include/config+ or +arch/*/include/generated+, as
+required by the kernel when using +O=+); run +make mrproper+ in it if
+needed. The kernel is configured and built with +O=+ pointing to
++output/build/linux-custom/+.
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
