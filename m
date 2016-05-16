From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 May 2016 23:31:44 +0200
Subject: [Buildroot] [PATCH 05/13 v7] core/legal-info: add package
 version to license directory
In-Reply-To: <20160515175022.GD3877@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <5e1963c6feb57cd7a5096d296b86624f14bf3d8d.1462637351.git.yann.morin.1998@free.fr>
 <f99ee6fa-bb3a-411e-9b78-899dcad0c5b8@mind.be>
 <20160511234343.55332952@free-electrons.com> <20160513201135.GA3682@free.fr>
 <c9f705eb-9a8a-176d-6da9-d649d0396a13@mind.be>
 <20160515175022.GD3877@free.fr>
Message-ID: <b51c3e12-7a05-207d-6118-35ef2b611d91@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/15/16 19:50, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2016-05-14 23:22 +0200, Arnout Vandecappelle spake thusly:
>> On 05/13/16 22:11, Yann E. MORIN wrote:
>>> Thomas, All,
>>>
>>> On 2016-05-11 23:43 +0200, Thomas Petazzoni spake thusly:
>>>> On Sat, 7 May 2016 22:01:28 +0200, Arnout Vandecappelle wrote:
>>>>
>>>>>> +	@$$(call legal-warning-pkg,$$($(2)_RAW_BASE_NAME),cannot save license ($(2)_LICENSE_FILES not defined))
>>>>>
>>>>>  I think this should stay $(2)_RAWNAME, or either it should change as well for
>>>>> the legal-warning-source below.
>>>>>
>>>>>  Other than that:
>>>>> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>>>
>>>> I agree with Arnout here (we should keep using $(2)_RAWNAME for the
>>>> warning). Yann, what do you think?
>>>
>>> 1. With this patch (and the following one), legal-info now gets saved in
>>>   sub-directories named after the paclage name and version, i.e.:
>>>
>>>    legal-info/licenses/pkg-version/
>>>    legal-info/sources/pkg-version/
>>>
>>> 2. With this patch, we also store the package name and version in the
>>>   manifest.
>>>
>>> 3. The warnings are stored in the legal-info report.
>>>
>>> So, I think it is better that the info about packages is the same
>>> everywhere: sources/ and licenses/ sub-dirs, entries in the manifest and
>>> warnings alike.
>>
>>  I completely agree with this reasoning. Note that I wrote:
>>
>>>>>   [...] or either it should change as well for
>>>>> the legal-warning-source below.
>
> OK, but now that I look at it, and after Thomas pointed it on IRC, we can't
> really add the version for legal-warning-nosource (legal-warning-source
> does not exist, so I gues you meant legal-warning-nosource), because for
> the two occurences of those two, we don't have a version to beging with:
>
>   - one if about 'local' pacakges for which we do not have a version
>     string at all;
>
>   - the second if for overriden packages, for which we do not have a
>     version string either (well, the one in our .mk is probably wrong,
>     so we should not use it).
>
> So, do you still want to use the _RAW_BASE_NAME for those, even though
> it does not make sense (both would be rendered into 'foo-custom')?

  Argh, right, I forgot about that. So then this patch stays as it is.

  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
