From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 16 Mar 2012 17:08:51 +0100
Subject: [Buildroot] curl sagmentatation fault - > is openssl theculprit
	?
In-Reply-To: <201203161653.39678.arnout@mind.be>
References: <F4A167A0B310422C906F05845738AE17@JohanW7>
 <201203161653.39678.arnout@mind.be>
Message-ID: <CE5E726BAFB84B30B0525A23A17DB718@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi Arnout ;

I looked into the openssl.mk.

I don't know where armv4 stands for i am using arm9 on my target..

Snip....

# Some architectures are optimized in OpenSSL
ifeq ($(ARCH),arm)
ifneq ($(BR2_generic_arm),y)
ifneq ($(BR2_arm610),y)
ifneq ($(BR2_arm710),y)
OPENSSL_TARGET_ARCH = armv4
endif
endif
endif
endif

Snip...

This needs some more research...
Gone give it a try commenting it out.

Goede bezighouding voor in het weekend.....


Regards Johan


-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Arnout Vandecappelle
Verzonden: vrijdag 16 maart 2012 16:54
Aan: Sagaert Johan
CC: 'Thomas Petazzoni'; buildroot at busybox.net
Onderwerp: Re: [Buildroot] curl sagmentatation fault - > is openssl theculprit ?

On Friday 16 March 2012 15:52:53 Sagaert Johan wrote:
> Hi
> 
> Things are not always what they seem:
> 
> It seems to me that when the configure script of curl runs it checks 
> for openssh, if none is found Then it is build without openssl.

 Hm, could be.  Maybe try if other programs work with openssl, e.g. 
lighttpd (make sure you configure it to use openssl).

 But of course, that doesn't tell you what the real problem is...  You'll still need to get a strack trace.

[snip]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
