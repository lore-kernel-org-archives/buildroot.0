From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 1 Sep 2015 13:51:40 +0100
Subject: [Buildroot] [PATCH 1/1] Move tar package location to
	'system-tools'
In-Reply-To: <12995385.iRNRCdloQv@deathstar>
References: <12995385.iRNRCdloQv@deathstar>
Message-ID: <55E59F5C.5020806@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francesco Nwokeka,

could you please send the patch in-line using "git send-email" instead
of attaching the patch to the email?

Also, one comment regarding your patch:

> @@ -1509,6 +1506,9 @@ endif
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/sysvinit/Config.in"
>  endif
> +if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	source "package/tar/Config.in"
> +endif
>  	source "package/util-linux/Config.in"
>  endmenu

Since there are two packages in a row which are inside an "if
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS", it would be better if you put them
together into the same if clause. Something like this:

> @@ -1509,6 +1506,9 @@ endif
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/sysvinit/Config.in"
> +	source "package/tar/Config.in"
>  endif
>  	source "package/util-linux/Config.in"
> endmenu

Please label your next patch as v2 ([PATCHv2]) when you send it :-)

Regards,

Vincent.

On 09/01/2015 01:44 PM, Francesco Nwokeka wrote:
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
