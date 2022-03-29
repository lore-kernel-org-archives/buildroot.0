Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0751C433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 19:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DE1E418B5;
	Tue, 29 Mar 2022 19:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URlgRv1f2BSL; Tue, 29 Mar 2022 19:58:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BD29418AD;
	Tue, 29 Mar 2022 19:58:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 650491BF83B
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61E32605AF
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YCC9i52fR_NN for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 19:58:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AEAD605A7
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 19:58:28 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id p17so18611295plo.9
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 12:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=A+dqziVDudK9OK21WjZMFC+dG2HlQyc8uHXKd/ynlGc=;
 b=is0MhxixhyO0UstRx2IoX4sg4ourtO6udmhkfc6/aSbajpeum9L0SxwJrG6K95ES0Z
 Q7o6hzGZgcUD78pFvVv7rUZZ1wbaeWU4LYNX6zIyXMuK499nlPwZf1rBFdeuZiGpj0iS
 QZ4+kVLQedQjl2asp3hhIptzfvnJQFDibCHmlhpl6ucnhdXeytPxbv6VWE50RjDkGcei
 dEE6gsdXjRB8q07qCjK3xhyifjcz7l0BRFuwKkKf5/ihA60SZGYdLY/mZrKJxtaSpfh3
 bFyyYDTZUgsE4wKw3nf6e+sRf/MqfgF45wCVhEdPdZqifhHh9Ddg+HVW04K1rUi0+k9V
 s4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=A+dqziVDudK9OK21WjZMFC+dG2HlQyc8uHXKd/ynlGc=;
 b=JlpIFWPyK/OJwQv2RR2HkSnVPD8oae0fqfuzSHg0om1kmNJnAZMQ7k6b9gzpU/OXAN
 Ux/LYTHWiGuSfkLwV6wK/IGodP7+5iKDVuFBCmnJGee8nihbOBi+tv/Dpo27V/kgHVaE
 XrakIqxPOMLlojxjvIXHdPdQLzqFnRYxfCrkZ5Ua7r0uWKzQkvnNW1fvfKpcAEXjH89K
 CoiU+Q5a/lxKTy1t3ZUyWZnmR22GlV2qYfbGs7zIJFOjx0PsUgPHY0ZWHevwCZ6Z3E3J
 Zszd9dDqEtxLxognTKCeorT9+3CDJexB8hjxUB4GYF4aJ+fIi9XCB9puDX2SlY0C9JF+
 LBww==
X-Gm-Message-State: AOAM530j0PxCjFXtqsssQDIVcGnlcxh27JHHCmZ/bsT0iPLPaLB/lzgI
 acLxGhx2TB9RSnHbc6M9R2VM2v2oXOuuLQ==
X-Google-Smtp-Source: ABdhPJy6Wpg50MjpQlvGAk1qyjwADjEgBKILit9nXPzuqaI6XYXLrjYrzeFjbMk/zm57goYIzhW4tA==
X-Received: by 2002:a17:902:ab08:b0:154:192:40ab with SMTP id
 ik8-20020a170902ab0800b00154019240abmr32240129plb.80.1648583907848; 
 Tue, 29 Mar 2022 12:58:27 -0700 (PDT)
Received: from smtpclient.apple ([2806:1000:8003:5c6c:6c2f:312d:b304:bc56])
 by smtp.gmail.com with ESMTPSA id
 8-20020a056a00070800b004e14ae3e8d7sm19933059pfl.164.2022.03.29.12.58.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Mar 2022 12:58:27 -0700 (PDT)
From: Alsey Miller <alseycmiller@gmail.com>
X-Google-Original-From: Alsey Miller <Alseycmiller@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
In-Reply-To: <CADvTj4oQxty5MOVPmjXcQXOGXgdFn=LAF4WsgC8Ntf8Q6h-wng@mail.gmail.com>
Date: Tue, 29 Mar 2022 12:58:25 -0700
Message-Id: <6DD9DC86-9DF3-4CF8-9D7E-92F238643AA6@gmail.com>
References: <20220329185059.943889-1-alseycmiller@gmail.com>
 <A770A102-397D-4194-B7CA-FA413C944812@gmail.com>
 <CADvTj4oQxty5MOVPmjXcQXOGXgdFn=LAF4WsgC8Ntf8Q6h-wng@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Subject: Re: [Buildroot] [PATCH 1/4] package/pkg-cmake: allow overriding
 toolchain
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

That commit is not merged and only seems to override the C flags. How can we force cmake to use Clang for target packages? I would be fine with basing my work that patch if support for using Clang and as the C and C++ compiler is added.

> On Mar 29, 2022, at 12:26 PM, James Hilliard <james.hilliard1@gmail.com> wrote:
> 
> On Tue, Mar 29, 2022 at 1:18 PM Alsey Miller <alseycmiller@gmail.com> wrote:
>> 
>> This change is necessary because if you specify the toolchain it will always use the GCC toolchain and C flags instead of the Clang cross compiler  and custom C flags. This is not an issue for host packages, only for target.
> 
> I think this is probably a better way of dealing with the issue:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220322232224.2842266-5-james.hilliard1@gmail.com/
> 
>> 
>>> On Mar 29, 2022, at 11:50 AM, Alsey Coleman Miller <alseycmiller@gmail.com> wrote:
>>> 
>>> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
>>> ---
>>> package/pkg-cmake.mk | 25 ++++++++++++++++++++++++-
>>> 1 file changed, 24 insertions(+), 1 deletion(-)
>>> 
>>> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
>>> index 3b1db35fb6..9b36ee2b47 100644
>>> --- a/package/pkg-cmake.mk
>>> +++ b/package/pkg-cmake.mk
>>> @@ -57,7 +57,7 @@ $(2)_INSTALL_STAGING_OPTS   ?= DESTDIR=$$(STAGING_DIR) install/fast
>>> $(2)_INSTALL_TARGET_OPTS      ?= DESTDIR=$$(TARGET_DIR) install/fast
>>> 
>>> $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
>>> -
>>> +$(3)_SUPPORTS_CMAKE_TOOLCHAIN ?= YES
>>> 
>>> ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
>>> $(2)_BUILDDIR                 = $$($(2)_SRCDIR)
>>> @@ -82,6 +82,7 @@ ifeq ($(4),target)
>>> #   documented as a standard CMake variable. If a package supports it,
>>> #   it must handle it explicitly.
>>> #
>>> +ifeq ($(3)_SUPPORTS_CMAKE_TOOLCHAIN),YES)
>>> define $(2)_CONFIGURE_CMDS
>>>      (mkdir -p $$($$(PKG)_BUILDDIR) && \
>>>      cd $$($$(PKG)_BUILDDIR) && \
>>> @@ -104,6 +105,28 @@ define $(2)_CONFIGURE_CMDS
>>>      )
>>> endef
>>> else
>>> +define $(2)_CONFIGURE_CMDS
>>> +     (mkdir -p $$($$(PKG)_BUILDDIR) && \
>>> +     cd $$($$(PKG)_BUILDDIR) && \
>>> +     rm -f CMakeCache.txt && \
>>> +     PATH=$$(BR_PATH) \
>>> +     $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
>>> +             -DCMAKE_INSTALL_PREFIX="/usr" \
>>> +             -DCMAKE_COLOR_MAKEFILE=OFF \
>>> +             -DBUILD_DOC=OFF \
>>> +             -DBUILD_DOCS=OFF \
>>> +             -DBUILD_EXAMPLE=OFF \
>>> +             -DBUILD_EXAMPLES=OFF \
>>> +             -DBUILD_TEST=OFF \
>>> +             -DBUILD_TESTS=OFF \
>>> +             -DBUILD_TESTING=OFF \
>>> +             -DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
>>> +             $$(CMAKE_QUIET) \
>>> +             $$($$(PKG)_CONF_OPTS) \
>>> +     )
>>> +endef
>>> +endif
>>> +else
>>> 
>>> # Configure package for host
>>> define $(2)_CONFIGURE_CMDS
>>> --
>>> 2.35.1
>>> 
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
