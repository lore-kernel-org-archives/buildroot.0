From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 26 May 2016 12:42:36 -0500
Subject: [Buildroot] Genimage last partition size issue
In-Reply-To: <871t4rcuv1.fsf@dell.be.48ers.dk>
References: <CANQCQpb634S9qdGcoZubqLcpFupyLyD8a=5hEOOXiNeOq1Vsrw@mail.gmail.com>
 <871t4rcuv1.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpa+ViouS7GyWLn4cxw6h4puDmMnLiFMTQy=dhFAfaQX7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 24, 2016 at 10:56 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:
>
>  > As noted in the partition options, size = 0 should cause the last
>  > partition to take the rest of the space on the device.  However, when
>  > I set size = 0 and then write the image to a SD card using "sudo dd
>  > if=foo.img of=/dev/sdb", the rootfs partition only has 190M (the same
>  > amount as when I don't use the size argument) when there is almost 4G
>  > worth of space available.  I know the size argument works in general
>  > as if I set the size to 3000M, the rootfs partition is 3000M after
>  > writing it to the SD card.
>
> How should genimage know what the size is of your SD card when you
> generate the foo.img image? I guess you would need to add size = 4G
> inside image foo.img { }, but notice that this is isn't very efficient
> as you will be writing lots of zeros to the sd card.
>
Good point, I should have looked a bit closer before forwarding this
question from one of my developers.  He didn't want to specify the
size anywhere and wanted it to make the last partition fit the disk.
Which with pre-builts is obviously not realistic.  Instead he dd's his
image and then adjusts the partition / re-tunes the fs to make it fill
the rest of the disk. Whick works....

Thanks
Matt
