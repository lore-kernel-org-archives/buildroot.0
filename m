From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Oct 2013 09:20:20 +0200
Subject: [Buildroot] [PATCH] Allow PHP to compile ans link with
 berkeleydb 6
In-Reply-To: <20131007145734.781254cd@skate>
References: <1381146130-8575-1-git-send-email-jezz@sysmic.org>
 <20131007135727.3cb4150d@skate> <5252A7DF.5020008@zacarias.com.ar>
 <20131007142614.45304395@skate> <5252A958.6010001@zacarias.com.ar>
 <20131007145734.781254cd@skate>
Message-ID: <5253B234.60001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/07/13 14:57, Thomas Petazzoni wrote:
> Dear Gustavo Zacarias,
>
> On Mon, 07 Oct 2013 09:30:16 -0300, Gustavo Zacarias wrote:
>> On 10/07/2013 09:26 AM, Thomas Petazzoni wrote:
>>
>>> Sorry, I forgot to add a smiley or something. To be "how useful
>>> BerkleyDB can be with PHP" was ironic, so I was actually meaning that I
>>> don't think PHP+BerkeleyDB is so useful, so that to me, the first
>>> option is perfectly acceptable.
>>
>> Seems to be useful to Jerome maybe since he cared about fixing it.
>> That being said the license is rotten and not only for PHP, we should
>> just stick away from bdb6 IMHO.
>
> Ok, so as discussed on IRC, my proposal would be:
 >
 >   * Downgrade the berkeleydb package to the last known non-AGPL version
 >     (i.e essentially revert commit
 >     4c478de2e76ffc1d0a6dc413475307fd44a0a595). This way, all existing
 >     packages in Buildroot that rely on berkeleydb continue to work with
 >     no change, and don't create a legal issue. Add a comment in the
 >     berkeleydb.mk file that explains why it shouldn't be bumped to v6 of
 >     the project.
 >
 >   * If someone cares, integrate an additional berkeleydb6 package that
 >     packages the v6 of berkeleydb under AGPL.

  I didn't follow the conversation on IRC, but IMHO this proposal has 
important political implications.  With this change, we are taking a 
stand: non-copyleft software should be the default. So in my opinion, we 
should instead make the default berkeleydb v6 and add a berkeleydb5 
package for PHP.

  I took a quick look at which other packages are using berkeleydb. Most 
of them are compatible with GPL.

netatalk: GPLv2+ -> compatible (note that _LICENSE is missing)
perl: Aristic is not compatible, but GPLv1+ is (note that _LICENSE is wrong)
python: PSF license v2 is compatible
ruby: Ruby license is probably incompatible, but BSD-2c is (note that 
_LICENSE is wrong). Unfortunately, there are also a few incompatible 
files in the ruby distribution.


  Footnote: except for python, none of the licenses above are actually 
correctly defined in buildroot. This worries me...


  Regards,
  Arnout

> J?r?me, are you interested in doing such work?
>
> Best regards,
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
