From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2015 14:16:54 +0200
Subject: [Buildroot] [PATCH v5 06/13] package/opencv: add qt5 support
In-Reply-To: <1433672799-21387-7-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
 <1433672799-21387-7-git-send-email-s.martin49@gmail.com>
Message-ID: <20150607121654.GG3545@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-07 12:26 +0200, Samuel Martin spake thusly:
> Starting with the 2.4.6 release, OpenCV supports both Qt4 and Qt5,
> but only one can be enabled at the same time.
> 
> Since Buildroot does not support Qt4/Qt5 co-existence, we keep the Qt
> support knob as a boolean, but make it depend on BR2_PACKAGE_QT or
> BR2_PACKAGE_QT5, and automatically uses the enabled one.
> 
> Note that we usually use 'select ...' to express the dependencies
> between packages, but in this case, we cannot since the Qt4/Qt5
> co-existence exclusion is not handled by a simple choice, but by a
> dependency. This makes impossible using 'select ...' for the Qt
> support knob without triggering a circular dependency at the kconfig
> level.
> 
> Besides, we already use 'depends on ...' to express the dependencies
> with some "big" packages (like xorg or libgtk2). qt or qt5* packages
> are fairly big. So, I don't think it will hurt that much to use a
> 'depends on ...' statement in this case.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
[--SNIP--]
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index 58a6ccb..4866780 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -209,13 +209,37 @@ config BR2_PACKAGE_OPENCV_WITH_QT
[--SNIP--]
> +comment "qt backend needs either Qt4 or Qt5"
> +	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
> +	depends on !BR2_avr32

We no longer support avr32. I should know, I ditched it! ;-)

Otherwise, looks good.

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
