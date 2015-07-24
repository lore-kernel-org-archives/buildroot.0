From: Julien CORJON <corjon.j@ecagroup.com>
Date: Fri, 24 Jul 2015 08:40:44 +0000
Subject: [Buildroot] qt5base build issue
In-Reply-To: <CAGm1_ku+MGyBs_CkXtAjZVgqCkmNAPJ8mjW6yc05unKzyQRDhA@mail.gmail.com>
References: <CAGm1_kumsLYH8RmBn3WWr64_yN1mjhc5DGhiZfpqCSdc3jvPtQ@mail.gmail.com>
 <55B0FEED.4070700@ecagroup.com>
 <CAGm1_kv_JrjpKVJ50_APpNsfP1knqxkNcr8bN0bSacvxVsjq7A@mail.gmail.com>
 <CAGm1_ku+MGyBs_CkXtAjZVgqCkmNAPJ8mjW6yc05unKzyQRDhA@mail.gmail.com>
Message-ID: <55B1FA0C.6000809@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor,

Le 24/07/2015 10:32, Yegor Yefremov a ?crit :
> On Fri, Jul 24, 2015 at 8:33 AM, Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
>> On Thu, Jul 23, 2015 at 4:49 PM, Julien CORJON <corjon.j@ecagroup.com> wrote:
>>> Dear Yegor,
>>>
>>> Le 23/07/2015 15:45, Yegor Yefremov a ?crit :
>>>> Toolchain: Sourcery CodeBench ARM 2014.05
>>>>
>>>> BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
>>>> BR2_PACKAGE_QT5=y
>>>> BR2_PACKAGE_QT5BASE=y
>>>> BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
>>>> BR2_PACKAGE_QT5BASE_CONFIG_FILE=""
>>>> BR2_PACKAGE_QT5BASE_NETWORK=y
>>>> BR2_PACKAGE_QT5BASE_SQL=y
>>>> BR2_PACKAGE_QT5BASE_SQLITE_NONE=y
>>>> BR2_PACKAGE_QT5BASE_TEST=y
>>>> BR2_PACKAGE_QT5BASE_XML=y
>>>> BR2_PACKAGE_QT5BASE_GUI=y
>>>> BR2_PACKAGE_QT5BASE_WIDGETS=y
>>>> BR2_PACKAGE_QT5BASE_LINUXFB=y
>>>> BR2_PACKAGE_QT5BASE_DEFAULT_QPA=""
>>>> BR2_PACKAGE_QT5BASE_PRINTSUPPORT=y
>>>> BR2_PACKAGE_QT5SVG=y
>>>>
>>>
>>> Which buildroot version/commit# do you use?
>>
>> This was yesterdays git version.
>>
>>> Can you pastebin your .config file?
>>
>> I've activated only Qt5 and approve licence and it worked. Will be
>> investigating further.
>>
>>>> During compilation I get following error:
>>>>
>>>> Running configuration tests...
>>>> Failed to process makespec for platform 'devices/linux-buildroot-g++'
>>>> Project ERROR: Compiler
>>>> /home/user/MyProjects/oss/buildroot/prods1/host/usr/bin/ccache
>>>> /home/user/MyProjects/oss/buildroot/prods1/host/usr/bin/arm-none-linux-gnueabi-g++
>>>> not found. Check the value of CROSS_COMPILE -device-option
>>>> Could not read qmake configuration file
>>>> /home/user/MyProjects/oss/buildroot/prods1/build/qt5base-5.5.0/mkspecs/devices/linux-buildroot-g++/qmake.conf.
>>>
>>> Is qmake file really missing or it cannot be readed?
>>>
>>>> Error processing project file: /dev/null
>>>> package/pkg-generic.mk:146: recipe for target
>>>> '/home/user/MyProjects/oss/buildroot/prods1/build/qt5base-5.5.0/.stamp_configured'
>>>> failed
>>>>
>>>> Any idea? I also tried uclibc-ng toolchain - same result.
>
> I think I found the cause: ccache. To reproduce just enable toolchain,
> ccache and Qt5 base. That's all.

Have you tried to clear your cache (rm -rf ~/.buildroot-ccache)?

>
> How can one fix this?
>
> Yegor
>
Julien
