From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 21 Mar 2012 15:25:35 +0100
Subject: [Buildroot] [git commit] libupnp: move to version 1.6.14 Not OK
In-Reply-To: <2c5c9ecebbb72208a14a6f11c44a0fea@zacarias.com.ar>
References: <20120321130510.D12F095418@busybox.osuosl.org>
 <A6EF940D27964F9AA5B3B3B810E12908@JohanW7>
 <2c5c9ecebbb72208a14a6f11c44a0fea@zacarias.com.ar>
Message-ID: <04C0FB7BC89C4511843C68113A0131D5@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

Target is :

Gcc 4.5.3 uClibc 0.9.33 busybox 1.19.4 on ARM EABI (at91sam9260)


I tried to get this one running but got the same error(s), finally i reverted back to the 1.6.6 :

(...if it works don't fix it ...)

#############################################################
#
# libupnp
#
#############################################################
LIBUPNP_VERSION:=1.8.0~svn20100507.orig
LIBUPNP_SOURCE:=libupnp4_$(LIBUPNP_VERSION).tar.gz
LIBUPNP_SITE:=http://ftp.de.debian.org/debian/pool/main/libu/libupnp4
LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
LIBUPNP_INSTALL_STAGING:=YES
LIBUPNP_INSTALL_TARGET:=YES

ifeq ($(BR2_INET_IPV6),y)
	LIBUPNP_CONF_ENV+= CFLAGS="-DIPV6_ENABLED"
endif

$(eval $(call AUTOTARGETS,package,libupnp))



-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Gustavo Zacarias
Verzonden: woensdag 21 maart 2012 15:06
Aan: Sagaert Johan
CC: buildroot at busybox.net; 'Peter Korsgaard'
Onderwerp: Re: [Buildroot] [git commit] libupnp: move to version 1.6.14 Not OK

On 2012-03-21 10:32, Sagaert Johan wrote:

> Hi
>
> I have rebuild my small app with the 1.6.15 and also with 1.6.14 : 
> both fail
> (compile but does not work)
>
> In the past i have tried to use a more recent one and got the same 
> problem.
> I am using httpd from busybox as the http server, and i think its 
> related with that.
> I do not use the internal http server from libupnp since i need httpd 
> to serve static pages and process cgi-bin.

Hi.
Out of curiosity, which toolchain/target architecture are you using?
Regards.

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
