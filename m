From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 30 Apr 2018 12:57:00 -0500
Subject: [Buildroot] [PATCH 3/4] package/Makefile.in: Remove RELRO
 linker flags from CFLAGS
In-Reply-To: <20180425064518.31797-3-stefan.sorensen@spectralink.com>
References: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
 <20180425064518.31797-3-stefan.sorensen@spectralink.com>
Message-ID: <CANQCQpbyDWsyEQ4ERFfpQ=h_5fU_QnXNcKN-ULOKhMf1e7FLDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan,

On Wed, Apr 25, 2018 at 1:45 AM, Stefan S?rensen
<stefan.sorensen@spectralink.com> wrote:
> The RELRO related flags are for the linker, not the compiler, so they belong
> in LDFLAGS.
>
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  package/Makefile.in | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 1cbf34e0df..4525b8e79f 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -141,9 +141,6 @@ ifeq ($(BR2_DEBUG_3),y)
>  TARGET_DEBUGGING = -g3
>  endif
>
> -TARGET_CFLAGS_RELRO = -Wl,-z,relro
> -TARGET_CFLAGS_RELRO_FULL = -Wl,-z,now $(TARGET_CFLAGS_RELRO)
> -

If you remove these flags from CFLAGS then packages that link with gcc
vs explicitly ld won't get the flag.
