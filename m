From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 2 May 2014 10:59:36 -0400
Subject: [Buildroot] [PATCH] Rebuild busybox when an external config is
	updated
In-Reply-To: <53639BDE.4050009@zacarias.com.ar>
References: <1396469147-21713-1-git-send-email-sojka@merica.cz>
 <CAAXf6LVyQfj8Z=RQkfq_tyjN-e305bZSpKaOg5N5FpVSsc1Tbg@mail.gmail.com>
 <20140501203103.GA3231@free.fr> <87ha58corn.fsf@steelpick.2x.cz>
 <53639BDE.4050009@zacarias.com.ar>
Message-ID: <CANxTyt70fyJpEav__0EiE_j=v3_2HG5ooKAvhSSogWR2WttJbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 2, 2014 at 9:21 AM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 05/02/2014 10:07 AM, Michal Sojka wrote:
[SNIP]
> If you rebuild busybox without doing so for the other packages then your
> "reproducibly" goes down the drain since the "big and featured" binaries
> get overwritten by busybox (with the way busybox is installed at the
> moment) for a built project.

Ah, but that's where the busybox install script's "no clobber" feature
is useful - it won't create links on top of existing files/links.

I sent a patch [1] to the bb mailing list to add an option for this in
the bb config menu, but got no reply thus far.  In the meanwhile, I've
been using a simpler patch that just forces this feature on - it makes
"make busybox-menuconfig" much safer.

[1]  http://lists.busybox.net/pipermail/busybox/2014-April/080786.html

Danomi -
