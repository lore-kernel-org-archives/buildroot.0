From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Thu, 23 May 2019 22:48:43 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/gpsd: bump to version
 3.18.1
In-Reply-To: <20190523200501.12716-1-fontaine.fabrice@gmail.com>
References: <20190523200501.12716-1-fontaine.fabrice@gmail.com>
Message-ID: <CA+sos79OJ0fZ-F8k7QsNKEuMRXCEoz4wZhN6eNTr7oewLdGJpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Thu, May 23, 2019 at 10:05 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> - Remove second patch (already in version)
> - Add a patch to fix build without man pages

[...]

Have you tested this with BR2_INSTALL_LIBSTDCPP set? I think that in
this case there is a C99-style "for (int i" somewhere in gpsd 3.18.1
that breaks the build because of the "-std=gnu++98" in CFLAGS and
CXXFLAGS.

Best regards,
Beno?t
