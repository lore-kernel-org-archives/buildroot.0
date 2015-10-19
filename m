From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 19 Oct 2015 12:22:30 +0200
Subject: [Buildroot] [PATCH] package/skeleton: add a startup script to
	wait for slow network interfaces
In-Reply-To: <87a8rf88qb.fsf@dell.be.48ers.dk>
References: <1443879105-3036-1-git-send-email-yann.morin.1998@free.fr>
 <4678408.ifdbXGka0U@sagittea> <87a8rf88qb.fsf@dell.be.48ers.dk>
Message-ID: <2221288.gAOZtpqjeu@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 19 October 2015 12:15:40 Peter Korsgaard wrote:
> >>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:
> Hi,
> 
> > I am a bit late to do the review, but why not add a script in
> > 
>  > /etc/network/if-pre-up.d ? For example (notice $IFACE and
>  > $IF_MAXWAIT
>  > are set by ifupdown):
>  > 
>  > #! /bin/sh
>  > if [ "${IF_MAXWAIT}" ]; then
>  > 
>  >     printf "Waiting for interface %s to appear" "${IFACE}"
>  >     while [ ${IF_MAXWAIT} -gt 0 ]; do
>  >     
>  >         if [ -e "/sys/class/net/${IFACE}" ]; then
>  >         
>  >             printf " yes\n"
>  >             exit 0
>  >         
>  >         fi
>  >         sleep 1
>  >         printf "."
>  >         
>  >         : $((wait--))
>  >     
>  >     done
>  >     printf " no.\n"
>  >     exit 1
>  > 
>  > fi
> 
> That's certainly also an option. Care to send a patch reworking the
> logic in S40network to a pre-up.d hook?
Ok, I will.



-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
