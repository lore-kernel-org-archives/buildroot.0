From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Wed, 26 Nov 2014 01:09:24 +0100
Subject: [Buildroot] [PATCH v2] samba: Add support for libnss_win*.so*
	installation
In-Reply-To: <1416960016-5956-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1416960016-5956-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <CA+sos78yM1jSbH4tfFeOnGisghNXyW_WT+q1d+ufBACtywcx0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 26, 2014 at 1:00 AM, Beno?t Th?baudeau
<benoit.thebaudeau.dev@gmail.com> wrote:
> The libnss_wins and libnss_winbind libraries are required in order to
> add support for the wins and winbind sources to the Name Service Switch
> (NSS), so make it possible to install them. This is useful in order to
> resolve NetBIOS names or user and group information from a Windows NT
> server.
>
> These libraries are installed to /lib/ like the standard libnss_*
> libraries from (E)GLIBC.
>
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
>
> ---
>
> Changes in v2:
> - Make BR2_PACKAGE_SAMBA_LIBNSS_WIN* depend on BR2_TOOLCHAIN_USES_GLIBC
>   and BR2_PACKAGE_SAMBA_WINBINDD.
> - Use full path for target in 'install -D'.
> - Move the definitions of the hook functions inside the corresponding
>   conditional blocks.

Note that the winbindd daemon is still not started by S91smb if
BR2_PACKAGE_SAMBA_WINBINDD is set.

Regards,
Beno?t
