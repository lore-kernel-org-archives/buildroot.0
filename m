From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Aug 2017 21:53:00 +0200
Subject: [Buildroot] [PATCH] package/e2fsprogs: version bump for bug fix.
In-Reply-To: <20170810125316.6qeroacb3dcvicj4@tarshish>
References: <20170810124536.26344-1-daggs@gmx.com>
 <20170810125316.6qeroacb3dcvicj4@tarshish>
Message-ID: <77a8ebc6-5825-77a4-bbe3-4f23b2bea658@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-08-17 14:53, Baruch Siach wrote:
> Hi Dagg,
> 
> On Thu, Aug 10, 2017 at 03:45:36PM +0300, Dagg Stompler wrote:
>> when compiling host e2fsprogs on my system (gentoo amd64, glibc 2.25) the build fails with this error:
>> ../lib/libext2fs.a(ismounted.o): In function `check_mntent_file':
>> ismounted.c:(.text+0x224): undefined reference to `major'
> 
> Please provide the defconfig that causes this issue.
> 
> Was that the host version of e2fsprogs?
> 
>> bumping versions fixes the issue.
> 
> This is upstream commit 3fb715b554268759 (include sys/sysmacros.h as needed), 
> right? If so, please add a reference in the commit log.

 I'm wondering if we should apply this version bump to master or to next (and
backport 3fb715b55 to master)...

 It looks like this release does a *lot* more than just a few fixes, so it's not
really the type of bump we would take into master now.

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
