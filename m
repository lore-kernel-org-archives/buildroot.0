From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jul 2017 00:12:16 +0200
Subject: [Buildroot] [PATCH 08/20] system: with no init system,
 only allow custom skeleton
In-Reply-To: <9d4545cd-27a2-39dc-65e5-9f669f28db52@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <005008f3ac1cdbd8de65006d578d43c555355d0f.1500398733.git.yann.morin.1998@free.fr>
 <3bd7e441-4317-20f9-9e7f-9a06168ced61@mind.be>
 <20170722135322.GB9929@scaer>
 <9d4545cd-27a2-39dc-65e5-9f669f28db52@mind.be>
Message-ID: <20170722221216.GI9929@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,  All,

On 2017-07-22 23:18 +0200, Arnout Vandecappelle spake thusly:
> On 22-07-17 15:53, Yann E. MORIN wrote:
> > Ranout, All,
> > 
> > On 2017-07-22 15:28 +0200, Arnout Vandecappelle spake thusly:
> >> On 18-07-17 19:25, Yann E. MORIN wrote:
> >>> When there is no init system (i.e. a custom one), our bundled default
> >>> skeleton is most probably un-fit for that (non-)init system.
> >>>
> >>> This will be the case when we introduce per init system skeletons. The
> >>> systemd skeleton will be unfit except for a systemd init; the sysv
> >>> skeleton will be unfit except for a sysv-like init system.
> >>>
> >>> In case they are using no init system (really, a custom one), the user
> >>> should be responsible for providing their own, custom skeleton as well.
> >>>
> >>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >>
> >>  NACK on this one. Our skeleton (as in, the contents of system/skeleton) is
> >> already init-agnostic. If you use another init system (shell script, or no init
> >> at all because you just use it as a chroot, or whatever), you will *still* need
> >> that skelecton. Indeed, the skeleton contains things like the /sys and /dev
> >> directories, a passwd file, ....
> >>
> >>  If there are things in that skeleton that you don't need for a custom init
> >> system, then they probably shouldn't even be in the skeleton.
> > 
> > This patch is reverted later in the series, once all the types of
> > skeleton are in place. I could not see how to do it sanely and cleanly
> > otherwise.
> 
>  OK, in that case
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks.

>  I trust that you looked for a way to avoid this temporary workaround.

I tried, but I could not see a simple, clean and quick solution...

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
