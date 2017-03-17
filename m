From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Mar 2017 16:51:14 +0100
Subject: [Buildroot] [PATCH 1/2] acl: add host variant
In-Reply-To: <20170317105136.ibrj6tg3bgmi5pcl@tarshish>
References: <20170316223840.23007-1-arnout@mind.be>
 <402ef173-377c-e717-c882-bd31b91f2d87@andin.de>
 <20170317105136.ibrj6tg3bgmi5pcl@tarshish>
Message-ID: <9d249840-b6aa-7b46-0181-f9e270e3b1ef@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-03-17 11:51, Baruch Siach wrote:
> Hi Andreas,
> 
> On Fri, Mar 17, 2017 at 09:59:24AM +0100, Andreas Naumann wrote:
>> However, when I run it I get a
>> acl_get_fd.c:26:24: fatal error: attr/xattr.h: No such file or directory
>>
>> I find this file in
>> output/host/usr/include/attr/xattr.h
>>
>> but that's outside the sysroot, so probably not included, right?
> This is the host variant of acl, so don't expect it to be in the target 
> sysroot.
> 
>> When I install
>> apt-get install libattr1-dev
>> on the host it works.

 I indeed had libattr1-dev installed while testing.


>> But we shouldnt depend on that, should we?
> We should. Something went wrong with the host headers search path.

 Yes, it seems the acl build system ignores CFLAGS. v2 follows.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
