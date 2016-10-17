From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 17 Oct 2016 10:22:23 +0200
Subject: [Buildroot] [PATCH] core/legal-info: allow ignoring packages
 from the legal-info
In-Reply-To: <20161015201327.GA3982@free.fr>
References: <1476538102-8779-1-git-send-email-yann.morin.1998@free.fr>
 <878ttpbq72.fsf@dell.be.48ers.dk> <20161015153246.GG3668@free.fr>
 <ce7a11dc-d228-5724-9821-5ef47eb670dc@lucaceresoli.net>
 <18b75237-c88f-586e-347c-d1c1a1d15cd5@mind.be>
 <20161015173729.GI3668@free.fr>
 <520a1ab5-06bb-7a22-1ace-7b4d1febc2c1@mind.be>
 <20161015201327.GA3982@free.fr>
Message-ID: <23f14628-b4d9-4fb2-4faf-c3f95749bf9c@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Arnout,

On 15/10/2016 22:13, Yann E. MORIN wrote:
[...]
>>>>  One remark though: I think the pre- and post-hooks should still run even if
>>>> _GEN_LEGAL_INFO = NO.
>>> Not so sure... Such hooks are made to save extra stuff into legal-info,
>>> or to prepare the package for legal-info. So, if the package is excluded
>>> for legal-info, there is no reason to run those hooks to start with, is
>>> there?
>>  First of all, both _GEN_LEGAL_INFO and _LEGAL_INFO_HOOKS are package-specific
>> so the package knows what it's doing.
>>
>>  The reason to run hooks is that you may still want to do *something* in the
>> legal info for excluded packages. I can't give a concrete example, but I'm
>> thinking along the lines of e.g. doing some check and erroring out, or still
>> adding some custom information to legal info. You know, what the hooks are meant
>> for in the first place :-) The point is, this option disables the normal
>> legal-info, but that doesn't mean that there would be no legal-info at all.
> 
> I would argue that, if a packager elected to have its package completely
> ignored by the legal-info infra, we should just abide by this wish and
> just completely ignore it. Altogether.
> 
> Let's see what others think... ;-)

I think Arnout is right. The hooks would allow to implement any weird
behavior that the infra is not (and should not even be) flexible enough
to do. Of course this would be doable with a user-provided script, but
then the script should also detect whether the given package is enabled
or not, while the hooks do it for free.

As far as the code is concerned, it should be only a matter of moving
the if/endif a few lines below/above, so it shouldn't add complexity.

-- 
Luca
