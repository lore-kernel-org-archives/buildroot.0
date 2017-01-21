From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 21 Jan 2017 09:57:06 -0200
Subject: [Buildroot] Adding kmscube support
In-Reply-To: <CAOMZO5BDx6SqN-ZxU+ogJNetjtZhDqWrF0cB5YhqC7pW3NwaSA@mail.gmail.com>
References: <CAOMZO5BDx6SqN-ZxU+ogJNetjtZhDqWrF0cB5YhqC7pW3NwaSA@mail.gmail.com>
Message-ID: <CAOMZO5AYjEb56ErnvnAQ-PA4xtZb_97BsGyqYRF2tWSj+Osi-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 20, 2017 at 11:21 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi,
>
> I am trying to build kmscube package so that I can test etnaviv from
> mesa 17.0.0-rc1.
>
> Here is the quick patch version for adding kmscube:
> http://pastebin.com/MVz86aE6
>
> After doing a make I get:
>
> $ make
>>>> kmscube be60c2f26fbc79038b246dc9a3b8b5fa2fa1fe54 Configuring
>>>> kmscube be60c2f26fbc79038b246dc9a3b8b5fa2fa1fe54 Autoreconfiguring
> aclocal: error: couldn't open directory 'm4': No such file or directory

It seems that manually creating the m4 directory like it is done in
other .mk packages do the trick:

+# Autoreconf requires an m4 directory to exist
+define KMSCUBE_PATCH_M4
+       mkdir -p $(@D)/m4
+endef
+KMSCUBE_POST_PATCH_HOOKS += KMSCUBE_PATCH_M4
