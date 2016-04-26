From: rfinkelstein at rtsys.fr <rfinkelstein@rtsys.fr>
Date: Tue, 26 Apr 2016 16:44:45 +0200
Subject: [Buildroot] QMAKESPEC has not been set
In-Reply-To: <20160426114218.1ee9c489@free-electrons.com>
References: <cbbb11e2c7e662c45ad8c288e9f113d8@rtsys.fr>
 <20160425170410.394d5384@free-electrons.com>
 <e196f3adfdc7b795a8b8aa0f555f6a35@rtsys.fr>
 <20160426114218.1ee9c489@free-electrons.com>
Message-ID: <0a9cdf44d25e1fda4ca87cbc97c879e7@rtsys.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> So you should first change the python-sip package to make it possible
> to build it without selecting Qt4.

I've removed the Qt of the python-sip dependencies, now I'm using only 
the Qt5

>> The error I've mentioned (QMAKESPEC has not been set, so configuration
>> cannot be deduced), as the command that generates the error can be 
>> seen
>> in the copy of my terminal in the link below
>> https://gist.github.com/Finkelrf/035f2f7554039ee1ce1008425340e8b3
> 
> For Qt5, we need to pass the spec file in argument to qmake, which is
> done automatically if you use $(QT5_QMAKE). So in python-sip, you
> should replace:
> 
>    $(HOST_DIR)/usr/bin/qmake
> 
> by:
> 
>    $(QT5_QMAKE)
> 
> if Qt5 is being used.
> 

I've replaced the $(HOST_DIR)/usr/bin/qmake to $(QT5_QMAKE) and it seems 
to fix the QMAKESPEC problem but now I'm getting the error 
(https://gist.github.com/Finkelrf/4f7ac78cb48e231c233b31b3270b1b14):
> /media/secure/sda416/zynq_buildroot/host/usr/mkspecs/features/device_config.prf:4: 
> Missing ] terminator [found /]

In the line 4 of the device_config.prf there is the following line:
> DEVICE_PRI = $$[QT_HOST_DATA/get]/mkspecs/qdevice.pri

If i call:
> /media/secure/sda416/zynq_buildroot/host/usr/bin/qmake -query

I don't get the QT_HOST_DATA 
(https://gist.github.com/Finkelrf/d64bf44ea8662de238cceae3e2bdbcd6)

Shouldn't it be defined as a qmake property?
