From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Aug 2020 21:53:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-rpi-gpio: fix build with
 gcc 10.x
In-Reply-To: <20200806112301.19985-1-mf@go-sys.de>
References: <20200806112301.19985-1-mf@go-sys.de>
Message-ID: <20200806195332.GF2186@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2020-08-06 13:23 +0200, Michael Fischer spake thusly:
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/python-rpi-gpio/0001-Fix-build-with-gcc-10.patch | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 package/python-rpi-gpio/0001-Fix-build-with-gcc-10.patch
> 
> diff --git a/package/python-rpi-gpio/0001-Fix-build-with-gcc-10.patch b/package/python-rpi-gpio/0001-Fix-build-with-gcc-10.patch
> new file mode 100644
> index 0000000000..1bac987267
> --- /dev/null
> +++ b/package/python-rpi-gpio/0001-Fix-build-with-gcc-10.patch
> @@ -0,0 +1,8 @@
> +--- a/setup.py	2019-07-21 14:49:21.000000000 +0200
> ++++ b/setup.py	2020-08-06 10:59:51.455133324 +0200
> +@@ -43,4 +43,4 @@
> +       url              = 'http://sourceforge.net/projects/raspberry-gpio-python/',
> +       classifiers      = classifiers,
> +       packages         = ['RPi','RPi.GPIO'],
> +-      ext_modules      = [Extension('RPi._GPIO', ['source/py_gpio.c', 'source/c_gpio.c', 'source/cpuinfo.c', 'source/event_gpio.c', 'source/soft_pwm.c', 'source/py_pwm.c', 'source/common.c', 'source/constants.c'])])
> ++      ext_modules      = [Extension('RPi._GPIO', [...],extra_link_args=['-Wl,--allow-multiple-definition'] )])

As Thomas said in his review on another patch of yours, we really want
to fix the problem, not paper over it.

Care to actually fix the code and respin a better fix, please?

Regards,
Yann E. MORIN.

> 2.28.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
