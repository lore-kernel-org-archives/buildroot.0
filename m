From: Julien CORJON <corjon.j@ecagroup.com>
Date: Fri, 24 Jul 2015 10:17:19 +0000
Subject: [Buildroot] qt5base build issue
In-Reply-To: <CAGm1_kujy48mMmd4QMSJL+zbEXf3ooRWN8mKd+WF6e5Dg3LeQA@mail.gmail.com>
References: <CAGm1_kumsLYH8RmBn3WWr64_yN1mjhc5DGhiZfpqCSdc3jvPtQ@mail.gmail.com>
 <55B0FEED.4070700@ecagroup.com>
 <CAGm1_kv_JrjpKVJ50_APpNsfP1knqxkNcr8bN0bSacvxVsjq7A@mail.gmail.com>
 <CAGm1_ku+MGyBs_CkXtAjZVgqCkmNAPJ8mjW6yc05unKzyQRDhA@mail.gmail.com>
 <55B1FA0C.6000809@ecagroup.com>
 <CAGm1_kujy48mMmd4QMSJL+zbEXf3ooRWN8mKd+WF6e5Dg3LeQA@mail.gmail.com>
Message-ID: <55B210AF.8010004@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

[snip]

>>>>>> During compilation I get following error:
>>>>>>
>>>>>> Running configuration tests...
>>>>>> Failed to process makespec for platform 'devices/linux-buildroot-g++'
>>>>>> Project ERROR: Compiler
>>>>>> /home/user/MyProjects/oss/buildroot/prods1/host/usr/bin/ccache
>>>>>> /home/user/MyProjects/oss/buildroot/prods1/host/usr/bin/arm-none-linux-gnueabi-g++
>>>>>> not found. Check the value of CROSS_COMPILE -device-option
>>>>>> Could not read qmake configuration file
>>>>>> /home/user/MyProjects/oss/buildroot/prods1/build/qt5base-5.5.0/mkspecs/devices/linux-buildroot-g++/qmake.conf.

[snip]

>>> I think I found the cause: ccache. To reproduce just enable toolchain,
>>> ccache and Qt5 base. That's all.
>>
>> Have you tried to clear your cache (rm -rf ~/.buildroot-ccache)?
>
> This doesn't help :-(

Ok,  I've just built your test case with and without ccache and It look 
like a ccache issue since it work without.

At the beginning of the configure we have the error : 
xxx/output/host/usr/bin/ccache: invalid option -- 'W'

I clearly do not know how ccache work and how it is handled by BR so I 
cannot help more than that.

If anyone listening I paste the qt5base build log at 
http://pastebin.com/RAGPnKZr
and my config is :
BR2_arm=y
BR2_CCACHE=y
BR2_CCACHE_DIR="$(HOME)/Projets/buildroot/build/buildroot-qtbase-ccache/.buildroot-ccache"
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.05-496-g85945aa.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y

>
> Yegor
>

Julien
