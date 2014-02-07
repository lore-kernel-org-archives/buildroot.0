From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 7 Feb 2014 21:39:32 +0100
Subject: [Buildroot] [PATCH v7 0/4] udev is now provided by systemd or
	eudev
In-Reply-To: <52F5435A.3080700@mind.be>
References: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
 <52F5435A.3080700@mind.be>
Message-ID: <CAAXf6LUUNwiuM9mLemt7n3F_4OSqwJGVhLyBKaEu11iJWs5Qgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Fri, Feb 7, 2014 at 9:34 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 07/02/14 14:21, Eric Le Bihan wrote:
>> This series converts udev to a virtual package, either provided by systemd or
>> eudev.
>>
>> Starting with version 183, udev has been merged into systemd. This forces the
>> use of systemd as the init system if /dev is to be dynamically managed by
>> udev. eudev is a fork of udev, maintained by Gentoo, but isolated from
>> systemd, so it can be used with any init system.
>>
>> Systemd has been bumped to v207 and a new eudev package has been added.
>> Version 1.3 of eudev is in sync with systemd v207.
>>
>> The bump of systemd to v207 also introduces new options, like the activation
>> of the journal gateway.
>>
>> In the end:
>>
>>   - if systemd is selected as init system, the /dev management will handled by
>>     udev. No other choice possible.
>>   - if busybox or SysV is chosen, the user can choose to manage /dev
>>     statically, or dynamically using mdev or eudev.
>
>  Hi Eric,
>
>  I'm very happy with this patch series, it really cleans things up a lot.
> I first had some reservations about how the choices were organised in the
> menus, but after trying out a few things it turns out to work pretty well.
>
>  I do agree with the comments Thomas has made, though. However, I
> wouldn't want to stop this series to go into 2014.02-rc1, so I propose
> that Peter still merges it for the release and that these small things
> are fixed in follow-up patches.

Just for the record: my comments are indeed minor and I agree they
shouldn't block the integration of this series.
Some of them could even be handled by Peter while merging the patches,
or otherwise as follow-up patches in 2014.05.

Best regards,
Thomas
