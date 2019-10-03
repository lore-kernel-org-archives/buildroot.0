From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 3 Oct 2019 19:25:53 -0300
Subject: [Buildroot] [PATCH 1/1] board/raspberrypi/post-build.sh: avoid
 HDMI login when getty disabled
In-Reply-To: <f21377ab-1bdb-42a8-fc51-66a5b195913d@logilin.fr>
References: <20191001125028.5094-1-mailist@logilin.fr>
 <CAJ4jsafDZuYipJF1s9OdiMV=NeUMV6-SyDOqfKdC2ObBj_gqow@mail.gmail.com>
 <f21377ab-1bdb-42a8-fc51-66a5b195913d@logilin.fr>
Message-ID: <CAJ4jsacH9XEsbZcu6PZzZNCwnaCVZfnWhJq6G=m_hSpOtUE94Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 3, 2019 at 4:54 PM Christophe Blaess <mailist@logilin.fr> wrote:
>
> Hello Carlos,
>
> > I guess you are using raspberrypi_defconfig as a template for a custom
> > board configuration. Can't you simply leave
> > BR2_ROOTFS_POST_BUILD_SCRIPT empty?
>
> No, I was using raspberry_defconfig on Raspberry Pi 4 as training
> support to show how to use this option on production systems when we
> don't want any getty (only custom code running on background).
>
> I removed serial console by disabling the "Run a getty option.." but the
> HDMI login was still there.
>
> It's ok to remove the BR2_ROOTFS_POST_BUILD_SCRIPT, but I would rather
> have only disabled the getty option. It seemed more elegant to me.

I think it's more elegant to solve the problem by means of the
configuration, not by customizing buildroot. The board configurations
an their  post-build and post-mage scripts are mostly examples.

If you need something more sophisticated then it's better to keep them
in a BR2_EXTERNAL, as documented in

    http://www.buildroot.org/downloads/manual/manual.html#customize

-- 
Carlos Santos <unixmania@gmail.com>
