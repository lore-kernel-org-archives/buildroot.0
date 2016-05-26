From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 May 2016 15:37:22 -0300
Subject: [Buildroot] Genimage last partition size issue
In-Reply-To: <20160526203517.1a2a3670@free-electrons.com>
References: <CANQCQpb634S9qdGcoZubqLcpFupyLyD8a=5hEOOXiNeOq1Vsrw@mail.gmail.com>
 <871t4rcuv1.fsf@dell.be.48ers.dk>
 <20160526203517.1a2a3670@free-electrons.com>
Message-ID: <57474262.2020500@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/05/16 15:35, Thomas Petazzoni wrote:

> Hello,
>
> On Tue, 24 May 2016 17:56:50 +0200, Peter Korsgaard wrote:
>
>> How should genimage know what the size is of your SD card when you
>> generate the foo.img image? I guess you would need to add size = 4G
>> inside image foo.img { }, but notice that this is isn't very efficient
>> as you will be writing lots of zeros to the sd card.
>
> Isn't it possible to generate a sparse file, and then use the sparse
> capability of dd to avoid writing those lots of zeros?
>
> Thomas

You're still dealing with the partition table, it goes beyond sparse files.
Regards.
