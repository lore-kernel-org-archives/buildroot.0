From: Bryce Schober <bryce.schober@gmail.com>
Date: Mon, 23 Sep 2013 14:22:47 -0700
Subject: [Buildroot] [BFCI] HOWTO Defconfig for host package
In-Reply-To: <CAAXf6LXGQXNhEo+HXjJO-3JKRn2xZiK0tKukKQVgCOQLy_f7mw@mail.gmail.com>
References: <CAJpxd06FJXZde5VS9BdifeH5ejSDDWUmHUoA8x3tt6FJ+77A-Q@mail.gmail.com>
 <CAAXf6LXGQXNhEo+HXjJO-3JKRn2xZiK0tKukKQVgCOQLy_f7mw@mail.gmail.com>
Message-ID: <CAJpxd07UjYQmPrM=y4ZxaET0DRGBoROjnv33WPCrKXA7OhLf3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 23, 2013 at 12:20 PM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Hi Bryce,
>
> On Mon, Sep 23, 2013 at 8:58 PM, Bryce Schober <bryce.schober@gmail.com>
> wrote:
> > [Buildroot for Complete Idiots] question here:
> >
> > How do I configure (in a defconfig) to build a host package variant? I
> was
> > guessing that BR2_PACKAGE_HOST_FOO would work, but apparently not. I've
> > defined a new generic package, and its host-foo target works as expected,
> > but I don't see anything obvious in the manual about how to get this in
> my
> > defconfig.
> >
> > I'm on an ancient version of buildroot here, so that may complicate
> > things...
>
> Previously (don't know by heart in which buildroot version this was
> introduced, I think somewhere in 2012) there was no support for
> explicit host packages. The only host packages that would be built,
> were those that were dependencies of target packages. Only the target
> packages would appear in the config.
>
> In current buildroot (as said, somewhere since a 2012 version) 'real'
> host packages were introduced, explicitly selectable in menuconfig.
> These config entries are in files Config.in.host instead of Config.in.
> The .mk files are as before (you still need HOST_FOO_XXX variables).
> In menuconfig, these explicit host packages are in the 'Host
> utilities' menu.
>
> If you do not have this new 'Host utilities' menu in your version of
> buildroot, and you cannot update to a newer buildroot version, you
> could either:
> a. backport the explicit host packages support, or
> b. (untested) create a dummy target package foo that depends on
> host-bar, and have BR2_PACKAGE_FOO in your .config. This should
> automatically build host-bar (not present in .config).
>
> Best regards,
> Thomas
>

Ok, thanks that makes sense. Indeed I have no Config.in.host, and it's no
problem in my case to make the target build depend on the host.

<><  <><  <><
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130923/f75ac118/attachment.html>
