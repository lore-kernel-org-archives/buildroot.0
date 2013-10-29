From: Chris Zankel <chris@zankel.net>
Date: Tue, 29 Oct 2013 13:52:52 -0700
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <20131029211622.62459eef@skate>
References: <20131029204108.5d707d09@skate> <52701682.2040208@zankel.net>
 <20131029211622.62459eef@skate>
Message-ID: <52702024.3060303@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/29/13, 1:16 PM, Thomas Petazzoni wrote:
> Are you interested in receiving a daily e-mail with the Xtensa build
> failures, if any?
Are they different from the one on the mailing list?

For example:
[Buildroot] [autobuild.buildroot.net] Build results for 2013-10-28

> Unfortunately, seeing the absolute desert of release activity the
> uClibc project is showing, I am not sure when any feature of this size
> can be merged, and even worse released :-(
Hopefully, I can push them to make a 'pre-release'.

> In the mean time, it would be good if we could identify such packages,
> and add the appropriate dependencies to avoid autobuilder failures. Can
> you point us which packages need NPTL support?
I'll go through my list again, and will run some builds. Give me a few 
days to a week to come up with a list and patches...
>
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
Actually, when you run automatic builds, do you 'cache' the dl 
directory? What I noticed is that 'snapshots' of packages are not (were 
not) updated (probably because the filename doesn't change). If cached, 
it would be good to delete all 'snapshot' from the dl directory (short 
term solution). I'll see if I can come up with a solution to  'pin' a 
working version for uClibc for Xtensa.

Some of the binutils errors might come from using 'uClibc' snapshots, 
and if the uClibc-snapshot package is not cleared, the same error will 
continue to show up even if fixed.


Thanks,
-Chris
