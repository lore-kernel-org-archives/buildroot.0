Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EC3EB64D7
	for <buildroot@archiver.kernel.org>; Fri, 23 Jun 2023 16:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEFC2416AD;
	Fri, 23 Jun 2023 16:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEFC2416AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGFB62QQAynC; Fri, 23 Jun 2023 16:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D713E41583;
	Fri, 23 Jun 2023 16:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D713E41583
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D07CF1BF21A
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 16:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B749082E1A
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 16:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B749082E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOk82izs720Y for <buildroot@lists.busybox.net>;
 Fri, 23 Jun 2023 16:59:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9636E80C04
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9636E80C04
 for <buildroot@buildroot.org>; Fri, 23 Jun 2023 16:59:15 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-51a3e6a952aso899408a12.3
 for <buildroot@buildroot.org>; Fri, 23 Jun 2023 09:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687539553; x=1690131553;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wln3Qe5cndI4HzfIddh3kCOgOqxDq9RlmXAgxpneXoA=;
 b=TDRqNy5t5ZjOSVGwcPzuw1W6xk7xG7Q9KEaqpaZ8BtY2zfixr2fSgV+14kgJR1X1Yq
 6u1zoBJ+ErRiyngZ1VyZNw5zOv1ql2Tr5lMYgPILK3nJWFAgrqDMN8Uc4MSVxnxQbuBp
 7dJ6F7a7sbtl5rabbeeRu1WBdRZS2RAi3ZG+r+JILBQ2QXcZWU27YcnR4wLRyMCH7PBu
 Hlcift9EY4xN1hoqQ+cc/ObDicFO0wN2ky2V1gD3HO4eZHjg6IOLA3KD75QJcFQvX3XY
 DPvBZci+q1wGYW7daP9jmtLTvW8KvTUcX6zDJkQGfp//q+1ZS8DhlW9sQLpmEaU136rE
 16YA==
X-Gm-Message-State: AC+VfDxJmr6D2CW+2X8C0H4vN/bi/+uILkhxFwjduFHdH8J33pt6LrYY
 oNgowfWwB+QggX2S9u3/F0tZuO88gsGKAQ==
X-Google-Smtp-Source: ACHHUZ48z/ko7Qv/8I3yEjOiuniW+7Z/UFBnSKco3SUcfl5I63EZKNRLDONfrgjmTrH9eCN4HldYvg==
X-Received: by 2002:a17:907:802:b0:982:a454:6d20 with SMTP id
 wv2-20020a170907080200b00982a4546d20mr17605435ejb.54.1687539552948; 
 Fri, 23 Jun 2023 09:59:12 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 f12-20020a17090624cc00b0098d2261d189sm2621662ejb.19.2023.06.23.09.59.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 09:59:12 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-51bde6a8c20so919211a12.0
 for <buildroot@buildroot.org>; Fri, 23 Jun 2023 09:59:12 -0700 (PDT)
X-Received: by 2002:a05:6402:404:b0:51b:fbf3:d9a7 with SMTP id
 q4-20020a056402040400b0051bfbf3d9a7mr1239312edv.39.1687539552132; Fri, 23 Jun
 2023 09:59:12 -0700 (PDT)
MIME-Version: 1.0
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Fri, 23 Jun 2023 10:59:00 -0600
X-Gmail-Original-Message-ID: <CADXxVSKVs-LQ7we1DPQ3oN46ONQ-d56Cza8zRZ=2HyTGZ-bTow@mail.gmail.com>
Message-ID: <CADXxVSKVs-LQ7we1DPQ3oN46ONQ-d56Cza8zRZ=2HyTGZ-bTow@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] Using a go.mod in a subdirectory
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
Cc: christian@aperture.us
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi All,
I was looking at adding a package for shellhub in buildroot.  Two
issues, first one is that the latest needs go 1.20.  I applied this
patch (https://patchwork.ozlabs.org/project/buildroot/list/?series=358451)
to get around that which seems to work so far.   CC: Christian since
I'm testing with his patch set.

The 2nd issue is the agent is in a subdirectory with its own go.mod
that is different from one the on the root directory.

Is there a way to do this better?  Or is the go.mod required to be in
the root of the repo?

SHELLHUB_VERSION = v0.12.3
SHELLHUB_SITE = $(call github,shellhub-io,shellhub,$(SHELLHUB_VERSION))
SHELLHUB_LICENSE = Apache-2.0
SHELLHUB_LICENSE_FILES = LICENSE.md
SHELLHUB_DEPENDENCIES = libxcrypt

SHELLHUB_GOMOD = github.com/shellhub-io/shellhub/agent
SHELLHUB_LDFLAGS =  -X main.AgentVersion=${SHELLHUB_VERSION}

# SHELLHUB_BUILD_TARGETS = agent
# SHELLHUB_INSTALL_BINS = $(notdir $(SHELLHUB_BUILD_TARGETS))

 $(eval $(golang-package))


I can export my output/host/usr/bin and do go build -ldflags "-X
main.AgentVersion=v0.12.3" and it is able to build in that way, so it
seems the host-go 1.20 patch is working.

Bryce
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
