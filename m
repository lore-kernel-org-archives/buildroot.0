From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 15 May 2021 13:46:18 +0200
Subject: [Buildroot] Suggestion to "support/scripts/apply-patches.sh: do
 not apply patches with renames"
In-Reply-To: <20210515111946.GB2506@scaer>
References: <CAALxPJ0qprnhxWtHGg7oeY=Ws4+w3Wt-_hdM1WvbL6B42jQO5g@mail.gmail.com>
 <87fsyopkcr.fsf@dell.be.48ers.dk> <20210515094010.GA2506@scaer>
 <a6e13bf6-0cad-41d7-396e-0b9a31d225fd@gmail.com>
 <20210515111946.GB2506@scaer>
Message-ID: <fecfc535-58b5-4059-c1d2-9e3d05524dc2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

Le 15/05/2021 ? 13:19, Yann E. MORIN a ?crit?:
> Romain, All,
> 
> On 2021-05-15 12:57 +0200, Romain Naour spake thusly:
>> Le 15/05/2021 ? 11:40, Yann E. MORIN a ?crit?:
>>> On the Ubuntu side (as another data point), the odest LTS is Trusty,
>>> 14.04, and it has patch 2.7.1.
>> Based on the host gcc requirement on gcc 4.9 (released the 22 April 2014), we
>> already don't support such old distro. Ubuntu LTS Trusty provide gcc 4.8.
> 
> Ah, I don't thinks so. We still only require gcc >= 4.8:

It seems the BR2_HOST_GCC_AT_LEAST_4_8 symbol has been removed with commit
55fc80260b packages: host gcc >= 4.8 is now guaranteed.

I just noticed it while looking at this discussion...

> 
>   - the manual still references gcc 4.8, even the nightly snapshots:
>         http://nightly.buildroot.org/#requirement
> 
>         2.1. Mandatory packages
>         ...
>         * gcc (version 4.8 or any later)
>         * g++ (version 4.8 or any later) 
> 
>   - support/dependencies/dependencies.sh still only checks for gcc >=
>     4.8:
>         if [ $COMPILER_MAJOR -lt 4 -o $COMPILER_MAJOR -eq 4 -a $COMPILER_MINOR -lt 8 ] ; then
> 
> The last time (that I remember of) when we bumped our host gcc
> requirement, was with those commits, dated October 2020:
> 
>   * 5ee815ab6a docs/manual: bump our gcc/g++ requirements to 4.8
>   * 55fc80260b packages: host gcc >= 4.8 is now guaranteed
> 
> I could not find a reference to requiring host gcc >= 4.9 in the commit
> logs...

Otherwise, agree gcc 4.8 should be the minimal supported version.

Best regards,
Romain


> 
> Regards,
> Yann E. MORIN.
> 
