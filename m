From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Jul 2017 17:50:16 +0200
Subject: [Buildroot] [PATCH 20/20] support/testing: add runtime testing
 for init systems
In-Reply-To: <CAHQ1cqGROL2-MBCWGVTvgiQWQ_zaL5SxTK-CpsQK_PEpbRerAQ@mail.gmail.com>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <95f6965c48dbf2f754818e2bec1f2d3891015475.1500398733.git.yann.morin.1998@free.fr>
 <CAHQ1cqGROL2-MBCWGVTvgiQWQ_zaL5SxTK-CpsQK_PEpbRerAQ@mail.gmail.com>
Message-ID: <20170724155016.GD2918@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrey, All,

On 2017-07-24 08:20 -0700, Andrey Smirnov spake thusly:
> On Tue, Jul 18, 2017 at 10:25 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > The "builtin" kernel does not boot a systemd-based system, so
> > we resort to building the same one as currently used by our
> > qemu_arm_vexpress_defconfig.
[--SNIP--]
> > diff --git a/support/testing/tests/init/test_busybox.py b/support/testing/tests/init/test_busybox.py
> > new file mode 100644
> > index 0000000000..c3e425bf5d
> > --- /dev/null
> > +++ b/support/testing/tests/init/test_busybox.py
> > @@ -0,0 +1,67 @@
> > +import infra.basetest
> > +from tests.init.base import InitSystemBase as InitSystemBase
> > +
> > +class InitSystemBusyboxBase(InitSystemBase):
> > +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> > +        """
> > +        # BR2_TARGET_ROOTFS_TAR is not set
> > +        """
> > +
> > +    def checkInit(self):
> > +        super(InitSystemBusyboxBase, self).checkInit("/bin/busybox")
> > +
> 
> Just as a suggestion, you can probably get away without needing to
> override that function by defining a class variable "init_path" that
> SystemBusyboxBase and SystemSystemdBase will override to some
> appropriate value. See, for example, the code I wrote for Python and
> IPython related tests.
> 
> https://git.buildroot.net/buildroot/tree/support/testing/tests/package/test_python.py#n11
> https://git.buildroot.net/buildroot/tree/support/testing/tests/package/test_ipython.py#n18

Hmm, I see what you mean. I'll see if that helps with the code.

OTOH, calling super() is not too complex either. ;-)

Thanks for the suggestion! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
