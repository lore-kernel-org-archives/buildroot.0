From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 5 Dec 2011 17:01:11 +0200
Subject: [Buildroot] [PATCH v2] Add package connman
In-Reply-To: <87obvnrsnv.fsf@macbook.be.48ers.dk>
References: <20111205130056.GB30001@sapphire.tkos.co.il>
 <1323090955-5661-1-git-send-email-zonque@gmail.com>
 <87obvnrsnv.fsf@macbook.be.48ers.dk>
Message-ID: <20111205150111.GC30001@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Dec 05, 2011 at 03:37:24PM +0100, Peter Korsgaard wrote:
> >>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:
>  Daniel> +	$(if 
>  $(BR2_PACKAGE_CONNMAN_THREADS),--enable-threads,--disable-threads)		\
>  Daniel> +	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
>  Daniel> +	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)	\
>  Daniel> +	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
> 
> You probably also need to add wpa_supplicant to CONNMAN_DEPENDENCIES

AFAIK, wpa_supplicant is a run-time dependency, not a build-time one. So, the 
Config.in 'select' should be enough.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
