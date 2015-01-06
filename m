From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 6 Jan 2015 07:53:34 -0600
Subject: [Buildroot] [PATCH 00/29] SELinux Buildroot Additions
In-Reply-To: <20150106093406.4e249077@free-electrons.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20150101224717.2a063a90@free-electrons.com>
 <CANQCQpYzQyMBd8eKvJ8NtB59JpUvSfost6J+5k1gvKKqxNU+eQ@mail.gmail.com>
 <CANQCQpaUT_e3UY9-fcghHOMeVDB=X1TJ8iNi1BqV21oUn+VPeA@mail.gmail.com>
 <CANQCQpZPzH-BaxM3tjDrypLzGG23goxZzz-TS=uU4gW3uuRpfg@mail.gmail.com>
 <20150106093406.4e249077@free-electrons.com>
Message-ID: <CANQCQpY1FvFF8RmqpXwX4_sNfBsmb9p=8Rn9+yeffbHdv8G8SQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Tue, Jan 6, 2015 at 2:34 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Matthew Weber,
>
> On Mon, 5 Jan 2015 21:37:29 -0600, Matthew Weber wrote:
>
>> > It looks like they have set things up to support backwards
>> > compatibility with separate releases for the different packages,
>> > however I'd rather refactor the patchset to use the new approach.
>>
>> I just noticed that the release script they use is intentionally
>> packaging each folder/package separately, so it does look like that's
>> their current approach (even in a single repo).  I think we still
>> should consolidate it into a single package.  For every disadvantage I
>> can think of for having it as one package, I can see resolving those
>> through a temporary patch or the way the Kconfig exposes what's built.
>
> I disagree: they are still shipping the thing as separate tarballs for
> each component, so we should continue to have separate packages in
> Buildroot.

Ok, that works.  I'll update the rest of the patchset with hash files
and similar cleanup like you've done in the Config.in of the
libselinux/libsemanage/libsepol.  I'd hold off merging until v2.


>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
