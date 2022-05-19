Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBD8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3229641D1A;
	Thu, 19 May 2022 14:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gj9sfpFbDIak; Thu, 19 May 2022 14:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95CDA41A06;
	Thu, 19 May 2022 14:08:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1FE71BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A0E341986
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RD8l9ucKQ_vP for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 441FD41A06
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:21 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id j25so7328534wrc.9
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QywTio6Fh5fbxMvR2vkGfYkfK/HrkchTgHJhMAt9T6Q=;
 b=AV1vjN6ZXGubHkPxqWmBZ263ZhRXaErOPPWfCumncQmijdwgbkqA5F9K/wrTa9BYO/
 MkkfbEsL5Pc/KYbSHImalTiXzzftdWfytH74TDTkJgOGZ9N+QNScITMR3CzdS9OCn8KO
 QSo0+f4BwtPZEwg2gvP01SpqrEszNWWQp8VgOiO0w0dRAiHEzO8mFXpU6x8YDBvnEPh6
 OUL7yAm8UP/YfzRWmiTTJMuTbm0SnU2ynBYHXRAqwi/i5974fAB8Zs4/Sf6bBOzdCN/P
 SN3x32c1vIPKjmoCIgD9zSKx44GfOefTs+dMzCZ7kHJBetYoUQxeq3geerp55Luu3WXh
 CBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QywTio6Fh5fbxMvR2vkGfYkfK/HrkchTgHJhMAt9T6Q=;
 b=rwdERs8lYaOuAbUQuGiwRE5FbYY1lmP0Fg9MuuHNQ0hb+wz7lj3xeKS5+Qho2sX/Zm
 8wbc1dpcSayYXV5gmE7j5wu7uDPvdqlDIl03xDUIP6kfhWuOBrKi0n5gm4LzsIflZNDy
 rE1qgHvqYLoYn5Y64Az5BqNU44cynfM3eE14o3RaPQP0wtWFYGeteodWBtbBRPDpewS/
 bGYwiyRo0AwtsSpGgW6eQko6EQpFXoLPS7Px6J8tT7EQ8iIEzXzX+ZQf02uAyXuX8ZoD
 8s5SugIeSY5+zMNBS6Afowt1tjdIVNE/x9EAm93/XiEzcskU+EDhMy27nct2HwWHA86Q
 UN0Q==
X-Gm-Message-State: AOAM533B+CPu6WxF9b32W27e2GU7EljaCt7bsNxPW/Dj4JYrNpeeDzLO
 fQB0Ih9mLl+jnyIKJP6z3majDRU9qB4=
X-Google-Smtp-Source: ABdhPJySfJlimQPX13SmpKDSllmGhThoE31hAQAHZpPVt2AA5lNzN/LhbKIrF1oW9CuD/gtxs6rXkg==
X-Received: by 2002:adf:ffd2:0:b0:20e:60ec:c37b with SMTP id
 x18-20020adfffd2000000b0020e60ecc37bmr4291795wrs.348.1652969299242; 
 Thu, 19 May 2022 07:08:19 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:18 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:07:50 +0200
Message-Id: <20220519140810.1953601-1-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 00/20] Update Ejabberd and its dependencies
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ejabberd has many dependencies. Update all of them to the versions
needed by ejabberd-21.12.

---
Changes v1 -> v2:
- bump erlang-idna version to 230a917 to avoid backporting the last
  commit (suggested by Yann)

Johan Oudinet (20):
  package/erlang-idna: bump version to 230a917
  package/erlang-lager: bump version to 3.9.1
  package/erlang-p1-utils: bump version to 1.0.23
  package/erlang-p1-cache-tab: bump version to 1.0.29
  package/erlang-p1-tls: bump version to 1.1.13
  package/erlang-p1-stringprep: bump version to 1.0.27
  package/erlang-p1-xml: bump version to 1.1.49
  package/erlang-p1-xmpp: bump version to 1.5.6
  package/erlang-p1-yaml: bump version to 1.0.32
  package/erlang-p1-yconf: bump version to 1.0.12
  package/erlang-p1-oauth2: bump version to 0.6.10
  package/erlang-p1-pkix: bump version to 1.0.8
  package/erlang-eimp: bump version to 1.0.21
  package/erlang-p1-mqtree: bump version to 1.0.14
  package/erlang-jose: bump version to 1.11.1
  package/erlang-p1-acme: bump version to 1.0.16
  package/erlang-p1-stun: bump version to 1.0.47
  package/erlang-p1-sip: bump version to 1.0.47
  package/erlang-p1-zlib: bump version to 1.0.10
  package/ejabberd: bump version to 21.12

 ...not-download-or-compile-dependencies.patch |   24 +-
 package/ejabberd/0003-fix-includes.patch      | 1614 +++++++++++++++++
 package/ejabberd/ejabberd.hash                |    2 +-
 package/ejabberd/ejabberd.mk                  |    5 +-
 package/erlang-eimp/erlang-eimp.hash          |    2 +-
 package/erlang-eimp/erlang-eimp.mk            |    2 +-
 package/erlang-idna/erlang-idna.hash          |    4 +-
 package/erlang-idna/erlang-idna.mk            |    2 +-
 package/erlang-jose/erlang-jose.hash          |    4 +-
 package/erlang-jose/erlang-jose.mk            |    2 +-
 package/erlang-lager/erlang-lager.hash        |    4 +-
 package/erlang-lager/erlang-lager.mk          |    2 +-
 ...ipt-remove-extra-dependency-to-base6.patch |   26 -
 package/erlang-p1-acme/erlang-p1-acme.hash    |    2 +-
 package/erlang-p1-acme/erlang-p1-acme.mk      |    2 +-
 .../erlang-p1-cache-tab.hash                  |    2 +-
 .../erlang-p1-cache-tab.mk                    |    2 +-
 .../erlang-p1-mqtree/erlang-p1-mqtree.hash    |    2 +-
 package/erlang-p1-mqtree/erlang-p1-mqtree.mk  |    2 +-
 .../erlang-p1-oauth2/erlang-p1-oauth2.hash    |    2 +-
 package/erlang-p1-oauth2/erlang-p1-oauth2.mk  |    2 +-
 package/erlang-p1-pkix/erlang-p1-pkix.hash    |    2 +-
 package/erlang-p1-pkix/erlang-p1-pkix.mk      |    2 +-
 package/erlang-p1-sip/erlang-p1-sip.hash      |    4 +-
 package/erlang-p1-sip/erlang-p1-sip.mk        |    2 +-
 .../erlang-p1-stringprep.hash                 |    2 +-
 .../erlang-p1-stringprep.mk                   |    2 +-
 package/erlang-p1-stun/erlang-p1-stun.hash    |    2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk      |    2 +-
 package/erlang-p1-tls/erlang-p1-tls.hash      |    4 +-
 package/erlang-p1-tls/erlang-p1-tls.mk        |    2 +-
 package/erlang-p1-utils/erlang-p1-utils.hash  |    2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk    |    2 +-
 package/erlang-p1-xml/erlang-p1-xml.hash      |    2 +-
 package/erlang-p1-xml/erlang-p1-xml.mk        |    2 +-
 package/erlang-p1-xmpp/Config.in              |    1 +
 package/erlang-p1-xmpp/erlang-p1-xmpp.hash    |    2 +-
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk      |    2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.hash    |    2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk      |    2 +-
 package/erlang-p1-yconf/erlang-p1-yconf.hash  |    2 +-
 package/erlang-p1-yconf/erlang-p1-yconf.mk    |    2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.hash    |    4 +-
 package/erlang-p1-zlib/erlang-p1-zlib.mk      |    2 +-
 44 files changed, 1675 insertions(+), 85 deletions(-)
 create mode 100644 package/ejabberd/0003-fix-includes.patch
 delete mode 100644 package/erlang-p1-acme/0001-rebar.config.script-remove-extra-dependency-to-base6.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
