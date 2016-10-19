From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Oct 2016 21:38:20 +0200
Subject: [Buildroot] systemd-timesyncd fails to start
In-Reply-To: <20161018114500.1a6f76e0@free-electrons.com>
References: <e98da8cb-40e1-c8bf-4393-dfff8c828d79@jikos.cz>
 <20161018114500.1a6f76e0@free-electrons.com>
Message-ID: <20161019193820.GA3898@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, Thomas, All,

On 2016-10-18 11:45 +0200, Thomas Petazzoni spake thusly:
> On Tue, 18 Oct 2016 10:55:26 +0200, Petr Kulhavy wrote:
> > there is a peculiar problem with systemd NTP synchronization, that in 
> > the default rootfs the systemd-timesyncd.service always fails to start.
> > The reason is that systemd-timesyncd requires the /var/tmp to be a 
> > permanent storage and not just a link to /tmp.
> > See the second comment on this page: 
> > https://bbs.archlinux.org/viewtopic.php?id=151937
> > And really, if I replace the symlink with an empty folder it starts working.
> > 
> > I'm wondering what is the proper way to fix this. By default buildroot 
> > creates /var/tmp as a link to /tmp, however
> > on some platforms the rootfs might be read-only or very limited in 
> > space, so making /var/tmp permanent might break other things...
> > 
> > It would be greatly appreciated if anybody could shed more light on this.
> 
> I've added Yann E. Morin in Cc. He is working on a revamp of the root
> filesystem skeleton for the systemd case, specifically to solve this
> sort of problem.

Yup, still working on it.

> You can have a look at
> https://github.com/yann-morin-1998/buildroot/commits/yem/systemd-skeleton,
> but I'm not sure it's the latest updated work from Yann.

Nope, that is the series I submitted in July, but it "just works". Even
if it is not what's going to ultimately go upstream, I'd still be
interested in getting some feedback for that series, since I'm aiming to
have a similar end-result with the new work. So, if you could give it a
spin and report back, that's be great! ;-)

The revamp taking Thomas' comments into account is:
    https://github.com/yann-morin-1998/buildroot/commits/yem/systemd-skeleton-2

But that is absolutely not finished.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
