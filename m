From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 18 May 2015 13:10:18 +0200
Subject: [Buildroot] [git commit] package/enlightenment: disable ptrace
 with xtensa and uClibc-ng
In-Reply-To: <CAJ3iQcomP9xHGszw38yFx2i6+3dKud-iaN1o197N9i+wQCQK8g@mail.gmail.com>
References: <20150517190414.D6F9B817E5@busybox.osuosl.org>
 <CAJ3iQcomP9xHGszw38yFx2i6+3dKud-iaN1o197N9i+wQCQK8g@mail.gmail.com>
Message-ID: <5559C89A.8040606@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gergely,

Le 18/05/2015 03:45, Gergely Imreh a ?crit :
> On 18 May 2015 at 03:02, Peter Korsgaard <peter@korsgaard.com> wrote:
>> commit: http://git.buildroot.net/buildroot/commit/?id=cce148558119047254981aab686deff16dbba1eb
>> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>
>> uCLibc-ng needs to backport the uClibc commit
>> de6561f6669308e5d2297589b39a217d4c14df1c to add
>> PT_GETSIGINFO definition.
>>
>> This commit is already merged in uClibc-snapshot used by
>> Buildroot's toolchains for xtensa.
>>
>> For now, disable ptrace with xtensa uClibc-ng toolchains.
>>
>> Thanks to Gergely Imreh for the initial investigation and
>> patch:
>> http://patchwork.ozlabs.org/patch/470073/
>>
> 
> Awesome, thanks! As a procedural question (since this is the first
> time for me like this), should I mark that linked patch in patchworks
> as Superseeded and archived? I'm sure someone's doing housecleaning
> there every now and than, but the less time they have to spend
> reviewing things the better.

Yes your patch is superseded for the xtensa part but not for PowerPC.
You can send another patch to allow ptrace with uClibc-ng an uClibc for PowerPC.

Best regards,
Romain
> 
> Cheers!
> 
>> Fixes:
>> http://autobuild.buildroot.net/results/77b/77b82e5b437d0778b3f6a3813f2c0a5c39b52db9
>>
>> Reported-by: Gergely Imreh <imrehg@gmail.com>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>> ---
