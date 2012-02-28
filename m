From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Feb 2012 22:48:14 +0000
Subject: [Buildroot] buildroot ncurses build problem
In-Reply-To: <CAAXf6LX=31pR9AXMSvmBZOkJBvWMyrxD76_KptKXsECk+HV5Sg@mail.gmail.com>
References: <CAAXf6LXn1Tdi9MLjqKEC1cGW+N4kU_YuiJD9xMVru1KVQNWcgA@mail.gmail.com>
 <749894859.1231630.1330441934340.JavaMail.root@zimbra22-e3.priv.proxad.net>
 <CAAXf6LX=31pR9AXMSvmBZOkJBvWMyrxD76_KptKXsECk+HV5Sg@mail.gmail.com>
Message-ID: <201202282248.14809.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 28 February 2012 15:32:34 Thomas De Schampheleire wrote:
> On Tue, Feb 28, 2012 at 4:12 PM,  <snarf77@free.fr> wrote:
> >> /bin/sh: -I../c++: not found
> >> make: *** [../objects/cursesf.o] Error 127
> 
> It seems that the compiler is not correctly filled in (the variable is empty).

 Search for CXX in output/build/host-ncurses-5.7/config.log and
output/build/host-ncurses-5.7/c++/Makefile

 In output/build/host-ncurses-5.7/config.log you should find:
ac_cv_env_CXX_set=set
ac_cv_env_CXX_value='/usr/bin/g++'

 This leads to the following in 
output/build/host-ncurses-5.7/c++/Makefile:
CXX             = /usr/bin/g++


 By the way, you do have /usr/bin/g++ installed I hope?


 If you've changed anything in your environment (e.g. installed g++),
you have to do a clean build of the package:

make host-ncurses-dirclean
make



 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
