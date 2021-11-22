Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB9AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 20:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55FF1605F8;
	Mon, 22 Nov 2021 20:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rf2_7a7T1tEa; Mon, 22 Nov 2021 20:42:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E1C560636;
	Mon, 22 Nov 2021 20:42:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B1D51BF5AD
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 20:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37DA360636
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 20:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZIDj7nCWWXG for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 20:42:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8089605F8
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 20:42:43 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y12so82401408eda.12
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 12:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AfV3d/TRGV638qqxyPgyPHIlg/C7GzEGAOduBYf0WdI=;
 b=VtOQMc9X89dDm11xSTRBKwNKBGidaUAh5Nu05rTz1qdrYuYVTWcEbcWABRQwk4Y+FP
 Ny9y8Z1Vx3PRTEnPyNA6B1F0eWgchKR8MClNtQOcLj95dnwWjrkxTR9p+rAi7jtuCpxB
 86muydMeV4TiHkfVRsXZU+DTKkjzpfWnBFIxGenJjYixi4XDazXV6SbiiBgZW7XJZiac
 SphHge5i+HMTGFjA4H5iAf+naJR8O/mEg3KSAuu/Hh+/LBOWOzQpDob/khRSR0l6ZoAH
 6apNQy+zm8f+J69dDQ+jb6IZaYng3xiQnQOijKyiqsG3WHh+pnEQEKGOuYf0xgmG09K0
 pvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AfV3d/TRGV638qqxyPgyPHIlg/C7GzEGAOduBYf0WdI=;
 b=euazVNQwMqPqNN8jh/KZBBK3X8unuqJoVKL6FlSd3Tw8Bo6IFCkZbpY1tJ+UZ69VZW
 qtTbhdVHnxCp1KjmmOisTS8KSOFLABGt59TEPNQo/19cHxOFQBsQCHXP6jKgPk8wFDh5
 FWd0Zcb7GNM7mnuzdRiw6F4rtS0jfEwdJwREZwpr3pQasCGSab5vFHxUgJXjtKiDZLjB
 Kj8OcLC0ITMe4M9SBrFN6rGZ6/tSGMgAGMpt4S6VqLdu/icctxAhJkmGa01xf9ExTYEp
 12cMhL2UwpNFVOw+fcEbm3w7vq6zRLIxC9V0k6ch/lQ/vKIMpM4flSmnEDVb12J8AThW
 JXRw==
X-Gm-Message-State: AOAM532rSIwKzLNF1h+3+M3dVrc5zYC5h5wm8B5X3iXkaizeBDVy4u2o
 R3lFfBvf2HLE4LjsQGFz3qJddw==
X-Google-Smtp-Source: ABdhPJysKtfO9izn4XCO+6s8qTRLwcPTAhustN3RdnMWZXyzP5/LfbBMwt4Ol4o2wyxpyRMktmQlxQ==
X-Received: by 2002:a50:d68e:: with SMTP id r14mr68697083edi.5.1637613761924; 
 Mon, 22 Nov 2021 12:42:41 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cy26sm4653043edb.7.2021.11.22.12.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 12:42:41 -0800 (PST)
Message-ID: <e4c35292-8807-37f1-086c-95d9b274df44@mind.be>
Date: Mon, 22 Nov 2021 21:42:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211118210623.1598934-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211118210623.1598934-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: run autoreconf
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/11/2021 22:06, Fabrice Fontaine wrote:
> For an unknown reason, the build fails since bump to version 1.4.60 in
> commit d62b7f54f00291a50274409fb5510527fd725ffe on:
> 
> array.c:140:2: error: 'for' loop initial declarations are only allowed in C99 mode
>    for (uint32_t i = 0; i < sz; ++i) {
>    ^
> 
> Running autoreconf fixes the build.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/0349d8fed35b0766796dd9ba3b8de6ff8bd68fe7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  After reading this thread and the upstream bug report, I did a bunch more 
analysis and drilled it down to the real issue. See the bug report and the 
updated commit message:

     Since upstream commit bb1d35dc1767 [1] (which is part of the bump to
     version 1.4.60), configure.ac no longer checks for a specific C
     standard. It will therefore use the "default" standard. With autoconf
     2.69 (which is what is used to generate the configure script in the
     tarball), the default standard is C89, which requires no option to be
     passed to the compiler. However, that means that older compilers, e.g.
     GCC 4.8, will indeed use C89 and not C99. This leads to the following
     error.

     array.c:140:2: error: 'for' loop initial declarations are only allowed in 
C99 mode
       for (uint32_t i = 0; i < sz; ++i) {
       ^

     In autoconf 2.71 (which is used by Buildroot), the default standard has
     changed: it is now C11 if available, C99 failing that, and finally fall
     back to C89. Since GCC 4.8 (and later) support C11, that's what will be
     selected, so C99 is allowed as well. Thus, running autoreconf fixes the
     build.

     The issue was reported upstream [2].

     Fixes:
      - 
http://autobuild.buildroot.org/results/0349d8fed35b0766796dd9ba3b8de6ff8bd68fe7

     [1] 
https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/bb1d35dc17671bc308e25651b4f5fa0c3008cc69
     [2] https://redmine.lighttpd.net/issues/3116


  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/lighttpd/lighttpd.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
> index 9c18a6038e..c39a5db20f 100644
> --- a/package/lighttpd/lighttpd.mk
> +++ b/package/lighttpd/lighttpd.mk
> @@ -12,6 +12,8 @@ LIGHTTPD_LICENSE = BSD-3-Clause
>   LIGHTTPD_LICENSE_FILES = COPYING
>   LIGHTTPD_CPE_ID_VENDOR = lighttpd
>   LIGHTTPD_DEPENDENCIES = host-pkgconf
> +# Issue in configure script provided in tarball
> +LIGHTTPD_AUTORECONF = YES
>   LIGHTTPD_CONF_OPTS = \
>   	--without-wolfssl \
>   	--libdir=/usr/lib/lighttpd \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
