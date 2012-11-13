From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Nov 2012 00:48:46 +0100
Subject: [Buildroot] [PATCH] pkg-infra: rename <pkg>-rsync to
	<pkg>-extract
In-Reply-To: <50A0B30E.3090308@relinux.de>
References: <1350225704-5693-1-git-send-email-arnout@mind.be>
 <50A0B30E.3090308@relinux.de>
Message-ID: <50A2DC5E.1010303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/11/12 09:27, Stephan Hoffmann wrote:
> Am 14.10.2012 16:41, schrieb Arnout Vandecappelle (Essensium/Mind):
[snip]
>> +$(1)-extract:		$$($(2)_TARGET_RSYNC)
>>
>>   $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
>>   endif
> Hello,
>
> this does not fix my issue, not even after doing a "make clean".
[snip]
>>>>> linux custom Syncing from source dir
>> /home/stephan/Dokumente/BeagleBone/kernel/kernel
>> rsync -au /home/stephan/Dokumente/BeagleBone/kernel/kernel/
>> /home/stephan/Dokumente/BeagleBone/buildroot/output/build/linux-custom
>> cp: cannot stat `/home/stephan/Dokumente/dl/linux-custom.tar.gz': No
>> such file or directory
>> make: *** [linux-legal-info] Error 1

  One step at a time :-)

  The .tar.gz doesn't exist for overridden packages.  So what should we do -
exclude the source for overridden packages?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
