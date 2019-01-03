From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 3 Jan 2019 22:47:18 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/glibc: fix include of
 syscalls.h for RISC-V architecture
In-Reply-To: <04e0d061-1929-ab39-d29b-865268b41aa9@embecosm.com>
References: <20190102151559.32221-1-mark.corbin@embecosm.com>
 <20190102151559.32221-2-mark.corbin@embecosm.com>
 <7d593615-b620-89af-4d58-3e4b496726d6@gmail.com>
 <20190102211826.GN23435@scaer>
 <04e0d061-1929-ab39-d29b-865268b41aa9@embecosm.com>
Message-ID: <54bea197-dd49-4590-40bd-a8852a4dbc4c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mark,

Le 03/01/2019 ? 21:16, Mark Corbin a ?crit?:
> Hello
> 
> On 02/01/2019 21:18, Yann E. MORIN wrote:
>> Romain, All,
>>
>> On 2019-01-02 20:51 +0100, Romain Naour spake thusly:
>>> Le 02/01/2019 ? 16:15, Mark Corbin a ?crit?:
>>>> UAPI header file asm/syscalls.h has been merged into the UAPI
>>>> asm/unistd.h header file for the RISC-V architecture in the
>>>> 4.20 kernel. This causes the glibc 2.28 build to break.
>>>>
>>>> This commit applies the upstream glibc patch for this issue.
>>> Can you ask upstream to backport this patch to the glibc 2.28 stable branch?
>>> When it's done you can just bump the glibc version up to the backported patch.
>> Well, we already have another patch that we backported from master, but
>> that upstream has not backported. Sigh...
>>
>> So, even if updating would solve Mark's case, we'd still be missing a
>> fix we'd stil have to carry.
> I managed to persuade the glibc developers to backport both fixes today :-)
> 
> I've just posted a new patch to bump the glibc version accordingly.

Great, thanks!

Best regards,
Romain

> 
> Kind regards
> 
> Mark
> 
