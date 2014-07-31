From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 31 Jul 2014 19:02:03 +0200
Subject: [Buildroot] [PATCH V7 1/1] google-breakpad: Integration into
 Makefile and Config.in
In-Reply-To: <53DA088F.3020608@gmail.com>
References: <1406124545-17915-1-git-send-email-pascal.huerst@gmail.com>
 <1406124545-17915-2-git-send-email-pascal.huerst@gmail.com>
 <20140729230335.GD5846@free.fr> <53DA088F.3020608@gmail.com>
Message-ID: <CAHXCMMJ+DAFp0LO=QrCxVKAkTrz_UEvDEO7VWRJ4rUy-4YwdAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pascal, all,

On Thu, Jul 31, 2014 at 11:12 AM, Pascal Huerst <pascal.huerst@gmail.com> wrote:
> Hey Yann, all,
>
> On 30.07.2014 01:03, Yann E. MORIN wrote:
>> On 2014-07-23 16:09 +0200, Pascal Huerst spake thusly:
>> I'll be shepherding this patch, since it still needs a bit of work.
>
> Thanks a lot, people seem to have quite different opinions and sometimes
> I don't understand why one solution is so much better than an other one...
>
>> For example, there is no host package for google breakpad, so it does
>> not work for me as I do not have googlebreakpad install on my host.
>
> I thought it has, since in google-breakpad.mk it says:
>
> 26 $(eval $(host-autotools-package))
>
> and in my current version I have at least:
>
> output/host/usr/bin/minidump-2-core

AFAICS [1], minidump-2-core is not a cross-program ; so it could be
better to remove it from the host tree.

> output/host/usr/bin/minidump_dump
> output/host/usr/bin/minidump_stackwalk
> output/host/usr/bin/minidump_upload
>
> I only need minidump_stackwalk, to process minidumps. So that looked ok
> to me.

Same here ;-).

[1] https://code.google.com/p/google-breakpad/source/browse/trunk/src/tools/linux/md2core/minidump-2-core.cc#425


Regards,

-- 
Samuel
