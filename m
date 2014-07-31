From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 31 Jul 2014 19:55:21 +0200
Subject: [Buildroot] [PATCH v2] Add option to copy config file to rootfs
In-Reply-To: <20140731171632.GC3960@free.fr>
References: <1406820398-2105-1-git-send-email-nroach44@gmail.com>
 <20140731171632.GC3960@free.fr>
Message-ID: <14321197-e8a0-43d3-9bcf-2f3d53e60753@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>Nathaniel, All,
>
>On 2014-07-31 23:26 +0800, Nathaniel Roach spake thusly:
>> BR2_CONFIG_COPY copies the config file to /etc/buildroot.config
>> as 0600 during target-finalize after overlay copy, but before
>> post-build script install.
>
>I wonder what would be the use-case for this?

What is the use case in crosstool-NG to save the
 configuration and log alongside the toolchain? Or
 what about the /proc/config.gz feature of the Linux
 kernel?
It allows people that receive the generated images to
 easily inspect and reproduce the configuration.

One doesn't even need to think about legal counter-
arguments here: even within the same company it
 can be useful to be able to inspect the configuration
 of a running system...

>
>I think the case where one would want this file in the generated
>filesystem is a corner case, and that it would be better served with
>a post-build script.

I think this is a feature that deserves to be in Buildroot 
directly.  Just like rootfs-overlay used to be
 something that people had to do manually from their
post build script, but later became a supported
 feature because many people found it useful, or the
 feature to set the root password, this is something that is generally useful by many users, even those
that don't fully know how to use the post build script
 to it's full ability, or did not yet realize the usefulness
of the saving of the configuration.

Best regards,
Thomas
