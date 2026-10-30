Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072EC606A322
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=THIX+7iz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D41CA40CE7;
	Fri, 30 Oct 2026 15:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeQPmO46rHlG; Fri, 30 Oct 2026 15:28:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 335E740CDE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374083;
	b=luz9Nj/oG8pgfdIKd5BTLFsE+61bj9slT2spIxnMDO5ECFm2A1uZsia6hgp/fS3uSPIH
	 e+k9vIP3S4bCervrov/XXdrbh6CVZte2vdBqar5JU0drI/azjKft0RsIxlfJwk1fR6jwP
	 Yb5d4Jfm1pzPXJf/nf75tVM9ZnxNb8pi/s4KE61BD4VBy3OFptLbWVt2EI5fUW0c5r4m6
	 2xXKhEh8x4Ow8VpVGnBV4QKc6lyjVYGERCCx0PaWn9GB+tD5EXEZ2SmjZFuKHdLMvsWp0
	 KgZp2IAukIwfqtONYdbQdJJn/om6D8VPoB+57587g4K0RywUN08Pza01493S3wAOjoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374083;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uDkhPvAVdX4JtaiX1wWhAZHeTZtqNZF3dES9nn015YU=;
	b=mu3AC10t0IzM7PTCPm3heA7jcvfdWKPYlfq+0j5tB4T9qceuC25Admvz/SGLD+W9kWMX
	 dBIsiAXWL40VXBmeHQK1Y7/RVE6wAVKrCK3QzErPYfQo/aoflpdjgdlKNtijd2DXJMZYk
	 xrjAaAZcDmVcNOlQ8wR1mOq3mRnWxuc2rJOu3Fyc3Ia7NZC13ovj4IfjA0K0Rs3SwQ9O1
	 bDVM2guTsA26LNcFQ2NqtONgjL6r8grfJhKTnH63NKAXaevRnLWb/hpv/NypEuzYpcODC
	 fffDolNcW+X8/e8f5fNuYJqbE93Wd1FG6d2MXYNMo+U5J2DXGGazUk4PUdWbMDijXpA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374083;
	bh=uDkhPvAVdX4JtaiX1wWhAZHeTZtqNZF3dES9nn015YU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=THIX+7izCl6XTh2xrxJNnQc1QevA/NbfUYwbfaQVUITL1LkSqQWQlIJZycTvSDAc5
	 5vxyCwBBHy+qvsgg6Aju6N7p0oIDunVRC73JklfDCpvq6bcOuchzJIK9r408nPiqe2
	 myxGg4dj07TZMXn3C1OPYNJJuYryr7bBSrHd93/IUXcfiJKqOhEEBDCJv1nFbg5OA7
	 5029HSxxwkbhOmBE5RRI2n4WGQ1Qa6SnNb6ykVVeEdK8frgj1Uy8tfaux+oFTzmzEk
	 otEyR/eT+uVVRKjNfLdQXant/tFAuiwwjqoKC4149+/O1zC85HFt9xilHQO+vzq+2W
	 fKquh9Z35WWeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 335E740CDE;
	Fri, 30 Oct 2026 15:28:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 101B9235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01A7360B0F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1yUBHtyFh2v for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B4BA260B0C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374062;
 b=DK/48U5Yv+U8eigygYO+sHAj79yzfOkGOdK/1EfT269g6GklVcCd9sVkPQHohe7sUsz+
 4Rp5yNZijLOc8IAWFGX2iYXQFFcJYjr1hA0a4vv+yNl6+2s5MQwnscQG0NUS4+hdVe2Yd
 BlpMqhfHxGhScMnvrMQqoWP/LsJd2ZShnqHoBoBpuWhTEx8roTMPMmyvv8HEESjItAKFL
 NQeC07rx/EzPVQiFhlpPBuQixo5d2ZI5/8KAgZmFahmYy1oRhrcYMyAhwQIpJ3VTxoJ4g
 NENCdELG1MMpzpFrOrTtYCKPR4FiKYSxNI0w6KiDcNWGJqxkklhtca3RO182nazlfaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374062;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=45b4lrgyp5BKqS4djvkbGxLAfWcBaNkXsZTKY5w4Ji0=;
 b=C5FR3Q4HkLuoLikUEk/atr0w2VB9a9VJ0IQDiMRjbC5d89VPVxMqtr11qEI1q23JJZQu
 XQUL4sfxYpwVQKI0PxILCY1kcLBpWzGONPnUPpODNmn27uQmFpPwUqA67pe/vifMxw5M1
 e1vKkTopSFo7PbnM4aEaeZosHSdEBfv/BH8lHfWDHFqXGmuyKcmxkJRiZgdD2kw9Q9DIw
 n6qpVmtpBrM7zQaI2RH3h6CO/NqiWxjdSvCtjDIR6RpC+D6quHNxZSkve3oL56ybr0vQU
 DdMhHKT0odTWpDh81EGOHAxlu2BLwdiR4GzAM+0+9RUCWFPAv5ZrbO1QyiNrhkFZsTQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dY0bOw56; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4BA260B0C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:41 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a60f9474c4so9235575e9.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374059; x=1793978859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=45b4lrgyp5BKqS4djvkbGxLAfWcBaNkXsZTKY5w4Ji0=;
 b=wktvkhokrOEtD8/Rwr5KHs8NWwtBtx4Io0yY5JB6mwes61xnbJB4kYhe1UWQ7h/k+R
 4xC5LE5UUcYaH+kqKfq0lHqXB5spQe44E5gZf8ifPdw6Qcku1VrEeKliJAcRnaDD10sJ
 9MZTFr9vOs394A2LgAF2ZqEvNo4OJNhCdANTkzGjssFPkTHTONgT38El5MaMNnmGYyiB
 zBLXvORdT4y+LcjEk23A7YU8TF3Vpho6xLANSCz10BKdFcF8J/EnQadf1z9H3sSh6PW2
 v382jMhBDnidFukOWrTGK3wsmGKK8F3ldGxMvEr9nhh/gWxq3io7TljhXA/ZPNE7a0CQ
 Txhw==
X-Gm-Message-State: AFq9FYJ1qvu/IJCj9dulZP1A91/Djo7tp+qYa/tKnUpSUC5dx/bsI33W
 i4eAFtDcSCrOyixlsI6JbJgKQ6X1gEWiMjHhlOGIBFiOdqE3WDDhSP7pCmb/uFLWVxCBwTiK3Pq
 DlRDQRos=
X-Gm-Gg: AYBFou2UPhrv3FMxlVFWuaV/rJ4p2+d4kr5r6DGUwgez0tUdyBHD6iVedwRxyR8jhkr
 K1a0eLRCYEL2Rcjy9jhtdV4E7xnU3SMvMuo81FEkhljlHIW1kvQnC39YdFZ9Il7l/Dt6x4pBvAG
 6hjc40Ioefkobrkbjmo4sTI/qLtRGCcjWCBUFRthjfVAq+RBV/eMtis9ZwJnRQPRvr3H04Im/Ky
 eyPn0iBjvgUfj4XMcEsSs3VAX83QqH7t1bMOVB65k67POZSO/+tsi/WEast0mVcyaqhNKXOYLHG
 9ClOeGRO77M+xV7yFw4WIUWhJsb/q3sefnhNAMxcEDJpGzJuBuDLQhBckDdE1mN5iN9ee82ineG
 Pxw2AjgcRZKXJkrdJ7CbktnEWjJbGpxLWMpeKnrmPYc6mPMaFmGaB0hQbD0WjXiRNx+Oy1QBfqn
 YHyBV8iP6pig1ZqbwclseyYidCf/4z1U7rhP7khnUvpwc07vgxy8FK3Ho4M5PNfD/HT4Fcvr9iy
 Y1+6B5W7LicI9NTMxlsa5r7HB5BxZC2l9NHP37TRAr5xg9pdbi6i0OejGUV6VhiyiKRcLYdr49q
 RVuwtVvzHO4rmWhyaTpm19OJciNZ0CcZpcRiaqOpkrv4e8/LT78lJED4kzY0ZZHfWpzXj2hnsQ=
 =
X-Received: by 2002:a05:600c:34d1:b0:4a0:b6:4619 with SMTP id
 5b1f17b1804b1-4ac12475a61mr57766375e9.0.1793374059296; 
 Fri, 30 Oct 2026 08:27:39 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac08b72578sm26451215e9.2.2026.10.30.08.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:38 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:36 +0100
Message-ID: <20261030152738.1906860-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020221309.4194290-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/gobject-introspection: fix host
 build when /bin/sh warns
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> host-gobject-introspection is built with LD_LIBRARY_PATH pointing to
> $(HOST_DIR)/lib. When g-ir-scanner calls pkg-config, which in Buildroot
> is a /bin/sh wrapper script, the shell inherits that LD_LIBRARY_PATH.
> On hosts where /bin/sh is bash linked against the system libreadline
> (e.g. Arch Linux), and host-ncurses has already been built, the
> dynamic loader picks up Buildroot's libncursesw, which has no symbol
> versioning, and warns on stderr:
> 
> /bin/sh: .../host/lib/libncursesw.so.6: no version information available (required by /usr/lib/libreadline.so.8)
> 
> giscanner merges pkg-config's stderr into its stdout and parses the
> result as compiler flags, so the build fails with:
> 
> gcc: error: /bin/sh:: linker input file not found: No such file or directory
> gcc: error: .../host/lib/libncursesw.so.6:: linker input file not found: No such file or directory
> gcc: error: no: linker input file not found: No such file or directory
> ...
> 
> Backport the pending upstream merge request, so that giscanner only
> parses pkg-config's stdout.
> 
> This issue has been present since commit 8270fca228b1
> ("package/gobject-introspection: fix host-linking"), which started
> setting LD_LIBRARY_PATH for the build, while giscanner has been
> merging pkg-config's stderr since 2018. It only shows up on some build
> hosts, when host-ncurses is built before host-gobject-introspection.
> It therefore affects 2020.05 and later, including 2025.02.x and
> 2026.02.x.
> 
> Fixes:
> https://autobuild.buildroot.org/results/615b6701c6c200f6e6f3081e784f981e4f4f644e
> 
> Fixes: 8270fca228b1892b699801536ce136460e4892e9 ("package/gobject-introspection: fix host-linking")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Changes v1 -> v2:
>   - backport the earlier upstream MR !561 by Franciszek Stachura,
>     which makes the same change, instead of my duplicate MR !568
> 
>  ...2-giscanner-Do-parse-stderr-as-flags.patch | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/gobject-introspection/0002-giscanner-Do-parse-stderr-as-flags.patch
> 
> diff --git a/package/gobject-introspection/0002-giscanner-Do-parse-stderr-as-flags.patch b/package/gobject-introspection/0002-giscanner-Do-parse-stderr-as-flags.patch
> new file mode 100644
> index 0000000000..f19d8ce092
> --- /dev/null
> +++ b/package/gobject-introspection/0002-giscanner-Do-parse-stderr-as-flags.patch
> @@ -0,0 +1,56 @@
> +From 5685062db8924fe0a58a9a2a3f435217614dcc9f Mon Sep 17 00:00:00 2001
> +From: Franciszek Stachura <fbstachura@gmail.com>
> +Date: Thu, 20 Aug 2026 20:23:16 +0200
> +Subject: [PATCH] giscanner: Do parse stderr as flags
> +
> +check_output in pkgconfig.py returns stdout with stderr. If pkg-config
> +prints something to stderr (ex. dynamic linker warnings, or warnings
> +from program passed in PKG_CONFIG), it may get parsed as flags and
> +passed to the compiler.
> +
> +Do not capture stderr in check_output at all.
> +
> +Upstream: https://gitlab.gnome.org/GNOME/gobject-introspection/-/merge_requests/561
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + giscanner/pkgconfig.py          |  2 +-
> + tests/scanner/test_pkgconfig.py | 10 ++++++++++
> + 2 files changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/giscanner/pkgconfig.py b/giscanner/pkgconfig.py
> +index 39db41d61..19c5953ea 100644
> +--- a/giscanner/pkgconfig.py
> ++++ b/giscanner/pkgconfig.py
> +@@ -31,7 +31,7 @@ def check_output(flags, ignore_errors, command=None):
> +     argv = command[:]
> +     argv.extend(flags)
> +     try:
> +-        return subprocess.check_output(argv, universal_newlines=True, stderr=subprocess.STDOUT)
> ++        return subprocess.check_output(argv, universal_newlines=True)
> +     except subprocess.CalledProcessError as e:
> +         output = e.output or ''
> +         if ignore_errors:
> +diff --git a/tests/scanner/test_pkgconfig.py b/tests/scanner/test_pkgconfig.py
> +index 8b654e38e..5da0eb4fc 100644
> +--- a/tests/scanner/test_pkgconfig.py
> ++++ b/tests/scanner/test_pkgconfig.py
> +@@ -104,6 +104,16 @@ class PkgConfigTest(unittest.TestCase):
> +             flags = pkgconfig.cflags(['bar-3.0'], command=command)
> +             self.assertEqual(flags, ['-DLOG="HELLO"'])
> + 
> ++    def test_pkgconfig_stderr(self):
> ++        s = """
> ++        import sys
> ++        print('warning: test', file=sys.stderr)
> ++        print('-ltest')
> ++        """
> ++        with pkg_config_script(s) as command:
> ++            flags = pkgconfig.cflags(['foo-2.0'], command=command)
> ++            self.assertEqual(flags, ['-ltest'])
> ++
> + 
> + if __name__ == '__main__':
> +     unittest.main()
> +-- 
> +GitLab
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
