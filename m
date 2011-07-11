From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 21:38:05 +0200
Subject: [Buildroot] [PATCH 07/12] u-boot: allow specification of custom
	Git repo as source
In-Reply-To: <6c2e3e2e44b61f427fa861ce4c7d5d76eb48682a.1310392269.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 Jul 2011 15:53:51 +0200")
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <6c2e3e2e44b61f427fa861ce4c7d5d76eb48682a.1310392269.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ipr8liaq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  boot/uboot/Config.in |   14 ++++++++++++++
 Thomas>  boot/uboot/uboot.mk  |    3 +++
 Thomas>  2 files changed, 17 insertions(+), 0 deletions(-)

 Thomas> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
 Thomas> index aada346..b8eb42d 100644
 Thomas> --- a/boot/uboot/Config.in
 Thomas> +++ b/boot/uboot/Config.in
 Thomas> @@ -34,6 +34,9 @@ config BR2_TARGET_UBOOT_2010_03
 Thomas>  config BR2_TARGET_UBOOT_CUSTOM_TARBALL
 Thomas>  	bool "Custom tarball"
 
 Thomas> +config BR2_TARGET_UBOOT_CUSTOM_GIT
 Thomas> +        bool "Custom Git repository"

Should be <tab> rather than spaces.

 Thomas> +if BR2_TARGET_UBOOT_CUSTOM_GIT
 Thomas> +
 Thomas> +config BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL
 Thomas> +        string "URL of custom Git repository"

Here as well.

 Thomas> +
 Thomas> +config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION
 Thomas> +        string "Custom Git version"

And here.

Otherwise it looks good. The only possible improvement would be to make
it simply a custum URL, and let the Makefile.package.in support sort out
if it's a tarball, a svn repo or git or whatever.

-- 
Bye, Peter Korsgaard
