Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3057DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99853400C7;
	Sat,  5 Feb 2022 22:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEmNHwwNB8Ty; Sat,  5 Feb 2022 22:13:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39B074010E;
	Sat,  5 Feb 2022 22:13:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2636E1BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12EAC4010E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4FnxoWB4l6eM for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:13:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F674400C7
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:13:08 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id s13so30484149ejy.3
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 14:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ZigY5czq5jKdiLXOHtPnf/Oeqhk3SSWsIfr108dHNxs=;
 b=Vlpafl7Jx0G7IHULweAZygd2744VWBaJ9xgoYFl89eVbUxEIxvHXSRHxFugyXjpTwp
 N1nWhudNJvk5yaTCbiUZZg5qlmBA7oT3XcVhS2mZrQ8TSy/WiA2BPlvSCYFGNJsd6Ylu
 TIFKx0NygJZ0vXQCBEVcnS/85/9asniKlim1rx1onoF9o6nrqXGep8tPOY2sGG+b/5YG
 lKPaAvz9OKGEXy6gKeoM9a7XZInrVHN7chS2eF9PHJ0vchqLIMwivuAjfzDWLjkK/QZ/
 Xg4xEFf4AcPJVCnRr8aoypPWWVXj72KrVcvy2+Su5rTLtFNzVRlGBkVZ+yNMO2S8rLOr
 arYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZigY5czq5jKdiLXOHtPnf/Oeqhk3SSWsIfr108dHNxs=;
 b=ICm/FvR1SQnrZv5V5VDDVmz78//Lvn/UH1wcpcNQ3cir4lIwAwRUJXrseCmYVuc+2l
 ucp+a3kAZyQEy2hCzMzMHJ6P/pNtxnz2alHbYAgUAw4fb8PNqdOMLOFleJ8v6dS73T7F
 RJ52aZeUHdHou7UQK2yJyl3RFZuYZDsI59RAHt8vRaCSI7+/RQlgJ0r6Z4TzB0OgKVsB
 3XLTUQlvZHdRI/h7xYSWdWgLQayBMkUoSXx6k7H2kmiMcEF3TDbkJNN4FCAWTLZQ1w52
 6GAV5D+pnbmaxNbDXthCAOkyaYTx89XFmF9/WrUUNhZnjuy3ic59p1Dnkls4Zyi0adgs
 bhnQ==
X-Gm-Message-State: AOAM530+gSpIOKnaudHhDmwLKAM2IzDlJ76uiJMw2lAUkQhBVx4ZRQNx
 WKHpK1NHjsGwmnPQZf5pQu//RAkF2/N0sA==
X-Google-Smtp-Source: ABdhPJzO+UG3GG5Mh+pXeaHCs0Aeriv87p31Ch4Kk8gqWsnHWkhr0jZ2zcVxr9cuIFO5UVPlpAOl8g==
X-Received: by 2002:a17:907:7e92:: with SMTP id
 qb18mr4667651ejc.555.1644099186437; 
 Sat, 05 Feb 2022 14:13:06 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w18sm2709185edr.59.2022.02.05.14.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 14:13:05 -0800 (PST)
Message-ID: <9ff36776-8e54-e835-21de-5b7466efb7fb@mind.be>
Date: Sat, 5 Feb 2022 23:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20220114101247.342256-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220114101247.342256-1-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] support/scripts/mkusers: allow option
 for system uid/gid
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/01/2022 11:12, Norbert Lange wrote:
> Some software decides based on uid/gid whether a user is a
> system or normal/human user, with differnt behaviour for those
> flavors (example journald [2]).
> 
> So adding logic to create system-users is necessary, we take
> the now common ranges from [1].
> 
> This extends the mkusers script to allow -2 for uid/gid,
> this argument will take an identifier from the system range.
> 
> System/user ranges are added as variables, and the argument
> for user/system uid was added as variable aswell.
> Thus some magic constants could be removed, some further
> occurences of -1 were replaced with equivalent logic.
> 
> [1] - https://systemd.io/UIDS-GIDS/
> [2] - https://www.freedesktop.org/software/systemd/man/journald.conf.html
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

  I applied both to master, after squashing and making the modifications I 
mentioned in my previous review. In addition...

> ---
>   support/scripts/mkusers | 57 +++++++++++++++++++++++++++++------------
>   1 file changed, 40 insertions(+), 17 deletions(-)
> 
> diff --git a/support/scripts/mkusers b/support/scripts/mkusers
> index d00ba33823..9d8295e8a3 100755
> --- a/support/scripts/mkusers
> +++ b/support/scripts/mkusers
> @@ -8,6 +8,15 @@ MIN_UID=1000
>   MAX_UID=1999

  For consistency wiht LAST_SYSTEM_UID, I renamed this one to LAST_USER_UID (and 
same for the other 3 of course).


  Regards,
  Arnout


>   MIN_GID=1000
>   MAX_GID=1999
> +# use names from /etc/adduser.conf
> +FIRST_SYSTEM_UID=100
> +LAST_SYSTEM_UID=999
> +FIRST_SYSTEM_GID=100
> +LAST_SYSTEM_GID=999
> +# argument to automatically crease system/user id
> +AUTO_SYSTEM_ID=-2
> +AUTO_USER_ID=-1
> +
>   # No more is configurable below this point
>   #----------------------------------------------------------------------------
>   
> @@ -136,9 +145,9 @@ check_user_validity() {
>           fail "invalid username '%s\n'" "${username}"
>       fi
>   
> -    if [ ${gid} -lt -1 -o ${gid} -eq 0 ]; then
> +    if [ ${gid} -lt -2 -o ${gid} -eq 0 ]; then
>           fail "invalid gid '%d' for '%s'\n" ${gid} "${username}"
> -    elif [ ${gid} -ne -1 ]; then
> +    elif [ ${gid} -ge 0 ]; then
>           # check the gid is not already used for another group
>           if [ -n "${_group}" -a "${_group}" != "${group}" ]; then
>               fail "gid '%d' for '%s' is already used by group '%s'\n" \
> @@ -162,9 +171,9 @@ check_user_validity() {
>           fi
>       fi
>   
> -    if [ ${uid} -lt -1 -o ${uid} -eq 0 ]; then
> +    if [ ${uid} -lt -2 -o ${uid} -eq 0 ]; then
>           fail "invalid uid '%d' for '%s'\n" ${uid} "${username}"
> -    elif [ ${uid} -ne -1 ]; then
> +    elif [ ${uid} -ge 0 ]; then
>           # check the uid is not already used for another user
>           if [ -n "${_username}" -a "${_username}" != "${username}" ]; then
>               fail "uid '%d' for '%s' already used by user '%s'\n" \
> @@ -198,16 +207,18 @@ check_user_validity() {
>   #   - not already used by a group
>   generate_gid() {
>       local group="${1}"
> +    local mingid="${2:-$MIN_UID}"
> +    local maxgid="${3:-$MAX_UID}"
>       local gid
>   
>       gid="$( get_gid "${group}" )"
>       if [ -z "${gid}" ]; then
> -        for(( gid=MIN_GID; gid<=MAX_GID; gid++ )); do
> +        for(( gid=mingid; gid<=maxgid; gid++ )); do
>               if [ -z "$( get_group "${gid}" )" ]; then
>                   break
>               fi
>           done
> -        if [ ${gid} -gt ${MAX_GID} ]; then
> +        if [ ${gid} -gt ${maxgid} ]; then
>               fail "can not allocate a GID for group '%s'\n" "${group}"
>           fi
>       fi
> @@ -222,8 +233,12 @@ add_one_group() {
>       local members
>   
>       # Generate a new GID if needed
> -    if [ ${gid} -eq -1 ]; then
> -        gid="$( generate_gid "${group}" )"
> +    if [ ${gid} -lt 0 ]; then
> +        if [ ${gid} -eq ${AUTO_USER_ID} ]; then
> +            gid="$( generate_gid "${group}" )"
> +        else
> +            gid="$( generate_gid "${group}" $FIRST_SYSTEM_GID $LAST_SYSTEM_GID )"
> +        fi
>       fi
>   
>       members=$(get_members "$group")
> @@ -247,16 +262,19 @@ add_one_group() {
>   #   - not already used by a user
>   generate_uid() {
>       local username="${1}"
> +    local minuid="${2:-$MIN_UID}"
> +    local maxuid="${3:-$MAX_UID}"
> +
>       local uid
>   
>       uid="$( get_uid "${username}" )"
>       if [ -z "${uid}" ]; then
> -        for(( uid=MIN_UID; uid<=MAX_UID; uid++ )); do
> +        for(( uid=minuid; uid<=maxuid; uid++ )); do
>               if [ -z "$( get_username "${uid}" )" ]; then
>                   break
>               fi
>           done
> -        if [ ${uid} -gt ${MAX_UID} ]; then
> +        if [ ${uid} -gt ${maxuid} ]; then
>               fail "can not allocate a UID for user '%s'\n" "${username}"
>           fi
>       fi
> @@ -307,8 +325,13 @@ add_one_user() {
>       check_user_validity "${username}" "${uid}" "${group}" "${gid}"
>   
>       # Generate a new UID if needed
> -    if [ ${uid} -eq -1 ]; then
> -        uid="$( generate_uid "${username}" )"
> +    if [ ${uid} -lt 0 ]; then
> +        if [ ${uid} -eq ${AUTO_USER_ID} ]; then
> +            uid="$( generate_uid "${username}" )"
> +        else
> +            uid="$( generate_uid "${username}" $FIRST_SYSTEM_UID $LAST_SYSTEM_UID )"
> +
> +        fi
>       fi
>   
>       # Remove any previous instance of this user
> @@ -384,8 +407,8 @@ main() {
>           ENTRIES+=( "${line}" )
>       done < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
>   
> -    # We first create groups whose gid is not -1, and then we create groups
> -    # whose gid is -1 (automatic), so that, if a group is defined both with
> +    # We first create groups whose gid is positive, and then we create groups
> +    # whose gid is automatic, so that, if a group is defined both with
>       # a specified gid and an automatic gid, we ensure the specified gid is
>       # used, rather than a different automatic gid is computed.
>   
> @@ -399,7 +422,7 @@ main() {
>       # Then, create all the main groups which gid *is* automatic
>       for line in "${ENTRIES[@]}"; do
>           read username uid group gid passwd home shell groups comment <<<"${line}"
> -        [ ${gid} -eq -1 ] || continue    # Non-automatic gid
> +        [ ${gid} -lt 0 ] || continue    # Non-automatic gid
>           add_one_group "${group}" "${gid}"
>       done
>   
> @@ -410,7 +433,7 @@ main() {
>           read username uid group gid passwd home shell groups comment <<<"${line}"
>           if [ "${groups}" != "-" ]; then
>               for g in ${groups//,/ }; do
> -                add_one_group "${g}" -1
> +                add_one_group "${g}" ${AUTO_USER_ID}
>               done
>           fi
>       done
> @@ -433,7 +456,7 @@ main() {
>       for line in "${ENTRIES[@]}"; do
>           read username uid group gid passwd home shell groups comment <<<"${line}"
>           [ "${username}" != "-" ] || continue # Magic string to skip user creation
> -        [ ${uid} -eq -1        ] || continue # Non-automatic uid
> +        [ ${uid} -lt 0        ] || continue # Non-automatic uid
>           add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
>                        "${home}" "${shell}" "${groups}" "${comment}"
>       done
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
