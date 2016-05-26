From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 May 2016 14:49:16 -0300
Subject: [Buildroot] Genimage last partition size issue
In-Reply-To: <CANQCQpa+ViouS7GyWLn4cxw6h4puDmMnLiFMTQy=dhFAfaQX7Q@mail.gmail.com>
References: <CANQCQpb634S9qdGcoZubqLcpFupyLyD8a=5hEOOXiNeOq1Vsrw@mail.gmail.com>
 <871t4rcuv1.fsf@dell.be.48ers.dk>
 <CANQCQpa+ViouS7GyWLn4cxw6h4puDmMnLiFMTQy=dhFAfaQX7Q@mail.gmail.com>
Message-ID: <5747371C.40405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/05/16 14:42, Matthew Weber wrote:

>> How should genimage know what the size is of your SD card when you
>> generate the foo.img image? I guess you would need to add size = 4G
>> inside image foo.img { }, but notice that this is isn't very efficient
>> as you will be writing lots of zeros to the sd card.
>>
> Good point, I should have looked a bit closer before forwarding this
> question from one of my developers.  He didn't want to specify the
> size anywhere and wanted it to make the last partition fit the disk.
> Which with pre-builts is obviously not realistic.  Instead he dd's his
> image and then adjusts the partition / re-tunes the fs to make it fill
> the rest of the disk. Whick works....
>
> Thanks
> Matt

Hi Matt.
"Autoresize script" - there are some tricks around for this where you 
grow the partition to fit available space on the media, resize2fs and 
voila. Requires some care though.
Regards.
