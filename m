From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Jan 2011 12:08:40 -0300
Subject: [Buildroot] [git commit master 1/1] openssl: add ocf support
In-Reply-To: <87tygyrror.fsf@macbook.be.48ers.dk>
References: <20110117214924.564878A3BF@busybox.osuosl.org>	<20110124173553.61328a62@surf>
	<87tygyrror.fsf@macbook.be.48ers.dk>
Message-ID: <4D418A78.5080806@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/24/11 17:07, Peter Korsgaard wrote:

>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> Hi,
> 
>  >> +define OPENSSL_INSTALL_CRYPTODEV_H
>  >> +$(INSTALL) -D package/openssl/ocf-cryptodev-20101223.h \
>  >> +	$(STAGING_DIR)/usr/include/crypto/cryptodev.h
>  >> +endef
>  >> +
>  >> +OPENSSL_POST_EXTRACT_HOOKS += OPENSSL_INSTALL_CRYPTODEV_H
>  >> +endif
> 
>  Thomas> This is not a problem today, but it will break horribly when we'll try
>  Thomas> to merge the packaging work from Lionel, because here we are installing
>  Thomas> a file to the $(STAGING_DIR) outside of a package staging installation
>  Thomas> step.
> 
> Ok, so we would either need to move this to a seperate package or play
> around with -I options to get openssl to find it somewhere else during
> compilation.

Better split it out, patches sent.
In the future we might want to build the kernel part as modules or
something instead of needing a patched kernel.
Regards.
