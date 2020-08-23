From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Aug 2020 22:32:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/openfpgaloader: needs gcc >= 4.9
In-Reply-To: <20200823200116.GK8728@scaer>
References: <20200820204158.1237689-1-fontaine.fabrice@gmail.com>
 <20200823200116.GK8728@scaer>
Message-ID: <20200823203202.GL8728@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FAbrice, All,

On 2020-08-23 22:01 +0200, Yann E. MORIN spake thusly:
> On 2020-08-20 22:41 +0200, Fabrice Fontaine spake thusly:
> > openfpgaloader needs C++11 as specified in CMakeLists.txt:
> > set(CMAKE_CXX_STANDARD 11)
> > 
> > The build on gcc 4.8 fails on:
> > 
> > /home/buildroot/autobuild/instance-1/output-1/build/openfpgaloader-849e5751e06d4d00f323205d5f02ee01f9f59a61/src/spiFlash.cpp: In member function 'void SPIFlash::jtag_write_read(uint8_t, uint8_t*, uint8_t*, uint16_t)':
> > /home/buildroot/autobuild/instance-1/output-1/build/openfpgaloader-849e5751e06d4d00f323205d5f02ee01f9f59a61/src/spiFlash.cpp:92:43: error: variable-sized object 'jtx' may not be initialized
> >   uint8_t jtx[xfer_len] = {reverseByte(cmd)};
> >                                            ^
> > 
> > Fixes:
> >  - http://autobuild.buildroot.org/results/f3f3cc216ae42bb8a8925b0df7c1a3cc79b027d7
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Applied to master, thanks.

Not quite yet, in fact...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
