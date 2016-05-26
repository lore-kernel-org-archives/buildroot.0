From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 20:41:57 +0200
Subject: [Buildroot] Genimage last partition size issue
In-Reply-To: <57474262.2020500@zacarias.com.ar>
References: <CANQCQpb634S9qdGcoZubqLcpFupyLyD8a=5hEOOXiNeOq1Vsrw@mail.gmail.com>
 <871t4rcuv1.fsf@dell.be.48ers.dk>
 <20160526203517.1a2a3670@free-electrons.com>
 <57474262.2020500@zacarias.com.ar>
Message-ID: <20160526204157.201c0d78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 May 2016 15:37:22 -0300, Gustavo Zacarias wrote:

> >> How should genimage know what the size is of your SD card when you
> >> generate the foo.img image? I guess you would need to add size = 4G
> >> inside image foo.img { }, but notice that this is isn't very efficient
> >> as you will be writing lots of zeros to the sd card.  
> >
> > Isn't it possible to generate a sparse file, and then use the sparse
> > capability of dd to avoid writing those lots of zeros?
> >
> > Thomas  
> 
> You're still dealing with the partition table, it goes beyond sparse files.

Well, I was thinking of really creating a 4 GB image file when you have
a 4 GB SD card, so that the partition table is exactly in the state it
will be on the SD card. But by using sparse files, the 4 GB image file
isn't really taking up 4 GB on your disk, and you don't have to dd the
entire 4 GB, since zeros can be skipped.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
