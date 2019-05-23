From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 23 May 2019 23:25:11 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/gpsd: bump to version
 3.18.1
In-Reply-To: <CA+sos79OJ0fZ-F8k7QsNKEuMRXCEoz4wZhN6eNTr7oewLdGJpw@mail.gmail.com>
References: <20190523200501.12716-1-fontaine.fabrice@gmail.com>
 <CA+sos79OJ0fZ-F8k7QsNKEuMRXCEoz4wZhN6eNTr7oewLdGJpw@mail.gmail.com>
Message-ID: <CAPi7W82H-UfRm_ZumESTe3_BH4497TQMDwsaz+MJQCBiFDEzrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Beno?t,

Le jeu. 23 mai 2019 ? 22:48, Beno?t Th?baudeau
<benoit.thebaudeau.dev@gmail.com> a ?crit :
>
> Hi Fabrice,
>
> On Thu, May 23, 2019 at 10:05 PM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > - Remove second patch (already in version)
> > - Add a patch to fix build without man pages
>
> [...]
>
> Have you tested this with BR2_INSTALL_LIBSTDCPP set? I think that in
> this case there is a C99-style "for (int i" somewhere in gpsd 3.18.1
> that breaks the build because of the "-std=gnu++98" in CFLAGS and
> CXXFLAGS.
I tested with ./utils/test-pkg and LIBSTDCPP and it builds fine.
However, you're right that there is a C99-style loop in driver_ubx.c.
I'll retrieve upstream patch and send a v2 to fix it.
>
> Best regards,
> Beno?t
Best Regards,

Fabrice
