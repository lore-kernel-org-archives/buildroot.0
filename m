From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 04 Jan 2013 16:56:53 +0200
Subject: [Buildroot] [PATCH] divine: fix divine-config
In-Reply-To: <50E6E757.10809@zacarias.com.ar>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <50E6BFE2.2090405@zacarias.com.ar>
 <CAHXCMMKhDpanjesHYjMSh-dcAHKt-84B3gEgyzs6UgN_8VRZvQ@mail.gmail.com>
 <50E6E757.10809@zacarias.com.ar>
Message-ID: <50E6EDB5.9070004@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo, all

4.1.2013 16:29, Gustavo Zacarias kirjoitti:
> On 01/04/2013 11:17 AM, Samuel Martin wrote:
>
>> We quickly talked about this during the last Buildroot Dev. Days.
>>
>> IIRC, Thomas and Peter were not very fond of this kind of solution.
>> (guys, feel free to correct me if I speak with my ass ;)).
>>
>> btw, afaics:
>> - *-config provided by the imagemagick package wrap some calls to pkg-config;
>> - many packages in BR install handwritten scripts like this, as well
>> as some *.pc files.
>> So what about just use pkgconf since it's properly handled in BR?
>> (I agree it may mean patching many packages that only search for
>> *-config scripts)
>> - in this patch serie, only libgcrypt does not provide a *.pc file :-(
>>
>> Regards,
> I agree *-config files aren't nice, but they are still here and quite used.
> When the scenario is a "not very standard" *-config file that can't be
> easily fixed, one could just avoid the autopatcher and do it the old
> fashion way.
> It's a good goal to get rid of them, but realistically it won't happen
> anytime soon - you'll need to get *.pc files for *-config packages that
> don't provide them, and you'll also need to patch a lot to get them to
> use said pc files (with the added dep to host-pkgconf which is now small
> given my migration away from pkg-config hehe).
> Long story short, they're still here, so why not do it nicely until we
> get rid of them all?
> Just for fun, try to autoreconfigure PHP and see what happens. It's a
> heavy user of *-config scripts :)
> Regards.
>

So should I continue patching correct buildroot prefixes to all those
*-config files that
are in $(STAGING_DIR)/usr/bin or not ?

From my $(STAGING_DIR)/usr/bin/*-config files only libpng and libxml2
and few others
do the right thing and give the buildroot prefix and not the host system
prefix.
(It took a long time for me to figure why wireshark that im trying to
compile here did not
work out with libpcap, untill I found out that the
$(STAGING_DIR)/usr/bin/pcap-config spit a
wrong prefix all the time...)

Regards
Stefan
