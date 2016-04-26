From: rfinkelstein at rtsys.fr <rfinkelstein@rtsys.fr>
Date: Tue, 26 Apr 2016 11:15:02 +0200
Subject: [Buildroot] QMAKESPEC has not been set
In-Reply-To: <20160425170410.394d5384@free-electrons.com>
References: <cbbb11e2c7e662c45ad8c288e9f113d8@rtsys.fr>
 <20160425170410.394d5384@free-electrons.com>
Message-ID: <e196f3adfdc7b795a8b8aa0f555f6a35@rtsys.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25.04.2016 17:04, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 25 Apr 2016 14:31:12 +0200, rfinkelstein at rtsys.fr wrote:
>> Hello, I am using Buildroot 2016.02.
>> 
>> I'm trying to build the package python-pyqt5, to do so the package
>> python-sip 4.16.7 is selected,
> 
> We don't have a package called python-pyqt5 in Buildroot, we only have
> python-pyqt which is for Qt4 only.
> 
> So I'm not sure how to help you, since you're using packages that are
> not in Buildroot, and not even posting the corresponding patches for
> those packages, or giving the Buildroot configuration that produces the
> problem.
> 
> Could you give more details?
> 
> Thanks!
> 
> Thomas


Hi, sorry for the lack of information, I'll try to better show my 
problem.

In fact there is no package called python-pyqt5 yet in Buildroot, I've 
created the configuration files.
But i believe it is not the source of the problem (yet) because I'm 
stuck before the build of the python-pyqt5. My problem is happening when 
building the package python-sip (dependency for the python-pyqt5), 
already supported by Buildroot.

By "the Buildroot configuration that produces the problem" you mean the 
file .config?
https://gist.github.com/Finkelrf/dbe8280c705162c135dcbe0ea9fca845

The error I've mentioned (QMAKESPEC has not been set, so configuration 
cannot be deduced), as the command that generates the error can be seen 
in the copy of my terminal in the link below
https://gist.github.com/Finkelrf/035f2f7554039ee1ce1008425340e8b3

If I set the env variable QMAKESPEC in the terminal and export it by the 
follow commands
> QMAKESPEC=/media/secure/sda416/zynq_buildroot/build/qt-4.8.7/mkspecs/linux-arm-gnueabi-g++
> export QMAKESPEC
and than I run only the command that generated the error in the 
terminal, the error does not appear again.

My doubt is how to properly set the environment variable in the build 
process.

Hope I could better show my problem, Thanks for the help.

Rafael
