From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 16 Jan 2013 14:51:57 +0200
Subject: [Buildroot] RTLD_DEEPBIND and uClibc
Message-ID: <50F6A26D.4030607@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone

Yesterday evening I managed to compile cairo-dock-core and
cairo-dock-plugins
version 3.1.2 for buildroot 2012.08.

It's a nice, lightweight (made with C), Mac OSX feeling application dock.

The problem is that cairo-dock-core has the following line in it's code:

pCairoDockModule->handle = dlopen (pCairoDockModule->cSoFilePath,
RTLD_LAZY | RTLD_LOCAL | RTLD_DEEPBIND);

And uClibc does not have RTLD_DEEPBIND. Removing it will allow
cairo-dock to compile but the result is
that cairo-dock plugins won't work.

Is there any workaround to this RTLD_DEEPBIND stuff ?

Regards
Stefan
