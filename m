From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Apr 2017 10:25:50 +0200
Subject: [Buildroot] [PATCH/autobuild 4/8] autobuild-run: remove
 redundant 'make oldconfig'
In-Reply-To: <20170409205128.11560-4-arnout@mind.be>
References: <20170409205128.11560-1-arnout@mind.be>
 <20170409205128.11560-4-arnout@mind.be>
Message-ID: <20170410102550.224313e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 9 Apr 2017 22:51:24 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> After running 'make randpackageconfig', and additional 'make oldconfig'
> is done. However, this is redundant, since randpackageconfig already
> does an olddefconfig.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Well, this oldconfig is not exactly right after randpackageconfig.

We do this:

 - randpackageconfig
 - fixup_config()
 - oldconfig

The fixup_config() function potentially does some changes to
the .config file, and that's why we re-run oldconfig afterwards. This
ensures that the build will not wait indefinitely while asking the user
the value of a config option.

Therefore, I wouldn't qualify this oldconfig as "redundant".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
