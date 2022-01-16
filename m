Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C51EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 12:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2A674013E;
	Sun, 16 Jan 2022 12:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cp39zF2ovJG0; Sun, 16 Jan 2022 12:25:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F80640176;
	Sun, 16 Jan 2022 12:25:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86E111BF32C
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 12:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 749A4402FD
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 12:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3W-arsV6Fvl for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 12:25:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C7D0402EC
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 12:25:21 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id j7so4969193edr.4
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 04:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=T8XUiJJvrGub96OtPRr/g5/9ILEkYWpwY1rAxYShjmM=;
 b=BNfMr2wo6AlGw3ss8B4MpuOCWNcrcrIdKURwq3yDzfI6DIEB0gLVxPQyWMhiC2UNyl
 yweNDQCNXREZlocP2tfOjuz1R6Ci3eNNam5piJs4DhBEvIVxhYaY+HKF00m5QQkOfgTf
 eBlzjqx4ydEqr6OnZxdAyH1iIURqCOkeuNE7eWgC6NkEE2XEYhUjJM5nb2a1AfIb+qHS
 0UWl8GVtLmzBSVfDsSM1VbYPJEfr5mUhz0LrjiosV/Swd+5n567/Kq0L3kpcfC7G9hOG
 zrh29Afkfbl6cp+/nSZ4V/QEiW7pHOB4lWkTZBuPf98uwxVWO3ecbAQqyUOtwa0WJQ1H
 51qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=T8XUiJJvrGub96OtPRr/g5/9ILEkYWpwY1rAxYShjmM=;
 b=yXqlDJ/U5t6aQL3hX3tdcB9B3QHZHRV+ghSZTFzMC/p9BxAc7dW4TIpGVSHMRodczQ
 pxfMS2R0P2rkQjQxaQ9tvmH7+W/8bxaDbOQPkJo+3Dv4TS2Cw6vdS95crwmHV8RJsgPP
 UtNNxURk/+T85tPBJwAY199oP5Wm0r/8aWVkmwEZ+FLPNbA1bGijun9cA8RdHNQGoyfa
 jeKz8JGKOI2oxRaPeOYJXmeIWIGcAO8dtg0Wy8b1pp6lXutCnEjXyK0KuBaZPdUrrI7B
 7D8GDRrq9Lk2DmturNfUZUn+6akqCvjTSMPFfIvOaAykEIemxJXPQ2d6GFTSZtNQFRUA
 tDNw==
X-Gm-Message-State: AOAM532+pf2DCG64Ey7nHpsXSX+q3VsPQirCdLdjwqG66+inqNa80CcW
 RBJt9fL1RunZ4j2ff0YyH2Epf/Tfq8i+YQ==
X-Google-Smtp-Source: ABdhPJyKEvx6qDnGFoxwgRKXmwvFXlipUCk6PX3v6F0gghJsm0vB/RCccBYNlLo/me79dGOUKKTjpQ==
X-Received: by 2002:a17:907:9709:: with SMTP id
 jg9mr13349842ejc.397.1642335920228; 
 Sun, 16 Jan 2022 04:25:20 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e16sm4453599edu.15.2022.01.16.04.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jan 2022 04:25:19 -0800 (PST)
Message-ID: <5273d4d1-8254-e53d-0ce2-9c390fe315ad@mind.be>
Date: Sun, 16 Jan 2022 13:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
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

  Thank you for the short yet sufficient summary!

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

  You forgot to mention that this is v2. v1 is here [1].

  I think the only change is in the commit message.

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
>   MIN_GID=1000
>   MAX_GID=1999
> +# use names from /etc/adduser.conf
> +FIRST_SYSTEM_UID=100
> +LAST_SYSTEM_UID=999
> +FIRST_SYSTEM_GID=100
> +LAST_SYSTEM_GID=999
> +# argument to automatically crease system/user id
> +AUTO_SYSTEM_ID=-2

  Wouldn't it be better to use -1 for system users (= the usual case) and add -2 
for normal users? System users are the usual, after all, and all current in-tree 
uses of -1 are definitely system users.

  I though that someone had already made this remark, but I can't find any trace 
of it.

> +AUTO_USER_ID=-1
> +

[snip]
> @@ -222,8 +233,12 @@ add_one_group() {
>       local members
>   
>       # Generate a new GID if needed
> -    if [ ${gid} -eq -1 ]; then
> -        gid="$( generate_gid "${group}" )"
> +    if [ ${gid} -lt 0 ]; then
> +        if [ ${gid} -eq ${AUTO_USER_ID} ]; then
> +            gid="$( generate_gid "${group}" )"

  (nitpick) For symmetry, I'd always pass the first and last as argument here.

> +        else
> +            gid="$( generate_gid "${group}" $FIRST_SYSTEM_GID $LAST_SYSTEM_GID )"
> +        fi
>       fi

  (nitpick) I'd structure the entire block above as follows:

     if [ ${gid} -eq ${AUTO_USER_ID} ]; then
     elif [ ${gid} -eq ${AUTO_SYSTEM_ID} ]; then
     fi

That's one level less deep, and more explicit about the system-id branch.

  Both remarks also apply to the uid case of course.

>   
>       members=$(get_members "$group")
> @@ -247,16 +262,19 @@ add_one_group() {
>   #   - not already used by a user
>   generate_uid() {
>       local username="${1}"
> +    local minuid="${2:-$MIN_UID}"
> +    local maxuid="${3:-$MAX_UID}"

  So here I'd remove the defaults and instead always pass the arguments.



  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/list/?series=152843&state=%2A&archive=both


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
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
