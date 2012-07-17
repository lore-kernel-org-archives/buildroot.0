From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 17 Jul 2012 05:38:50 -0400
Subject: [Buildroot] [PATCH] Added package v86d which provides a
 real-mode helper for uvesafb driver.
In-Reply-To: <20120717100151.3948f42e@skate>
References: <1342495023-17145-1-git-send-email-golubovsky@gmail.com>
 <20120717100151.3948f42e@skate>
Message-ID: <CADiAo4J_8Q6+5i=X+qAVb5ry828uo_nFeT9BC=rU9mk_-xCnqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Jul 17, 2012 at 4:01 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Mon, 16 Jul 2012 23:17:03 -0400,
> Dmitry <golubovsky@gmail.com> a ?crit :
>
>> +define V86D_BUILD_CMDS
>> +     $(MAKE) CC="$(TARGET_CC) -D__i386__" LD="$(TARGET_LD)" -C $(@D) all
>> +endef
>
> Can you try using $(TARGET_CONFIGURE_OPTS) instead, so that CFLAGS and
> al. are also passed?

This patch some was discussed some time ago:

http://lists.busybox.net/pipermail/buildroot/2012-May/053825.html
http://lists.busybox.net/pipermail/buildroot/2012-May/053790.html
etc.

and other discussion in May. My initial patch missed installation
instructions, but that was fixed.

and I thouhgt we reached agreement.

>
> Something like:
>
>         $(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D__i386__" -C $(@D) all
>
> I'm a bit surprised by the -D__i386__, because this is normally defined
> by the compiler. Why is it needed?

Because of manually-written Makefile which somehow does not let these
flags through. I tried many ways.

I submitted this patch in May after many iterations, and I believe it
was just lost in space because of preparations for the May release.

http://lists.busybox.net/pipermail/buildroot/2012-May/053824.html

I am just resubmitting it again.

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
