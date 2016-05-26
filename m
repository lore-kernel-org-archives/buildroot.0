From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 May 2016 15:45:17 -0300
Subject: [Buildroot] Genimage last partition size issue
In-Reply-To: <20160526204157.201c0d78@free-electrons.com>
References: <CANQCQpb634S9qdGcoZubqLcpFupyLyD8a=5hEOOXiNeOq1Vsrw@mail.gmail.com>
 <871t4rcuv1.fsf@dell.be.48ers.dk>
 <20160526203517.1a2a3670@free-electrons.com>
 <57474262.2020500@zacarias.com.ar>
 <20160526204157.201c0d78@free-electrons.com>
Message-ID: <5747443D.2020109@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/05/16 15:41, Thomas Petazzoni wrote:

> Well, I was thinking of really creating a 4 GB image file when you have
> a 4 GB SD card, so that the partition table is exactly in the state it
> will be on the SD card. But by using sparse files, the 4 GB image file
> isn't really taking up 4 GB on your disk, and you don't have to dd the
> entire 4 GB, since zeros can be skipped.
>
> Thomas

Yes, that would be suitable, expect for 8 GB cards where you "loose" 
space :)
The other approach which i briefly mentioned is on first boot running a 
resize script that adjusts the partition table to grow the last 
partition to fit the running block device and resizes the filesystem.
Of course it has some limitations, like ext2/3/4 filesystems (some 
others as well) and having some tools around for the trick.
Regards.
