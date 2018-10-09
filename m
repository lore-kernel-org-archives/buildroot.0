From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Oct 2018 10:01:37 +0200
Subject: [Buildroot] [PATCH] u-boot: add option to generate env image
 from default env
In-Reply-To: <1539068855.6269.16.camel@diehl.com>
References: <20181002053526.11374-1-Denis.Osterland@diehl.com>
 <16db145d-edf3-787d-bb3c-3a50c340eb1c@mind.be>
 <1539068855.6269.16.camel@diehl.com>
Message-ID: <cd9141ed-23e0-34ec-2cd2-dc926fe7497c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 9/10/18 09:07, Denis OSTERLAND wrote:
> Hi Arnout,
> 
> thanks for the review.
> Am Montag, den 08.10.2018, 19:33 +0200 schrieb Arnout Vandecappelle:
[snip]
>> ?However, I think it would be simpler to just allow this option to be empty. In
>> other words, remove the choice, and add something like the following at the end
>> of the help text:
>>
>> 	??For U-Boot >= v2018.03, it is possible to leave this empty. In that
>> 	??case, the default environment for the target configuration will be
>> 	??used.
>>
>> ?This is just an idea, if you don't like it, feel free to keep the current solution.
> Well, I thought about it.
> contra:
> ?- adds additional configuration switches
> pro:
> ?- clear on first look (not required to read help first)

 This is a valid point.

> ?- easier to extend (add other sources in future)

 Hm, there is something to be said for this point as well. It might be possible
that U-Boot will start shipping internal environment fragments.

 However, in that case, I think we would really want to add an additional list
of internal sources, again without an option to control enabling it.

> ?- keeps current behavior (failed to build, if only BR2_TARGET_UBOOT_ENVIMAGE is selected)

 This is really not important.


> I think it is not very likely that other sources were implemented.
> Maybe it would be nice to just tick BR2_TARGET_UBOOT_ENVIMAGE and
> empty default of SOURCE will lead to default env.
> 
> What do you think?

 That is indeed what I meant.

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
