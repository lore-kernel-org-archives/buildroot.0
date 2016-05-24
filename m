From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 17:56:50 +0200
Subject: [Buildroot] Genimage last partition size issue
In-Reply-To: <CANQCQpb634S9qdGcoZubqLcpFupyLyD8a=5hEOOXiNeOq1Vsrw@mail.gmail.com>
 (Matthew Weber's message of "Tue, 24 May 2016 10:26:08 -0500")
References: <CANQCQpb634S9qdGcoZubqLcpFupyLyD8a=5hEOOXiNeOq1Vsrw@mail.gmail.com>
Message-ID: <871t4rcuv1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > As noted in the partition options, size = 0 should cause the last
 > partition to take the rest of the space on the device.  However, when
 > I set size = 0 and then write the image to a SD card using "sudo dd
 > if=foo.img of=/dev/sdb", the rootfs partition only has 190M (the same
 > amount as when I don't use the size argument) when there is almost 4G
 > worth of space available.  I know the size argument works in general
 > as if I set the size to 3000M, the rootfs partition is 3000M after
 > writing it to the SD card.

How should genimage know what the size is of your SD card when you
generate the foo.img image? I guess you would need to add size = 4G
inside image foo.img { }, but notice that this is isn't very efficient
as you will be writing lots of zeros to the sd card.

-- 
Bye, Peter Korsgaard
