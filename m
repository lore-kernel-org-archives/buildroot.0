From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 17:14:23 +0200
Subject: [Buildroot] [PATCH] acl, attr: fix libdir variable in .la files
In-Reply-To: <87siawabh0.fsf@dell.be.48ers.dk>
References: <1431780866-26839-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87siawabh0.fsf@dell.be.48ers.dk>
Message-ID: <20150516171423.3dee0578@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 16 May 2015 15:38:51 +0200, Peter Korsgaard wrote:

> Committed, thanks. I still find it odd that it only happens with that
> specific combination through.

Yes, this is the part I couldn't figure out, I admit.

If you just have acl+attr+libarchive, it doesn't fail.

If you have acl+attr+zlib+libarchive, it doesn't fail.

You really need to acl+attr+zlib+libxml2 for things to fail. libxml2 as
AUTORECONF = YES, so it brings host-libtool, host-automake,
host-autoconf into the mix. But I'm not sure it's really related.

To be honest, I'm hoping for upstream acl and attr to make releases
that convert their build system to automake, and clean up all this crap.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
