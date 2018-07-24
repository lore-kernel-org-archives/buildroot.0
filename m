From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Jul 2018 09:55:40 +0200
Subject: [Buildroot] [PATCH] vim: install /bin/vi as a relative symlink
In-Reply-To: <20180723151740.145c41ea@windsurf>
References: <20180718123443.7242-1-casantos@datacom.com.br>
 <20180718150350.4a910b0c@windsurf> <87fu0g53wd.fsf@tkos.co.il>
 <589643561.4441380.1531997921281.JavaMail.zimbra@datacom.com.br>
 <877elq5tz0.fsf@tkos.co.il>
 <1840086717.4674313.1532086956701.JavaMail.zimbra@datacom.com.br>
 <20180723151740.145c41ea@windsurf>
Message-ID: <93989b29-232f-20a2-4ac4-835066e5229b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-18 15:17, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 20 Jul 2018 08:42:36 -0300 (BRT), Carlos Santos wrote:
> 
>>> But if we allow dangling non-relative symlinks I don't think we want to
>>> add this complexity to the vim package, or any other package that
>>> installs similar relative symlinks.  
>>
>> The complexity is a consequence of the BR2_ROOTFS_MERGED_USR stuff.
>> We already need to deal with such situations in six packages. I'd
>> rather declare merged /usr as mandatory and send all those ifeq's
>> down the tubes.
> 
> Perhaps we could introduce one or two helper functions that hide what
> BR2_ROOTFS_MERGED_USR is doing. I thought a few minutes about this and
> couldn't find immediately a good semantic/naming, but perhaps this is
> a direction that could be investigated ?

 The thing is, I don't believe that relying on BR2_ROOTFS_MERGED_USR is the
right approach. I've had projects with a usr -> . symlink in a custom skeleton,
for instance. We could of course declare such a skeleton invalid, but I don't
think that it is checked currently. Also I can imagine that there could be other
custom skeleton layouts that could create problems.

 We already use ln --relative in a few places, isn't that the easiest solution?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
