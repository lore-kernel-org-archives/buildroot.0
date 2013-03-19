From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Mar 2013 13:11:04 +0100
Subject: [Buildroot] [PATCH v2] libcap: Add optional support for libattr
	capabilities
In-Reply-To: <1363690308-29680-1-git-send-email-markos.chandras@gmail.com>
 (Markos Chandras's message of "Tue, 19 Mar 2013 10:51:48 +0000")
References: <1363690308-29680-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <87a9pzwpwn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:

 Markos> From: Markos Chandras <markos.chandras@imgtec.com>
 Markos> libcap can optionally link to libattr to support extra
 Markos> file capabilities. Link to this library and pull it as
 Markos> dependency if BR2_PACKAGE_ATTR is selected.

 Markos> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
 Markos> ---
 Markos>  package/libcap/libcap.mk |   13 ++++++++++---
 Markos>  1 files changed, 10 insertions(+), 3 deletions(-)

 Markos> diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
 Markos> index dcd3a18..87d5b85 100644
 Markos> --- a/package/libcap/libcap.mk
 Markos> +++ b/package/libcap/libcap.mk
 Markos> @@ -15,18 +15,25 @@ LIBCAP_LICENSE_FILES = License
 Markos>  LIBCAP_DEPENDENCIES = host-libcap
 Markos>  LIBCAP_INSTALL_STAGING = YES
 
 Markos> +ifeq ($(BR2_PACKAGE_ATTR),y)
 Markos> +	LIBCAP_DEPENDENCIES += attr
 Markos> +	HAVE_LIBATTR = yes
 Markos> +else
 Markos> +	HAVE_LIBATTR = no
 Markos> +endif

Buildroot uses a global namespace, so I renamed this to
LIBCAP_HAVE_LIBATTR and committed, thanks.

-- 
Bye, Peter Korsgaard
