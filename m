From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jul 2015 13:48:06 +0200
Subject: [Buildroot] systemd not working properly?
In-Reply-To: <CAGduivz1u0fcOcSCZODYETGWS5jPFh51gab0REregRxf003c0w@mail.gmail.com>
References: <20141019124525.01fe9653@free-electrons.com>
 <CAGduivx-ZzNLFbvEkTGwEwDyucGKqL0UmLb7s3F5AAxno5_ECQ@mail.gmail.com>
 <20150707230348.5c7ea316@free-electrons.com>
 <CAGduivz1u0fcOcSCZODYETGWS5jPFh51gab0REregRxf003c0w@mail.gmail.com>
Message-ID: <CAGduivzg=YN5taesX6CzUOqqR-2_E_3e=+SpXoYJTZmNeWyrCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 7, 2015 at 11:53 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> On Jul 7, 2015 23:03, "Thomas Petazzoni"
> <thomas.petazzoni@free-electrons.com> wrote:
>>
>> Dear Maxime Hadjinlian,
> Hi Thomas
>>
>> On Mon, 20 Oct 2014 10:45:10 +0200, Maxime Hadjinlian wrote:
>>
>> > > Then a *very* long delay because of dev-ttyAMA0.device., that finally
>> > > ends up with:
>> > >
>> > > [ TIME ] Timed out waiting for device dev-ttyAMA0.device.
>> > > [DEPEND] Dependency failed for Serial Getty on ttyAMA0.
>> > >
>> > > And finally, I get no getty at all.
>> > So this particular issues, is due to the fact that for some reason,
>> > systemd doesn't like the fact that ttyAMA0 is a serial-link. If you
>> > delete the link in /etc/systemd/system/multi-user.target.wants/ and
>> > recreate it to point to getty at .service instead of
>> > serial-getty at .service, it will boot up fine.
>> > I am still looking into why it doesn't work. I am exploring some idea.
>>
>> I still see this issue today. Can we fix this to have something that
>> works properly out of the box?
> Sure things. I'll keep that in my queue for Friday :).
So after verified and talked to you, here's the definitive answer to that:

If you build your kernel through Buildroot, you'll have FHANDLE
selected if you use systemd as init.
If you build your kernel any other way and don't select FHANDLE in the
kernel's configuration, you'll end up with exactly this problem.

>>
>> Thanks,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
