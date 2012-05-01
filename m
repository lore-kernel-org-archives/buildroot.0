From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 01 May 2012 10:21:21 +0200
Subject: [Buildroot] Fedora 16: Cannot find -lc
In-Reply-To: <CA+T-u8d3owC=YNJ5O9V6MUaahdSOPo21H+5aLxxnf8xan5GyHQ@mail.gmail.com>
References: <CA+T-u8d3owC=YNJ5O9V6MUaahdSOPo21H+5aLxxnf8xan5GyHQ@mail.gmail.com>
Message-ID: <4F9F9D01.2090407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/01/12 08:35, Alexander Broekhuis wrote:
> Hi all,
>
> I am trying to use buildroot on a Fedora 16 installation and run into
> the following error:
>
> /usr/bin/ld: cannot find -lc
> collect2: ld returned 1 exit status
>
> The last make command before the error:
> make[2]: Entering directory
> `/home/alexander/Development/buildroot/output/build/host-module-init-tools-3.15/build'
> /usr/lib/ccache/gcc  -O2
> -I/home/alexander/Development/buildroot/output/host/include
> -I/home/alexander/Development/buildroot/output/host/usr/include -Wunused
> -Wall -static -L/home/alexander/Development/buildroot/output/host/lib
> -L/home/alexander/Development/buildroot/output/host/usr/lib
> -Wl,-rpath,/home/alexander/Development/buildroot/output/host/usr/lib -o
> insmod.static insmod.o libmodtools.a

  I guess you need /usr/lib/libc.a installed on your build system.  I 
think it's in the glibc-static package on Fedora.

  If that makes the difference, it definitely should be in the 
documentation.  (On Debian derivatives, libc.a is a dependency of the 
compiler so it will be there.)

  Regards,
  Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
