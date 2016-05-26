From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 21:54:08 +0200
Subject: [Buildroot] Genimage last partition size issue
In-Reply-To: <20160526203517.1a2a3670@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 26 May 2016 20:35:17 +0200")
References: <CANQCQpb634S9qdGcoZubqLcpFupyLyD8a=5hEOOXiNeOq1Vsrw@mail.gmail.com>
 <871t4rcuv1.fsf@dell.be.48ers.dk>
 <20160526203517.1a2a3670@free-electrons.com>
Message-ID: <87bn3s61en.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 24 May 2016 17:56:50 +0200, Peter Korsgaard wrote:

 >> How should genimage know what the size is of your SD card when you
 >> generate the foo.img image? I guess you would need to add size = 4G
 >> inside image foo.img { }, but notice that this is isn't very efficient
 >> as you will be writing lots of zeros to the sd card.

 > Isn't it possible to generate a sparse file, and then use the sparse
 > capability of dd to avoid writing those lots of zeros?

Can dd detect and do something sensible about sparse files? I thought it
was only able to create sparse files (by seeking)? I would guess you
need a tool that understand the filesystem to know if you can really
skip sequences of zeros when writing.

-- 
Venlig hilsen,
Peter Korsgaard 
