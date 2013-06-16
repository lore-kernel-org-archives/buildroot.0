From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 16 Jun 2013 17:56:14 +0100
Subject: [Buildroot] [PATCH] sconeserver: add patch to fix build issue
In-Reply-To: <1371401514-17259-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1371401514-17259-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHt8ZCMYSSHYyPofmMacBUK1v1cyttyOHCuY9cQJ=W_taZa3yg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas; thanks for looking into this.

On 16 June 2013 17:51, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Fixes:
>
>   http://autobuild.buildroot.org/results/f28/f2856c00d99fbf9ce882442ab7b868ccc4966388/build-end.log
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Simon Dawson <spdawson@gmail.com>
> ---
> Simon, feel free to upstream this patch. Since I know you've been
> following the sconeserver development, it's probably easier if you
> upstream the patch.
> ---

Okay; will do.

> diff --git a/package/sconeserver/sconeserver-fix-configure-operators.patch b/package/sconeserver/sconeserver-fix-configure-operators.patch
> new file mode 100644
> index 0000000..504be45
> --- /dev/null
> +++ b/package/sconeserver/sconeserver-fix-configure-operators.patch
> @@ -0,0 +1,93 @@
> +configure: use the proper '=' POSIX shell operator
> +
> +The '==' shell operator doesn't work in POSIX shells, so when sh is
> +symlinked to a POSIX shell such as dash and not a bash shell, the
> +configure tests that use this operator fail to work.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Aha; that explains why I couldn't get it to fail on my build machine.
Well spotted!

Simon.
