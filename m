From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Oct 2014 19:11:37 +0200
Subject: [Buildroot] [PATCH 3/5] infra: Add automatic install of init
	scripts
In-Reply-To: <20141018190628.67c1516c@free-electrons.com>
References: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1413643624-14757-4-git-send-email-maxime.hadjinlian@gmail.com>
 <20141018185601.1a8e732c@free-electrons.com>
 <CAGduivwJMVzpd+uc6Ng_CMivXP1i3pNBtFVjd0ara70oZ5UKYA@mail.gmail.com>
 <20141018190628.67c1516c@free-electrons.com>
Message-ID: <CAGduivxamBowj_0TCFZ-SEGd+x7FUM1JcsUhnRxFy_DuM1aWOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all

On Sat, Oct 18, 2014 at 7:06 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Hadjinlian,
>
> On Sat, 18 Oct 2014 18:59:03 +0200, Maxime Hadjinlian wrote:
>
>> > Why is an explicit variable necessary ? Why not simply install all the
>> > S* and K* files from the package directory for sysvinit/busybox and all
>> > the .service (or some extension) of the package directory for systemd ?
>> > I think we discussed this at the meeting, no?
>> Indeed, but as stated in the cover letter, we need to have a variable,
>> because, some packages only install their init scripts conditionally
>> (take ntpd for example).
>
> Well, we could by default install S* and K* files, except if the
> <pkg>_INIT_SYSV_FILES variable is defined, in which case we only
> install the ones that are mentioned. Maybe it's making the logic too
> complicated, I don't know.
We could that, but as you say, maybe it makes things a little more
complex than they should be.
>
>> So you can't blindly install files only by maching their names.
>> Also, the current trend is that applications have their init scripts
>> in the sources, and we don't want to keep a copy if in our packages,
>> we want to take it straight from the sources, having such a variable
>> enable that.
>
> For systemd, I would expect the package build system to install the
> unit files by itself, no?
I would expect that too yes. It would be quite nice actually.
>
> And for init scripts, we generally don't use the init scripts provided
> by the package itself, because they're often too complicated / not
> compatible with the simple Busybox init.
>
> But, well, maybe you're right and making things explicit is better.
It's up for discussion as always :).
The intention here, is mainly to remove duplicated code and have some
enforced rules as to where the init files should be installed.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
