From: Chris Zankel <chris@zankel.net>
Date: Tue, 05 Nov 2013 10:36:48 -0800
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <20131029211622.62459eef@skate>
References: <20131029204108.5d707d09@skate> <52701682.2040208@zankel.net>
 <20131029211622.62459eef@skate>
Message-ID: <52793AC0.4090306@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Just a quick update on binutils. There seems to be an issue with uClibc 
(_obstack_* symbols are not exported). I also tried a similar build for 
ARM with the same result (same error). Do you have any test builds using 
a uClibc snapshot for other architectures that pass binutils?

There was a discussion about it on the uClibc mailing list a while ago.

Thanks,
-Chris



On 10/29/13, 1:16 PM, Thomas Petazzoni wrote:

> For the record, the 10 packages causing the highest number of problems
> since July, 1st 2013, are:
>
> +-------------------+-----+
> | reason            | cnt |
> +-------------------+-----+
> | binutils-2.21.1   |  96 |
> | m4-1.4.16         |  37 |
> | binutils-2.22     |  30 |
> | libnspr-4.9.6     |  21 |
> | m4-1.4.17         |  17 |
> | cdrkit-1.1.11     |  14 |
> | ffmpeg-0.8.12     |   8 |
> | iozone-3_414      |   8 |
> | gstreamer-0.10.36 |   6 |
> | libpfm4-4.3.0     |   6 |
> +-------------------+-----+
>
> Looks like fixing binutils is a good thing to do in the very near
> future. Can you send a patch for that?
