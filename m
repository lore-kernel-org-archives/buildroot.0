From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Jun 2013 00:10:18 +0200
Subject: [Buildroot] [PATCH v2] directfb: Make imlib2 support optional
In-Reply-To: <1369128580-15685-1-git-send-email-markos.chandras@gmail.com>
 (Markos Chandras's message of "Tue, 21 May 2013 10:29:40 +0100")
References: <1369128580-15685-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <8738swb451.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:

Regarding subject - That's not really what the patch does, it adds
optional imlib2 support.

 Markos> From: Markos Chandras <markos.chandras@imgtec.com>
 Markos> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
 Markos> ---
 Markos> Changes since v1:
 Markos> - Make imlib2 support optional
 Markos> ---
 Markos>  package/directfb/Config.in   | 5 +++++
 Markos>  package/directfb/directfb.mk | 8 ++++++++
 Markos>  2 files changed, 13 insertions(+)

 Markos> diff --git a/package/directfb/Config.in b/package/directfb/Config.in
 Markos> index b9ff5f9..a6bfb6b 100644
 Markos> --- a/package/directfb/Config.in
 Markos> +++ b/package/directfb/Config.in
 Markos> @@ -100,6 +100,11 @@ config BR2_PACKAGE_DIRECTFB_GIF
 Markos>  	bool "enable GIF support"
 Markos>  	default y
 
 Markos> +config BR2_PACKAGE_DIRECTFB_IMLIB2
 Markos> +	bool "enable IMLIB2 support"
 Markos> +	default y
 Markos> +	select BR2_PACKAGE_IMLIB2

Directfb didn't use to pull in imlib2, and it apparently wasn't
critical, so I've dropped the 'default y'.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
