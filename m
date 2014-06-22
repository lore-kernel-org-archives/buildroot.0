From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 22 Jun 2014 19:34:19 -0300
Subject: [Buildroot] [PATCHv2 1/2] geoip: new package
In-Reply-To: <20140622215442.4c060328@free-electrons.com>
References: <1403015963-27278-1-git-send-email-gustavo@zacarias.com.ar>
 <20140622215442.4c060328@free-electrons.com>
Message-ID: <53A759EB.8090702@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/22/2014 04:54 PM, Thomas Petazzoni wrote:

>> +	  GeoIP is a C library that enables the user to find geographical
>> +	  and network information of an IP address.
>> +	  To use this library, you need to download MaxMind's free GeoLite or
>> +	  commercial GeoIP binary databases into the target's /usr/share/GeoIP
>> +	  directory in uncompressed form.
> 
> Wouldn't it make sense to create a package for the free database, so
> that GeoIP can be useful out of the box?

As the current infra is right now, not really, even with fixes i
wouldn't go for it.
That's because the tarball naming is fixed (no hash, timestamp or
anything) and they change at least daily, so an old
sources.buildroot.net copy/mirror could be really old.
Even if we can say "don't mirror it" the same can happen to people with
their local copy.
Regards.
