From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 22 Feb 2019 19:06:20 +0200
Subject: [Buildroot] [PATCH RFC/next 1/4] package/webkit: new home for
 GTK and WPE WebKit components
In-Reply-To: <CAB0FRsvF-6rbND2_N-M0TFhOOyX7J2oMEWEBhXd18m47D5HsOw@mail.gmail.com>
References: <20190218171719.18721-1-aperez@igalia.com>
 <20190218171719.18721-2-aperez@igalia.com>
 <CAB0FRsvJuxkJ03b5RpmsPPbymOvxpwxGQjgF_EJxxUPRRvvyBQ@mail.gmail.com>
 <20190222164630.GB20589@momiji>
 <CAB0FRsvF-6rbND2_N-M0TFhOOyX7J2oMEWEBhXd18m47D5HsOw@mail.gmail.com>
Message-ID: <20190222190620.GC11151@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

Thanks for your comments, but I have reservations about your suggestion.

On Fri, 22 Feb 2019 17:32:48 +0100, Fran?ois Perrad <francois.perrad@gadz.org> wrote:
> Le ven. 22 f?vr. 2019 ? 15:47, Adrian Perez de Castro <aperez@igalia.com> a
> ?crit :
> 
> > Hello!
> >
> > On Fri, 22 Feb 2019 11:40:20 +0100, Fran?ois Perrad <
> > francois.perrad at gadz.org> wrote:
> > > Le lun. 18 f?vr. 2019 ? 18:17, Adrian Perez de Castro <aperez@igalia.com>
> > a
> > > ?crit :
> > >
> > > > Move the packages related to the GTK and WPE WebKit ports (webkitgtk,
> > > > libwpe, wpewebkit, wpebackend-fdo) under a new package/webkit/
> > > > subbdirectory as the first step to unify some of their configuration.
> > > >
> > > >
> > > Moving packages into a subdirectory is discouraged,
> > > see
> > https://buildroot.org/downloads/manual/manual.html#_package_directory
> >
> > On the other hand, while adding new subdirectories is discouraged, it is
> > not forbidden. In this case I thought that it could make sense grouping the
> > the (very related) WebKit packages. Also note that I expect to be adding a
> > more in the future [1].
> >
> > That being said, I am of course open to alternative suggestions, and in
> > particular knowing where the common parts that this patch set adds into
> > ?webkit/webkit.mk? and ?webkit/Config.in? would go in the case of not
> > making a subdirectory to group the related packages. Any ideas?
> >
> > Cheers,
> >
> >
> > -Adri?n
> >
> >
> > > Fran?ois
> > >
> >
> > Le ven. 22 f?vr. 2019 ? 15:47, Adrian Perez de Castro <aperez@igalia.com>
> > a ?crit :
> > Hello!
> >
> > On Fri, 22 Feb 2019 11:40:20 +0100, Fran?ois Perrad <
> > francois.perrad at gadz.org> wrote:
> > > Le lun. 18 f?vr. 2019 ? 18:17, Adrian Perez de Castro <aperez@igalia.com>
> > a
> > > ?crit :
> > >
> > > > Move the packages related to the GTK and WPE WebKit ports (webkitgtk,
> > > > libwpe, wpewebkit, wpebackend-fdo) under a new package/webkit/
> > > > subbdirectory as the first step to unify some of their configuration.
> > > >
> > > >
> > > Moving packages into a subdirectory is discouraged,
> > > see
> > https://buildroot.org/downloads/manual/manual.html#_package_directory
> >
> > On the other hand, while adding new subdirectories is discouraged, it is
> > not forbidden. In this case I thought that it could make sense grouping the
> > the (very related) WebKit packages. Also note that I expect to be adding a
> > more in the future [1].
> >
> > That being said, I am of course open to alternative suggestions, and in
> > particular knowing where the common parts that this patch set adds into
> > ?webkit/webkit.mk? and ?webkit/Config.in? would go in the case of not
> > making a subdirectory to group the related packages. Any ideas?
> >
> >
> You could create a virtual package webkit with 2 providers webkitgtk &
> wpewebkit.
> See details on
> https://buildroot.org/downloads/manual/manual.html#virtual-package-tutorial

There cannot be a virtual package, because both ?webkitgtk? and ?wpewebkit?
can be built and be installed in the same system.

> midori still depends on webkitgtk,
> but cog could depends on webkit, ie. using webkitgtk or wpewebkit.

I don't think so. Cog can be built against WebKitGTK, that's true; but that is
intended as a development aid and it is not recommended for normal usage. The
main goal of Cog is to be a library to help out implementing custom WPE WebKit
launchers, and it just happens to include a reference launcher as well.

The question still remains: if there is no subdirectory, where would the
common bits from ?webkit/webkit.mk? and ?webkit/Config.in? belong?

Regards,


-Adri?n


> > Cheers,
> >
> >
> > -Adri?n
> >
> >
> > > Fran?ois
> > >
> > >
> > > > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190222/2724c404/attachment.asc>
