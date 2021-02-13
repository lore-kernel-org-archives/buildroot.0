From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Feb 2021 00:08:57 +0100
Subject: [Buildroot] PATCH package/gettext-tiny install file
 host-cpu-c-abi.m4, needed by gettextsize
In-Reply-To: <CABJxTWFQKOGik+G-nOExfdVm_9+Y0GCcn1Amca0WHOhZrqArBg@mail.gmail.com>
References: <CABJxTWFQKOGik+G-nOExfdVm_9+Y0GCcn1Amca0WHOhZrqArBg@mail.gmail.com>
Message-ID: <20210214000857.627712fd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kiril,

On Wed, 10 Feb 2021 19:18:26 +0100
Kiril Maler <kiril.maler@gmail.com> wrote:

> gettext-gnu tool 'gettextsize' included in gettext-tiny, searches
> for file host-cpu-c-abi.m4, as shown in gettext-gnu ChangeLog
> 
> But gettext-tiny will install only files found in its m4 dir
> A workaround: add a link to gettext-gnu file, so it is installed

Here as well, thanks for this patch. Could you send it with your
Signed-off-by-line in the commit log, and with git send-email so that
it doesn't get line wrapped by your e-mail client ?

> + # In gettext-gnu ChangeLog:
> + # 2018-11-11  Bruno Haible  <bruno@clisp.org>
> + # gettextize: Install also host-cpu-c-abi.m4 (needed since 2018-03-24)
> + [ -e $(@D)/m4/host-cpu-c-abi.m4 ] || ln -fs
> ../gettext-gnu/gettext-tools/gnulib-m4/host-cpu-c-abi.m4 $(@D)/m4

I think we'd prefer to use the existing
GETTEXT_TINY_EXTRA_GETTEXT_FILES logic, which is precisely there to
borrow some files from gettext-gnu when building/installing
gettext-tiny. Could you look into this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
