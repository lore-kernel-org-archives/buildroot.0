From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 17 Mar 2015 02:49:29 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-03-15
In-Reply-To: <20150316073020.6611C100E85@stock.ovh.net>
References: <20150316073020.6611C100E85@stock.ovh.net>
Message-ID: <CAMo8BfKLif9Bmgjd7nOT3-aSX5nTBrgXQvTBzPtRvNOAHXXwxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 16, 2015 at 10:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2015-03-15
>     mips64el |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/2f42e7a58823a94ec61f05fd06b1b4b915ac5e57/
>          arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/7801e1a204c28da266548782ffafaeb499eefd00/
>          arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/7d275a911f72d4483d3336b3fdb5f17ff817d920/
>       xtensa |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/c1eccc90dab16d22b4621ce20cb9aa78357bdd52/

These have path to compiler missing in libtool invocations, like this:

/bin/bash ../libtool  --tag=CXX   --mode=compile  -DHAVE_CONFIG_H -I.
-I..  -I/home/test/autobuild/instance-1/output/build/snmppp-3.3.4/include
-pthread -I/home/test/autobuild/instance-1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-D_GNU_SOURCE  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64   -Os  -D_NDEBUG -pthread -c -o address.lo
address.cpp

Couldn't reproduce it.

>         bfin |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/ddf6792001e3ff9e3a6ca88c03e0111a3bc1b1f9/

This has libtool command line set up correctly, but something's
apparently wrong with libgcc.

-- 
Thanks.
-- Max
