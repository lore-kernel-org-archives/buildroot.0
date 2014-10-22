From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Oct 2014 18:45:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/cdrkit: standardize site URL
In-Reply-To: <20141022152231.1ecdf27a@free-electrons.com>
References: <1413983659-3496-1-git-send-email-kaszak@gmail.com>
 <20141022152231.1ecdf27a@free-electrons.com>
Message-ID: <5447DF1F.3040100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/10/14 15:22, Thomas Petazzoni wrote:
> Dear Karoly Kasza,
> 
> On Wed, 22 Oct 2014 15:14:19 +0200, Karoly Kasza wrote:
>> Standardize download site URL using the Debian mirror.
>>
>> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
>> ---
>>  package/cdrkit/cdrkit.mk |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
>> index 3f2b429..e1392b6 100644
>> --- a/package/cdrkit/cdrkit.mk
>> +++ b/package/cdrkit/cdrkit.mk
>> @@ -6,7 +6,7 @@
>>  
>>  CDRKIT_VERSION = 1.1.11
>>  CDRKIT_SOURCE = cdrkit_$(CDRKIT_VERSION).orig.tar.gz
>> -CDRKIT_SITE = http://snapshot.debian.org/archive/debian/20101018T151929Z/pool/main/c/cdrkit/
>> +CDRKIT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/c/cdrkit
>>  CDRKIT_DEPENDENCIES = libcap bzip2 zlib
>>  CDRKIT_LICENSE = GPLv2
>>  CDRKIT_LICENSE_FILES = COPYING
> 
> Yeah, well, actually, I believe using snapshot.debian.org is a better
> idea, since it guarantees that files won't be moved. While using
> $(BR2_DEBIAN_MIRROR) means that we point to locations where tarballs
> will disappear at some point. At least, we've seen that in the past.
> 
> So maybe we should rather get rid of BR2_DEBIAN_MIRROR and make sure
> all packages downloading their source from Debian use
> snapshot.debian.org instead.
> 
> Thoughts?

 We've discussed this before and IIRC nobody was against getting rid of
BR2_DEBIAN_MIRROR. Well, looking back through my mail archives, it looks like
you (Thomas) said a couple of times to use snapshot instead of BR2_DEBIAN_MIRROR
and nobody objected.

 I certainly agree that using snapshot is a better idea. We now have a mix of 17
packages using BR2_DEBIAN_MIRROR and 10 packages using snapshot.debian.org, and
AFAIK we never had any problem with the snapshot packages.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
