From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Feb 2017 18:24:56 +0100
Subject: [Buildroot] [PATCH v3 2/5] package: add generic support for lz
 archives
In-Reply-To: <20170216093405.24f25e54@free-electrons.com>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
 <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
 <20170215221520.41e4c66e@free-electrons.com>
 <83572997-616f-8bec-fadb-0a59bbf847ed@mind.be>
 <20170216083206.2064b783@free-electrons.com>
 <19a785a4-beaf-92dd-c53b-6e81dde24c7d@mind.be>
 <20170216093405.24f25e54@free-electrons.com>
Message-ID: <cb714032-ddc6-ca8b-9879-f570f028f7b7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-02-17 09:34, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 16 Feb 2017 09:25:55 +0100, Arnout Vandecappelle wrote:
> 
>>> BR2_LZCAT does not specify only the path to the lzcat program, but also
>>> its options. And we completely ignore those custom options if the
>>> lzcat built by Buildroot is used.  
>>
>>  It is possible to provide extra options, but these are completely useless.
>> Well, actually, lzcat is the first one with an option that could be useful:
>> --threads, to decompress over several cores. Except that --threads isn't
>> implemented yet for decompression. So, although it is possible to add extra
>> options in BR2_LZCAT, it just makes no sense.
> 
> My point is not whether it makes sense or not to be able to pass
> options to lzip. My point is that we provide a Config.in option to
> allow the user to pass additional options, but we don't actually take
> into account the value of this option when we build our own host-lzip or
> host-xz.

 My point is that we *don't* have an option to be able to pass options to lzip.
We have an option to be able to provide an alternative path to lzip, and when
you use that option you have to remember to add the correct arguments as well.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
