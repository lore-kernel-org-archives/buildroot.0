From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 15 Jul 2018 12:02:56 +0200
Subject: [Buildroot] [RFC v1 2/2] libdrm: change to meson build system
In-Reply-To: <20180714222729.00517695@windsurf>
References: <20180713205801.25976-1-ps.report@gmx.net>
 <20180713205801.25976-2-ps.report@gmx.net>
 <20180714222729.00517695@windsurf>
Message-ID: <20180715100256.GA27498@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On 2018-07-14 22:27, Thomas Petazzoni wrote:
> Hello,
>
> On Fri, 13 Jul 2018 22:58:01 +0200, Peter Seiderer wrote:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Notes:
> >   - convertion from "LIBDRM_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'"
> >     is missing (maybe meson gets it right (?) or use LIBDRM_MESON_CFLAGS
> >     to force it)
>
> With all those packages migrating to meson, would it be possible to
> look at removing some dependencies from host-ninja/host-meson ? Right
> now, host-ninja forces to build a Python interpreter, either
> host-python or host-python3, and then host-meson forces to build
> host-python3.
>
> If Ninja is compatible with both Python 2 and Python 3, why can't we
> use the system-provided Python interpreter rather than building our
> own ?

Is it the technique used for cmake with $(BR2_CMAKE_HOST_DEPENDENCY), or
am I mistaken?

> Does Meson absolutely needs a Python 3 interpreter ?

Meson is strict about this. From setup.py:

```
if sys.version_info < (3, 5, 0):
    print('Tried to install with an unsupported version of Python. '
              'Meson requires Python 3.5.0 or greater')
	          sys.exit(1)
```

Regards,

--
ELB
