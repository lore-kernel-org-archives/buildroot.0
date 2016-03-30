From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Mar 2016 21:03:27 +0200
Subject: [Buildroot] [PATCH] tcl: rework logic for databases support
In-Reply-To: <56FBF32C.7070802@imgtec.com>
References: <1459351282-16091-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160330173503.2e710605@free-electrons.com> <56FBF32C.7070802@imgtec.com>
Message-ID: <56FC22FF.5020900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/30/16 17:39, Vicente Olivert Riera wrote:
> Hi Thomas,
>
> On 30/03/16 16:35, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Wed, 30 Mar 2016 16:21:22 +0100, Vicente Olivert Riera wrote:
[snip]
>>>   TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite)
>>> +TCL_DEPENDENCIES += $(if $(BR2_PACKAGE_MYSQL),mysql)
>>> +TCL_DEPENDENCIES += $(if $(BR2_PACKAGE_POSTGRESQL),postgresql)
>>
>> TCL_DEPENDENCIES = \
>> 	$(if ...) \
>> 	$(if ...)
>>
>> Would be nicer.
>
> That was my first approach and I didn't look nicer to me, so I changed
> it :P Anyway, if you prefer that way, I'll do it that way, no problem.

  Like you, Vincent, I also prefer TCL_DEPENDENCIES to be repeated.

- You don't need to move your eyes to see which variable is affected.
- When adding/removing a dependency, you don't have to worry about the backslashes.


  I do prefer in this case that all assignments, including the first one, have +=


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
