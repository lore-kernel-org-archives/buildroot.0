From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Aug 2014 22:14:06 +0200
Subject: [Buildroot] [PATCH 00/12] toolchain: warn for unsafe
 library/header paths
In-Reply-To: <20140824112218.GA3778@free.fr>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <53F656E5.9020802@openwide.fr> <20140821233312.03679844@free-electrons.com>
 <20140822163057.GA3998@free.fr>
 <c4d57675-8499-4727-bdc1-4d8d772b6096@email.android.com>
 <20140824112218.GA3778@free.fr>
Message-ID: <53FCEA8E.3030600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [/me is back from too long holidays, facing 2000 BR mails :-)]

On 08/24/14 13:22, Yann E. MORIN wrote:
> Thomas?, All,
> 
> On 2014-08-22 21:29 +0200, Thomas De Schampheleire spake thusly:
>> "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>>> Thomas, All,
>>>
>>> On 2014-08-21 23:33 +0200, Thomas Petazzoni spake thusly:
>>>> On Thu, 21 Aug 2014 22:30:29 +0200, Romain Naour wrote:
>>>>> Also, BR_COMPILER_PARANOID_UNSAFE_PATH needs to be renamed to
>>>>> BR2_COMPILER_PARANOID_UNSAFE_PATH to follow the naming scheme ?
>>>>
>>>> No: BR2_* variables are Config.in options. Environment variables are
>>>> BR_*.
>>>
>>> Earlier this year in Brussels, we said we were to use BR2_ everywhere :
>>>    http://elinux.org/Buildroot:DeveloperDaysFOSDEM2014
>>
>> Hmm, that is written in the conclusion, but this is very
>>  different than what is in the 'proposed rules'.
>> Was it really the final outcome to use BR2 for all types
>>  of variable? I thought we wanted to make a
>>  distinction between config variables and others...
> 
> Yes, I was a bit surprised by the conclusion, too.
> From what I remember, I thought we decided for:
>   - user-facing variables: prefix with BR2_
>   - internal variables: prefix with BR_
> 
> IIRC, we already have a few changesets implementing those rules.
> 
> For example:
>     35c666e toolchain/wrapper: rename BR_DEBUG_WRAPPER
> 
> (I could not find another reverse such change, unfortunetely...)

 Blame the reporter.

 The conclusion was:

* BR2_ for all Kconfig variables;
* BR2_ for user-facing environment variables;
* BR_ for internal environment variables.


 Other such changes:

4113b3c infra: replace BUILDROOT_CONFIG with BR2_CONFIG
6768021 infra: replace BUILDROOT_DL_DIR with BR2_DL_DIR.


 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
