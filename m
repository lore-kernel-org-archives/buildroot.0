From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 09:19:22 +0100
Subject: [Buildroot] [PATCHv2] core: add defconfig to .gitignore
In-Reply-To: <1451249086-24341-1-git-send-email-yann.morin.1998@free.fr>
References: <1451249086-24341-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151229091922.41fac4b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, 27 Dec 2015 21:44:46 +0100, Yann E. MORIN wrote:
> From: Karoly Kasza <kaszak@gmail.com>
> 
> After using "make safedefconfig", a defconfig file appears which is an
> extract of the .config file. When running git, it incorrectly detects it as a
> source code change.
> 
> Add /defconfig to .gitignore.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> [yann.morin.1998 at free.fr: do not remove on distclean]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I continue to question whether this is the right thing to do.
"defconfig" is really only the default name, and it can be changed to
anything by changing BR2_DEFCONFIG. So should we gitignore the default
name, but not any other name?

I'm for the principle of least surprise, and I would personally find it
odd that we gitignore the default name only. Since we can't gitignore
all defconfigs, I'd prefer to not gitignore any of them.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
