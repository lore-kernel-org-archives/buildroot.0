From: Tomohiro Masubuchi <bucchi@e-ml.jp>
Date: Mon, 11 Jun 2007 18:21:39 +0900
Subject: [Buildroot] problem with openssh/samba
In-Reply-To: <20070608095101.GA32442@z1.synertronixx>
References: <e19d85410706050700s69e06497gef032dddb6eef9c9@mail.gmail.com>	<e19d85410706051935j42739782ndf1307022f2e9031@mail.gmail.com>	<20070606100917.e0724deb.philippe.ney@pardes.ws>	<e19d85410706060839l6baf072cte7a5c9c9d58b67ab@mail.gmail.com>	<e19d85410706061235g63cadda9s364849b0737a39ec@mail.gmail.com>	<20070606235535.ddc532ee.philippe.ney@pardes.ws>	<4668E09B.1000200@e-ml.jp>
	<20070608095101.GA32442@z1.synertronixx>
Message-ID: <466D1423.1060904@e-ml.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Konsti.

>>> Ive been trying to compile openssh using buildroot, and just like
>>> samba, it compiles fine but any executable halts with "segmentation
>>> fault".
>
>> UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
>>
>> It works fine with arm(iwmmxt), gcc-4.2.0, binutils-2.17.50.0.16,
>> uClibc-0.9.29.
>
> Sadly this does not fix the smbd/nmbd issue. I can't check the fix for
> openssh, may be I install it for testing purposes.

I found the way of evading this problem.  The problem of openssh and
the problem of samba were due to another cause.

To solve this problem, patch this attachment file to uClibc-0.9.29,
and rebuild it.
It works with arm (iwmmxt,EABI) target, gcc-4.2.0, binutils-2.17.50.0.16,
and patched uClibc-0.9.29.
However, I am not confident about this way...

Regards,
Tomohiro
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: uClibc-0.9.29-fix-dynamic-info.patch
Url: http://busybox.net/lists/buildroot/attachments/20070611/a0fdda6f/attachment.diff 
