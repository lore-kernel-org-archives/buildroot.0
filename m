Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46492C433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 09:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB55B608D8;
	Mon, 17 Jan 2022 09:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id knyGtqK73akk; Mon, 17 Jan 2022 09:34:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEED0607F9;
	Mon, 17 Jan 2022 09:34:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DAA61BF41A
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 09:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C3C58146C
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 09:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fYQ8LVdimKW3 for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 09:34:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BCC08146B
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 09:34:47 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id g205so22620330oif.5
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 01:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VVklyhqKGdQ/jRzYjmNcq3iMK1pi1bZXLCZbHpOZWfY=;
 b=kFyih9KEFBTyvlDsuTreDjmAMjq4BGD5GMLx4ZNk9z5T+Uqc6rZOiqwd1AkcIAmrsC
 PmajwRd7ks30AbkyABAGX1/7SCvg4Xg3aTDzq1jCUhmDJJbK2uJfpztTmYyCRXrqAJrB
 fFlrdXrfi3e1D0wi4FT45JP7cMtkQudl2WEpzFMepFq986b9CxQkuujbwemiBcoNsaT0
 cAJVCLO5wfF4JUjzBkp1QBSQ3da7amSIufyOT9xjaxlCP2wL1cQpeZ/yiEjKWb0uYWEL
 F3CDlS65WKZrXXMVn5xcNETxiCTKmr7IBTr2iWT44LYIaE8juDdeTRoSF0KqVYbKpDjt
 G7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VVklyhqKGdQ/jRzYjmNcq3iMK1pi1bZXLCZbHpOZWfY=;
 b=ibkvjb6BBWzaNG+YbptyYTQcigvb2k3YY3n1SfkKwWPeNP06WPGTV0g1as0ITqjIqZ
 EXZsxNRXwqmb9flzQgipDXvgRHIA8oz4qTxGCKw8Bmbux5igrZ4Wv+Ri32Q0KFaL332S
 I0S+DnxARHTwBgJ9fO96pNQXP+8ypGZc7/pft9fWod8ITGz3WEnEQEWbf/wsOg+VZnrG
 zFJsQGTKTJ0vhTK1kvsE0e++ou69PDZb0ubxVdqTrekTSBaGtMAdS52I8/hgSzP09L8/
 vVPAcSIN1PVQaT3/hVzYgZqxVatbWn1BLoV8j8BuK5NvNNBjGuSHj94YIQ2AxY5DHwFf
 2Bvg==
X-Gm-Message-State: AOAM532CwLmtYLnYpi7fWFNfwzHSLAjP0k5n16taOcf9HIjWVtvFQjFP
 6MRyX0nY20dBb1/Ehr5+/iqJUI50oyKQw9xfynuP/DrE4Zk=
X-Google-Smtp-Source: ABdhPJzDsvw3CD7AfGLTgm3neRzhzKX6LJDyFKWY/Fso1i6PTi+IMQ7aACUbOQch8f6K+3sEkap9aANGY5qvkJgTR28=
X-Received: by 2002:a05:6808:16a3:: with SMTP id
 bb35mr16995185oib.72.1642412085658; 
 Mon, 17 Jan 2022 01:34:45 -0800 (PST)
MIME-Version: 1.0
References: <20220114101247.342256-1-nolange79@gmail.com>
 <5273d4d1-8254-e53d-0ce2-9c390fe315ad@mind.be>
In-Reply-To: <5273d4d1-8254-e53d-0ce2-9c390fe315ad@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 17 Jan 2022 10:34:34 +0100
Message-ID: <CADYdroOkk1aMB1Hxk8uLYaAeGEHsweXWkTHK39PhS5cz-tP_=g@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am So., 16. Jan. 2022 um 13:25 Uhr schrieb Arnout Vandecappelle
<arnout@mind.be>:
>
>
>
> On 14/01/2022 11:12, Norbert Lange wrote:
> > Some software decides based on uid/gid whether a user is a
> > system or normal/human user, with differnt behaviour for those
> > flavors (example journald [2]).
>
>   Thank you for the short yet sufficient summary!
>
> >
> > So adding logic to create system-users is necessary, we take
> > the now common ranges from [1].
> >
> > This extends the mkusers script to allow -2 for uid/gid,
> > this argument will take an identifier from the system range.
> >
> > System/user ranges are added as variables, and the argument
> > for user/system uid was added as variable aswell.
> > Thus some magic constants could be removed, some further
> > occurences of -1 were replaced with equivalent logic.
> >
> > [1] - https://systemd.io/UIDS-GIDS/
> > [2] - https://www.freedesktop.org/software/systemd/man/journald.conf.html
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
>
>   You forgot to mention that this is v2. v1 is here [1].

I did not forget it, just did not find references I pushed
the patch before.

>
>   I think the only change is in the commit message.

Nah, its a bit more.

>
> > ---
> >   support/scripts/mkusers | 57 +++++++++++++++++++++++++++++------------
> >   1 file changed, 40 insertions(+), 17 deletions(-)
> >
> > diff --git a/support/scripts/mkusers b/support/scripts/mkusers
> > index d00ba33823..9d8295e8a3 100755
> > --- a/support/scripts/mkusers
> > +++ b/support/scripts/mkusers
> > @@ -8,6 +8,15 @@ MIN_UID=1000
> >   MAX_UID=1999
> >   MIN_GID=1000
> >   MAX_GID=1999
> > +# use names from /etc/adduser.conf
> > +FIRST_SYSTEM_UID=100
> > +LAST_SYSTEM_UID=999
> > +FIRST_SYSTEM_GID=100
> > +LAST_SYSTEM_GID=999
> > +# argument to automatically crease system/user id
> > +AUTO_SYSTEM_ID=-2
>
>   Wouldn't it be better to use -1 for system users (= the usual case) and add -2
> for normal users? System users are the usual, after all, and all current in-tree
> uses of -1 are definitely system users.
>
>   I though that someone had already made this remark, but I can't find any trace
> of it.
>
> > +AUTO_USER_ID=-1
> > +
>
> [snip]
> > @@ -222,8 +233,12 @@ add_one_group() {
> >       local members
> >
> >       # Generate a new GID if needed
> > -    if [ ${gid} -eq -1 ]; then
> > -        gid="$( generate_gid "${group}" )"
> > +    if [ ${gid} -lt 0 ]; then
> > +        if [ ${gid} -eq ${AUTO_USER_ID} ]; then
> > +            gid="$( generate_gid "${group}" )"
>
>   (nitpick) For symmetry, I'd always pass the first and last as argument here.
>
> > +        else
> > +            gid="$( generate_gid "${group}" $FIRST_SYSTEM_GID $LAST_SYSTEM_GID )"
> > +        fi
> >       fi
>
>   (nitpick) I'd structure the entire block above as follows:
>
>      if [ ${gid} -eq ${AUTO_USER_ID} ]; then
>      elif [ ${gid} -eq ${AUTO_SYSTEM_ID} ]; then
>      fi
>
> That's one level less deep, and more explicit about the system-id branch.
>
>   Both remarks also apply to the uid case of course.
>
> >
> >       members=$(get_members "$group")
> > @@ -247,16 +262,19 @@ add_one_group() {
> >   #   - not already used by a user
> >   generate_uid() {
> >       local username="${1}"
> > +    local minuid="${2:-$MIN_UID}"
> > +    local maxuid="${3:-$MAX_UID}"
>
>   So here I'd remove the defaults and instead always pass the arguments.
>
>
>
>   Regards,
>   Arnout
>
> [1]
> https://patchwork.ozlabs.org/project/buildroot/list/?series=152843&state=%2A&archive=both
>
>
> > +
> >       local uid
> >
> >       uid="$( get_uid "${username}" )"
> >       if [ -z "${uid}" ]; then
> > -        for(( uid=MIN_UID; uid<=MAX_UID; uid++ )); do
> > +        for(( uid=minuid; uid<=maxuid; uid++ )); do
> >               if [ -z "$( get_username "${uid}" )" ]; then
> >                   break
> >               fi
> >           done
> > -        if [ ${uid} -gt ${MAX_UID} ]; then
> > +        if [ ${uid} -gt ${maxuid} ]; then
> >               fail "can not allocate a UID for user '%s'\n" "${username}"
> >           fi
> >       fi
> > @@ -307,8 +325,13 @@ add_one_user() {
> >       check_user_validity "${username}" "${uid}" "${group}" "${gid}"
> >
> >       # Generate a new UID if needed
> > -    if [ ${uid} -eq -1 ]; then
> > -        uid="$( generate_uid "${username}" )"
> > +    if [ ${uid} -lt 0 ]; then
> > +        if [ ${uid} -eq ${AUTO_USER_ID} ]; then
> > +            uid="$( generate_uid "${username}" )"
> > +        else
> > +            uid="$( generate_uid "${username}" $FIRST_SYSTEM_UID $LAST_SYSTEM_UID )"
> > +
> > +        fi
> >       fi
> >
> >       # Remove any previous instance of this user
> > @@ -384,8 +407,8 @@ main() {
> >           ENTRIES+=( "${line}" )
> >       done < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
> >
> > -    # We first create groups whose gid is not -1, and then we create groups
> > -    # whose gid is -1 (automatic), so that, if a group is defined both with
> > +    # We first create groups whose gid is positive, and then we create groups
> > +    # whose gid is automatic, so that, if a group is defined both with
> >       # a specified gid and an automatic gid, we ensure the specified gid is
> >       # used, rather than a different automatic gid is computed.
> >
> > @@ -399,7 +422,7 @@ main() {
> >       # Then, create all the main groups which gid *is* automatic
> >       for line in "${ENTRIES[@]}"; do
> >           read username uid group gid passwd home shell groups comment <<<"${line}"
> > -        [ ${gid} -eq -1 ] || continue    # Non-automatic gid
> > +        [ ${gid} -lt 0 ] || continue    # Non-automatic gid
> >           add_one_group "${group}" "${gid}"
> >       done
> >
> > @@ -410,7 +433,7 @@ main() {
> >           read username uid group gid passwd home shell groups comment <<<"${line}"
> >           if [ "${groups}" != "-" ]; then
> >               for g in ${groups//,/ }; do
> > -                add_one_group "${g}" -1
> > +                add_one_group "${g}" ${AUTO_USER_ID}
> >               done
> >           fi
> >       done
> > @@ -433,7 +456,7 @@ main() {
> >       for line in "${ENTRIES[@]}"; do
> >           read username uid group gid passwd home shell groups comment <<<"${line}"
> >           [ "${username}" != "-" ] || continue # Magic string to skip user creation
> > -        [ ${uid} -eq -1        ] || continue # Non-automatic uid
> > +        [ ${uid} -lt 0        ] || continue # Non-automatic uid
> >           add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
> >                        "${home}" "${shell}" "${groups}" "${comment}"
> >       done
> >

Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
