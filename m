From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Aug 2017 11:41:12 +0200
Subject: [Buildroot] [PATCH 1/1] Update the ncurses library package names
In-Reply-To: <1502208845-24891-1-git-send-email-arvindprasanna@gmail.com>
References: <1502208845-24891-1-git-send-email-arvindprasanna@gmail.com>
Message-ID: <bd8082a6-0454-4504-528d-8faa606e757a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Arvind,

 [I'm commenting on your v1, because as far as I can see, v2 only makes changes
that are not good, like removing your Sob).

On 08-08-17 18:14, Arvind Prasanna wrote:
> -- Should be libncurses-dev for Debian based distros and ncurses-devel for Redhat based distros.
> -- It saves time for the user to look up the actual package name.

 Don't start commit message lines with --, and wrap at 72 columns.

> 
> Signed-off-by: Arvind Prasanna <arvindprasanna@gmail.com>
> ---
>  support/kconfig/lxdialog/check-lxdialog.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/support/kconfig/lxdialog/check-lxdialog.sh b/support/kconfig/lxdialog/check-lxdialog.sh
> index 3ce0a23..5400aed 100755
> --- a/support/kconfig/lxdialog/check-lxdialog.sh
> +++ b/support/kconfig/lxdialog/check-lxdialog.sh
> @@ -54,7 +54,9 @@ EOF
>  	    echo " *** required header files."                            1>&2
>  	    echo " *** 'make menuconfig' requires the ncurses libraries." 1>&2
>  	    echo " *** "                                                  1>&2
> -	    echo " *** Install ncurses (ncurses-devel) and try again."    1>&2
> +	    echo " *** Install ncurses (libncurses-dev for Debian based"  1>&2
> +	    echo " distros and ncurses-devel for Redhat based distros)"   1>&2
> +	    echo " and try again."    					  1>&2

 This is unfortunately a bit problematic. kconfig doesn't come from Buildroot,
it's copied from the Linux kernel. To be able to track the changes w.r.t. the
kernel itself, we keep the differences in a set of patches, which you can find
in support/kconfig/patches. So if you modify kconfig, you should also add a
patch to that directory.

 However, I wonder if it is really worth it. In fact, I'd much prefer that you
would push this patch to Linux itself, and then (if accepted) resync with the
kernel. Send a mail to linux-kbuild [1] to get it upstream. And anyway, I think
for us this is more relevant to put in docs/manual/prerequisite.txt rather than
in this script.


 Regards,
 Arnout

[1] http://vger.kernel.org/vger-lists.html#linux-kbuild

>  	    echo " *** "                                                  1>&2
>  	    exit 1
>  	fi
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
