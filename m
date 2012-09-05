From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 05 Sep 2012 11:07:10 +0200
Subject: [Buildroot] Fwd: Re:  fs skeleton quick rebuild
Message-ID: <5047163E.3040303@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dallas,

I forward your messages to the list in case someone else is interested
in your findings.

Is there interest in getting something like "make root-reinstall" added
to buildroot?

Kind regards

Stephan

-------- Original-Nachricht --------
Betreff: 	Re: [Buildroot] fs skeleton quick rebuild
Datum: 	Tue, 4 Sep 2012 17:42:36 -0500
Von: 	Dallas Clement <dallas.a.clement@gmail.com>
An: 	Stephan Hoffmann <sho@relinux.de>



I found the answer.  Need to preserve target/lib or repopulate from staging/lib.

On Tue, Sep 4, 2012 at 5:21 PM, Dallas Clement
<dallas.a.clement@gmail.com> wrote:
> One small follow up question.  This method works great except, my /lib
> dir is empty afterward.  Any pointers on how to repopulate this dir
> with all the libs?
>
> On Tue, Sep 4, 2012 at 1:30 PM, Stephan Hoffmann <sho@relinux.de> wrote:
>> Am 04.09.2012 19:59, schrieb Dallas Clement:
>>> Greetings:
>>>
>>> I'm working on a custom skeleton for my rootfs and wanting to make
>>> changes and test without having to rebuild everything.  Is there an
>>> easy way to do this?
>> Hi,
>>
>> I figured out that
>> 1. remove output/target
>> 2. remove output/build/.root
>> 3. remove all .stamp_target_installed files
>> give a quite fast, clean rebuild of the root file system.
>>
>> Hope that helps
>>
>> Stephan
>>> Thanks,
>>>
>>> Dallas
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>>
>> --
>> reLinux     -    Stephan Hoffmann
>> Am Schmidtgrund 124    50765 K?ln
>> Tel. +49.221.95595-19    Fax: -64
>> www.reLinux.de     sho at reLinux.de
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120905/803770fd/attachment.html>
