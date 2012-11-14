From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 14 Nov 2012 09:20:47 +0100
Subject: [Buildroot] [PATCH] pkg-infra: rename <pkg>-rsync to
	<pkg>-extract
In-Reply-To: <50A2DC5E.1010303@mind.be>
References: <1350225704-5693-1-git-send-email-arnout@mind.be>
 <50A0B30E.3090308@relinux.de> <50A2DC5E.1010303@mind.be>
Message-ID: <50A3545F.2090602@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 14.11.2012 00:48, schrieb Arnout Vandecappelle:
> On 12/11/12 09:27, Stephan Hoffmann wrote:
>> Am 14.10.2012 16:41, schrieb Arnout Vandecappelle (Essensium/Mind):
> [snip]
>>> +$(1)-extract:        $$($(2)_TARGET_RSYNC)
>>>
>>>   $(1)-source:        $$($(2)_TARGET_RSYNC_SOURCE)
>>>   endif
>> Hello,
>>
>> this does not fix my issue, not even after doing a "make clean".
> [snip]
>>>>>> linux custom Syncing from source dir
>>> /home/stephan/Dokumente/BeagleBone/kernel/kernel
>>> rsync -au /home/stephan/Dokumente/BeagleBone/kernel/kernel/
>>> /home/stephan/Dokumente/BeagleBone/buildroot/output/build/linux-custom
>>> cp: cannot stat `/home/stephan/Dokumente/dl/linux-custom.tar.gz': No
>>> such file or directory
>>> make: *** [linux-legal-info] Error 1
>
>  One step at a time :-)
>
>  The .tar.gz doesn't exist for overridden packages.  So what should we
> do -
> exclude the source for overridden packages?
Good point. At the first glance, I'd suggest to create the tar.gz using
the x_OVERRIDE_SRCDIR. That seems to be better than nothing.

After creating a linux-custom.tar.gz, "make legal-info" works for me,
but it does not seem to make sence to copy a .tar.gz file that has not
been extracted to build the packet.

Kind regards

Stephan
>
>  Regards,
>  Arnout
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
