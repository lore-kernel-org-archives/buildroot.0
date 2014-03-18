From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Tue, 18 Mar 2014 15:45:47 +0100
Subject: [Buildroot] Error building Qt5Multimedia
In-Reply-To: <CAAXf6LX-dJFpaOkMaCg0A4PD1FphzO8xbPbLWTyLTX3xmO+ELA@mail.gmail.com>
References: <53269705.6060805@gmail.com>
 <CAAXf6LVoTKqC61B2fPbwp-9LQZ1ephfpEodHVfqedB7SPyn7kg@mail.gmail.com>
 <532828E8.5040405@gmail.com>
 <CAAXf6LVvo4VSgkHawfNuftrqW317QzQ8FO2c-1k33datwdpfSg@mail.gmail.com>
 <53284767.3040408@gmail.com> <53284881.1090803@gmail.com>
 <CAAXf6LUmEB2=XB=CuUnDREER139E3MiouKLMa4GAFrNvnDzJsw@mail.gmail.com>
 <53285568.7080900@gmail.com>
 <CAAXf6LX-dJFpaOkMaCg0A4PD1FphzO8xbPbLWTyLTX3xmO+ELA@mail.gmail.com>
Message-ID: <53285C1B.9040201@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thomas,
> You can go to output/build/qt5multimedia and try to re-execute the
> command mentioned in config.log related to the gstreamer test. Maybe
> you can debug based on that, maybe using 'strace -fo /tmp/out
> <command>' to check what kind of files it is looking for.


I issued:

cd 
/home/marco/dev/buildroot/output/build/qt5multimedia-5.2.1/config.tests/gstreamer

strace -fo /tmp/out /home/marco/dev/buildroot/output/host/usr/bin/qmake 
"CONFIG -= qt debug_and_release app_bundle lib_bundle" 
/home/marco/dev/buildroot/output/build/qt5multimedia-5.2.1/config.tests/gstreamer
Project ERROR: gstreamer-0.10 development package not found

Here the strace output:

http://code.bulix.org/7oi5mj-85862

I'm not so expert to understand what's happening.

Unfortunately this feature is mandatory for my project.

Are we working on the same repo? 2014.05-git-00363-g3749143
Unless buildroot needs something outside it's own directory it's very 
strange such a behavior.
For you information my host machine is:

Linux devrpi 3.2.0-4-686-pae #1 SMP Debian 3.2.51-1 i686 GNU/Linux

Marco
