From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Sep 2013 11:17:32 +0200
Subject: [Buildroot] A Bug: xserver_xorg 1.12.4
In-Reply-To: <20130909080432.GA2684@zuhnb712.ap.bm.net>
References: <20130909080432.GA2684@zuhnb712.ap.bm.net>
Message-ID: <20130911111732.3300eaa7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Mon, 9 Sep 2013 16:04:33 +0800, Woody Wu wrote:
> In 2013.08, build is using 1.12.4 version of xserver_xorg package.
> However, I found there is bug in this version, which cause the options
> parsing of kdrive modules is not correct.
> 
> I attached a patch file in the message (not sure what's the correct way
> to commit buildroot package patches).

Unfortunately, no, it's not the correct. You should submit a patch
against Buildroot, which adds a patch in
package/x11r7/xserver_xorg-server/ that fixes the bug you're seeing.

See http://buildroot.org/downloads/manual/manual.html#patch-policy.

Also, it'd be good to see if this patch has been fixed upstream
already. If it's already fixed upstream, either backport the upstream
patch, or bump the X.org server version used in Buildroot. If not, then
try to submit your patch upstream so that it gets integrated in future
releases of X.org.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
