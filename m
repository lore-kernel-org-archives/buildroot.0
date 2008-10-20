From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Mon, 20 Oct 2008 12:55:30 +0200
Subject: [Buildroot] ext2+isofs initrd too big
In-Reply-To: <20081019160520.GI11249@mx.loc>
References: <e4c675870810181157u69e5e3d4j3ed89b53a414c6f3@mail.gmail.com>
	<e4c675870810181256j11da9c1eha5035bedc7a088a4@mail.gmail.com>
	<e4c675870810181655x1bdf8817l114da029a3a9c807@mail.gmail.com>
	<e4c675870810190300h6274b470nefb816ae6798d301@mail.gmail.com>
	<20081019160520.GI11249@mx.loc>
Message-ID: <e4c675870810200355g55367c71x351b2ed4ff49751f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/19 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>:
> On Sun, Oct 19, 2008 at 12:00:13PM +0200, Roberto A. Foglietta wrote:
>>2008/10/19 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
>>> 2008/10/18 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
>>>> 2008/10/18 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
>>>>> Hi,
>>>>>
>>>>>  using buildroot I have compiled a system which is big enough to not
>>>>> fit in the initrd image (default size is 4Mb but could be enlarged by
>>>>> kernel .config). Attached patch prepare a initrd of 16Mb and I can
>>>>> enlarge it more in order to put all my system inside. However this is
>>>>> not the best solution because has no future itself, initrd image could
>>>>> not enlarged forever.
>>>>
>>>>  _Attached patch_ forgot, until now
>>>>
>>>
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

a) Ok with s,STIPCMD,STRIPCMD, thanks for the answer.

 do you think it could be useful have a menuconfig option to strip
modules in order to include it into buildroot svn?

b) is useless, dropped.

 I would add another question

c) what is the smallest X11 fonts set?

 I am going to produce a demo for Italian Linux day (next saturday).

 Cheers,
-- 
/roberto
