From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Jan 2014 11:42:16 +0100
Subject: [Buildroot] full rebuild and errors
In-Reply-To: <20140129093013.5ca63190@skate>
References: <52E4FA8C.7060109@gmail.com>	<52E6945C.40202@mind.be>	<52E8120F.7080805@gmail.com>	<20140128230904.1f01a5dc@skate>	<52E8AA41.1020709@mind.be>
 <20140129093013.5ca63190@skate>
Message-ID: <52E8DB08.8060107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/01/14 09:30, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Wed, 29 Jan 2014 08:14:09 +0100, Arnout Vandecappelle wrote:
>
>>> No, it doesn't. The cache of ccache is located in
>>> ~/.buildroot-ccache/, because the intent of ccache is precisely to be
>>> able to re-use the cache contents across complete rebuilds, and even
>>> across multiple clones of Buildroot.
>>
>>    But this is yet another proof that it doesn't work very well. And this
>> one really worries me, because it's a host build that failed.
>
> And for what it worth just two days ago, one of my colleague also had a
> weird compilation problem while building host-gettext (the link step
> was complaining because one of the object file it was given was built
> for i386, while the host machine is x86-64, and therefore the link was
> failing). The problem was reproducible even after a complete 'make
> clean all' cycle. And it turned out that clearing the cache solved the
> problem, so it was indeed a mis re-use of an existing object file.
>
> And it was also on the build of a host package, which is really weird.
> We know that our ccache handling is far from perfect in terms of
> detecting a change of the target compiler, but I wasn't aware of any
> theoretical problem regarding the build of host packages.

  If you encounter this again, it would be worthwhile to save the object 
file produced by ccache and then to try find where it was originally 
produced... CCACHE_LOGFILE can help.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
