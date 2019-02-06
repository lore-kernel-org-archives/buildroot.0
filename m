From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 6 Feb 2019 08:48:48 -0600
Subject: [Buildroot] [RFC] Getting run-time / defconfig testing
 maintainers feedback of failures
In-Reply-To: <20190206153746.43291101@windsurf>
References: <CANQCQpYBJ05wNamef9ZgdVBruMDUq5pY3x8XixGaww=10ertjw@mail.gmail.com>
 <20190206153746.43291101@windsurf>
Message-ID: <CANQCQpaQjygesoTOTHU7_Npvz8DCjcXO7J_V9MARHJNu-Kg0HA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Feb 6, 2019 at 8:37 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Matt,
>
> On Wed, 6 Feb 2019 08:14:37 -0600
> Matthew Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > Has there been any ideas or proposals so far for giving more
> > visibility to the CI failures?  I definitely want to contribute if
> > there is something in progress, otherwise here's a proposal..........
> >
> > One idea I had been throwing around was since you can personally fork
> > Buildroot in Gitlab and have your own personal Gitlab-runners doing
> > the CI builds.  Once the per job trigger series[1] merges, I'd like to
> > proposed adding a manual section which talks about the following
> > 1) How a user can setup a Buildroot fork on Gitlab
> > 2) Enable it to follow the main Gitlab Buildroot repo
> > 3) Create cron jobs for their test cases
> > 4) Manage notifications to track build failures
> > 5) Notes on Gitlab-runner setup
> >
> > This doesn't replace the main CI testing and reporting, however it
> > would put more ownership of defconfigs/run-time test fixing on others.
>
> My idea, which puts less burden on the shoulder of individual
> contributors is to extend the daily-mail script [1] that is used today
> to send autobuilder results. The extension would consist in using the
> Gitlab CI API to analyze the results of the last pipelines, and if
> there's a failure on a defconfig or test, mail the corresponding
> person. Thanks to this, we would have a single mail per day sent out
> (to the mailing list and to participants) with autobuilder failures and
> gitlab CI failures.
>
> What do you think ?

That sounds good.

Related to getting more runners setup, maybe it would still be worth
capturing that under the contributing section [2] ?

Matt

[2] https://buildroot.org/downloads/manual/manual.html#_contributing_to_buildroot
