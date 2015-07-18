From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 23:51:40 +0200
Subject: [Buildroot] [PATCH v2] quazip: new package
In-Reply-To: <1436747889-23748-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1436747889-23748-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20150718235140.5a4eb571@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoltan Gyarmati,

On Mon, 13 Jul 2015 02:38:09 +0200, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
> Changes v1 -> v2:
>     - correct license file name

I've applied, but there were still lots of things I had to fix before
applying. Here are the details:

    [Thomas:
     - fix indentation of select BR2_PACKAGE_ZLIB in Config.in
     - rewrap Config.in help text, lines were too long
     - remove depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5, since
       quazip/Config.in is already only included if one of Qt4 or Qt5 is
       enabled.
     - remove QUAZIP_SOURCE definition, since its value was the default
     - add the missing zlib dependency in the .mk file
     - add spaces around '=' signs when setting QUAZIP_QMAKE
     - pass $(TARGET_MAKE_ENV) at install time]

You can look at the final commit at
http://git.buildroot.net/buildroot/commit/?id=40f0c0c122bd93fc835a44d804096f7022f833be

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
