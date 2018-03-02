From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Mar 2018 21:30:55 +0100
Subject: [Buildroot] Running several virtual consoles and customizing
 the keymap
In-Reply-To: <20180302175531.GA4270@pema>
References: <20180302175531.GA4270@pema>
Message-ID: <20180302213055.1f294f8d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 2 Mar 2018 18:55:32 +0100, Sh?rab wrote:

> I am new to build root. First of all thanks a lot for having designed
> such a tool, and for having done so in such an elegant way.

Thanks!

> I use a system in pure text-mode, booted by systemd.
> 
> There are two things I don't know how to achieve right now.
> 
> 1. Define a (french) keymap. Is there a way to do that in the .config
> file while not running an X server?

Use "loadkeys fr"

> 2. I am able to run one virtual console but would love to have several of
> them, typically 6 as on my PC. Can tht be achieved?

Add more symlinks from /etc/systemd/system/getty.target.wants/ to
lib/systemd/system/getty at service. See SYSTEMD_INSTALL_SERVICE_TTY in
package/systemd/systemd.mk.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
