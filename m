From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2011 11:43:53 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
 for-2011.11/pkg-device
In-Reply-To: <4EE87CEE.5050304@free-electrons.com>
References: <cover.1315577080.git.maxime.ripard@free-electrons.com>
 <4EE87CEE.5050304@free-electrons.com>
Message-ID: <20111214114353.5a5e047a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Dec 2011 11:39:42 +0100,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

> Any review on that ?

I don't like the <pkg>_FILES name, because it makes me think that *all*
files installed by the package must be listed in this variable, while
in fact, only files for which special permissions must be applied, or
for device files.

What about having two variables:

 <pkg>_PERMISSIONS

and

 <pkg>_DEVICES

The idea is that by separating permission-modifications (like the one
for Busybox) for device files, it is much easier to use *_PERMISSIONS +
*_DEVICES when static /dev is used, and only *_PERMISSIONS when
dynamic /dev is used.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
