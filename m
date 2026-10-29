Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20692606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HCWUpYde
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFE5440CD2;
	Fri, 30 Oct 2026 14:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05l09fHMozy6; Fri, 30 Oct 2026 14:18:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0823E40A5B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369923;
	b=UienVqwzvzIO6z2ePuCBhM6GiRLYjD13HnMlIXqadNn7MmBgWIoeFmshYbUP+2YxKY1o
	 VboJ+mctr+SM4Uh8Tgt0OoELdIFYLhNCAjXmiakZFTKyvwX6Hb5DKGgYDQuXM9MWpdQ1C
	 t5WLHBOgz/HSCbiyWNcSNIBycJdkR8d1Mhr5Z45Q2w9rJe/StOFO56hEudlCR1pE3ad0b
	 kleKty5rNrhkEmJ49zWd1I1M0xWCwcGq5hZZZ/QSvhu5SfMkuMwunKI8PApTeckgQUSgn
	 ZF9vo8GNb7o/f1FBFw2J7hG4AOqE7yvNGVBsK/E8GWirRRPadml8U7TAT0G7UkMLq9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UMwZ6lgcSaLLyaqoxTt1/GWUSuILy5YktEeEAt/ELbo=;
	b=jLMRjq0ZCWO4N/4pZiSp6pN09d7VOe5wAYk+OvgJ7tTHlocRz8yMXRxvM7Mz+Og2z4Q4
	 TJOTnckrBa7FQ3ZrZ81f16ayfNGW7pNW669QoxEZqod6sjB0Ol2aZaiqJBPTIfToOaaga
	 bPHZACcJvN8Vvbfx/7vWo3T9QOyHTTFcxCMUiUSYBBrd4HdzhElyHC+GdMF1sKTVjFldr
	 iknUsguesihI+WoDzoIIoZ2UaBCPPLHQ7ibKQsOid0044hsvH1kSOzpc127+VnLYA57mW
	 0rXDwZoTMtSVrNH/oOVVpgajd4faTVljPXqkFeefEthG3k4F9u3uDq7s3nWl53OBQWQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369923;
	bh=UMwZ6lgcSaLLyaqoxTt1/GWUSuILy5YktEeEAt/ELbo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HCWUpYde3apMagTQ04zJOIx6SQI7cRXLbc0KoeyQHex/coIYLtjVvgLIaQfplsr7G
	 T1ZQqNsKwX80KIy/bIFB7eLHhyivMg4bWb96DHylbevFxXOHXKfyTxKjPzmrgbriOR
	 6jPfe6CdYLT0MXHIUQgh0Tx+Ph1lH1IUx/w3GZs2wUiZTZfSrQKFGnMqB/rVSNoIkM
	 YtX5Iy3TId3fhuvQqy+sU4zWV/yY2YEfMPXFJnlj8jfGY+JsXxwDoROGkSjVHYAND1
	 o2r0thTF3wQzbaKcpL4RCoMr0arl8nrsJxawa3BRXdQxDxng0UWj4XcYDTIuhuBAOS
	 3bJPdXe1TNahQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0823E40A5B;
	Fri, 30 Oct 2026 14:18:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D499D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0374D81283
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haI5XnMV3AFq for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1DDF2812B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369885;
 b=HrGN2m4L92nf96dDCnNinu7Hb/Gga1kNdGGPR6M/iDnKul0yf53wpAqF8ThlHl8p1J1L
 UjaCTHxX1ZZjQd9wcYnJwoxI+sskFEgF+bjF9Qx3MPL9BGHTB1HmQOVaD98OhooShUJz3
 zzO2R2HGiFQSN4ZG6+0ZI8EdvMuCKTbBZSGqT4SxdOGKkudqr7QarmuT5ItpLr3jK9eGS
 nMIf8lZKCZQ5/6DHf1cQA/t5fcx9rikjRPi7eicJm/PWfMaJNTxhTe9dzxlyDzkpAHl6D
 TCZaxIDFZ9zD6xo2V89HEawzyle+TRL7ark6qpilgrBXvLvIBxkmMaHLZU4qcQLmg7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369885;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bXHLawIRAM41OLlUGHZ8Nf1YZ10cD81Q9EuQ8KgfSW4=;
 b=EuStcU+Jyg92avf0LLcZNYHNTrLFcFkEnPVSiv1kBW7ifPo4GSuGXR8LEF2OVYJbX/l3
 hZrutYEpeSuor+IwpMHWjTP47XfdXL9l5+CWQm0hF9DTzVu4k428ns94p5P3u3qyDBLbf
 fWhWKorbbsARuVB+MX0i9d78sAmmcjpT+wmqodlIAD0gJB3FsmiKj54FZpyKSU2ZrtKkb
 TPR2Mm5JQ+k9jTEg9YBDZRyFIFav2IowPJ1wr068VAg4Ul5PnVdg1FPNmETw88PR/ENRj
 kj0JI7m/lC4fddwELwxVUjNop2HYYAmY19BpRUyQhTILOF0YWmJcrz9RZPWTA5F/rAw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DDF2812B4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AD409D389; Fri, 30 Oct 2026 14:16:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:06 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 82ceb5d60b55d93d2b8fe39e88fe9f41a9a9e1ff
X-Git-Newrev: 31aa81e84f6c26670e59880ebfe6338c5bd6bacf
X-Patchwork-Hint: ignore
Message-Id: <20261030141637.3AD409D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
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
Content-Type: multipart/mixed; boundary="===============6074301748357667399=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6074301748357667399==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/31aa81e84f6c26670e59880ebfe6338c5bd6bacf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============6074301748357667399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6074301748357667399==--
