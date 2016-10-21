From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Oct 2016 20:13:51 +0200
Subject: [Buildroot] [PATCH][autobuild] autobuild-run: introduce
 "--tc-cfg-uri" option for toolchain configs URI
In-Reply-To: <20161021133452.0508e5c5@free-electrons.com>
References: <1477045454-8660-1-git-send-email-vzakhar@synopsys.com>
 <20161021133452.0508e5c5@free-electrons.com>
Message-ID: <1efebf79-366d-f274-fd4c-d41264cfcd77@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-10-16 13:34, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 21 Oct 2016 13:24:14 +0300, Vlad Zakharov wrote:
>> This commit introduces "--tc-cfg-uri" option (short "-t").
>> Described option is used to pass URI of file that contain
>> toolchains configurations to be used in autobuilds.
>>
>> Default value refers to standard buildroot autobuild toolchain
>> configuration file:
>> http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv
>>
>> Such update allows users to add their own toolchain configurations
>> to use in buildroot autobuilds.
>>
>> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> 
> I am not sure I like this approach very much. It means people can start
> using a non-default set of toolchains, and then submit results to
> autobuild.buildroot.org. Such results would possibly not be
> reproducible by others because we may not have access to those
> toolchains.

 Maybe just make this option mutually exclusive --upload? I.e., automatically
disable upload if this option is set. I guess that's OK for the ARC use case?

 Regards,
 Arnout

> 
> Is this intended to run tests only the ARC architecture builds on your
> autobuilder?
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
