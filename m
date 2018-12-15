From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Dec 2018 14:47:11 +0100
Subject: [Buildroot] [PATCH v2 1/1] boot/systemd-boot: new package
In-Reply-To: <CADvTj4o3UQOnhq3ewP_tLGxE4bwnMP-At3zU6PLJEUmqZhM7Uw@mail.gmail.com>
References: <1544787764-4537-1-git-send-email-james.hilliard1@gmail.com>
 <20181215085855.GA2625@scaer>
 <CADvTj4os44jtzrL=1uzQ83=xry2BJnJjKMPU-QgJaXi-tVNBoA@mail.gmail.com>
 <20181215102745.GB2625@scaer>
 <CADvTj4qfxJmefVR71juMxMdoV7+ua5Utt4cUGhPCnDXFUtBXDA@mail.gmail.com>
 <20181215110035.GE2625@scaer>
 <CADvTj4o3UQOnhq3ewP_tLGxE4bwnMP-At3zU6PLJEUmqZhM7Uw@mail.gmail.com>
Message-ID: <20181215134711.GH2625@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-12-15 04:09 -0700, James Hilliard spake thusly:
> On Sat, Dec 15, 2018 at 4:00 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2018-12-15 03:43 -0700, James Hilliard spake thusly:
> > > systemd-boot needed to be built at the same time as the userspace
> > > tools for systems that have a systemd init system for the integration
> > > to work properly.
> > OK, so we need to think it a bit, then. Is it the boot part that needs
> > the userland part, of the userland that needs the boot part, of they
> > both need to know each other?
> Mostly userland that needs to know the boot part, the boot part itself
> doesn't really care what OS it is booting.

OK, so we should be able to build systemd-boot as its own package.

Then, we just configure systemd with boot support.

> > One option I can think of quickly, is that we could have a systemd-boot
> > package that is only available when systemd is not enabled, and an option
> > in systemd to install the boot part when systemd is enabled.
> I was trying to avoid having fully separate packages since that would
> create a lot of maintenance overhead keeping both up to date as well.
> Is there something wrong with having a fake boot package that
> configures the appropriate options in the primary systemd package?

What is wrong is that it makes the systemd package *and* the init
selectionmuch more copmplex, and this is not acceptable (IMHO).

I'd rather have a second package that is trivial, with mimimum, if at
all, changes in the main systemd package.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
