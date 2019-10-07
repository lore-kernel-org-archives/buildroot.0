From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 17:36:40 +0200
Subject: [Buildroot] glmark2 build failure
In-Reply-To: <CAOMZO5BC0CyEpPyJxeXWYf8ZqY+K10tEQw2W5nJZ2S9viM0e4g@mail.gmail.com>
References: <CAOMZO5BC0CyEpPyJxeXWYf8ZqY+K10tEQw2W5nJZ2S9viM0e4g@mail.gmail.com>
Message-ID: <20191007173640.5ec12ff1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Bernd in Cc.

On Mon, 7 Oct 2019 11:01:12 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> --prefix=/usr --libdir=/usr/lib --prefix=/usr --with-flavors=

--with-flavors is empty

I guess it's a fallout of cf66a67112cd706d2e71665e45e8f6453fd53963. Do
you have udev enabled in your configuration ? If not that's the
culprit. But it also means that
cf66a67112cd706d2e71665e45e8f6453fd53963 was in fact not sufficient,
and some additional dependencies need to be added in the Config.in file
to prevent the package from being selected in configuration where no
glmark2 flavor will be available.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
