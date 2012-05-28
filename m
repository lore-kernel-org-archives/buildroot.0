From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 May 2012 21:49:22 +0200
Subject: [Buildroot] [PATCH] New package: xinetd
In-Reply-To: <1338230502-21663-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Mon, 28 May 2012 14:41:42 -0400")
References: <1338230502-21663-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87mx4s6q7x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

Hi,

 Danomi> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
 Danomi> ---
 Danomi>  package/Config.in                              |    1 +
 Danomi>  package/xinetd/Config.in                       |    8 +++
 Danomi>  package/xinetd/xinetd-2.3.15/001-ar.patch      |   66 ++++++++++++++++++++++++
 Danomi>  package/xinetd/xinetd-2.3.15/002-destdir.patch |   27 ++++++++++
 Danomi>  package/xinetd/xinetd-2.3.15/003-rpc_fix.patch |   19 +++++++

Please add a git-style header to each patch specifying the authorship
and a description of what they do + your signed-off-by.

 Danomi> +++ b/package/xinetd/xinetd.mk
 Danomi> @@ -0,0 +1,13 @@
 Danomi> +#############################################################
 Danomi> +#
 Danomi> +# xinetd
 Danomi> +#
 Danomi> +#############################################################
 Danomi> +XINETD_VERSION      = 2.3.15
 Danomi> +XINETD_SOURCE       = xinetd-$(XINETD_VERSION).tar.gz

Minor detail: This is the default value for _SOURCE, so you can skip
this line.

 Danomi> +XINETD_SITE         = http://www.xinetd.org
 Danomi> +XINETD_CONF_OPT     =
 Danomi> +XINETD_DEPENDENCIES =

No need to these two lines either.

 Danomi> +
 Danomi> +$(eval $(call AUTOTARGETS))
 Danomi> +

Please no trailing line.

Otherwise it looks good - Care to fix and resend?

-- 
Bye, Peter Korsgaard
