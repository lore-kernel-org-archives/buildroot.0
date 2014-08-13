From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 13 Aug 2014 17:07:10 -0400
Subject: [Buildroot] [PATCH] qt: don't install translation files by
	default
In-Reply-To: <1407961570-10684-1-git-send-email-luca@lucaceresoli.net>
References: <1407961570-10684-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <CANxTyt5VK1XKYXe8Y3RbqDAoraWC_heS0p0HoCExfH3pbEbORA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 13, 2014 at 4:26 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Commit 93917b6980f7f2b51302e1a3fa451b07cf7d674e (2013.11) introduced
> the installation of the binary .qm translation files, unconditionally.
>
> However, the installed size is very large for some embedded systems
> (about 8 MB), and they are not needed in many cases.
>
> In order to avoid such a waste of storage space, commit
> 2ff329412f490dc916bab3377073ef5950a46298 (2014.08) made this
> installation an option that could be disabled. For backward
> compatibility, the option defaults to yes.
>
> Given the relevant size of these files, and that they had never been

Nitpick: "relevant"?  Do you mean "relative" or "relatively large"?


> installed by Buildroot versions before 2013.11, change the default to
> not installing these files.
>
> Interested users can still activate it as needed.
>
> Also update and improve a bit the help text.

/a bit the help text/the help text/

Otherwise:

Reviewed-by: Danomi Manchego <danomimanchego123@gmail.com>

Danomi -


>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Danomi Manchego <danomimanchego123@gmail.com>
> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/qt/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index 93751cd..da159b4 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -30,10 +30,10 @@ config BR2_PACKAGE_QT_DEMOS
>
>  config BR2_PACKAGE_QT_TRANSLATION_FILES
>         bool "Install translation files"
> -       default y
>         help
>           Install binary .qm translation files.
> -         If unsure, say y.
> +         Say y if you need these files. They will take about 8 MB
> +         on the target root filesystem.
>
>  config BR2_PACKAGE_QT_EXAMPLES
>         bool "Compile and install Qt examples (with code)"
> --
> 1.9.1
>
