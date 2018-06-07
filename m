From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 7 Jun 2018 19:26:36 +0200
Subject: [Buildroot] [PATCH 2/2] librsvg: bump to version 2.42.5
In-Reply-To: <20180607075842.1c92eba9@windsurf>
References: <20180606202501.14535-1-fontaine.fabrice@gmail.com>
 <20180606202501.14535-2-fontaine.fabrice@gmail.com>
 <20180607075842.1c92eba9@windsurf>
Message-ID: <CAPi7W80r-NzMsh4r2df0XHeZtkXAtpJ8NNdnaAwyBD8wZ6V4Vw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2018-06-07 7:58 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Wed,  6 Jun 2018 22:25:01 +0200, Fabrice Fontaine wrote:
> > - Add a dependency to host-cargo
> > - Add a patch to set RUST_TARGET
> > - Add a dependency to BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> > - Forward this dependency to efl svg and enlightment
> > - Add hash for license file
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> As I was surprised by the new rust dependency, I looked at
> https://github.com/GNOME/librsvg/blob/master/COMPILING.md. Indeed, Rust
> appears to be necessary.
>
Yes, rust is now needed and 2.40.x won't be maintained anymore: see
https://gitlab.gnome.org/GNOME/librsvg/merge_requests/71#note_231260.

>
> But the other thing that came up from this reading is:
>
> Mandatory dependencies
> [...]
> GObject-Introspection 0.10.8
>
> But we don't have gobject-introspection in Buildroot, the package for
> that is pending review, and it's a complicated one. How is it possible
> that you built librsvg without it ? Is the documentation incorrect and
> in fact it's an optional dependency ?
>
The documentation is incorrect.
configure.ac makes a call to GOBJECT_INTROSPECTION_CHECK and not
GOBJECT_INTROSPECTION_REQUIRE.
So except, if we set --enable-introspection, build won't fail without
gobject-introspection.
gobject-instropection is only needed for vala bindings, see:
https://github.com/GNOME/librsvg/blob/f17210327623f59d4b1fbe
c538850b145f2fc069/m4/vapigen.m4.
This is the same behavior in 2.4.20.
Nevertheless, I will send you a v2 to take into account Baruch's review.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180607/5f977855/attachment.html>
