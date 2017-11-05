From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Nov 2017 23:15:45 +0100
Subject: [Buildroot] [PATCH 2/2] package/freerdp: always uses pkg-config
In-Reply-To: <ad0e2a73-0cde-17be-70fd-f9a9ec600f5b@mind.be>
References: <cover.1509907598.git.yann.morin.1998@free.fr>
 <f3ea53ecff0ea344fcc64197b75f4ee5be1ac09c.1509907598.git.yann.morin.1998@free.fr>
 <CAHXCMMJuTNZJhqOBdjAP3zfAQ2heOXoq+qscLXwKFy8GE8oYmw@mail.gmail.com>
 <20171105212220.GD10472@scaer>
 <ad0e2a73-0cde-17be-70fd-f9a9ec600f5b@mind.be>
Message-ID: <20171105221545.GE10472@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-11-05 23:09 +0100, Arnout Vandecappelle spake thusly:
> On 05-11-17 22:22, Yann E. MORIN wrote:
> > On 2017-11-05 22:17 +0100, Samuel Martin spake thusly:
> >> On Sun, Nov 5, 2017 at 7:46 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >>> Currently, we only deopend on host-pkgconf for gstreamer-0.x
> >>>
> >>> However, we also need it at least for gstreamer-1.x and waylabnd, too.
> >>>
> >>> Make it a mandatory dependency, no matter what.
> >>
> >> Since freerdp uses the cmake infrastructure, it already has
> >> host-pkgconf among its dependencies (c.f. [1])
> > 
> > OK, god to know, indeed...
> > 
> > Then, that does not explain the errors we're seeing... Damned... :-(
> 
>  I took a look at
> http://autobuild.buildroot.org/results/bdf/bdfe233ade36a56d0f65ef3c3d1698fca548beed/build-end.log

Yes, I'm revisitng the series as a whole: it turns out I did not have a
clean build tree, and something made it build ocally. Now, I can still
reproduce the issue with my patches...


>  It errors on
> .../output/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/wayland-scanner: No
> such file or directory
> i.e. it's trying to execute the staging wayland-scanner.

And that's becasue it uses whatever pkg-config provides, which is
obviously stupid and wrong for cross-compilation... Sigh... :-(

I'm revisiting the whole series...

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > 
> > I'll update the patch to just drop the depenency altogether, then.
> > 
> > Thanks!
> > 
> > Regards,
> > Yann E. MORIN.
> > 
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
