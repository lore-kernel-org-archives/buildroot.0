From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 21:35:13 +0200
Subject: [Buildroot] [PATCH 06/12] linux: allow specification of a
	custom Git repository as a source
In-Reply-To: <34af0b74e6f973c57a15d469210e044f2aee5c77.1310392269.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 Jul 2011 15:53:50 +0200")
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <34af0b74e6f973c57a15d469210e044f2aee5c77.1310392269.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87mxgklifi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  linux/Config.in |   15 +++++++++++++++
 Thomas>  linux/linux.mk  |    3 +++
 Thomas>  2 files changed, 18 insertions(+), 0 deletions(-)

 Thomas> diff --git a/linux/Config.in b/linux/Config.in
 Thomas> index bf16ddf..4a17cba 100644
 Thomas> --- a/linux/Config.in
 Thomas> +++ b/linux/Config.in
 Thomas> @@ -47,6 +47,12 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL
 Thomas>  	  This option allows to specify the http or ftp location of a
 Thomas>  	  specific kernel source tarball
 
 Thomas> +config BR2_LINUX_KERNEL_CUSTOM_GIT
 Thomas> +        bool "Custom Git tree"

Wrong indentation.
 
 Thomas> +config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
 Thomas> +        string "URL of custom Git repository"

Here as well.

 Thomas> +config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 Thomas> +        string "Custom Git version"

And here.

Otherwise it looks good.

-- 
Bye, Peter Korsgaard
