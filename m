From: Will Moore <will.moore@beraninstruments.com>
Date: Mon, 8 Oct 2012 09:43:35 +0100
Subject: [Buildroot] [PATCH] Manual: added FAQ entry about source
	override
In-Reply-To: <1349621111-31678-1-git-send-email-sho@relinux.de>
References: <1349621111-31678-1-git-send-email-sho@relinux.de>
Message-ID: <E89DACB1AC1444AD9CA376BC494277A5@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
> Behalf Of Stephan Hoffmann
> Sent: 07 October 2012 15:45
> 
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> ---
>  docs/manual/faq.txt |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
> 
> diff --git a/docs/manual/faq.txt b/docs/manual/faq.txt
> index 575d019..fdd6a30 100644
> --- a/docs/manual/faq.txt
> +++ b/docs/manual/faq.txt
> @@ -1,6 +1,19 @@
>  Frequently Asked Questions
>  ==========================
> 
> +How can I use sources from my local PC instead of the official tarball?
> +-----------------------------------------------------------------------
> +
> +Just use the "Source Directory Override" mechanism.
> +
> +You have to add a file local.mk to you project with the following
> +definition within:

May I suggest "your project" not "you project" and ".  This file should contain
the following definition:" rather than "with the following definition within:".
That is:

You have to add a file local.mk to your project.  This file should contain the
following definition:

> +
> +<package>_OVERRIDE_SRCDIR = wherever.you.source.lives

Again, may I suggest "wherever.your.source.lives" rather than
"wherever.you.source.lives".

> +
> +Then announce this file to buildroot in the "Build options" menu as
> +"location of a package override file".
> +
>  The boot hangs after 'Starting network...'
>  ------------------------------------------
> 
> --
> 1.7.0.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
