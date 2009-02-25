From: Eric Malkowski <eric@bvwireless.net>
Date: Wed, 25 Feb 2009 09:38:41 -0500
Subject: [Buildroot] [Fwd: Re:  I apologize for asking...]
In-Reply-To: <49A50A02.2070105@comcast.net>
References: <49A3D452.4030606@comcast.net> <49A50A02.2070105@comcast.net>
Message-ID: <49A557F1.30401@bvwireless.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I created your problem and fixed it using the method described earlier.  
A transcript follows...
Are you using bash for your shell?

emalkowski at eric-lnx:/local/emalkowski/buildroot$ export CFLAGS=blah
emalkowski at eric-lnx:/local/emalkowski/buildroot$ make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   FALSE


You must run 'unset CFLAGS' so buildroot can run with
a clean environment on your build machine

make: *** [dependencies] Error 1
emalkowski at eric-lnx:/local/emalkowski/buildroot$ env | grep CFLAGS
CFLAGS=blah
emalkowski at eric-lnx:/local/emalkowski/buildroot$ unset CFLAGS
emalkowski at eric-lnx:/local/emalkowski/buildroot$ env | grep CFL
emalkowski at eric-lnx:/local/emalkowski/buildroot$ make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.1':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.1':                   Ok
awk installed:                                  Ok
bash installed:                                 Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf 
/local/emalkowski/buildroot/project_build_i586/vehicle_manager/buildro
ot-config
mkdir -p /local/emalkowski/buildroot/project_build_i586/vehicle_manager
cp -dpRf package/config/buildroot-config 
/local/emalkowski/buildroot/project_
build_i586/vehicle_manager/buildroot-config

<< snip >>

Xavian-Anderson Macpherson wrote:
> Would some one please just make a utility to "unset CFLAGS", so that I 
> can get this to work. Maybe provide a setting from within buildroot 
> itself to set this properly. Nothing I do can get this to work.
>
> Xavian-Anderson Macpherson
> Shingoshi
> ------------------------------------------------------------------------
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
