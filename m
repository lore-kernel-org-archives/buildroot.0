From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Apr 2013 16:23:16 +0200
Subject: [Buildroot] [PATCH 0/4] Wayland/weston packages
In-Reply-To: <5177D3C8.8020309@mind.be>
References: <1366646873-26196-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <5175ACB8.4060405@mind.be> <20130424042732.2cbfdc43@skate>
 <5177D3C8.8020309@mind.be>
Message-ID: <20130424162316.223da5b4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 24 Apr 2013 14:44:56 +0200, Arnout Vandecappelle wrote:

> > Does it matter, or should I also move the xkeyboard-config directory
> > outside of package/x11r7/ ?
> 
>   If it no longer depends on xorg7, I would vote to move it out.

It still depends on host-xapp_xkbcomp, but since it's a host package,
it can be used even if BR2_PACKAGE_XORG7 is not enabled, which is why I
could move the xkeyboard-config/Config.in inclusion outside of the
BR2_PACKAGE_XORG7. The other dependencies are runtime dependencies that
are only needed in a X.org context.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
