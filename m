From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 28 May 2012 17:33:41 -0400
Subject: [Buildroot] [PATCH] New package: xinetd
In-Reply-To: <87mx4s6q7x.fsf@macbook.be.48ers.dk>
References: <1338230502-21663-1-git-send-email-danomimanchego123@gmail.com>
 <87mx4s6q7x.fsf@macbook.be.48ers.dk>
Message-ID: <CANxTyt4G4+ZhS8b6JwORauRQRe4KEMmcQ7XnbjM5t0ikJoimDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

The three patches are taken verbatim from openwrt.  Is it okay to
sign-off as myself?
After getting your answer, I'll adjust my additions and resend.

Danomi -


On Mon, May 28, 2012 at 3:49 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:
>
> Hi,
>
>  Danomi> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>  Danomi> ---
>  Danomi>  package/Config.in                              |    1 +
>  Danomi>  package/xinetd/Config.in                       |    8 +++
>  Danomi>  package/xinetd/xinetd-2.3.15/001-ar.patch      |   66
> ++++++++++++++++++++++++
>  Danomi>  package/xinetd/xinetd-2.3.15/002-destdir.patch |   27 ++++++++++
>  Danomi>  package/xinetd/xinetd-2.3.15/003-rpc_fix.patch |   19 +++++++
>
> Please add a git-style header to each patch specifying the authorship
> and a description of what they do + your signed-off-by.
>
>  Danomi> +++ b/package/xinetd/xinetd.mk
>  Danomi> @@ -0,0 +1,13 @@
>  Danomi> +#############################################################
>  Danomi> +#
>  Danomi> +# xinetd
>  Danomi> +#
>  Danomi> +#############################################################
>  Danomi> +XINETD_VERSION      = 2.3.15
>  Danomi> +XINETD_SOURCE       = xinetd-$(XINETD_VERSION).tar.gz
>
> Minor detail: This is the default value for _SOURCE, so you can skip
> this line.
>
>  Danomi> +XINETD_SITE         = http://www.xinetd.org
>  Danomi> +XINETD_CONF_OPT     =
>  Danomi> +XINETD_DEPENDENCIES =
>
> No need to these two lines either.
>
>  Danomi> +
>  Danomi> +$(eval $(call AUTOTARGETS))
>  Danomi> +
>
> Please no trailing line.
>
> Otherwise it looks good - Care to fix and resend?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120528/00e97b54/attachment.html>
