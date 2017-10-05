From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 5 Oct 2017 14:57:14 +0200
Subject: [Buildroot] [PATCH] pkg-download: make package name optional in
 github helper
In-Reply-To: <20171005122356.2b31e9b5@windsurf.home>
References: <20171004085745.15457-1-ismael@iodev.co.uk>
 <26d3dc60-5a3a-0fce-f3cf-b75ee2670644@mind.be>
 <20171005122356.2b31e9b5@windsurf.home>
Message-ID: <56b30245-79c9-a29d-c8ee-b9d4f91e461a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-10-17 12:23, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 4 Oct 2017 18:35:07 +0200, Arnout Vandecappelle wrote:
> 
>>  As noticed by Peter, this was already wrong in the original patch: it only
>> works if the github helper is used in a := assignment,
> 
> Doh? We're using the github helper almost exclusively in = assignments:
> 
> package/assimp/assimp.mk:ASSIMP_SITE = $(call github,assimp,assimp,$(ASSIMP_VERSION))
> package/asterisk/asterisk.mk:ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
> package/atest/atest.mk:ATEST_SITE = $(call github,amouiche,atest,$(ATEST_VERSION))
> package/aufs/aufs.mk:AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
> package/avrdude/avrdude.mk:AVRDUDE_SITE = $(call github,kcuzner,avrdude,$(AVRDUDE_VERSION))
> package/axfsutils/axfsutils.mk:AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
> package/azmq/azmq.mk:AZMQ_SITE = $(call github,zeromq,azmq,$(AZMQ_VERSION))
> 
> Am I missing something in your explanation ?
> 
> Or perhaps you meant "when the third argument is not passed, we need to
> use a := assignment" ?

 Yes, "it" was meant to mean "making the argument optional".

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
