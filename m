From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Sep 2012 19:58:40 +0200
Subject: [Buildroot] [PATCH 08/11] package/pulseaudio: fix
 build-dependency on gettext
In-Reply-To: <1347836276-24262-9-git-send-email-yann.morin.1998@free.fr>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
 <1347836276-24262-9-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20120918195840.7d2af5af@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 17 Sep 2012 00:57:53 +0200, Yann E. MORIN wrote:
> In its Config.in, pulseaudio declares a dependency on gettext
> using the documented construct:
>     select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
> 
> but in its .mk file, declares a dependency on the package:
>     PULSEAUDIO_DEPENDENCIES = [...] $(if $(BR2_PACKAGE_GETTEXT),gettext) [...]
> 
> instead of the documented:
>     $(if $(BR2_NEEDS_GETTEXT),gettext)
> 
> Fix that.

Some other packages seem to suffer from the same problem, for example
diffutils. Why are you fixing pulseaudio separately, and not diffutils,
which gets fixed in your 11/11 patch:

-DIFFUTILS_DEPENDENCIES = \
-       $(if $(BR2_PACKAGE_GETTEXT),gettext)
+DIFFUTILS_DEPENDENCIES = $(gettext)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
