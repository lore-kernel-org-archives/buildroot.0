From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Apr 2013 12:25:49 +0200
Subject: [Buildroot] [PATCH v2] libserial: new package
In-Reply-To: <1366102172-10308-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Tue, 16 Apr 2013 09:49:32 +0100")
References: <1366102172-10308-1-git-send-email-spdawson@gmail.com>
Message-ID: <87haixee6q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>

 spdawson> Note that the Python binding is disabled; we can't build this
 spdawson> in Buildroot without the sipconfig Python module for the
 spdawson> host.

Thanks, looks good - But it doesn't compile :/

(default internal 4.7.3 arm toolchain):

SerialPort.cpp: In member function 'void SerialPort::SerialPortImpl::Open()':
SerialPort.cpp:643:24: error: 'getpid' was not declared in this scope
SerialPort.cpp: In member function 'void SerialPort::SerialPortImpl::Close()':
SerialPort.cpp:748:26: error: 'close' was not declared in this scope
SerialPort.cpp: In member function 'unsigned char SerialPort::SerialPortImpl::ReadByte(unsigned int)':
SerialPort.cpp:1246:37: error: 'usleep' was not declared in this scope
SerialPort.cpp: In member function 'void SerialPort::SerialPortImpl::Write(const unsigned char*, unsigned int)':
SerialPort.cpp:1427:50: error: 'write' was not declared in this scope
SerialPort.cpp: In member function 'virtual void SerialPort::SerialPortImpl::HandlePosixSignal(int)':

Looks like it's missing a #include <unistd.h>

Care to fix that with a patch (and send upstream) and resubmit?

-- 
Bye, Peter Korsgaard
