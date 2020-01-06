From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 6 Jan 2020 19:08:52 +0100
Subject: [Buildroot] [PATCH v2 0/8] pkg-stats json output improvements
In-Reply-To: <CAEyMn7YYEcJUe6XE+AAjHMH+oaOMkF3=qydH9WE1fs4NqjQ5hw@mail.gmail.com>
References: <20200105092329.6288-1-heiko.thiery@gmail.com>
 <20200105204554.421b0ef7@windsurf>
 <CAEyMn7YYEcJUe6XE+AAjHMH+oaOMkF3=qydH9WE1fs4NqjQ5hw@mail.gmail.com>
Message-ID: <CAEyMn7arZQa2gb_F81ccM7d5zXqBgyMbph4A2C-m6Uzngv6Pwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am So., 5. Jan. 2020 um 22:40 Uhr schrieb Heiko Thiery <heiko.thiery@gmail.com>:
>
> Am So., 5. Jan. 2020 um 20:45 Uhr schrieb Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>:
> >
> > Hello Heiko,
> >
> > On Sun,  5 Jan 2020 10:23:22 +0100
> > Heiko Thiery <heiko.thiery@gmail.com> wrote:
> >
> > > This patches add several improvements for the json output of the
> > > pkg-stats script.
> > >
> > > - add developers information to the packages
> > > - add supported defconfigs to json
> > > - add license information to json
> > > - add more generic status field to the packages
> >
> > Thanks for this new iteration. There is however one really important
> > thing that I missed in the review of v1: the JSON provided by pkg-stats
> > is then used by other tools. So if you change the layout/format of the
> > JSON file, those tools also need to be modified accordingly.
> >
> > The tool consuming the JSON file today is the daily-mail script at
> > https://git.buildroot.org/buildroot-test/tree/utils/daily-mail. I think
> > the only function that needs to be modified is
> > https://git.buildroot.org/buildroot-test/tree/utils/daily-mail#n549.
>
> ok I see .. was not aware of this repo till now. I try to figure out
> how it works. But when I'm correct this script is also used for the
> other branches of maintained buildroot versions. So if we change the
> layout of the JSON file we have to take care of the pkg-stats script
> in the other maintained branches.

if I see correct we only need to change this line
https://git.buildroot.org/buildroot-test/tree/utils/daily-mail#n554 to
get the 'status', 'latest_v' and 'id' from the dict 'rm_version'.
Should I send a patch to you? Or where to send?

> > Best regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

--
Heiko
