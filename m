From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 7 Jun 2018 19:25:42 +0200
Subject: [Buildroot] [PATCH 1/2] host-cargo: select host-rustc
In-Reply-To: <20180607180250.0df17b2f@windsurf>
References: <20180606202501.14535-1-fontaine.fabrice@gmail.com>
 <20180607180250.0df17b2f@windsurf>
Message-ID: <CAPi7W82UXsaV3cEcsytooYkuELeXYEGBjMo4UyMa_r5mJfZsDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2018-06-07 18:02 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Wed,  6 Jun 2018 22:25:00 +0200, Fabrice Fontaine wrote:
> > Buildroot documentation specifies that cargo-based package should only
> > depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS and selects
> > BR2_PACKAGE_HOST_CARGO but this does not work as host-cargo depends on
> > BR2_PACKAGE_HAS_HOST_RUSTC which is selected only when host-rustc is
> > selected.
>
> What "does not work" exactly ?
>
> Yes, you end up with host-rust being built as a dependency of
> host-cargo, while BR2_PACKAGE_HOST_RUST is not enabled.
>
> But for host packages, we currently don't enforce that their
> Config.in.host option is enabled when the package is built.
>
> So, which problem have you encountered ?
>
I got the following warning when I selected librsvg without this patch
because I added a "select BR2_PACKAGE_HOST_CARGO" in librsvg/Config.in as
specified in
https://buildroot.org/downloads/manual/manual.html#_integration_of_cargo_based_packages
:
warning: (BR2_PACKAGE_LIBRSVG) selects BR2_PACKAGE_HOST_CARGO which has
unmet direct dependencies (BR2_PACKAGE_HAS_HOST_RUSTC)

But thanks to Baruch review of my second patch, I understand that it is not
needed to add this select.
However, I think that documentation should be updated to remove this
select, I will send a patch to update
./docs/manual/adding-packages-cargo.txt if it's ok with you.

>
> I agree that your patch makes sense (it's better to have the
> Config.in.host option enabled when the corresponding host package is
> going to be built), but I don't see where the *problem* is, so I'd like
> to understand before applying.
>
> Thanks!
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180607/0807ba99/attachment.html>
