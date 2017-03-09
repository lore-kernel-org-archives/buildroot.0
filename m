From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 21:36:05 +0100
Subject: [Buildroot] [PATCH 1/1] test-pkg: Extend the logfile with the
 first command as well
In-Reply-To: <1489072521-5514-1-git-send-email-benoit.allard@greenbone.net>
References: <1489072521-5514-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20170309213605.20997679@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Mar 2017 16:15:21 +0100, Beno?t Allard wrote:
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> ---
>  support/scripts/test-pkg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied.

> diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
> index a040ce1..0e7779d 100755
> --- a/support/scripts/test-pkg
> +++ b/support/scripts/test-pkg
> @@ -108,7 +108,7 @@ build_one() {
>  	_EOF_
>      cat "${cfg}" >>"${dir}/.config"
>  
> -    if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
> +    if ! make O="${dir}" olddefconfig > "${dir}/logfile" 2>&1; then

To be honest, I wasn't sure if we wanted > or >> here. It matters if
you restart the test-pkg command after fixing issues. Do you want
logfiles to contain the log of all previous builds, or just the current
build?

For now, I've applied your patch as-is, with just ">", which means the
logfile will only contain the output of the last build. It seems better
to me this way, but we'll see if other folks disagree.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
