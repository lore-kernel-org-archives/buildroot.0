From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Jun 2017 00:04:57 +0200
Subject: [Buildroot] [PATCH 0/4 v2] tools: add a directory to contain
 usefull user-facing tools
In-Reply-To: <20170618142324.GS2918@scaer>
References: <cover.1497794488.git.yann.morin.1998@free.fr>
 <20170618161531.762b0929@windsurf> <20170618142324.GS2918@scaer>
Message-ID: <26389f44-0602-bcbf-eeed-b70b5cd01033@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-06-17 16:23, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2017-06-18 16:15 +0200, Thomas Petazzoni spake thusly:
>> On Sun, 18 Jun 2017 16:01:40 +0200, Yann E. MORIN wrote:
>>> Currently, we provide a few user-facing utilities, like get-developers,
>>> in support/scripts/ . But this directory also contains internal scripts
>>> that a user should not be directly concerned with. Besides, it is
>>> two-level deep in the hierarchy, which is not really nice.
>>>
>>> So, we introduce tools/ as a top-level directory, with the goal to store
>>> and expose all user-facing utilities, while keeping our internal scripts
>>> in support/scripts/ .
>>>
>>> The first patch in the series introduces a new utility, brmake, a
>>> wrapper around make that stores all the output to a log file and
>>> displays only the >>> lines.
>>>
>>> The second and subsequent patches each move a few user-facing utilities
>>> out of support/scripts/ and into tools/ .
>>
>> I am wondering if there is a very clear cut boundary between
>> user-facing tools and non-user facing tools.
> 
> Yes, the frontier is not trivial.
> 
> I'd say that if a tool is meant to be called by the user, then it
> belongs to tools/. If it is not meant to be alled by a user (even if it
> could be so) then it belongs to support/scripts/.

 Sounds good to me!

 Just to be clear: the main reason why I liked the idea of this directory is
because it makes it easier for users to discover these scripts.

>> For example, graph-build-time or graph-depends are internally used by
>> the Buildroot Makefile, but may also be used directly.
> 
> The primary use for those scripts is still an internal use. They are
> supposed to be called from our infra.
> 
>> The size-stats
>> tool is also used internally by the Buildroot Makefile, but
>> size-stats-compare is meant to be used directly.
> 
> Then the former stays in support/scripts/ while the latter should move
> to tools/.
> 
>> What about support/scripts/genimage.sh ?
> 
> I would leave it to support/scripts/. It is an internal helper./
> Besides, it needs a few of our variables (TARGET_DIR and BINARIES_DIR),
> so I see it as internal.

 For me, that is a definite indication that it should stay in support/scripts.


 Regards,
 Arnout

> 
> Of course, I might not have moved all that can/should be moved. This
> series serves as a base for further discussion.
> 
> See the initial submission:
> 
>     [PATCH] contrib: add a directory to store "contrib" stuff
>     http://lists.busybox.net/pipermail/buildroot/2016-October/174238.html
> 
> Regards,
> Yann E. MORIN.
> 
>> Best regards,
>>
>> Thomas
>> -- 
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
