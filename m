From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Oct 2016 14:57:04 -0300
Subject: [Buildroot] [PATCH 1/7] libglib2: bump to version 2.50.0
In-Reply-To: <20161010194900.069c347b@free-electrons.com>
References: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
 <20160921141148.3aedf147@free-electrons.com>
 <20161009220744.3f41b8f2@free-electrons.com>
 <7dc3ea74-e874-4b9b-b6e3-2789bf126616@zacarias.com.ar>
 <20161010194900.069c347b@free-electrons.com>
Message-ID: <98ef1d1c-108c-eddc-1c1f-ef54aae02eda@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/10/16 14:49, Thomas Petazzoni wrote:

> Hello,
>
> On Mon, 10 Oct 2016 10:04:59 -0300, Gustavo Zacarias wrote:
>
>> Hi.
>> Hmmm ok... this causes more problems than it solves IMO.
>> So now what, revert gvfs, glibmm, gtk, gtkmm, wayland, weston, legacy ?
>
> Hm, sadly, it causes some other problems. And indeed, if nobody takes
> care of the crc32 issue, the only option will be to revert all those
> packages. I can't take care of fixing all autobuilder issues myself.
>
> Best regards,
>
> Thomas

Hi Thomas.
Ok let's clear something out for this case.
First, i didn't like the hyperbole in the commit message, it's not 500+ 
failures, it didn't even reach 200.
Second, it's only for static builds.
Third, as i told you on IRC i'd look into it time allowing, this is 
voluntary work on spare time, so this revert didn't rest in happily with me.
Fourth, i never left any big breakage of my own making at RC/release 
time, we are breaking eggs at this time so to speak, so a little 
headsup/patience would have been appreciated.
Five, yes, i knew you'd break a ton of stuff with a revert, but again 
"fourth" no headsup on IRC or anything - there's a reason the whole 
gnome stuff bump was in a series.

As you probably know the latest uclibc bump broke powerpc entirely and i 
didn't see any revert there, so it kind of feels personal (i know it's 
been fixed recently).

Regards.
