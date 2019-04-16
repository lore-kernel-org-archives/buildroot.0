From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Apr 2019 13:44:38 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-04-15
In-Reply-To: <e6975dfa-1a60-c394-de64-2e11243181d2@micronovasrl.com>
References: <20190416060047.6838786EF6@hemlock.osuosl.org>
 <e6975dfa-1a60-c394-de64-2e11243181d2@micronovasrl.com>
Message-ID: <20190416134438.246c63cf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Apr 2019 12:24:41 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> >    vdr-plugin-vnsiserver-v1.8.0 | 1  
> 
> This ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ is fixed by:
> https://patchwork.ozlabs.org/patch/1085284/

Yes, but I think https://patchwork.ozlabs.org/patch/1074926/ is a
better fix. This still makes your patch relevant in general, to bump
gettext-tiny and take advantage of the fixes.

In fact in theory, gettext-tiny msg* tools should not even be needed:
gettext-tiny is only used when BR2_SYSTEM_ENABLE_NLS is disabled, and
therefore when we don't want translation files at all. Of course, there
are probably some packages that will still try to call msg* tools when
they don't have an option to disable NLS support. But when they do, we
should preferably use that.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
