From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jun 2012 08:57:54 +0200
Subject: [Buildroot] New package
In-Reply-To: <CAFYZmWjqLdemKVbdGQ=s2WGNGjtpVF1hvfpmqFeaQShyUokRzA@mail.gmail.com>
References: <CAFYZmWjqLdemKVbdGQ=s2WGNGjtpVF1hvfpmqFeaQShyUokRzA@mail.gmail.com>
Message-ID: <20120618085754.5a6fb1b8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 17 Jun 2012 22:51:59 -0300,
"djames.suhanko" <djames.suhanko@gmail.com> a ?crit :

> BAR_SITE =
> http://sourceforge.net/projects/clpbar/files/clpbar/bar-1.10.9/bar_1.10.9.tar.gz/download

> The compilation is OK, but the automatic download from sourceforge isn't
> working. How can I do the automatic download from sourceforge?

This BAR_SITE will not work. Getting the correct URLs from SourceForge
is a bit funky. Tip: download from Firefox, and in the downloads
window, right click on the file, and ask Firefox for the original
location of the file. It will be:

http://kent.dl.sourceforge.net/project/clpbar/clpbar/bar-1.11.1/bar_1.11.1.tar.gz

So, you should use:

BAR_SITE = http://$(BR2_SOURCEFORGE_MIRROR)/project/clpbar/clpbar/bar-1.11.1/bar_1.11.1.tar.gz

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
