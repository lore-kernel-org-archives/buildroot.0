From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 1 Feb 2021 18:34:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/pugixml: drop
 BR2_PACKAGE_PUGIXML_HEADER_ONLY
In-Reply-To: <CAPi7W814FRkN6PY21kChgSVhCv3oLidX3hpzj-5DADxDXuVr3Q@mail.gmail.com>
References: <20210128172935.4138671-1-fontaine.fabrice@gmail.com>
 <20210131233021.605e67b0@windsurf.home>
 <CAPi7W814FRkN6PY21kChgSVhCv3oLidX3hpzj-5DADxDXuVr3Q@mail.gmail.com>
Message-ID: <CAPi7W82mgrDGJvSdrJQygo9o0zuAsjk2RHHXR0YTWR52VTjsJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 1 f?vr. 2021 ? 08:57, Fabrice Fontaine
<fontaine.fabrice@gmail.com> a ?crit :
>
> Hi Thomas,
>
> Le dim. 31 janv. 2021 ? 23:30, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> a ?crit :
> >
> > On Thu, 28 Jan 2021 18:29:35 +0100
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >
> > > Drop BR2_PACKAGE_PUGIXML_HEADER_ONLY which raises a build failure with
> > > gerbera (the only package that is using pugixml). Indeed, there is two
> > > issues:
> > >  - gerbera is not aware that it must define PUGIXML_HEADER_ONLY
> > >  - pugixml.cpp is not available in the staging directory so gerbera
> > >    can't use it
> > >
> > > It should be noted that pugixml continues to install a (non working)
> > > library even when PUGIXML_HEADER_ONLY is enabled resulting in a build
> > > failure at linking stage instead of configure step:
> > >
> > > [100%] Linking CXX executable gerbera
> > > /home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-musleabihf/8.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: liblibgerbera.a(config_manager.cc.o): in function `ConfigManager::getElement(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >) const':
> > > config_manager.cc:(.text+0x4d8): undefined reference to `pugi::xml_document::document_element() const'
> >
> > This looks like an upstream bug in pugixml, isn't it ? We're using
> > pugixml 1.10, but a 1.11 has been released since then. Have you tried
> > that ? Did you ask upstream pugixml about this issue ?
> It also fails with 1.11. Following your advice, I found that this
> issue has already been reported:
> https://github.com/zeux/pugixml/issues/200
> The answer was: "wontfix" with "Since I don't maintain pugixml
> packages and the packaging
> for Ubuntu seems appropriate (even though it doesn't support
> header-only builds, if you
> need them you should bundle pugixml with your app), I'm closing this."
Finally, after more investigation, it seems that the latest version of
pugixml installs a working library even if the option is still
"broken".
I'll send a v2.
> >
> > Thanks!
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> Best Regards,
>
> Fabrice
Best Regards,

Fabrice
