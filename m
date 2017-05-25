From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 25 May 2017 18:32:33 +0200
Subject: [Buildroot] [PATCH 2/2] package/sngrep: fix static build with
 gnutls
In-Reply-To: <d6jivdxlhq.ln2@ID-313208.user.individual.net>
References: <20170520162751.30809-1-romain.naour@gmail.com>
 <20170520162751.30809-2-romain.naour@gmail.com>
 <20170523162742.23372fb2@free-electrons.com>
 <9efd1b94-8830-15b9-8d17-608ce8eace50@gmail.com>
 <20170524084733.37fd3ca1@free-electrons.com>
 <d46413c8-2cf8-08cd-ce1e-f821896fa3bb@gmail.com>
 <d6jivdxlhq.ln2@ID-313208.user.individual.net>
Message-ID: <16d33727-59f0-afd0-0b14-34704e794ae2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 25/05/2017 ? 11:02, Bernd Kuhls a ?crit :
> Am Wed, 24 May 2017 23:54:03 +0200 schrieb Romain Naour:
> 
>>> Yes, I believe we should add !BR2_STATIC_LIBS, of course propagated to
>>> all reverse dependencies (but there are not too many of them).
>>
>> Ok, I'll do it.
> 
> Hi,
> 
> patch done: http://patchwork.ozlabs.org/patch/766903/

Thanks for the help!
It was too late to finish my own patch yesterday...

Your patch is almost good but some option comments are missing.

Also, I suggest to add --disable-static in GNUTLS_CONF_OPTS unconditionally to
avoid linking with libgnutls.a even if libgnutls.so is present
(BR2_SHARED_STATIC_LIBS case).

I'll resend an updated version, I'm keeping you as original author.

Best regards,
Romain

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
