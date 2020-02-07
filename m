From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 7 Feb 2020 13:41:10 +0100
Subject: [Buildroot] [PATCH 03/10] package/systemd: remove unused user
 accounts
In-Reply-To: <CAFvCimVgTb8XcC4fnR3NQLHa6dhv0b=9JyU_CVjHB_n=9ryAwQ@mail.gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
 <20200206093633.251413-4-nolange79@gmail.com>
 <CAFvCimVgTb8XcC4fnR3NQLHa6dhv0b=9JyU_CVjHB_n=9ryAwQ@mail.gmail.com>
Message-ID: <CADYdroPy+s9pAoSbB_oqMprHJhzKqnF-0iu-sxuLCXsRM--yog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sure, but that could get tricky is you dont enable sysuser.d on the target,
then you would need to grab the files from the host installation and use
similar build-options as the target.

Some smart infrastructure work would be needed to not complicate things
between non-system, systemd with option x disabled,
and full systemd.

Am Fr., 7. Feb. 2020 um 10:11 Uhr schrieb J?r?my ROSEN <
jeremy.rosen@smile.fr>:

> Yes...
> Long term we should use systems-sysuser for that, so upstream trickles
> down automatically
>
> in the mean time,
>
> Reviewed-by: J?r?my Rosen <jeremy.rosen@smile.fr>
>
>
> Le jeu. 6 f?vr. 2020 ? 10:37, Norbert Lange <nolange79@gmail.com> a
> ?crit :
>
>> Since V235 the "gateway" and "upload" services use DynamicUsers,
>> requiring no entries in /etc/passwd.
>> This functionality requires option nss-systemd, which is always
>> enabled in buildroot.
>>
>> The "bus-proxy" user was removed in V230
>>
>> Signed-off-by: Norbert Lange <nolange79@gmail.com>
>> ---
>>  package/systemd/systemd.mk | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
>> index a390cdd1a9..b46c4fd540 100644
>> --- a/package/systemd/systemd.mk
>> +++ b/package/systemd/systemd.mk
>> @@ -431,10 +431,7 @@ define SYSTEMD_USERS
>>         - - systemd-journal -1 * - - - Journal
>>         - - render -1 * - - - DRI rendering nodes
>>         - - kvm -1 * - - - kvm nodes
>> -       systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus
>> messages to/from a bus
>> -       systemd-journal-gateway -1 systemd-journal-gateway -1 *
>> /var/log/journal - - Journal Gateway
>>         systemd-journal-remote -1 systemd-journal-remote -1 *
>> /var/log/journal/remote - - Journal Remote
>> -       systemd-journal-upload -1 systemd-journal-upload -1 * - - -
>> Journal Upload
>>         $(SYSTEMD_COREDUMP_USER)
>>         $(SYSTEMD_NETWORKD_USER)
>>         $(SYSTEMD_RESOLVED_USER)
>> --
>> 2.24.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
>
> --
> [image: SMILE]  <http://www.smile.eu/>
>
> 20 rue des Jardins
> 92600 Asni?res-sur-Seine
> *J?r?my ROSEN*
> Architecte technique
>
> [image: email] jeremy.rosen at smile.fr
> [image: phone]  +33 6 88 25 87 42
> [image: url] http://www.smile.eu
>
> [image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
> <https://www.facebook.com/smileopensource> [image: LinkedIn]
> <https://www.linkedin.com/company/smile> [image: Github]
> <https://github.com/Smile-SA>
>
> [image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
> <https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200207/e674c793/attachment.html>
