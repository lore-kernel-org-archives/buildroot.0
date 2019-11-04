From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 4 Nov 2019 15:50:25 -0600
Subject: [Buildroot] [External] [PATCH v2 1/2] package/netdata: new
 package
In-Reply-To: <87wocfylbs.fsf@grinn-global.com>
References: <20191030093243.2936111-1-m.niestroj@grinn-global.com>
 <CANQCQpZtHBMFJUHxikL2vuYOj7iwnCXwOTQi=Svkk-FHLvuGwA@mail.gmail.com>
 <87r22sq4p6.fsf@grinn-global.com>
 <CANQCQpZGdVG8QmOLoWtaswnn25tM1KYiTAzn2i_vy1+Ggt231w@mail.gmail.com>
 <87y2wwx8zx.fsf@grinn-global.com> <87wocfylbs.fsf@grinn-global.com>
Message-ID: <CANQCQpYqRvet5Q1HVpWeKvn4+QM6T+WAjkKACXf1m3CmU0z1WA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 4, 2019 at 4:42 AM Marcin Niestr?j
<m.niestroj@grinn-global.com> wrote:
>
> Hi Matt,
>
> Marcin Niestr?j <m.niestroj@grinn-global.com> writes:
>
> > Hi Matt,
> >
> > [snip]
> >
> > So in order to do things properly we would need to ask netdata about
> > their prefered build system for future and do improvements there :)
> >
>
> Looking at Github issues there is an ongoing effort to support cmake as
> the main build system. So I would go with autotools for now and add
> patch that removes .keep installation. In future we can convert to cmake
> if that will be ready in next netdata release. Then we will drop
> Buildroot specific patch and do improvements in cmake installation if
> neccessary. What do you think about that?

Ah that is a good catch, if they are changing we'll have to integrate
this again soon.  I'd suggest putting in a ticket to bring visibility
to this .keep collision such that they don't keep it in the cmake
update.  Then you can reference that ticket as your upstream issue/bug
in your patch in buildroot.

Matt
