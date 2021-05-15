From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 15 May 2021 12:57:04 +0200
Subject: [Buildroot] Suggestion to "support/scripts/apply-patches.sh: do
 not apply patches with renames"
In-Reply-To: <20210515094010.GA2506@scaer>
References: <CAALxPJ0qprnhxWtHGg7oeY=Ws4+w3Wt-_hdM1WvbL6B42jQO5g@mail.gmail.com>
 <87fsyopkcr.fsf@dell.be.48ers.dk> <20210515094010.GA2506@scaer>
Message-ID: <a6e13bf6-0cad-41d7-396e-0b9a31d225fd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, All,

Le 15/05/2021 ? 11:40, Yann E. MORIN a ?crit?:
> Peter, Ryota, All,
> 
> On 2021-05-15 08:44 +0200, Peter Korsgaard spake thusly:
>>>>>>> "Ryota" == Ryota Kinukawa <pojiro.jp@gmail.com> writes:
>>  > Hi. Thank you for your great work, Buildroot team.
>>  > I'm writing this email for suggestions to support/scripts/apply-patches.sh.
>>
>>  > Recently, I was working with buildroot to apply patches-4.14.164-rt73.
>>  > It included a patch((patches-4.14.164-rt73/0462-..)) which renames a file.
>>  > This caused the build to terminate with an error.
> [--SNIP--]
>> The problem with such an option is that it describes a property of the
>> build host, not of the Buildroot configuration - And we still wouldn't
>> be able to use rename patches as long as that option was supported.
>>
>> So we want apply-patches.sh to work the same for everyone.
>>
>> But we're now 4 years later, so perhaps it is time to unconditionally
>> drop support for GNU patch < 2.7?
>>
>> GNU patch 2.7 was released in September 2012, so 8.5 years ago:
>>
>> https://savannah.gnu.org/forum/forum.php?forum_id=7361
>>
>> Thomas, Yann - Any ideas how common such old patch version are nowadays?
> 
> One of the oldest supported distro that was rel;eased before patch 2.7,
> is RHEL 6. It has entered Extended Support in late 2020, and is expected
> to be supported until mid 2024. However, consdering this is an old
> distro, Iand that there were CVes on patch < 2.7 I'd expect that RHEL 6
> now packages a newer patch that is >= 2.7.
> 
> People that do not update their systems, and are stuck on so old a host
> distro, will probably not update their Buildroot version either...
> 
> On the Ubuntu side (as another data point), the odest LTS is Trusty,
> 14.04, and it has patch 2.7.1.
> 
> As for Debian, the oldest still supported is Jessie, with Extended LTS
> until mid 2022, and it was released in 2015, so presumably has patch >=
> 2.7 too.
> 
> So, I would be OK for requiring patch >= 2.7.
> 
> So, lets do it that way;
> 
>  1. add a check in support/dependencies/dependencies.sh that patch >=
>     2.7 (just after/before the check for --no-backup-if-mismatch)

Based on the host gcc requirement on gcc 4.9 (released the 22 April 2014), we
already don't support such old distro. Ubuntu LTS Trusty provide gcc 4.8.

Best regards,
Romain

> 
>  2. drop the test for renames in support/scripts/apply-patches.sh
> 
> Ryota, would you care to work on that and send the patches to the list,
> please?
> 
> Regards,
> Yann E. MORIN.
> 
