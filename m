From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 14:43:09 +0100
Subject: [Buildroot] [PATCH V2 2/2] tcl: rename
 BR2_PACKAGE_TCL_SHLIB_ONLY to be more consistent
In-Reply-To: <1425734562-5312-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1425734562-5312-1-git-send-email-Vincent.Riera@imgtec.com>
 <1425734562-5312-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150307144309.4c40305e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Sat, 7 Mar 2015 13:22:42 +0000, Vicente Olivert Riera wrote:

> +config BR2_PACKAGE_TCL_SHLIB_ONLY
> +	string "tcl: the 'install only shared library' option has been renamed"
> +	help
> +	  The option BR2_PACKAGE_TCL_SHLIB_ONLY has been renamed to
> +	  BR2_PACKAGE_TCL_REMOVE_TCLSH to be consistent with what it
> +	  does.
> +
> +config BR2_PACKAGE_TCL_SHLIB_ONLY_WRAP
> +	bool
> +	default y if BR2_PACKAGE_TCL_SHLIB_ONLY != ""
> +	select BR2_LEGACY

The 'wrap' thing is only when removing string options, not boolean
options.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
