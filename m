Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2EA606A329
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 08:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=REn9jXFK
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CA26405B6;
	Tue,  3 Nov 2026 08:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlQjOKsn65IJ; Tue,  3 Nov 2026 08:07:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 715CB405AD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793693276;
	b=KFmBDCOxwKTKpkdmxOkmZpOJZRfovHxB0HBWHrhSZK+aVHeLV4GLOvfir+Q4Dr07WDTg
	 OaoVfVlObkzfHpwsNBlwQD8Hm8C7bw7h6/R9qmgra0W1MSLZnsB6Cv2GLt00O/VcYfD4y
	 G+VV33TEk7COD21s0NC7cMBNqFOsq+cjzE2ind1H5erxcPFQrYzpDq0CXtQ3J5BQg5+4V
	 fYBLKlX/OZC5ptaCRe8G2womDX72JSNLEqGEa4oDSBGaC8vGAttg2Q/EtuP4e0iy6fzMc
	 o6SNCxmS5UB2vWnlPwjG3piA4i3Xw9gaM524Cr5kmaVgjXyNFCS5v4IYrQx3B8CXskg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793693276;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=z1fp1t8KnbkiqUnejCb3cfXQ5pb3scYif85nesdS1Qo=;
	b=m5aNW11yRRrKnAZYPjli5Dwu8E3fbAegepuJfNK5pLqulPcy4ejXlvaQ+CGWk22hMBbL
	 YZj+kGWcgURd7BfCvuJbJlHUr68XOQsHcXwt4XC3tqS08jAtm3lKxmTTpK0ti4dWRDaLt
	 LPcALv/SkGEqawTISRGWUX81IwC8JCDnDAcA2HTFE6CKLX19aEd2J4I7YYcs8mB2VcinC
	 duYlcvzdyd4KlSuQ1vHtXuO25Nxy9y/XcqMtzFC1XvKg8G8M49RcVwy+Cy4jngzP8/3FG
	 ZGwgBOOB7tdbCgycQJgiOmyYAhsBr1ub7dGw2fVxVEVVCUlTd0OxbOe0UerM+QpCEYg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793693276;
	bh=z1fp1t8KnbkiqUnejCb3cfXQ5pb3scYif85nesdS1Qo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=REn9jXFKNullUXEou1zWHoiTeqOGrpyIR6U2PPM1SOtu7BSX8Su6EDce4IEuGjKgb
	 /b4Rv8uXnC4GhFnhkTQxm3sxmnpBEea6+LUwmHPNnOiKVbnaEYuNj5l5prcZfJJDpH
	 DY1xokZWo0sKAM9vnk2nzKiHnXqQP/pvVKYINcTBuov+NS6y5NAhR22mm2B8ZbYJWc
	 PefYGJSlDVKluQoKzm4s8IwNlexkyl6bj3iRd7OyguZe3nusszILRO7PIjO+W3bL1h
	 G8UOsrQsq3G5L2pXyQMnbEqAOAbMCyc/e9FzoCb2Xdc43cO4Op12UhMHkKZXioidyS
	 k0z+wXR/llLBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 715CB405AD;
	Tue,  3 Nov 2026 08:07:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33C832AC
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 08:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1934880D9F
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 08:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWixrzx4ycr2 for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 08:07:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EB3DB80D66
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793693274;
 b=gpbAxte7puzKWFsK5LKQLZGU1UFtTpDzpU048CIXL8bzsTiegVFBbccj2efWgqlfVKWr
 YRtUQZLajJ3jKcnytrQSpE9UEBWWfqRL8JewG2S6xJD1vcz/cr+fg0HYq544/sUJVLWRK
 9bBrKAoBCml4zrugCR8Khw84GnxbqdPyLsdCQmtA7g7a0yg/dtpttP1gbQ0zq3uXkrCL3
 tJtFznq6vWnYxA4nkq1LI6V1hqFf6ykKI5qG9p4WUqeAhyWMKWwYQjZr1OAWvOPKsKr4M
 tY1c/QS5I3oLAW0BYGZJsIkdBNUUx5+5GHy0UpeKbbTqSU57gyZmPy+gzWGCbtWSKYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793693274;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=5n3CZ9KhTPTeaCQTT1GgOjbU7oXvDlFd4jN43yb+RHs=;
 b=mjKDcgDkUGoLmPFiQ6m6rXz3WmkwTWMp0Xlz38OZq0exrnfA10qEmHmOM+1Ha14Z46IX
 0+MxYQynuevOBmkfwsoVwqN42hmvE7/kfjhWTbGH1FoGQXDYrTXHfkfcVBE/sfRdBm+ge
 wgy0GrdFomRpnfcRTHmJ2a36aJnNgKx2KCTre0l7zaMywS8bfF+uIWv6+54vWscXj0vVB
 rGmEe33We6Run3Hm+YIyPLT6tOQl0W9dHGzD8sPHY5QRtQwi2YyvbkYhT7Iw02BPlHKKG
 9k9n2zpyJsM6VGsxUh/3NtzNR1JldAh61UeR+MG9BDnhIbHhmGX2wNV+ZN4NPMshzcw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=jhzOgWoJ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::629"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB3DB80D66
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 08:07:51 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c423b145922so529656366b.3
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 00:07:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793693269; x=1794298069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=5n3CZ9KhTPTeaCQTT1GgOjbU7oXvDlFd4jN43yb+RHs=;
 b=qdpE9jOZWqF3Y6ib5z0WXsGZXd40e/Svhqa3/CZ0E15PLVX/ifK+rwTSn+Ajvv7XiH
 ndIui7K7wpDLynyPYpOQDHGpkaNPPwpy/tMBQUAgBir84ALbGmmVYLP59oy3FHXhHt+9
 qGN7JBOTbLBAWxXRgoOmNyiZShyRKxq5WY3hp/QLYEKQsgtrp0gQ6baWiC2jH2QLqPn9
 txN+cHnxpjDajMZSalxlPxvRXBIwoCrblBz39oowV9kajY3j9UIQwVahiUg0SBE2ERVu
 19sEHPdCjkBNVt26YTh7NYF8k4tECFYq5JyBhpqD96h2Dj+dihg4j38SNCNdJMbDn/cf
 9iQQ==
X-Gm-Message-State: APuU4Z8S5uOOuLJKoHggvWJpJ9OwTs4L2PEoWhZE9E2JxvI+R+9N6v/m
 ty67aigGFgMMAv5qVshR2AoCv5KRIhsLdDG/8ikZEJZCXx43T1WQ4BCWDPZf2A==
X-Gm-Gg: AYBFou3QQ0XSFyyidG/I2h0n58Kcy959lCqOLgKs1+QWXpYSVAeDCX65sNCQFk5yXpU
 Bpwui/K+mzQG/cAYyiLsVwwJCpXVELIDkrBgD3cpscCwlP1PifaRrVuedTFbVVMgTMFbdvINcxL
 CMjahGQ3W1R952BL2baXMi9pP/xFUcz6P6A+8jVoYigvE2tcKbDKcNbGy9vhVxW6piFCdNGCz2P
 8X4y8CXkOjHijscEFB8kn9F0wGAusO6qMtHv9cPi+cmAdA1FUh7z8bInqOlNJ8CKK9I6hJ2BbUK
 Fqk740jCJ9raUPyZ9sWVbXLjMHjHmFGxpMtC2En4hPw8wjxLbnLe5Y/cyD+tUha5kEWNM8gijAV
 pgqKx/iWztFa2pm/XciWxkQEBSpM6K/0kbyiqclrS68s5OGbWxEh+QMAtU4NGKFStLiEGQ2VOgu
 SUkYypA4icREPAJPr+nFlOiYFmBM/dzJFkAsx3yI3ZqQTElzl10PAomoMIH1272dArUWO6lHFLR
 rgctYO7K6TmS+wZSGlZtr6Jm9TUIm9JrW3/w3SPnIsx/+zBbfZudOiiPmSZhGbXHtByjHH4oMHW
 18DeiCgbemKhJUMjOLZxEz6mUjzE9rug5B6wMbkv0JTo42PB06P3joiM9k9pH6U2BDxdgkVFoGz
 TqnZOZCIb
X-Received: by 2002:a17:907:96a1:b0:c33:ca5e:8ddb with SMTP id
 a640c23a62f3a-c4ca7ab1161mr1041953066b.28.1793693269306; 
 Tue, 03 Nov 2026 00:07:49 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4cebd3f8a9sm62795766b.7.2026.11.03.00.07.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 00:07:48 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Nov 2026 09:07:48 +0100
Message-Id: <20261103080748.3945161-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/download/git: fix cache update with
 stale submodule commits
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the git cache already has the submodules of a previous download
initialized, "git fetch origin" defaults to --recurse-submodules=on-demand
and also fetches every submodule commit referenced by the newly fetched
superproject history, not just the one of the cset we need.

open62541's 1.3 branch now contains commit 935588a18b ("fix(deps):
update mqtt-c topic bounds validation"), which points deps/mqtt-c to a
commit that was never pushed to the MQTT-C repository (it was fixed
by the next commit). Updating a cache that holds an earlier open62541
version therefore fails, although v1.5.10 itself does not use it:

  Fetching submodule deps/mqtt-c
  fatal: remote error: upload-pack: not our ref 3cac1238c29627f0a1e80fec7e9f2629bdb8c4d2
  Errors during submodule fetch:
  	deps/mqtt-c
  Detected a corrupted git cache.
  Removing it and starting afresh.

At best the whole cache is then thrown away and cloned again; on the
autobuilder, removing it failed as well and the download aborted.

Pass --recurse-submodules=no to the fetches of the cache update. The
submodules of the requested cset are still fetched afterwards by
"git submodule update --init --recursive".

This issue has been present since commit 6d938bcb5249 ("download: git:
introduce cache feature"), which started updating a persistent git
cache with "git fetch", and only shows up when some upstream history
references unavailable submodule commits. It therefore affects 2018.05
and later, including all maintained branches.

Fixes:
https://autobuild.buildroot.org/results/f0043de3bba1b4acfbd4289c4f48927e40a32e4e

Fixes: 6d938bcb524987f3e4a56fc311692ba9127417d9 ("download: git: introduce cache feature")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 support/download/git | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/support/download/git b/support/download/git
index fdc00607cc..0f6adb0d98 100755
--- a/support/download/git
+++ b/support/download/git
@@ -132,9 +132,12 @@ fi
 
 _git remote set-url origin "'${uri}'"
 
+# Do not let git fetch the submodules of all the fetched commits: they
+# may point to commits that no longer exist in the submodule upstream.
+# The submodules of the requested cset are fetched below anyway.
 printf "Fetching all references\n"
-_git fetch "${@}" origin
-_git fetch "${@}" origin -t -f
+_git fetch --recurse-submodules=no "${@}" origin
+_git fetch --recurse-submodules=no "${@}" origin -t -f
 
 # Try to get the special refs exposed by some forges (pull-requests for
 # github, changes for gerrit...). There is no easy way to know whether
@@ -143,7 +146,7 @@ _git fetch "${@}" origin -t -f
 # below, if there is an issue anyway. Since most of the cset we're gonna
 # have to clone are not such special refs, consign the output to oblivion
 # so as not to alarm unsuspecting users, but still trace it as a warning.
-if ! _git fetch "${@}" origin "'${cset}:${cset}'" >/dev/null 2>&1; then
+if ! _git fetch --recurse-submodules=no "${@}" origin "'${cset}:${cset}'" >/dev/null 2>&1; then
     printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
 fi
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
