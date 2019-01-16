From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 16:02:14 +0100
Subject: [Buildroot] [PATCH 1/1] libserial: fix build on sparc
In-Reply-To: <20190115193820.19478-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 15 Jan 2019 20:38:20 +0100")
References: <20190115193820.19478-1-fontaine.fabrice@gmail.com>
Message-ID: <87k1j4d4sp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > On certain architectures (namely Sparc), the maximum baud rate exposed
 > by the kernel headers is B2000000. Therefore, the current libserial
 > code doesn't build for the Sparc and Sparc64 architectures due to
 > this.

 > In order to address this problem, this patch tests the value of
 > __MAX_BAUD. If it's higher than B2000000 then we assume we're on an
 > architecture that supports all baud rates up to B4000000. Otherwise,
 > we simply don't support the baud rates above B2000000.

 > Fixes build failures such as:

 > SerialPort.cpp: In member function 'int LibSerial::SerialPort::Implementation::GetBitRate(const LibSerial::BaudRate&) const':
 > SerialPort.cpp:1226:14: error: 'BAUD_2000000' is not a member of 'LibSerial::BaudRate'
 >          case BaudRate::BAUD_2000000:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/63ba95b6786464fa8e75af64593010df84530079

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
