From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Thu, 6 Nov 2008 12:39:56 +0100
Subject: [Buildroot] Stripping kernel modules (was: ext2+isofs initrd too
	big)
Message-ID: <e4c675870811060339j4446066bid6115de77a438342@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/19 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>:
> On Sun, Oct 19, 2008 at 12:00:13PM +0200, Roberto A. Foglietta wrote:

[cut]

>>>
>>>  a) stripping modules (previous patch was wrong, see below)
>>>
>>>  Using strip on .ko does not work at all without --strip-unneeded.
>>>
>>>  http://mailman.uclinux.org/pipermail/uclinux-dev/2007-January/041616.html
>>>
>>>  strip -R  .comment -R .note -g --strip-unneeded
>>>
>>
>> Stripping modules belong to the kernel Makefile.in and Makefile.in.advanced
>>
>> Declaring INSTALL_MOD_STRIP=1 in modules_install should be enough,
>>however find,xargs,strip has been added also.
>>
>> Ciao,
>>--
>>/roberto
>
>
>> linux26-modules: cross-depmod26 $(LINUX26_DIR)/.modules_installed
>>+      find $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION) -name \*.ko | xargs strip -R .comment -R .note -g --strip-unneeded
>
> This is wrong. Proper thing to do is $(STIPCMD) $(STRIP_STRIP_UNNEEDED)
>

 Using $(STRIPCMD) is wrong too because when
STRIPCMD=/some/where/sstrip then stripping fails.

 I think the only viable way is INSTALL_MOD_STRIP=1, what about adding
a proper .config variable?

 Cheers,
-- 
/roberto
