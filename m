From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jun 2010 09:17:12 +0200
Subject: [Buildroot] [PATCH 1/2] [skeleton] move default skeleton to fs/
 and drop busybox skeleton
In-Reply-To: <4c114469.104ddf0a.710f.1519@mx.google.com>
References: <4c114469.104ddf0a.710f.1519@mx.google.com>
Message-ID: <20100615091712.2f41ce8f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Which skeleton are you moving to fs/skeleton/ ? The
target/generic/target_skeleton or
target/generic/target_busybox_skeleton ?

On Thu, 10 Jun 2010 22:58:30 +0300
Dmytro Milinevskyy <milinevskyy@gmail.com> wrote:

>  rename {target/generic/target_busybox_skeleton/dev => fs/skeleton/bin}/.empty (100%)

I'm not sure what's happening here, but this rename (and many others)
look strange. Is it because all these .empty files are identical and
Git misdetects the renames ?

>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/etc/init.d/S20urandom (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/etc/init.d/S40network (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/etc/init.d/rcS (100%)
>  rename {target/generic/target_skeleton => fs/skeleton}/etc/inittab (100%)

Some files renamed from target_busybox_skeleton, some others from
target_skeleton, strange. Is it also a strange Git behaviour because
the files are identical ?

Otherwise looks good,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
