From: Andreas Stahl <a.stahl@wsa-electronic.de>
Date: Thu, 6 Jan 2011 12:11:26 +0100
Subject: [Buildroot] Problem building avahi
References: <B3C53ADB207D471B8656E4BCBBDDD557@WSA.local>
	<20110105171027.1e64ffe6@surf>
Message-ID: <D473AD103FC84CD18D1AF9AB6EAE9D2B@WSA.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

> This path seems to indicate that you might be running Buildroot as
> root. You should not do this.

I build in /usr/buildroot-2010.11 for some historical reason, but not as
root. The buildroot directory belongs to the devel group and i'm a 
member of this group.

> And in fact I think it's precisely because you're building somewhere
> in /usr that things break. In order to workaround libtool oddness, we
> have a mechanism in Buildroot that modifies .la files by replacing:
> 
> /usr
> 
> by
> 
> $(STAGING_DIR)/usr
 
Ok, I now extracted buildroot to /opt/buildroot-2010.11 and everything
works now. Thanks for that hint!

Hmm, the uImage now is in output/images and got not copied to
output/target/boot/ and is not in the rootfs.tar ?

Thanks, Andreas
