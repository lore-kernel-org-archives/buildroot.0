From: olyvine.chen at logiways.com.cn <olyvine.chen@logiways.com.cn>
Date: Tue, 28 Dec 2010 18:31:46 +0800
Subject: [Buildroot] wvstreams configure error
In-Reply-To: <20101228113323.6b7c982d@surf>
References: <1293525765.15318.24.camel@olyvine-desktop.logiways-sz.cn>
	<20101228101313.0e257c8b@surf>
	<1293529540.15318.34.camel@olyvine-desktop.logiways-sz.cn>
	<20101228113323.6b7c982d@surf>
Message-ID: <1293532306.15318.36.camel@olyvine-desktop.logiways-sz.cn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


But I add the following to the makefile, it can compile ok:
WVSTREAMS_CONF_OPT = CXX=$(TARGET_CXX)
WVSTREAMS_MAKE_OPT = CXX=$(TARGET_CXX)

and BR2_INSTALL_LIBSTDCPP is not set.

On Tue, 2010-12-28 at 11:33 +0100, Thomas Petazzoni wrote:
> On Tue, 28 Dec 2010 17:45:40 +0800
> "olyvine.chen at logiways.com.cn" <olyvine.chen@logiways.com.cn> wrote:
> 
> > Thanks for your reply, and I check the config.log, and find CXX compiler
> > is missing, then how to pass the argument to configure to enable CXX ?
> > ####################################################################
> > configure:8427: result: no
> > configure:8461: checking for openssl/ssl.h
> > configure:8482: false -c -Os -pipe -Os  -D_LARGEFILE_SOURCE
> > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 --sysroot ????/staging/
> > -Iyes/include conftest.cpp >&5
> 
> Presumably, you forgot to enable BR2_TOOLCHAIN_BUILDROOT_CXX, and so
> you don't have a C++ cross-compiler. Your project should therefore
> "depends on BR2_INSTALL_LIBSTDCPP" in its Config.in.
> 
> However, the "????" string for the sysroot argument is a bit strange.
> It should be that way. Is it you that edited the log to not show the
> full location of your staging directory ?
> 
> Thomas
