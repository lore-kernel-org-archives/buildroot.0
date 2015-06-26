From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Jun 2015 17:06:43 +0200
Subject: [Buildroot] [PATCH v2 1/1] board: add support for Warpboard
In-Reply-To: <CAMQcK5JBCq4Dro8o-6n2O=YKeSzvv3Eb07FT+=iKfvsv-sB3zg@mail.gmail.com>
References: <1434988018-16391-1-git-send-email-lambertarthur22@gmail.com>
 <558B254C.2090606@mind.be> <20150625085428.GA3400@arthur-dreem>
 <558C800F.5030702@mind.be> <20150625223823.GI4178@free.fr>
 <CAMQcK5JBCq4Dro8o-6n2O=YKeSzvv3Eb07FT+=iKfvsv-sB3zg@mail.gmail.com>
Message-ID: <20150626150643.GB17113@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

On 2015-06-26 08:23 -0500, Ryan Barnett spake thusly:
> On Thu, Jun 25, 2015 at 5:38 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Arnout, Arthur, All,
> >
> > One case where I'd be inclined to accept more than the above is a
> > full-wireless device (like the soon-to-come-I-hope 96boards stuff).
> > But since wpa-supplicant needs configuration that we can't provide
> > (SSID and key), I don't see the point of adding it to the defconfig.
> >
> > However, we've decided to accept "demo" defconfigs, which can be packed
> > with more features than a simple board defconfig. We haven't had any
> > single such demo defconfig submitted so far.
> >
> > Still, even if we accept demo defconfigs, I stil think we should have a
> > small board defconfig file before we get a demo.
> 
> For the SELinux patchset, we are submitting a demo configuration
> because of the complexities of enabling SELinux packages.
> 
> http://patchwork.ozlabs.org/patch/479484/

Yeah, I haven't had time to look at your SElinuxpatchset so far (sorry,
I really intend to look at it, but I'm way under the water...).

Still, I had a quick look at that patch you reference above.

First, I have no objection that we do have "demo" defconfig files.
That's something we said we would accept.

Second, I see that this patch changes the existing qemu/x86 defconfig. I
beliefve this is wrong for a demo defconfig.

Here's my position:

  - basic defconfig files should provide the bare minimum for booting up
    a board up to the login prompt (possibly with a dhcp client on wired
    ethernet being OK). This is useful to check the board is booting
    fine, and can serve as a basis for further customisations for one's
    project.

  - demo defconfig files should be a different defconfig, possibly
    copied from the basic one, above, but should not replace it. This is
    usefull for quickly showing off the possibilities offered by
    Buildroot, like *big* stuff (Kodi, SELinux, whatever is *biggish*).

Adding more non-essential stuff in basic defconfig files is a barrieir
to entry, first in terms of build-time (we want to show we can be fast),
second because more stuff means more complexity and more causes for
failures in one's own environment.

Again, I'm *not* against adding demo defconfig files, I am OK with that.
What I'd like is we keep basic defconfig files for all boards, and that
a demo defconfig should be a second defconfig, not  replacement for a
basic defconfig file.

(Ditto the Linux defconfig file, btw...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
