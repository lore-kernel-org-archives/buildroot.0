From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 19 Jan 2010 11:41:02 -0500
Subject: [Buildroot] (no subject)
In-Reply-To: <87iqaym5tm.fsf@macbook.be.48ers.dk>
References: <BD79186B4FD85F4B8E60E381CAEE19090208945D@mi8nycmail19.Mi8.com>
	<87iqaym5tm.fsf@macbook.be.48ers.dk>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909020E8BEF@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, January 19, 2010 9:13 AM, Peter Korsgaard wrote:
>>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:
>
>> Hello all,
>> Does anyone know what happened to mkfs.jffs in mtd-utils?
>>
>> I recently updated my buildroot tree to the latest git.  This bumped
>> the mtd-utils package from 1.1.0 to 1.2.0.  I did a make mtd-dirclean
>> then started the make.  Eventually I got:
>>
>> cp -f /home/bigguiness/buildroot/output/build/mtd_orig/mkfs.jffs /home/bigguiness/buildroot/output/target/usr/sbin/mkfs.jffs
>> cp: cannot stat `/home/bigguiness/buildroot/output/build/mtd_orig/mkfs.jffs': No such file or directory
>> make: *** [/home/bigguiness/buildroot/output/target/usr/sbin/mkfs.jffs] Error 1
>
> Hmm, it works here. Do you also have the problem if you do a clean
> rebuild?

Hi Peter,

I figured out the issue already and sent you a patch that fixed it:

commit 5a352cdeba03856fa2d0cf12c707fd80704ebfdd

mtd-utils-1.1.0 had this in the file feature-removal-schedule.txt:

What:   mkfs.jffs.c
When:   Shortly after kernel 2.6.21 is released
Why:    Support for the JFFS filesystem is being removed from the kernel
Who:    Josh Boyer <jwboyer@gmail.com>

When the mtd-utils package got bumped to 1.2.0 that file was removed so
the utility was gone.

I didn't actually need the utility it was just selected in my .config.

Thanks,
Hartley

PS, Sorry about forgetting to put a subject on this thread.
