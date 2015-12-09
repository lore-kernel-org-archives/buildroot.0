From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Dec 2015 14:19:35 +0000
Subject: [Buildroot] [PATCH v2 2/3] python-pexpect: new package
In-Reply-To: <1449670313-3613-3-git-send-email-viktorin@rehivetech.com>
References: <1446203156-26848-1-git-send-email-viktorin@rehivetech.com>
 <1449670313-3613-1-git-send-email-viktorin@rehivetech.com>
 <1449670313-3613-3-git-send-email-viktorin@rehivetech.com>
Message-ID: <56683877.40501@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Viktorin,

On 09/12/15 14:11, Jan Viktorin wrote:
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  package/Config.in                        |  1 +
>  package/python-pexpect/Config.in         | 10 ++++++++++
>  package/python-pexpect/python-pexpect.mk | 14 ++++++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 package/python-pexpect/Config.in
>  create mode 100644 package/python-pexpect/python-pexpect.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 69bc347..77a92d2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -638,6 +638,7 @@ menu "External python modules"
>  	source "package/python-networkmanager/Config.in"
>  	source "package/python-nfc/Config.in"
>  	source "package/python-numpy/Config.in"
> +	source "package/python-pexpect/Config.in"

This should be alphabetically ordered.

>  	source "package/python-pam/Config.in"
>  	source "package/python-posix-ipc/Config.in"
>  	source "package/python-protobuf/Config.in"
> diff --git a/package/python-pexpect/Config.in b/package/python-pexpect/Config.in
> new file mode 100644
> index 0000000..a42aec7
> --- /dev/null
> +++ b/package/python-pexpect/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYTHON_PEXPECT
> +	bool "python-pexpect"
> +	depends on BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_PYTHON_PTYPROCESS
> +	help
> +	  Pexpect is a pure Python module for spawning child applications; controlling them; and responding to
> +	  expected patterns in their output. Pexpect works like Don Libes? Expect. Pexpect allows your script
> +	  to spawn a child application and control it as if a human were typing commands.

Wrap that line to 72 characters length, taking into account that we
consider a tab as 8 characters wide.

Regards,

Vincent.
