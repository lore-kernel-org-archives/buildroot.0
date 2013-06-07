From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 7 Jun 2013 10:37:03 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/1] pulseaudio : bump to version 4.0
In-Reply-To: <87mwr37z0e.fsf@dell.be.48ers.dk>
Message-ID: <1888418624.109742.1370594223148.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, I will do all that in V2...

waiting a couple of days in case there is another review then I'll repost...

    Cordialement

    J?r?my Rosen

fight key loggers : write some perl using vim

----- Mail original -----
> >>>>> "J?r?my" == J?r?my Rosen <jeremy.rosen@openwide.fr> writes:
> 
>  J?r?my> removes a patch that was integrated upstream
>  J?r?my> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
>  J?r?my> ---
>  J?r?my>  .../pulseaudio-compat-with-json-c-0.11.patch       |   26
>  --------------------
> 
> Then you should also drop the AUTORECONF. From pulseaudio.mk:
> 
> # One patch touches configure.ac. We unconditionnally need libglib2
> # because configure.ac uses AM_GLIB_GNU_GETTEXT. This unconditionnal
> # dependency can be removed once the patch is removed.
> PULSEAUDIO_AUTORECONF = YES
> PULSEAUDIO_DEPENDENCIES += libglib2
> 
>  J?r?my> +++ b/package/multimedia/pulseaudio/pulseaudio.mk
>  J?r?my> @@ -3,7 +3,7 @@
>  J?r?my>  # pulseaudio
>  J?r?my>  #
>  J?r?my>
>   ################################################################################
>  J?r?my> -PULSEAUDIO_VERSION = 3.0
>  J?r?my> +PULSEAUDIO_VERSION = 4.0
>  J?r?my>  PULSEAUDIO_SITE =
>  http://freedesktop.org/software/pulseaudio/releases/
>  J?r?my>  PULSEAUDIO_INSTALL_STAGING = YES
>  J?r?my>  PULSEAUDIO_CONF_OPT = \
> 
> From http://www.freedesktop.org/wiki/Software/PulseAudio/Notes/4.0/ I
> see that the gtk support now needs gtk 3.x, which we don't have in
> buildroot, so the optional libgtk2 support should get removed.
> 
> It would also be good if you could add license info while you're at
> it.
> 
> --
> Bye, Peter Korsgaard
> 
