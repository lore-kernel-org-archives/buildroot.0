From: Andy Gibbs <andyg1001@hotmail.co.uk>
Date: Fri, 5 Nov 2010 14:10:05 +0100
Subject: [Buildroot] [git commit master 1/1] lsof: stop overriding
	CFLAGS in build
References: <20101104161748.EC2E68DAC1@busybox.osuosl.org><20101104173941.2966c58b@surf><BLU0-SMTP1368DBCA5159307B5213EDFE74B0@phx.gbl>
	<20101104203505.65c0c12e@surf>
Message-ID: <BLU0-SMTP20895E48D241BF5C3027A6FE74C0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, November 04, 2010 8:35 PM, Thomas Petazzoni wrote:

>> I wasn't able to find the patch you reference, but I downloaded 4.84 and
>> scanning over it quickly, I believe the patch just committed is still
>> required.  If you can point me to the patch bumping to 4.84, then I will
>> do
>> some testing, if you wish.
>
> http://lists.busybox.net/pipermail/buildroot/2010-October/038111.html
>
> If you can test and report, that would be great.
>

Thomas,

I have tested this patch, but it does still need the LSOF_CFLAGS_OVERRIDE
fix.

However, I also had a few additional minor problems running with Martin
Banky's patch (even against the current git checkout), so I've done some
additional modification on it also.  The patch is still based on the work
done by Martin, but I've re-enabled the use of the patch system inside
GENTARGETS.  I have therefore attached this revised patch to this email and
full details of the modifications made are in the commit text.

As an additional point of note, Martin's patch removed the uclibc-related
patch for lsof.  I have kept its deletion in my patch, but I have not had
the opportunity to test this particular change as I don't have a
uclibc-toolchain/environment in which to test it.  I have assumed that this
change has been tested already by Martin.

Cheers
Andy

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: patch.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101105/5b3a270b/attachment-0001.txt>
