Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D20E748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 22:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B13B81F5C;
	Sat, 30 Sep 2023 22:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B13B81F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NiQF-WTQ7WkD; Sat, 30 Sep 2023 22:17:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9B9883C6B;
	Sat, 30 Sep 2023 22:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9B9883C6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA5F61BF5F5
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FB2A41B36
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FB2A41B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F7x90BJBo5ZM for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 22:17:35 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6105B41B18
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 22:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6105B41B18
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3231d6504e1so11272254f8f.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696112253; x=1696717053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fYYVx43KH4uumtJ/YNGnY3LIz9V36fzdQjB/a0EMHwo=;
 b=heERVPeeUXiUP6proXZGbHRifrN/ocWpVSvjiD/PXL+u3HmiBK02ofPnD9UwWHA6in
 x9mYXTa3tcAAsZnWVC1uABDzhm6DRGy6WvVdMvtmEN8yZCrHkLXikv5tyd+B0HyhRKXC
 Lggkgz1dwK5BTia0c058hVTBFb19SXR7OQgfAwl8E4gOm+8527DgAeMsoN0EIqzzF7CW
 7RNEsU1rzE+FL4t+pzdKvDqLlVPaHyO1n+7haupaawQWaYs4E2cDUkp7eYhB4atbzIJo
 eOJsLXr7sYZtwyL9nI58nwPl7o6oG+fzIuOhhKBUgTL9tGnbY9CmFU63nZhoGFWMiidt
 llmQ==
X-Gm-Message-State: AOJu0Yz+tB+nbfAAjPZs8bhu8zBaKyDFKNVSWTFGuvZ6bXyE1cjX7Bkl
 6XBNB5NZjIZnJzh+dkzL8WQWZFOnnQQ9r6dMNQ+p7Q==
X-Google-Smtp-Source: AGHT+IGb2blTc/7dxUuunwYZH2D24r1oieKFHO9QLY7I86BO1xHJPsG3ElFWEz+CpyaZl+poGMNbKw==
X-Received: by 2002:a5d:5b17:0:b0:31f:a4fa:130a with SMTP id
 bx23-20020a5d5b17000000b0031fa4fa130amr7718198wrb.14.1696112253287; 
 Sat, 30 Sep 2023 15:17:33 -0700 (PDT)
Received: from arnoutx1.home
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4d0f000000b00324ae863ac1sm5681274wrt.35.2023.09.30.15.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 15:17:32 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 00:16:24 +0200
Message-ID: <20230930221727.1458825-1-arnout@mind.be>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696112253; x=1696717053; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fYYVx43KH4uumtJ/YNGnY3LIz9V36fzdQjB/a0EMHwo=;
 b=T/lpZn9GY4GTU7UpprfFc4CfJx122Xm7SokEwq05WoPfaIomjxx9GDTGTbo+G7MHVC
 6nh+tYclG/cftqPnqV/T3/5P4R+FQdsSGdnpesMwJ6cGEqLcLbDbstiCYKt9QOPZbHS1
 sz6AuI1mb7eQj7yotVhlXSlsp612EOcMjOuOH98i92KwDjjJGdg+lnC8xkLbHv9N7hCu
 rXyYIUekZVg+Rp9kH1B1b8e/D3XehpkiaU2u+K2tdKMum7EEG+eOHCrnWjBSsb0L+nd3
 aFPdPdnvRdkSgEZSJGwl6T1kL/cZQy3Qgv5SjjpAzTzZQCiULa8fCNEvMaVfmebFwGoP
 /mrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=T/lpZn9G
Subject: [Buildroot] package/pkg-python.mk: refactor setup-type variables
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Signed-off-by : Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Most of the python-package infrastructure consists of a big conditional
tree that sets various variables based on the package's setup type.
Initially, this was quite OK, but since we have 7 different setup types
now, some of which share some variables with others, it's becoming quite
complicated and hard to read.

This patch series refactors it so that the inner-python-package doesn't
dispatch the setup type through a conditional tree, but instead does it
with variable indirection, i.e. by using variables like
 $(PKG_PYTHON_$($(PKG)_SETUP_TYPE_UPPER)_ENV)

The rist two patches are simple cleanups, removing variables that are
not really needed.

The third patch is a preparatory one that splits the build commands for
target and host builds. This is necessary because we need to use
different variables for the two, i.e. HOST_PKG_PYTHON_* for host build.

The fourth and fifth patch each replace one variable from the
conditional tree with an indirectly addressed one.

The following three patches are needed because the ninth patch removes
the PKG_PYTHON_*_OPTS variables, which were used in 3 packages. It is in
fact not strictly needed to remove those variables, but IMHO they don't
add sufficient value to keep them. I think it's better to handle the few
special cases explicitly.

The ninth patch replaces the remaining variables from the conditional
tree with indirectly addressed ones. The conditional tree is now empty,
and the error handling that was in there is made more explicit.

The tenth patch edits the documentation to remove the references to the
PKG_PYTHON_*_OPTS variables that were removed in the previous patch.

This series adds lines rather than removing lines. That is because
things are made more explicit, introducing per-setup-type variables
where previously several setup types were (partially) reusing the pep517
variables. There are also some additional lines because of more line
splitting.

To test this series, I built all the python packages with one specific
toolchain configuration, and I ran all runtime tests for python packages.
One package failed to build: host-python-sip. It also fails on master.
For the runtime tests, 14 of them failed, all of them also fail on
master.


The following changes since commit 7906272c39744e26ed73028725787aa3a4441c54:

  package/python-rtoml: migrate to setuptools-rust infrastructure (2023-09-29 22:02:31 +0200)

are available in the Git repository at:

  git@gitlab.com:arnout/buildroot.git pkg-python-refactor-variables

for you to fetch changes up to 89b33e004fc13e22a9c0bdcafcee245a97d2dd51:

  docs/manual: remove references to PKG_PYTHON_*_OPTS (2023-09-30 15:18:48 +0200)

----------------------------------------------------------------
Arnout Vandecappelle (Essensium/Mind) (10):
      package/pkg-python.mk: remove $(2)_PYTHON_INTERPRETER variable
      package/pkg-python.mk: remove _BASE_BUILD_OPTS variable
      package/pkg-python.mk: split the commands in a target and host section
      package/pkg-python.mk: replace $(_BASE_ENV) with $($(SETUP_TYPE)_ENV)
      package/pkg-python.mk: replace $(_BASE_BUILD_CMD) with $($(SETUP_TYPE)_BUILD_CMD)
      package/python-flit-core: instantiate _INSTALL_CMDS
      package/jailhouse: expand PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS
      package/i2c-tools: expand PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS
      package/pkg-python.mk: replace $(_BASE_INSTALL*_CMD) with $($(SETUP_TYPE)_INSTALL*_CMD)
      docs/manual: remove references to PKG_PYTHON_*_OPTS

 docs/manual/adding-packages-python.txt       |  14 +-------
 package/i2c-tools/i2c-tools.mk               |   6 ++--
 package/jailhouse/jailhouse.mk               |   7 +++-
 package/pkg-python.mk                        | 256 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------------
 package/python-flit-core/python-flit-core.mk |   9 +++--
 5 files changed, 173 insertions(+), 119 deletions(-)



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
