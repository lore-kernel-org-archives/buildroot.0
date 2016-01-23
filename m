From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 23 Jan 2016 13:16:00 -0200
Subject: [Buildroot] Analysis of build failures
References: <20160123154220.06518c9d@free-electrons.com>
Message-ID: <56a39930cd84_671a180a0ec59869@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 23, 2016 at 12:42 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> On Sat, 23 Jan 2016 15:26:13 +0100, Thomas De Schampheleire wrote:
> 
>> I guess a hard link would work here, then. Care to try?

Between the 2 e-mails I tested using hard link.
Using patch v2.6, the hardlinks get unlinked too.

patch v2.7.1 has --follow-symlinks but its use is discouraged in the man page.
> 
> But why would we do that? If I understood Ricardo's e-mail, a simple
> change to the patch (remove the double quotes) would make it just work.
> 
> So why are we looking for a complicated solution here ?

Just to be clear, removing the double quotes makes it work with
patch 2.5.9 or later.
Patch 2.5.4 can't handle spaces in filenames.
(I tested using only the versions with tarballs available, that's the cause of
the gap 2.5.9 -> 2.5.4, see http://ftp.gnu.org/gnu/patch/)

I am sending the first version of the patch series.
Probably it will need some rewording, since it's my first patch to the manual.

Regards,
Ricardo
