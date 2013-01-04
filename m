From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Fri, 04 Jan 2013 16:01:52 +0200
Subject: [Buildroot] [PATCH] perf: new package
In-Reply-To: <20130104002214.7a112fdf@skate>
References: <1357225671-18101-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <50E5A2B4.6090405@petroprogram.com> <20130104002214.7a112fdf@skate>
Message-ID: <50E6E0D0.10302@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

4.1.2013 1:22, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Thu, 03 Jan 2013 17:24:36 +0200, Stefan Fr?berg wrote:
>
>> Here is an elfutils 0.155 (which contains libelf) for buildroot that I
>> posted some time ago.
>> Patch #4 is missing from that list because it was too big to submit to
>> this list.
>>
>> http://lists.busybox.net/pipermail/buildroot/2012-December/063855.html
>> http://lists.busybox.net/pipermail/buildroot/2012-December/063856.html
>> http://lists.busybox.net/pipermail/buildroot/2012-December/063864.html
>> http://lists.busybox.net/pipermail/buildroot/2012-December/063858.html
>> http://lists.busybox.net/pipermail/buildroot/2012-December/063857.html
>> http://lists.busybox.net/pipermail/buildroot/2012-December/063859.html
>> http://lists.busybox.net/pipermail/buildroot/2012-December/063861.html
>> http://lists.busybox.net/pipermail/buildroot/2012-December/063860.html
>> http://lists.busybox.net/pipermail/buildroot/2012-December/063863.html
>> http://lists.busybox.net/pipermail/buildroot/2012-December/063862.html
>> http://lists.busybox.net/pipermail/buildroot/2012-December/063865.html
> I've started having a real look at this, and started refactoring your
> patch series.
>
> Could you point me to the missing PATCH #4, so that I can see your
> entire series? At least send it by private e-mail to me, so that we
> don't get limited by the list.

I can do that but I have to warn you that it's huge (1.5 MB).
Only one of the grub patches in buildroot is bigger (1.6 MB).

It's because uClibc is missing obstack_printf functionality and almost
half of it goes
to implementing it by gnulib portability library
(https://www.gnu.org/software/gnulib/)

Another half goes to enabling fts interface (because it's not enabled by
default in buildroot).

Ofcourse enabling it buy default in buildroot or even better, giving
user a choice of enabling it
in buildroot will help cutting size of that patch.

Anyway, I try to send it to you privately.

And also within few hours I will be kicking my old
crappy server online again, upload that patch there and submit link to
that patch for
everybody to work on.

Regards
Stefan
 

> Thanks,
>
> Thomas
