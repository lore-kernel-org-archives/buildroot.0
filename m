From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 17:22:15 +0100
Subject: [Buildroot] Poco 1.6.1 with glib for Raspberry Pi
In-Reply-To: <5638CEBF.1030502@prosystems.de>
References: <56388339.6080904@prosystems.de>
 <20151103151918.1aa989ea@free-electrons.com>
 <5638CBAE.9040700@prosystems.de>
 <20151103160203.187da1ba@free-electrons.com>
 <5638CEBF.1030502@prosystems.de>
Message-ID: <20151103172215.4afe95f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Benno,

On Tue, 3 Nov 2015 16:11:59 +0100, Benno wrote:

> > This is unclear. Can you give the *exact* commands you are running
> > using the example program above to get the problem ?
> 
> for compiling:
> path/to/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabi-g++ 
> -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"src/Example.d" 
> -MT"src/Example.d" -o "src/Example.o" "../src/Example.cpp"
> 
> for linking:
> path/to/output/host/usr/bin/arm-buildroot-linux-gnueabi-g++ 
> -L/path/to/buildroot/output/target/usr/lib -o "ExampleProj" 
> ./src/Example.o   -lPocoFoundation -lPocoUtil -lPocoNet

I didn't test your program since you never gave me the Example.cpp
source code. Instead, I used the example HTTP server provided in the
Poco documentation. I indeed stumbled across the pcre issue, and also a
library installation problem.

I've fixed both issues in commit
http://git.buildroot.net/buildroot/commit/?id=b8527eb3c017c74c861db8b21f8a0def55988382.
With those patches, I can successfully build and run the HTTP server
example.

Thanks for reporting the issue in the first place, and don't hesitate
to test and report back if the patches are working for you.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
