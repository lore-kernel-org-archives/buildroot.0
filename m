From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:32:59 +0200
Subject: [Buildroot] [PATCH 2/4] package/tvheadend: bump version,
 add optional dependencies to opus & x265
In-Reply-To: <20170907161539.GA2973@scaer>
References: <20170906204908.30036-1-bernd.kuhls@t-online.de>
 <20170906204908.30036-2-bernd.kuhls@t-online.de>
 <20170907161539.GA2973@scaer>
Message-ID: <c3c7f9d0-843e-1acf-f1ea-6c690e6c978f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-09-17 18:15, Yann E. MORIN wrote:
> Bernd, All,
> 
> On 2017-09-06 22:49 +0200, Bernd Kuhls spake thusly:
[snip]
>> @@ -31,6 +31,7 @@ config BR2_PACKAGE_TVHEADEND_TRANSCODING
>>  	bool "transcoding support"
>>  	select BR2_PACKAGE_FFMPEG
>>  	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
>> +	select BR2_PACKAGE_FFMPEG_GPL # needed for x264 support
> 
> NAK. If we have an option to enable/disable GPL-licensed codecs, it is
> to leave the option to the user to enable/disable them.
> 
> We do not want to automatically force that option. Such an option must
> only be available as a user-selected option.

 The situation is quite different here. The option BR2_PACKAGE_FFMPEG_GPL exists
because we don't have suboptions for every possible codec in ffmpeg, and because
ffmpeg's configure script has a corresponding option.

 However, in this case the user has an explicit option
BR2_PACKAGE_TVHEADEND_TRANSCODING that controls whether or not the GPL codecs of
ffmpeg are included. To top things off, tvheadend already is GPL-3.0+, so the
point is kind of moot.

 Therefore, I've applied the entire series to master.

> However, we've started to remove similar options, like the recently
> dropped Qt license.
> 
> Instead, I would try to simply remove that option altogether. Instead,
> add the GPL license to the license list in the .mk, when such-licensed
> codecs are enabled.
> 
> After all, ffmpeg is not the only package whose licening terms change
> depending on the set of options enabled for that package.

 Since we don't have individual options for every ffmpeg codec, such an approach
wouldn't be possible. In addition, since ffmpeg configure has the --enable-gpl
and --enable-nonfree options, I think it makes sense to keep them.

 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
