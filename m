Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A369606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a2QkAwrW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AA1360B10;
	Fri, 30 Oct 2026 14:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1b8d3qjKU5a4; Fri, 30 Oct 2026 14:06:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 34E4D60ADC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369185;
	b=K9iP1t9W/kYZwW6NSid1pXQafg8W5maf3TffkstB5Dvsgu5nNEAhQLKSs4s3MizvqJ4R
	 AboQTJiorT0p6JZWwi1I0m7zW+A9Ejvg+cXOWFtaQaocvYEBLafJmjP7x8SUf5MyycBm2
	 8wtxYU22bdv21BsYBH34s84ymDDqaawm5SZT3xv84usXYGfD0KrkoGPy7ABtcMhlXHJw0
	 418gty4hXxS/Ta7YCkQdqusImfrdyr4KOEsW1sP5CNJ2aaH6R+UUClWC/qWwdVxUr8u0S
	 DGQimL3QFrN4sBLONbd8BhD7nLZvWEJjoV96iQPVhUjJRMH06xTdSGxo76mILe96U2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369185;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UWMd1Gb0NsPiNUO/ndnTWHansNsAYtvjv65llPa0HGo=;
	b=GL+U4W0c96mZsRSFN1QBX6q/M0sAt8MrV1oJ4CfZ6Q9ly0Ap+fMznma5+Lkn73EOeqYn
	 mTKDi7eWPv4b/V79Qlj4bHqsyF4l7X7OxT7KBiAuUzDmT8NEiagLEjPBKQX3eFXvDm2WF
	 1KwHMICIrsxmJbLebmvme3KOLjuKuGClW9Vsp/iiKzcQJQ6xOFb+nOCYmv7sD37GCMMcp
	 5dVIDD9Fi6sZJP0iSfUUfSCTdofu7cG5ORI7zGznRUWCMlDZuBDeS72mj0KP/on275Ixo
	 Uo7Rn8JyUVXHF3Hv6BgdcubrwI33DPIFA0piDJWN6IdM8yGoKWg+8kl1E38CEHHVJyQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369185;
	bh=UWMd1Gb0NsPiNUO/ndnTWHansNsAYtvjv65llPa0HGo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a2QkAwrW9wHZ7nAri4rCHTiVaj2Vb9rxQlrdErfR1NCNxd+WztHZXe461dYLiZUA3
	 8MP+l2bICBSH9R76xBnnj1WdrGEJakmB0flKtNhpTMRmQi1cn126Mblwx3djnhCBS7
	 bVJe5PZb7ZPCmw4HCzKQPC3DDG2DL4LLboYpN2gOPqAYKp8fdhWq1NoMG3BjCiV8Xx
	 kjBsCrCfuGeSMPxPQz4vIv3qY8DyABfft/IoYfCSldRSdiUdsx7XXMcBOLtR2nAUyZ
	 IXOUVg+A4rpsOYzT+o23cIv0awVRoCeialRRJoTRUfAYGeaKSq9+GQmcMjGAv8EuqT
	 gyfGDj8qMxYeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34E4D60ADC;
	Fri, 30 Oct 2026 14:06:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0CD7362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6CCE60ADC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPw0vg_k8RIG for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 12FA4607A0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369158;
 b=oZRXecrXMDMGYsH91wkxB+jL+ymg3NiSvRt41Qng0/ktOgcvTwNEg4hbV6cLxhv4MVOO
 +O/e1tZ77PhOYG2es8Jtoix936ahA2ByqRj5ntpqpGEjltMW3C5GZpIpGzdNnmCgYKXXZ
 vlJbS5bbG4C8p1DRuE/JwVByVFOKkD4mS0kkCDdRSbrQW+nc1FWWRIoCGJg6ZCplXQ1gi
 GVGo/FqmOGuEA+3hrc9DBZuTXLkKycMNZDC7O8Re0gKtQlHEGB7dGnKmQymURjrl1X2Qe
 gXdGC3+rFdYiDkoVvbsE5PW12sNYfMyjIuJw1Ysj4ujATcfcrMCVThXwRCC55lVr0SA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369158;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DiD+ChZby4JTZZNyh2T4N83nGqjfRrO3o2bDBCaaUP8=;
 b=kkViXFCd4mgqzc62kMnxe+PNA5m6PhdUrSHvlKz/5Fd8qdk/z4vBLFsvF7gCEYsrqN/c
 sbqjP4ixPNwgDkU5QziQtRDWaQNsP5RRHpFXiIaqwwj8kwAXqgMm6UrQDgFdE59YHqexU
 pUPkQL1G6TYtYEkpc7HnzhAjHt6lzlrNlBThL2X0o7MSdw9rsDbDemtFRhNDcxwEf6yMM
 r3Wk3zVn02k7LnkrWGSWV10W30sHZuuVDAoE0SVsw1zEUe4wzrHwBsa9JNZ632vLJe+p0
 zwceAPLwCdh1U9NyJBDPzOrQQwtoPXAQt/O96P9ETeH4ZqoZrZsJzz4va83JfpvlcRQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12FA4607A0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32ED09D38A; Fri, 30 Oct 2026 14:04:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e9d4fc79827b7f054e749899d54b73bf719379e2
X-Git-Newrev: 53c783f266c8f4f27251f96bdcf10b9b8979856d
X-Patchwork-Hint: ignore
Message-Id: <20261030140430.32ED09D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 utils/bump-stable-kernel-versions: fix newline in commit message
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3254281984896061133=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3254281984896061133==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/53c783f266c8f4f27251f96bdcf10b9b8979856d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

By default (xpg_echo disabled) bash's echo doesn't expand escapes,
which results in a literal '\n' being inserted in the commit
message. For example:
Update the latest kernel releases to:\n - 6.18.53 -> 6.18.54

Commit da01b7271a ("utils/bump-stable-kernel-versions: update for
split hash file") added the '\n' line, but at that point the variable
was never printed.

The bug became visible in
fab50ed3b1 ("utils/bump-stable-kernel-versions: automatically commit
result"), when echo "${updated_versions}" was introduced.

Since the script already uses bash arrays and the list of updated
versions fits an array well, use one. This allows us to easily print
its content with actual newlines without storing them in a variable.

The fixed string initially contained in 'updated_versions' is also
moved to an echo call, so that 'updated_versions' really contains only
the list of updated versions.

Fixes: fab50ed3b1532037fa67582a6b47ac4084daaa88 ("utils/bump-stable-kernel-versions: automatically commit result")
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 1e1d973a205771ffdeb03543bcba1c55f464bbb8)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/bump-stable-kernel-versions | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
index af85d32852..b02b854d95 100755
--- a/utils/bump-stable-kernel-versions
+++ b/utils/bump-stable-kernel-versions
@@ -27,7 +27,7 @@ echo "${latest_version} -> ${latest_release_version}"
 
 updated_files_list=()
 updated_releases_list=''
-updated_versions='Update the latest kernel releases to:'
+updated_versions=()
 
 update_linux_hash() {
     HASHFILE="$1"
@@ -85,7 +85,7 @@ update_linux_hash() {
                 fi
 
                 updated_releases_list="${updated_releases_list} ${release_version}.x"
-                updated_versions="${updated_versions}\n - ${old_version} -> ${new_version}"
+                updated_versions+=("${old_version} -> ${new_version}")
             fi
         else
             # Different line: Reset hash list and just copy this line over as is.
@@ -111,7 +111,8 @@ if [ -n "${updated_releases_list}" ]; then
     git commit --verbose --edit --signoff --file=<( {
         echo "{linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"
         echo
-        echo "${updated_versions}"
+        echo 'Update the latest kernel releases to:'
+        printf ' - %s\n' "${updated_versions[@]}"
     } )
 else
     echo '>>> Nothing happened.'

--===============3254281984896061133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3254281984896061133==--
