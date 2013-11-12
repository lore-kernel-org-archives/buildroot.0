From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Nov 2013 16:35:21 +0100
Subject: [Buildroot] [PATCH 2 of 2] infra: remove usage of pkgparentdir
 in favor of pkgdir
In-Reply-To: <CAAXf6LVJ+0c2Qgo7P1wNWejtvRm8meq_3vjwjJnuMBAoVbJE8A@mail.gmail.com>
References: <patchbomb.1384170790@argentina>
 <8953db252a5816d2e988.1384170792@argentina> <52816529.9010704@mind.be>
 <CAAXf6LVMJ-EQemvYkvujm+zypQO_cufQq5=z7zz_tto2hug=Aw@mail.gmail.com>
 <20131112120904.4e65d13f@skate>
 <CAAXf6LX+_CGzfYwsAsLMQbUCYoO6Khvh7dcxkDRRt1BespkPGw@mail.gmail.com>
 <5282302C.7000005@mind.be>
 <CAAXf6LVJ+0c2Qgo7P1wNWejtvRm8meq_3vjwjJnuMBAoVbJE8A@mail.gmail.com>
Message-ID: <52824AB9.6070907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/11/13 14:49, Thomas De Schampheleire wrote:
> On Tue, Nov 12, 2013 at 2:42 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 12/11/13 12:32, Thomas De Schampheleire wrote:
>>>
>>> Hi Thomas,
>>>
>>> On Tue, Nov 12, 2013 at 12:09 PM, Thomas Petazzoni
>>> <thomas.petazzoni@free-electrons.com> wrote:
>>>>
>>>> Dear Thomas De Schampheleire,
>>>>
>>>> On Tue, 12 Nov 2013 09:56:37 +0100, Thomas De Schampheleire wrote:
>>>>
>>>>>>    I think it's a better idea to choose a new name - if only to help
>>>>>> people who are using this variable in custom packages. Or better
>>>>>> yet, remove it completely - it's anyway not used anymore.
>>>>>
>>>>>
>>>>> The only remaining place is in the foo-patch block, to get the
>>>>> location of patches for that package.
>>>>> That is outside the inner-generic-package, so we cannot use $(4)
>>>>> anymore. How do you propose to solve that?
>>>>
>>>>
>>>> Currently:
>>>>
>>>>    <foo>_DIR => build directory
>>>>
>>>>    <foo>_DIR_PREFIX => prefix of the package directory in Buildroot
>>>>                        sources
>>>>
>>>>    <foo>_DL_DIR => location of the package download directory, for
>>>>                    git/cvs downloads (apparently not used consistently)
>>>>
>>>> I think it would make a lot more sense to have:
>>>>
>>>>    <foo>_DIR => points to the package directory in Buildroot sources, e.g
>>>>                 package/busybox/ for Busybox. This would allow packages
>>>>                 to easily reference their own directory, to get access to
>>>>                 configuration files and others, instead of having to know
>>>>                 they are located in package/busybox/. This could also be
>>>>                 used in the patching step instead of the DIR_PREFIX thing.
>>
>>
>>   As I mentioned before, I would prefer to not reuse the same name with a
>> different meaning, because it may confuse users who have custom
>> modifications that rely on that variable. So instead I'd remove the
>> <foo>_DIR completely (so that it's pretty clear that this variable is empty
>> if anybody still uses it), and instead use e.g. <foo>_BR_DIR for this
>> purpose.
>
> In that case I would prefer something like <foo>_PKG_DIR, instead of BR.

  OK.

  But for consistency with BUILDDIR and SRCDIR, I'd prefer PKGDIR.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
