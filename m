From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 May 2019 10:44:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/exiv2: cleanup options and
 licenses
In-Reply-To: <20190508102742.0000138c@sensefly.com>
References: <20190507103639.94701-1-nicolas.serafini@sensefly.com>
 <bdcad4a5-2ba7-ed8c-8fc3-3de53bd2aa0d@mind.be>
 <20190508102742.0000138c@sensefly.com>
Message-ID: <8e7755d7-831f-4945-d04f-b63d9ebc67c2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/05/2019 10:27, Nicolas Serafini wrote:
>>>  config BR2_PACKAGE_EXIV2_LENSDATA
>>> -	bool "Nikon lens name database"
>>> -	depends on !BR2_PACKAGE_EXIV2_COMMERCIAL
>>> +	bool "Include lens data"
>> How big is this lens data? Is it worth keeping an option for it?
> Yes you are right we can remove it. The binary is only 80KB less with
> the lensdata option disabled.
> 
> Do I need to add a Config.in.legacy option if I remove it.

 No, same as for the _COMMERCIAL option. The legacy handling is there to make
sure that people who update Buildroot and had some option enabled will be able
to do whatever is needed to keep the same behaviour.

 It is useful to mention explicitly in the commit message why legacy handling is
skipped. Something like: "Legacy handling for the removed options _COMMERCIAL
and _LENSDATA is not needed, since now they are always enabled."

> The default
> state in exiv2 CMakeList is enabled.

 It is a good idea to still add the -D...=ON explicitly, because:
- it makes sure that the same behaviour is kept if the default changes; and
- if the option changes name, is removed, ... there is a warning in the
configure step, so there's a better chance that whoever is doing the bump will
notice it.

 Regards,
 Arnout
