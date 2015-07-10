From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 10 Jul 2015 17:18:07 -0500
Subject: [Buildroot] [PATCH v7 22/22] cpio: new package
In-Reply-To: <20150711001618.44eb6d3c@free-electrons.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-23-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150706123840.61ff3672@free-electrons.com>
 <CANn-YGTt5AoiV=5ht_4krY6EvVNTih=tiYqDoty6WmykeqkFug@mail.gmail.com>
 <20150711001618.44eb6d3c@free-electrons.com>
Message-ID: <CANn-YGT4NRRbEzSxJ7ny+LDSxYm5nvMUtJXREdcObqrQnJefug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Jul 10, 2015 at 5:16 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Clayton,
>
> On Fri, 10 Jul 2015 16:02:41 -0500, Clayton Shotwell wrote:
>
>> > What is the motivation to have a host variant of cpio? cpio is already
>> > part of the mandatory programs that Buildroot checks for at the
>> > beginning of every build: it must be installed on the host system prior
>> > to running Buildroot.
>>
>> Well I am not using it for anything in particular, I really just need
>> the target variant. I can remove the host option without any impact to
>> anything.
>
> Well, if you don't use it, then I'd prefer to not support the host
> build, especially since cpio is already a mandatory dependency of
> Buildroot.
>
> We do have cases (like tar) where we support building a host option
> even if it's a mandatory dependency, because some platforms have a too
> old tar for Buildroot.

I will drop the host build option then to keep things simpler. It
would be very simple for someone to add it back in the future if the
need arises.

>>
>> > If the ArchLinux patches apply without any adaptation, have you
>> > considered using:
>> >
>> > CPIO_PATCH = \
>> >         https://projects.archlinux.org/svntogit/packages.git/plain/trunk/cpio-2.11-stdio.in.patch?h=packages/cpio \
>> >         ...
>> >
>> > instead ?
>>
>> I always forget that is an option because I cannot freely download
>> stuff behind our firewall. I'll look at changing the patches to links
>> to make things simpler but I may have issues testing that all the
>> links work properly.
>
> I can test before committing, no problem with that.

Sounds good.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
