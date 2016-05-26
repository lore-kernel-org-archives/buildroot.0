From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:59:29 +0200
Subject: [Buildroot] Genimage last partition size issue
In-Reply-To: <87bn3s61en.fsf@dell.be.48ers.dk>
References: <CANQCQpb634S9qdGcoZubqLcpFupyLyD8a=5hEOOXiNeOq1Vsrw@mail.gmail.com>
 <871t4rcuv1.fsf@dell.be.48ers.dk>
 <20160526203517.1a2a3670@free-electrons.com>
 <87bn3s61en.fsf@dell.be.48ers.dk>
Message-ID: <20160526215929.61993c8f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 May 2016 21:54:08 +0200, Peter Korsgaard wrote:

> Can dd detect and do something sensible about sparse files? I thought it
> was only able to create sparse files (by seeking)? I would guess you
> need a tool that understand the filesystem to know if you can really
> skip sequences of zeros when writing.

man dd(1):

       sparse try to seek rather than write the output for NUL input blocks

So it doesn't seem to need a sparse file, it's just that it detects
blocks that are completely zero and does not write them.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
