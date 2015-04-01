From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 01 Apr 2015 23:55:01 +0200
Subject: [Buildroot] [PATCH 1/1 v2] build host lz4 to support lz4
 compression in the kernel.
In-Reply-To: <20150401223752.0fd358cf@free-electrons.com>
References: <1427919153-16080-1-git-send-email-sagaert.johan@proximus.be>
 <20150401223752.0fd358cf@free-electrons.com>
Message-ID: <551C6935.3050401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/04/15 22:37, Thomas Petazzoni wrote:
> Dear Sagaert Johan,
> 
> On Wed,  1 Apr 2015 22:12:33 +0200, Sagaert Johan wrote:
> 
>> +# lz4 kernel compression is only available on ARM and kernel >= 3.11
>> +# we always build host-lz4 when the target is ARM.
>> +# (how could i use LINUX_VERSION_PROBED to check for >=3.11 ?)
>> +ifeq ($(BR2_arm),y)
>> +LINUX_DEPENDENCIES += host-lz4
>> +endif
> 
> No that still isn't good: LZ4 compressed kernel is available on ARM,
> MIPS, x86 and S390 (we don't care about the latter in Buildroot).
> 
> No, I really think we need to add new options in linux/Config.in.

 Well, I'm in agreement with Johan's earlier statement that the overhead of the
host-lz4 build is negligible. It takes 20 seconds on my laptop, of which 6 are
buildroot overhead from parsing package/*/*.mk.

 Peter said before that all this hacking of linux (or other) config files should
be avoided, and I agree.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
