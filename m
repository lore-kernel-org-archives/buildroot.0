From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Apr 2021 09:35:27 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/osm2pgsql: new package
In-Reply-To: <208ae79f-afe7-5ce9-68c1-53ba53fb51a4@inbox.ru>
References: <20210413135120.3724605-1-fido_max@inbox.ru>
 <c734c656-6f02-a1f7-fbb3-82cd9c4538f0@mind.be>
 <208ae79f-afe7-5ce9-68c1-53ba53fb51a4@inbox.ru>
Message-ID: <98d06122-e99f-0a16-232b-b40be3de6139@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/04/2021 06:28, Maxim Kochetkov wrote:
> 
> 
> 13.04.2021 21:37, Arnout Vandecappelle ?????:
>> ? Hi Maxim,
>>
>> ? Did my merging of postgis trigger this? :-)
>>
>> On 13/04/2021 15:51, Maxim Kochetkov via buildroot wrote:

[snip]
>>> +config BR2_PACKAGE_OSM2PGSQL
>>> +??? bool "osm2pgsql"
>>> +??? depends on BR2_PACKAGE_POSTGRESQL
>>> +??? depends on BR2_INSTALL_LIBSTDCPP # boost
>>> +??? depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
>>> +??? depends on BR2_TOOLCHAIN_HAS_THREADS # boost
>>> +??? depends on BR2_USE_WCHAR # boost
>>> +??? select BR2_PACKAGE_BOOST
>>> +??? select BR2_PACKAGE_BOOST_SYSTEM
>>> +??? select BR2_PACKAGE_BOOST_FILESYSTEM
>>> +??? select BR2_PACKAGE_BZIP2
>>> +??? select BR2_PACKAGE_EXPAT
>>> +??? select BR2_PACKAGE_ZLIB
>>> +??? help
>>> +????? osm2pgsql is a tool for loading OpenStreetMap data into a
>>> +????? PostgreSQL / PostGIS database suitable for applications like
>>> +????? rendering into a map, geocoding with Nominatim,
>>> +????? or general analysis.
>>> +
>>> +????? https://osm2pgsql.org
>>
>> ? You again don't have the comment that indicates what's missing in the
>> toolchain.
> 
> Do you mean microblazeel with the bootlin toolchain?

 No, I mean a comment like:

comment "osm2pgsql needs a toolchain w/ C++, threads, wchar, gcc >= 4.7"
        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
                !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR

 Regards,
 Arnout


[snip]
