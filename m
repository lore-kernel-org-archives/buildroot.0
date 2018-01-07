From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 23:20:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-01-03
In-Reply-To: <cbf92a23-f475-b9e4-a71c-d3edf95e46da@gmail.com>
References: <20180104070035.EEAA2207B1@mail.free-electrons.com>
 <12466b9b-4377-b65c-bdb7-c76b136fc3ef@gmail.com>
 <CANQCQpahMS8fVOAS1-1R9veM_4LoO8xdnRosEs9yKNC4EtTERg@mail.gmail.com>
 <CANQCQpaphdhYG8Z23vnxEvUN=fG+UVra2gzc-QApLjbmCeGdpQ@mail.gmail.com>
 <CANQCQpaqZdMqsoXcODeTjM_hLdH5mX4p3Mmmj4zO6Ab258L1DQ@mail.gmail.com>
 <cbf92a23-f475-b9e4-a71c-d3edf95e46da@gmail.com>
Message-ID: <20180107232054.750b6a84@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 Jan 2018 23:16:08 +0100, Romain Naour wrote:

> Here is the instance log for the following build:
> 
> [Fri, 05 Jan 2018 11:35:51] INFO: build started
> [Sat, 06 Jan 2018 03:19:51] INFO: build hung
> [Sat, 06 Jan 2018 03:19:51] INFO: file mtime:[02:19:47]
> [Sat, 06 Jan 2018 03:19:51] INFO: timeNow:[03:19:51]
> [Sat, 06 Jan 2018 03:19:51] INFO: file mtime(second read):[02:19:47]
> [Sat, 06 Jan 2018 03:19:51] INFO: build timed out [-9]
> 
> http://autobuild.buildroot.net/results/ca7/ca70ce7cdbdb834bf448bcb168de9d5bba9f9178/build-end.log

The build-time.log ends with:

1515201587:start:extract             : host-ti-cgt-pru

And 1515201587 is:

Saturday, January 6, 2018 2:19:47 AM GMT+01:00

I.e, it does match the mtime of 02:19:47.

So it really seems like this extract step was stuck for an hour.

To me, this log shows that the hung detector worked as expected, and
that for this specific situation, the problem is that the extract step
of host-ti-cgt-pru never completes.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
