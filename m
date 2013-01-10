From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Thu, 10 Jan 2013 23:01:56 +0200
Subject: [Buildroot] [PATCH v2] pkg-infra: add <pkg>_CONFIG_FIXUP to fix
 *-config files
In-Reply-To: <20130110211926.564113ba@skate>
References: <1357847559-31530-1-git-send-email-stefan.froberg@petroprogram.com>
 <1357847559-31530-2-git-send-email-stefan.froberg@petroprogram.com>
 <20130110211926.564113ba@skate>
Message-ID: <50EF2C44.8050508@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

10.1.2013 22:19, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Thu, 10 Jan 2013 21:52:39 +0200, Stefan Fr?berg wrote:
>
>> For example:
>>
>> DIVINE_CONFIG_FIXUP = divine-config
>>
>> or for multiple files:
>>
>> IMAGEMAGICK_CONFIG_FIXUP = Magick-config Wand-config
> I personally still believe that it is wrong to give just the filename
> here and not the full path, i.e:
>
> IMAGEMAGICK_CONFIG_FIXUP = \
> 	$(STAGING_DIR)/usr/bin/Magick-config \
> 	$(SATGING_DIR)/usr/bin/Wand-config
>
> With just the filename, my impression is that it is just too much magic
> happening behind the scene.
>
> That said, I would not oppose to the current solution being integrated.
> I'm just sharing a preference, not a strong opposition here.
>
> Thanks!
>
> Thomas

But this is much more less typing this way ;-)

And there really is no other place for these files than in
$(STAGING_DIR)/usr/bin in buildroot.

Granted, maybe the variable name could be a more descriptive, like maybe
<pkg>_STAGING_DIR_CONFIG_FIXUP
or something like that.

It's terse, it's ugly but hey at least it works! :-)

there are, however, still some problems with those
$(STAGING_DIR)/usr/bin/*-config files that I noticed that even this
patch won't fix.
I will investigate it further and report my findings later...

Thank for your help Thomas!

Regards
Stefan
