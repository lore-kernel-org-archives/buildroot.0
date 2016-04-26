From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 16:51:30 +0200
Subject: [Buildroot] QMAKESPEC has not been set
In-Reply-To: <0a9cdf44d25e1fda4ca87cbc97c879e7@rtsys.fr>
References: <cbbb11e2c7e662c45ad8c288e9f113d8@rtsys.fr>
 <20160425170410.394d5384@free-electrons.com>
 <e196f3adfdc7b795a8b8aa0f555f6a35@rtsys.fr>
 <20160426114218.1ee9c489@free-electrons.com>
 <0a9cdf44d25e1fda4ca87cbc97c879e7@rtsys.fr>
Message-ID: <20160426165130.4762a4ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Apr 2016 16:44:45 +0200, rfinkelstein at rtsys.fr wrote:

> I've replaced the $(HOST_DIR)/usr/bin/qmake to $(QT5_QMAKE) and it seems 
> to fix the QMAKESPEC problem but now I'm getting the error 
> (https://gist.github.com/Finkelrf/4f7ac78cb48e231c233b31b3270b1b14):
> > /media/secure/sda416/zynq_buildroot/host/usr/mkspecs/features/device_config.prf:4: 
> > Missing ] terminator [found /]
> 
> In the line 4 of the device_config.prf there is the following line:
> > DEVICE_PRI = $$[QT_HOST_DATA/get]/mkspecs/qdevice.pri
> 
> If i call:
> > /media/secure/sda416/zynq_buildroot/host/usr/bin/qmake -query
> 
> I don't get the QT_HOST_DATA 
> (https://gist.github.com/Finkelrf/d64bf44ea8662de238cceae3e2bdbcd6)
> 
> Shouldn't it be defined as a qmake property?

To be honest, I have no idea. I am not familiar enough with qmake and
Qt related stuff to know without looking myself in details. Hopefully
someone else on the Buildroot mailing list has some better ideas, or is
interested in getting python-sip to work with Qt5.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
