From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Wed, 4 Nov 2015 23:54:19 +0100
Subject: [Buildroot] [PATCH] package/rng-tools: systemd: support extra
	options
In-Reply-To: <CAGduivxQyGtK3BaXYwDwS9AGYC_x3Ax1pNGkjeMX_ov0if7_LQ@mail.gmail.com>
References: <1445381008-5165-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <CAGduivxQyGtK3BaXYwDwS9AGYC_x3Ax1pNGkjeMX_ov0if7_LQ@mail.gmail.com>
Message-ID: <CA+sos7-jzjNqy-bF0S-bfC2=75sLeVJ1waH4o7b1DS9A+EgBUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime, all,

On Wed, Nov 4, 2015 at 10:02 AM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> On Wed, Oct 21, 2015 at 12:43 AM, Beno?t Th?baudeau
> <benoit.thebaudeau.dev@gmail.com> wrote:
[...]
>> diff --git a/package/rng-tools/rngd.service
>> b/package/rng-tools/rngd.service
>> index 3bdc4c1..c0bcffe 100644
>> --- a/package/rng-tools/rngd.service
>> +++ b/package/rng-tools/rngd.service
>> @@ -2,8 +2,9 @@
>>  Description=Hardware RNG Entropy Gatherer Daemon
>>
>>  [Service]
>> -ExecStart=/usr/sbin/rngd -f
>> +ExecStart=/usr/sbin/rngd -f $DAEMON_ARGS
>>  SuccessExitStatus=66
>> +EnvironmentFile=-/etc/default/rngd
>>
>>  [Install]
>>  WantedBy=multi-user.target
>
> Everything's fine by me on this patch, just a quick question, would it be
> nice to have a default file with an empty DAEMON_ARGS ? Maybe that would be
> easier for users to understand ? Since it's used by both init system.

The issue is that empty files lying around in Buildroot would be one
more thing to maintain. They would also be useless apart from the
implicit documentation aspect, because users wanting to put something
in there would have to create their own file in a rootfs overlay.
Buildroot's users are probably advanced enough to know where and what
to look for if they need something.

> Other than that
> Reviewed-by "Maxime Hadjinlian <maxime.hadjinlian@gmail.com>"

Thanks.

Best regards,
Beno?t
