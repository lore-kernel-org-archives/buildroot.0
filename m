From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 14:15:57 +0200
Subject: [Buildroot] [PATCH 1/1] libglib2: Avoid absolute path to python
 in shebang
In-Reply-To: <20180719115033.vchfjfwmewah2wjd@bifrost>
References: <1531413454-11546-1-git-send-email-david.owens@rockwellcollins.com>
 <20180718171843.5ed5f10c@windsurf>
 <20180719075842.k3gxopajcat7f4dt@bifrost>
 <20180719100456.2146ce8b@windsurf>
 <20180719115033.vchfjfwmewah2wjd@bifrost>
Message-ID: <20180719141557.6f52723a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jul 2018 13:50:33 +0200, anisse at astier.eu wrote:

> I opened an issue upstream:
> https://gitlab.gnome.org/GNOME/glib/issues/1455

In this, they say that using "python" is not correct, because python3
is needed to run libglib python code. Is this correct ? If that is
correct, then our patch in package/libglib2/ is not good, as it uses
just python, which might be python2.

And also, it's not correct because our libglib package does not depend
on having python3 available on the host.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
