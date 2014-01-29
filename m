From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Jan 2014 08:02:55 +0100
Subject: [Buildroot] [PATCH v2 1/1] update package isolinux bootloader -
 simplify code
In-Reply-To: <20140128172705.1e1ee088@skate>
References: <1376644934-4302-1-git-send-email-jean.sorgemoel@laposte.net>
 <1389745445-8884-1-git-send-email-jean.sorgemoel@laposte.net>
 <20140128172705.1e1ee088@skate>
Message-ID: <52E8A79F.4060005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/01/14 17:27, Thomas Petazzoni wrote:
> Dear jean.sorgemoel at laposte.net,
>
> On Wed, 15 Jan 2014 01:24:05 +0100, jean.sorgemoel at laposte.net wrote:
>> From: jean <jean.sorgemoel@laposte.net>
>>
>>
>> Signed-off-by: jean <jean.sorgemoel@laposte.net>
>
> Please add a commit log with details, explaining what the patch is
> doing.
>
>> ---
>> After Arnout's remark, (sorry, I read last month), I updated this module.
>> Goal : use other method to generate iso (and I think it's work fine)
>> File : fs/isolinux/Config.in
>> 1/ I suppress redundant comment
>> 2/ Suppress menu and use conditional (replace 'depends on' by 'if/endif')
>> 3/ Modify comment
>> 4/ suppress option (keyboard, ...)
>> 5/ replace 8 x space by tabulation
>> File : fs/isolinux/isolinux.mk
>> 5/ suppress extension 'BR2_'
>> 7/ use variable 'ISOLINUX_DIR'
>> 8/ suppress keyboard option
>> 9/ I can't use command '$(INSTALL) -D' beacause I don't define filenames (I keep old code)
>> 10/ Hide command genisoimage (with option $@)
>>
>>   fs/Config.in             |    2 +-
>>   fs/isolinux/Config.in    |  210 ++++++++++----------------------------------
>>   fs/isolinux/bootmsg.txt  |    4 +
>>   fs/isolinux/isolinux.cfg |    7 ++
>>   fs/isolinux/isolinux.mk  |  219 ++++++----------------------------------------
>>   5 files changed, 87 insertions(+), 355 deletions(-)
>>   create mode 100644 fs/isolinux/bootmsg.txt
>>   create mode 100644 fs/isolinux/isolinux.cfg
>
> You did your patch incorrectly: what you're sending here are the
> differences between your v1 and your v2. What we need is a single patch
> that contains all of your changes.
>
> You need to squash your v2 changes into the original patch, to make
> only one patch that adds the isolinux stuff.

  Also, this version doesn't yet address one of the main comments that 
both Thomas and I have: you shouldn't create a new filesystem type, but 
instead you should modify the existing iso9660 support and add an option 
to it to use isolinux instead of grub.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
