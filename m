From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Jan 2017 13:54:24 +0100
Subject: [Buildroot] Adding kmscube support
In-Reply-To: <CAOMZO5AYjEb56ErnvnAQ-PA4xtZb_97BsGyqYRF2tWSj+Osi-A@mail.gmail.com>
 (Fabio Estevam's message of "Sat, 21 Jan 2017 09:57:06 -0200")
References: <CAOMZO5BDx6SqN-ZxU+ogJNetjtZhDqWrF0cB5YhqC7pW3NwaSA@mail.gmail.com>
 <CAOMZO5AYjEb56ErnvnAQ-PA4xtZb_97BsGyqYRF2tWSj+Osi-A@mail.gmail.com>
Message-ID: <87o9z0r2tb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

Hi,

 >> $ make
 >>>>> kmscube be60c2f26fbc79038b246dc9a3b8b5fa2fa1fe54 Configuring
 >>>>> kmscube be60c2f26fbc79038b246dc9a3b8b5fa2fa1fe54 Autoreconfiguring
 >> aclocal: error: couldn't open directory 'm4': No such file or directory

 > It seems that manually creating the m4 directory like it is done in
 > other .mk packages do the trick:

 > +# Autoreconf requires an m4 directory to exist
 > +define KMSCUBE_PATCH_M4
 > +       mkdir -p $(@D)/m4
 > +endef
 > +KMSCUBE_POST_PATCH_HOOKS += KMSCUBE_PATCH_M4

Yes, that is also what the upstream autogen.sh script does:

https://github.com/austriancoder/kmscube/blob/master/autogen.sh

-- 
Bye, Peter Korsgaard
