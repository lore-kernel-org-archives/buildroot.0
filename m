From: Arnar Mar Sig <antab@valka.is>
Date: Sat, 8 Mar 2008 01:57:12 +0000
Subject: [Buildroot] svn commit:
	trunk/buildroot/package:editors	editors/vi
In-Reply-To: <20080307235344.GA6144@cloud.net.au>
References: <ADB1372A-7CAA-41A5-A619-09A9DF0A0D0D@valka.is>
	<008b01c88027$780e44a0$040514ac@atmel.com>
	<4D6547F3-9672-4606-90EA-88630B3565E9@valka.is>
	<20080307235344.GA6144@cloud.net.au>
Message-ID: <961B5B9D-4F82-45D9-85B3-64E6FF38BC3E@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mar 7, 2008, at 11:53 PM, Hamish Moffatt wrote:
> On Fri, Mar 07, 2008 at 08:57:08AM +0000, Arnar Mar Sig wrote:
>> On Mar 7, 2008, at 7:47 AM, Ulf Samuelsson wrote:
>>> Guess what, searching "package/*/*.mk" will not find anything  
>>> related
>>> to editors.
>>>
>> This patch moves the other editors nano, uemacs and ed into packages/
>> editors and also moves the includes from package/Config.in into
>> package/editors/Config.in. Makes the package/ dir a bit more  
>> organized.
>>
>> http://mx1.opex.is/move-editor-patch.txt
>
> Like Ulf says, it's convenient to be able to grep package/*/*.mk and  
> now
> that's broken.
grep -r --include=*.mk "editors" package/*

> I think dividing of the package/ directory needs discussion
> first.
>
> It's not really a crowded directory by modern standards. Our file
> systems can cope with much larger directories than that.
Most filesystems can cope with it. But thats not the reason for the  
move.

IMO the config menu and dir structure should try to match. Its a lot  
faster to type: "ls package/editors" then running "make menuconfig"  
and going thru the menus to see if a editor package exists, or you see  
a package in package/ but when you try look for it you cant find it  
because its hidden in some submenu or worse, hidden because some of  
its 'depends' are not selected.

Arnar Mar Sig
