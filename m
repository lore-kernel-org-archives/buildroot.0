From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Jul 2014 22:15:17 +0200
Subject: [Buildroot] [Patch v3 1/1] systemd: rework network/tty units
 installation
In-Reply-To: <20140702174859.GA755@rmm-p1267483>
References: <1403517126-5776-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140629105512.0670fc4e@free-electrons.com>
 <20140702174859.GA755@rmm-p1267483>
Message-ID: <20140702221517.0590f17c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Wed, 2 Jul 2014 19:49:00 +0200, Eric Le Bihan wrote:

> Looking back, converting the fixup of getty service from an post installation
> hook to a service installation was not a good idea, after all.
> 
> $(PKG)_INSTALL_INIT_SYSTEMD is performed before installing the package itself
> in the target directory via $(PKG)_INSTALL_TARGET_CMDS. So the fixup will fail
> trying to delete a file that has not been installed yet... (D'Oh! I should
> have cleaned my build directory...).
> 
> I will send a patch reverting this part.

Hum, right, I don't know if a fixup of a file belongs to
<pkg>_INSTALL_INIT_SYSTEMD. But the fact that <pkg>_INSTALL_INIT_<foo>
gets executed *before* the package is installed to the target looks a
bit weird. Is there a reason for that?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
