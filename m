From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Apr 2014 11:02:02 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-19
In-Reply-To: <435816036.13835416.1398243362765.JavaMail.root@openwide.fr>
References: <435816036.13835416.1398243362765.JavaMail.root@openwide.fr>
Message-ID: <5357818A.4090104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/04/14 10:56, Jeremy Rosen wrote:
> 
>>
>>>
>>> Also, by having a much smaller percentage, I'm wondering if we have
>>> a
>>> lot less chances to trigger cases that require a fairly significant
>>> combination of options to be produced.
>>
>>  Do we actually have examples of such a situation, that a combination
>>  of
>> packages leads to an error? It's more likely to lead to runtime
>> errors I
>> expect.
>>
> 
> 
> on a side note, if the autobuilder has selected a high number of packages
> so far, there are probably many "low number of packages" type of bug
> that it could find. it might be interesting to temporarly set it to a
> low number of packages...

 No, the number of packages is randomly selected between 1% and 30/35%.
So about 1 out of 6 builds has less than 5%, i.e. 30 packages. With such
a small percentage, it's extremely likely that the selected packages are
completely unrelated.

 However, this makes me realize that with the lower percentages, most
likely all the sub-options of a package will be set to no. With 30%,
there's a decent chance that at least some sub-options are selected, and
at least there is some chance that all of them are selected (though for a
package with 4 suboptions the chance that all are selected is already
less than 1%). Yet another reason not to reduce the percentage any further.

 It would probably be a lot better if the configurations would not use
randconfig, but rather a more customised was of selecting a random
configuration. But as usual, that's a lot of work...

 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
