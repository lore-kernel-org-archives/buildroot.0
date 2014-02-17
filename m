From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Feb 2014 00:07:41 +0100
Subject: [Buildroot] [PATCH 1/2] imagemagick: disable documentation
In-Reply-To: <53028A16.40408@openwide.fr>
References: <1392508668-27561-1-git-send-email-romain.naour@openwide.fr>
 <53027DDA.6060102@mind.be> <53028A16.40408@openwide.fr>
Message-ID: <5302963D.4050103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/02/14 23:15, Romain Naour wrote:
> Hi Arnout,
> 
> Le 17/02/2014 22:23, Arnout Vandecappelle a ?crit :
>> On 16/02/14 00:57, Romain Naour wrote:
>>> There is no options to disable the documentation,
>>> so remove it directly in Makefile.am
>>>
>>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>>   Why is this needed?
> 
> It is not really needed, but all documentation is installed in staging
> and target,
> which hides compilation issues because logs are not long enough in
> autobuilder.
> 
> http://autobuild.buildroot.net/results/612/612f2b258114cbb2c60359f19a9797c5ce8852ae/build-end.log

 Hm, good point.


> 
> 
> Then documentation is removed from target.
> 
>>   Side-track: perhaps we should add stubs for makeinfo, help2man,
>> asciidoc, xmlto, docbook2*, ... in $(HOST_DIR)/usr/bin, so we can disable
>> all documentation in one fell swoop.
> Yes, but in the case of Imagemagick all html stuff is not generated,
> it is just directly installed from the source directory.
> 
> Ok, this is probably not the best method to do this...

 Yeah, it would be better to add a --disable-docs option to configure.ac
and use that in Makefile.am.


 Regards,
 Arnout

> 
> Best regards,
> Romain Naour
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
