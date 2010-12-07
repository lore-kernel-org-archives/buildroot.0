From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 7 Dec 2010 16:32:43 -0500
Subject: [Buildroot] [PATCH v4] inetutils: new package for random
	network tools
In-Reply-To: <20101123203818.3efd3e9a@surf>
References: <1290145160-21033-1-git-send-email-vapier@gentoo.org>
	<1290225547-9728-1-git-send-email-vapier@gentoo.org>
	<20101123203818.3efd3e9a@surf>
Message-ID: <201012071632.43904.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, November 23, 2010 14:38:18 Thomas Petazzoni wrote:
> On Fri, 19 Nov 2010 22:59:07 -0500 Mike Frysinger wrote:
> > +	$(call USE_ENABLE,INET_IPV6,ipv6) \
> 
> The following bit in package/Makefile.in already passes --disable-ipv6
> when IPv6 is not available:
> 
> ifneq ($(BR2_INET_IPV6),y)
> DISABLE_IPV6= --disable-ipv6
> endif
> 
> However, it does not pass --enable-ipv6 when IPv6 is enabled.
> 
> I'm not sure what to do:
> 
>  *) Pass --{disable,enable}-ipv6 to every package

i'd go with this as packages can go either way (default to off or on)
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101207/a0482936/attachment.pgp>
