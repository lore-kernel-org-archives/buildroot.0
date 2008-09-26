From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Fri, 26 Sep 2008 14:39:39 +0200
Subject: [Buildroot] Standalone toolchain
In-Reply-To: <20080924134635.GA14882@mx.loc>
References: <48DA3D47.5060204@cetrtapot.si> <20080924134635.GA14882@mx.loc>
Message-ID: <48DCD80B.5060105@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Reutner-Fischer wrote:
> On Wed, Sep 24, 2008 at 03:14:47PM +0200, Hinko Kocevar wrote:
>> Hi,
>>
>> Is it possible to create a toolchain and then transfer it to another machine or just another folder, and have it work?
> 
> This is supposed to work, yes. The keyword is sysroot support.
> Either configure your BR2_STAGING_DIR to e.g. /opt/my-target-tripplet
> or just move the staging dir wherever you want and use the proper
> --sysroot and -isysroot.

Yes, that helped!
I've added --sysroot=$(TOOLCHAIN) to CFLAGS and LDFLAGS and gcc was happy again.

Best regards,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
