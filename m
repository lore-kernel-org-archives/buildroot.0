From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Oct 2011 21:33:43 +0200
Subject: [Buildroot] [PATCH 4/6] libusb-compat: add host variant
In-Reply-To: <4E88C9B1.1040506@lucaceresoli.net>
References: <cover.1317481137.git.thomas.petazzoni@free-electrons.com>
 <01596349e2ee119699af5a011d79ad1d2bb7eb55.1317481137.git.thomas.petazzoni@free-electrons.com>
 <4E88C9B1.1040506@lucaceresoli.net>
Message-ID: <201110032133.44496.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sunday 02 October 2011 22:29:37, Luca Ceresoli wrote:
> I see many of the packages that have both target and host variant have
> their host dependencies equal to their target package dependencies, plus a
> "host-" prefix added to packages that don't have one on their own.
> 
> For example:
>  > LIBUSB_COMPAT_DEPENDENCIES = host-pkg-config libusb
>  > HOST_LIBUSB_COMPAT_DEPENDENCIES = host-pkg-config host-libusb
> 
> host-pkg-config does not change, libusb becomes host-libusb.
> 
> This is indeed pretty natural.
> 
> Would it be a good idea to define by default HOST_FOO_DEPENDENCIES
> equal to FOO_DEPENDENCIES with suitable subst magic to add "host-" where
> it is not present?

 I had a similar feeling of redundancy with these HOST_FOO_DEPENDENCIES, but 
didn't see how to solve it.

 This is BTW fully orthogonal to the Host Tools menu, so you can start working 
on a patch Luca :-)


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111003/af5e9e08/attachment-0001.html>
