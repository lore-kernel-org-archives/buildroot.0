Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D489CCD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A976B42A51;
	Sat, 30 May 2026 08:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gke-AjgkriQe; Sat, 30 May 2026 08:23:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D6CA42A63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780129430;
	bh=AJR39zE45a3krIxoUp0LLNxYXyeCK3lE8M7mPbzwSYk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=OpbW1gwsZ5Jl2LixEIxEGDhM0psctIfSt8wA3HKPpEXi4n9771Jj3IiqlZQr4tNxT
	 LnOjE6OS/V33aK9LYOTpz6Xe283fRfuBWgJNRsA2YR/gIvtHqHEtGJ+2Ia0DNg9ywY
	 WbWdmyrXqtuKnuhgqIfqGqeW5hMgwZrvA5jSvjeLzCWtiYZdmk2RRoO9sPkSARddHl
	 d4Pp+iVfxJ+UzmkJlP8wYqw4iZqsUGBLv7SSzT2RAXH24PQLLKuep4yifA8/uQXZcx
	 OKZ4g/TGZ8pvv9KESAZn2SKX+zYcIVoaBBGtFLZTEaIgLqstILjsLR+p3qdzz6ueQk
	 oHz1DV1H3xc4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D6CA42A63;
	Sat, 30 May 2026 08:23:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3554BD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1670085237
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2vnc6b9YK4t for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:23:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCF9784D72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCF9784D72
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCF9784D72
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:23:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A7ADDB97C44C; Sat, 30 May 2026 10:23:45 +0200 (CEST)
Message-ID: <d3cc6c57-8499-478b-afc7-b5c90cf05bfc@rnout.be>
Date: Sat, 30 May 2026 10:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
References: <20260529220219.2526204-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260529220219.2526204-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780129425; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=/InG/TcgBvEt4d1qh6vWg6syOQlI5sd7SRKN0E37KlA=;
 b=DbpyVQz7QHrrYa4KoRjvyw775zY973OSlantOJtXipXMXsGeVnNDWROhguBJyLLyD39BTc
 PC+EWPpaGxcsMarBxjXEQL2ic4Z0ousOZJjc6tlvF7fEim7jBCcClJxYwMbF8F4SDddr4S
 +J2XRe/ib8tyMXJVvi9z8aasC8aILID8FSZH8fJiclv4R3rdFdbfKkVO4TKBgiXjT8tW91
 97F6VdG58GbLUGJy098m+jPmrljfU9NOT8VtUv/mS/ZcuNdHQ74hd26yLQelFfIN4piT8u
 joy/1St7uIYL8fFwynUJrTSMleIdSfyxZY514bZkNta5Ics4SQPnYD1EztNNcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DbpyVQz7
Subject: Re: [Buildroot] [PATCH 1/2] utils/bump-stable-kernel-versions:
 update for split hash file
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/05/2026 00:02, Titouan Christophe via buildroot wrote:
> Since Buildroot commit 0e3ddc9dc85e29cd00338cc79ea4be1d634a75ba,
> linux hash files are split between pre- and post-6.17.
> 
> Since that commit, the script that automatically updates kernel
> versions in Buildroot was broken, as it assumed only a single linux
> hash file at a static location. Update the script to find all relevant
> files, even if a new split occurs in the future.
> 
> In addition, this patch carries additional minor changes:
> - Fix some minor shellcheck issues (quoting, test -a -> -e)
> - Move from wget to curl, as I had some issue on my home connection
>    with the former (possibly ipv6 related or something)
> 
> For a very long time, I've been carrying an uncommitted modified
> version on my computer, and I hadn't taken the time to upstream it yet,
> so here is finally the corresponding patch.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   utils/bump-stable-kernel-versions | 121 ++++++++++++++++--------------
>   1 file changed, 65 insertions(+), 56 deletions(-)
> 
> diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
> index 577a6841c8..6303bf4010 100755
> --- a/utils/bump-stable-kernel-versions
> +++ b/utils/bump-stable-kernel-versions
> @@ -16,7 +16,7 @@
>   # OTHER DEALINGS IN THE SOFTWARE.
>   
>   # Check for updates to Linux stable releases. The script uses the versions found in
> -# linux/linux.hash. For each of the versions it downloads the related hash list and tries
> +# linux/*/linux.hash. For each of the versions it downloads the related hash list and tries
>   # to find an updated stable release. If found it updates all related files and hashes.
>   
>   set -euo pipefail
> @@ -26,70 +26,79 @@ latest_release_version=$(echo "${latest_version}" | cut -f 1-2 -d .)
>   echo "${latest_version} -> ${latest_release_version}"
>   
>   updated_releases_list=''
> +updated_versions='Update the latest kernel releases to:'
>   
> -hash_list=
> -while read -r line; do
> -    # e.g.: # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -    url=$(echo "${line}" | sed -n 's|^# From \(https://www\.kernel\.org/pub/linux/kernel/.*/sha256sums.asc\)|\1|p')
> -    # e.g.: sha256  f905f1238ea7a8e85314bacf283302e8097006010d25fcea726d0de0ea5bc9b6  linux-6.8.9.tar.xz
> -    old_hash=$(echo "${line}" | sed -rn 's|^sha256 +([0-9a-f]+) +linux-.*$|\1|p')
> -    old_version=$(echo "${line}" | sed -rn 's|^sha256 +[0-9a-f]+ +linux-(.+)\.tar\.xz$|\1|p')
> -    if [ -n "${url}" ]; then
> -        # Line contained a URL: Download hash list and use it.
> -        if [ -a "${hash_list}" ]; then
> -            rm "${hash_list}"
> -        fi
> +update_linux_hash() {
> +    HASHFILE="$1"
> +    hash_list=
> +    while read -r line; do
> +        # e.g.: # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> +        url=$(echo "${line}" | sed -n 's|^# From \(https://www\.kernel\.org/pub/linux/kernel/.*/sha256sums.asc\)|\1|p')
> +        # e.g.: sha256  f905f1238ea7a8e85314bacf283302e8097006010d25fcea726d0de0ea5bc9b6  linux-6.8.9.tar.xz
> +        old_hash=$(echo "${line}" | sed -rn 's|^sha256 +([0-9a-f]+) +linux-.*$|\1|p')
> +        old_version=$(echo "${line}" | sed -rn 's|^sha256 +[0-9a-f]+ +linux-(.+)\.tar\.xz$|\1|p')
> +        if [ -n "${url}" ]; then
> +            # Line contained a URL: Download hash list and use it.
> +            if [ -e "${hash_list}" ]; then
> +                rm "${hash_list}"
> +            fi
>   
> -        hash_list=$(basename "${url}")
> -        echo ">>> Downloading hash list from ${url}"
> -        wget --no-verbose "${url}"
> -        gpg --verify "${hash_list}"
> +            hash_list=$(basename "${url}")
> +            echo ">>> Downloading hash list from ${url}"
> +            curl -q "${url}" > "${hash_list}"
> +            gpg --verify "${hash_list}"
>   
> -        echo "${line}" >> linux/linux.hash.new
> -    elif [ -n "${old_version}" ]; then
> -        # Line contained a hash entry: Search for newer versions.
> -        release_version=$(echo "${old_version}" | cut -f 1-2 -d .) # e.g.: 6.8 instead of 6.8.9
> -        # e.g.: 19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
> -        new_hash_entry=$(grep "^[0-9a-f]\+ \+linux-${release_version//./\\.}\.[0-9]\+\.tar\.xz$" "${hash_list}" | sort -V --key '2' | tail -1)
> -        new_hash=$(echo "${new_hash_entry}" | cut -f 1 -d ' ')
> -        new_version=$(echo "${new_hash_entry}" | cut -f 3 -d ' ' | sed -rn 's|linux-(.+)\.tar\.xz|\1|p')
> +            echo "${line}" >> "$HASHFILE.new"
> +        elif [ -n "${old_version}" ]; then
> +            # Line contained a hash entry: Search for newer versions.
> +            release_version=$(echo "${old_version}" | cut -f 1-2 -d .) # e.g.: 6.8 instead of 6.8.9
> +            # e.g.: 19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
> +            new_hash_entry=$(grep "^[0-9a-f]\+ \+linux-${release_version//./\\.}\.[0-9]\+\.tar\.xz$" "${hash_list}" | sort -V --key '2' | tail -1)
> +            new_hash=$(echo "${new_hash_entry}" | cut -f 1 -d ' ')
> +            new_version=$(echo "${new_hash_entry}" | cut -f 3 -d ' ' | sed -rn 's|linux-(.+)\.tar\.xz|\1|p')
>   
> -        if [ "$new_version" == "$old_version" ]; then
> -            # Same version as before
> -            echo ">>> Release ${release_version}.x already on newest version ${new_version}."
> -            echo "${line}" >> linux/linux.hash.new
> +            if [ "$new_version" == "$old_version" ]; then
> +                # Same version as before
> +                echo ">>> Release ${release_version}.x already on newest version ${new_version}."
> +                echo "${line}" >> "$HASHFILE.new"
>   
> -            if [ "${old_hash}" != "${new_hash}" ]; then
> -                # Hash changed! This should never happen!
> -                echo ">>> Version hash changed for ${release_version}.x!"
> -                echo ">>> It was: ${old_hash}"
> -                echo ">>> It is:  ${new_hash}"
> -                exit 1
> -            fi
> -        else
> -            # Different version: update hash list, default headers, and possibly latest
> -            # version.
> -            echo ">>> Updating hash for ${release_version}.x in linux/linux.hash"
> -            echo "sha256  ${new_hash}  linux-${new_version}.tar.xz" >> linux/linux.hash.new
> +                if [ "${old_hash}" != "${new_hash}" ]; then
> +                    # Hash changed! This should never happen!
> +                    echo ">>> Version hash changed for ${release_version}.x!"
> +                    echo ">>> It was: ${old_hash}"
> +                    echo ">>> It is:  ${new_hash}"
> +                    exit 1
> +                fi
> +            else
> +                # Different version: update hash list, default headers, and possibly latest
> +                # version.
> +                echo ">>> Updating hash for ${release_version}.x in $HASHFILE"
> +                echo "sha256  ${new_hash}  linux-${new_version}.tar.xz" >> "$HASHFILE.new"
>   
> -            echo ">>> Updating version from ${old_version} to ${new_version} in Config.in files"
> -            sed -Ei "s/\tdefault \"${old_version}\"([\t ]+)if /\tdefault \"${new_version}\"\1if /" \
> -                package/linux-headers/Config.in.host linux/Config.in
> +                echo ">>> Updating version from ${old_version} to ${new_version} in Config.in files"
> +                sed -Ei "s/\tdefault \"${old_version}\"([\t ]+)if /\tdefault \"${new_version}\"\1if /" \
> +                    package/linux-headers/Config.in.host linux/Config.in
>   
> -            updated_releases_list="${updated_releases_list} ${release_version}.x"
> -        fi
> -    else
> -        # Different line: Reset hash list and just copy this line over as is.
> -        if [ -a "${hash_list}" ]; then
> -            rm "${hash_list}"
> -            hash_list=
> +                updated_releases_list="${updated_releases_list} ${release_version}.x"
> +                updated_versions="${updated_versions}\n - ${old_version} -> ${new_version}"
> +            fi
> +        else
> +            # Different line: Reset hash list and just copy this line over as is.
> +            if [ -e "${hash_list}" ]; then
> +                rm "${hash_list}"
> +                hash_list=
> +            fi
> +            echo "${line}" >> "$HASHFILE.new"
>           fi
> -        echo "${line}" >> linux/linux.hash.new
> -    fi
> -done < linux/linux.hash
> +    done < "$HASHFILE"
> +
> +    # We were iterating over this file so we could not edit in-place.
> +    mv "$HASHFILE.new" "$HASHFILE"
> +}
>   
> -# We were iterating over this file so we could not edit in-place.
> -mv linux/linux.hash.new linux/linux.hash
> +while IFS= read -r -d '' hashfile; do
> +    update_linux_hash "$hashfile"
> +done < <(find linux/ -name '*.hash' -type f -print0)
>   
>   if [ -n "${updated_releases_list}" ]; then
>       echo ">>> Suggested subject: {linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
