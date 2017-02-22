From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Thu, 23 Feb 2017 10:38:02 +1100
Subject: [Buildroot] GObject introspection
In-Reply-To: <e4a16f6891f6c1215cfb87b5743762b1@zacarias.com.ar>
References: <20170221111505.n57qgjfzkfynlesw@tarshish>
 <e4a16f6891f6c1215cfb87b5743762b1@zacarias.com.ar>
Message-ID: <20170222233802.GA3058@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 21, 2017 at 09:26:40AM -0300, Gustavo Zacarias wrote:
> On 2017-02-21 08:15, Baruch Siach wrote:
> 
> >Hi Buildroot list,
> >
> >GObject introspection[1] is not currently packaged for Buildroot. Quite a
> >few
> >packages disable introspection support at build time. If fact, we go into
> >great trouble to disable introspection in libgtk3. Is there a reason why
> >we
> >don't package GObject introspection other than "nobody felt the need"?
> >Does
> >introspection require special build time handling?
> >
> >My goal is to package pydbus[2] that depends on a newer version of
> >python-gobject (latest is 3.22, we currently package 2.28), which in turn
> >depends on GObject introspection.
> >
> >The current Buildroot option for dbus Python binding is dbus-python, but
> >it is
> >based on dbus-glib which is "obsolete and unmaintained"[3].
> >
> >Any other option or suggestion?
> >
> >Thanks,
> >baruch
> >
> >[1] https://wiki.gnome.org/Projects/GObjectIntrospection
> >
> >[2] https://github.com/LEW21/pydbus
> >
> >[3] https://www.freedesktop.org/wiki/Software/DBusBindings/
> 
> Hi Baruch.
> Last time i checked introspection required some nasty tricks to cross
> compile.
> Just google around and you might find an update.
> I have/had some WIP somewhere, just need to see if that work is still
> relevant, but first i need to find it :)
> But other than "it needs some trickery" i see no other reason to avoid it.
> Regards.

Hi,

I've been working on this too, on and off, for a while and it's working
fairly well (for me anyway) if you're willing to accept the restriction
that the kernel on your target must not be newer than your host (this is
actually quite annoying for me, but it's a hard requirement of QEMU
usermode), and that it's a bit difficult to debug if there are problems
because it does indeed require a lot of trickery :-(

(I've had to be careful with the exact version of QEMU I use, as well,
because some versions have had problems with usermode.)

Anyway, I'm happy to share what I've got so far, so I'll post it
after I dust it off and see that it's actually still working ;-)

Cheers,
Sam.
