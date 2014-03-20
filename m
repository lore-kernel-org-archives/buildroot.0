From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Mar 2014 17:16:18 +0100
Subject: [Buildroot] [PATCH] libtool: use a different way to avoid
	autoreconfiguration
In-Reply-To: <20140320155422.1ff40798@skate>
References: <1395270180-12701-1-git-send-email-arnout@mind.be>	<20140320002504.0cebf7d5@skate>	<532A8C01.2070702@mind.be>
 <20140320155422.1ff40798@skate>
Message-ID: <532B1452.6080502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/03/14 15:54, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Thu, 20 Mar 2014 07:34:41 +0100, Arnout Vandecappelle wrote:
> 
>>> Shouldn't we mark libtool on the target as something deprecated? We
>>> have already removed the support for autoconf and automake on the
>>> target, so having libtool seems quite useless, no?
>>
>>  Pulseaudio depends on libtool. I guess it actually depends on libltdl,
>> though. But is precisely in libltdl that the problem occurs.
> 
> But isn't the libltdl code normally "copied" into the project when
> autoreconf is made, so that there should in fact not be any dependency
> from pulseaudio to the target libtool?

 I have no idea. Feel free to investigate.

 If we do deprecate libtool on target, then this patch is no longer
needed to fix the autobuild issue. However, perhaps it would still be
considered a cleaner way to handle things?

 Or perhaps another cleaner way is to use

touch -t 201110171216 $(@D)/libltdl/m4/libtool.m4

in a post-patch hook. The -t option is POSIX so it should be OK to use.
There are actually many more places where we could use that.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
