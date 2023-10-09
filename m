Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCF5CD613C
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 21:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C16381BCF;
	Mon,  9 Oct 2023 21:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C16381BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5aY52jiugtcR; Mon,  9 Oct 2023 21:37:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51ABE81C26;
	Mon,  9 Oct 2023 21:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51ABE81C26
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E53C61BF42C
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 21:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C99EF4167F
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 21:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C99EF4167F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C_7l1X8BG0Ky for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 21:37:46 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE12F415D9
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 21:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE12F415D9
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9b98a699f45so840346466b.3
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 14:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696887463; x=1697492263;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IrozxZwhcBUsk84RkOtKIcv9ElHBY3NnoRmFyYhjlDM=;
 b=HMI4DLg7/AAo2OsRo4u3xBTsL2i/wQvqBHmOzMk38qJM85CUzparkdQ+pySp8qZKVV
 lo6KliyTMPes1Dpkv405mx9pt343PCS6nMNQAvDp97g2DH2cWA57ZQcOQyUgnPMysp8r
 IcMLyExNOLqn3BbcxxE0GnU3UDIna8OruIkPtz+YboSn+oJ2nFrpbD9Gpy1blKXIF8h3
 g+tyRW7SDRoZ+kbeUv1MJBsCcFUrEN+L3bsomW/UtxhNdYxAB2BNnoxzvdesG3H4UPRh
 Cthr2Jj8gPPShmFp0GCMhCtYmXEp+NKfCgiwgYBCs78tpIjJtVsL9cPYM5voyAZzX8l1
 DIIw==
X-Gm-Message-State: AOJu0YwdRUn/bGwUtVsd/r4qU2GPRpsCkwyg7omNOFfAO9htCxyorpSU
 E5XQM1tYqm8g43/lcLVgtiz5YZo72XbLjCtCp5E7tAFQ+CXGfg==
X-Google-Smtp-Source: AGHT+IHNGrhtiE1KUU9nKeBRFisx/2s1GkV/HSsylEKzM2hTn1s7OzpOdsa8W6WiM+IzNFmw82vOJ7pdiwzVXG0latQ=
X-Received: by 2002:a17:906:748b:b0:9b2:b71f:83af with SMTP id
 e11-20020a170906748b00b009b2b71f83afmr14136015ejl.20.1696887463207; Mon, 09
 Oct 2023 14:37:43 -0700 (PDT)
MIME-Version: 1.0
From: Charles Hardin <ckhardin@gmail.com>
Date: Mon, 9 Oct 2023 14:37:31 -0700
Message-ID: <CAN=fXj3uioP_fhczziposSJ1A-t+QzE0kyYj8D5AqZVd8Gmt-A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696887463; x=1697492263; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IrozxZwhcBUsk84RkOtKIcv9ElHBY3NnoRmFyYhjlDM=;
 b=hIPDWZwbbR5dTmqr3i0VHEH1+uyFL68G2hANf85QBTX9GWbED1pziWnGOst/tYjDRl
 g6EIPZvOYR/oYNXWyVMCGfZwpyEnkGsHrQyii19hOv5tvhwtjxU6HCBYOFiNnkFMgTzf
 yGAEk2BfO5L7M368mIQGhl2CazEyGhvZaQ07MCn5IeE11YedLhDsMngETqjT3uCcVn5T
 KbP4QJ9Y4JYLGhewMZCzoiI4HeAM3IUKC4XANA+ZKJtXRUhJq3tI7cqj+jKejfn1qXdE
 efkHSgwsyYoERr2nZ9Rz3KEw37r287dDCNIcgD15f4h0lUTz5qDMOh3sGoVncQNu9gFi
 EhXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hIPDWZwb
Subject: [Buildroot] [RFC] Per-package and relocatable SDKs problem?
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
Cc: Charles Hardin <charles.hardin@chargepoint.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For the curious,

We have discovered a problem in that the per-package build of the host
directory is doing an rsync to finalize the tree from the last
per-package directory in the dependency chain (in our case below this
is qt5tools). This means that several text files like the one below
(shasum) contain the per-package directory path in them.

For example - a per-package build and check the BUILD directory to
check the shasum script

    $ head -5 host/bin/shasum
    #!/home/ubuntu/emb-platform-build/falcon/ucb/per-package/qt5tools/host/bin/perl
        eval 'exec
/home/ubuntu/emb-platform-build/falcon/ucb/per-package/qt5tools/host/bin/perl
-S $0 ${1+"$@"}'
            if 0; # ^ Run only under a shell
    #!perl
    ... snip snip ...

This works in the build path but will fail when the SDK is made and
relocated because the relocate-sdk.sh script doesn't handle
per-package paths.

    # Make sure file uses the right language
    export LC_ALL=C
    # Replace the old path with the new one in all text files
    grep -lr "${OLDPATH}" . | while read -r FILE ; do
        if file -b --mime-type "${FILE}" | grep -q '^text/' && [
"${FILE}" != "${LOCFILE}" ]
        then
            sed -i "s|${OLDPATH}|${NEWPATH}|g" "${FILE}"
        fi
    done


The OLDPATH is the old location of the directory without the concept
of the per-package paths in the tree. So, is this something that is
known? Tried searching the mailing list and commits and didn't see a
reference to this problem so was a bit curious.

Charles
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
