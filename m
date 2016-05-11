From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 11 May 2016 23:39:57 +0200
Subject: [Buildroot] dependencies calcualtion
In-Reply-To: <trinity-e1cc7e5a-9d9e-4d12-8e74-34995cf3d68f-1462998745265@3capp-mailcom-bs06>
References: <trinity-e1cc7e5a-9d9e-4d12-8e74-34995cf3d68f-1462998745265@3capp-mailcom-bs06>
Message-ID: <20160511233957.68165813@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello daggs,

On Wed, 11 May 2016 22:32:25 +0200, daggs <daggs@gmx.com> wrote:

> Greetings,
> 
> I got a question, how does a package knows of it's dependencies?
> for example, kodi needs libgles, lets assume that I'm using sunxi-mali which provides gles.
> how does buildroot know to compile sunxi-mali before it compiles kodi?
> 

From package/kodi/kodi.mk:

...
ifeq ($(BR2_PACKAGE_KODI_EGL_GLES),y)
KODI_DEPENDENCIES += libegl libgles
...

From  package/sunxi-mali/sunxi-mali.mk:

...
SUNXI_MALI_PROVIDES = libegl libgles
...

Regards,
Peter

> Thanks.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
