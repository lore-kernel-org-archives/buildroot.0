From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Nov 2016 09:45:12 +0100
Subject: [Buildroot] [PATCH for/next] krb5: new package
In-Reply-To: <20161116000427.74c92b5e@free-electrons.com>
References: <20161108005032.11340-1-arnout@mind.be>
 <20161116000427.74c92b5e@free-electrons.com>
Message-ID: <08250588-8b84-2d9a-56fd-d1ba8e6ab774@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-11-16 00:04, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 8 Nov 2016 01:50:32 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>> +# No buildroot packages exist for these so use the bundled ones.
>> +KRB5_CONF_OPTS += \
>> +	--without-system-libverto \
>> +	--without-system-ss \
>> +	--without-system-et
> 
> We generally don't like to use bundled libraries. Are those libraries
> likely to be used by other packages? Or are they so specific to krb
> stuff that it isn't worth having separate packages for them?

 You are so right. libss is part of e2fsprogs, and libverto makes sense
stand-alone. I can't find a libet in Debian, so I guess it doesn't make much
sense on its own.

 This was anyway just a bit of help for Charles and Daniel, so it may take some
time before I respin...

 Note that the KRB5_LICENSE is also a bit tricky, there is in fact a very long
list of licenses that apply to different parts and I couldn't make a lot of
sense of it...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
