From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Tue, 22 Dec 2015 19:13:27 +0200 (IST)
Subject: [Buildroot] [PATCH 1/1] nfs-utils: install /etc/nfsmount.conf
In-Reply-To: <20151221161658.0aaf830d@free-electrons.com>
References: <1450707537-30154-1-git-send-email-yba@tkos.co.il>
 <1450707537-30154-2-git-send-email-yba@tkos.co.il>
 <20151221161658.0aaf830d@free-electrons.com>
Message-ID: <alpine.DEB.2.11.1512221912420.15569@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Dec 2015, Thomas Petazzoni wrote:

> Date: Mon, 21 Dec 2015 16:16:58 +0100
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 1/1] nfs-utils: install /etc/nfsmount.conf
> 
> Dear Jonathan Ben-Avraham,
>
> On Mon, 21 Dec 2015 16:18:56 +0200, Jonathan Ben-Avraham wrote:
>
>> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
>> index 30f12fd..55b75e2 100644
>> --- a/package/nfs-utils/nfs-utils.mk
>> +++ b/package/nfs-utils/nfs-utils.mk
>> @@ -38,6 +38,9 @@ endif
>>  define NFS_UTILS_INSTALL_FIXUP
>>  	rm -f $(NFS_UTILS_TARGETS_)
>>  	touch $(TARGET_DIR)/etc/exports
>> +	$(INSTALL) -m 744 \
>
> Why 744 and not 644 ? It doesn't make much sense to have an executable
> configuration file.
>
> Also, please use the -D option.
>
>> +		$(BUILD_DIR)/nfs-utils-$(NFS_UTILS_VERSION)/utils/mount/nfsmount.conf \
>
> Please use:
>
> 		$(@D)/utils/mount/nfsmount.conf
>
>> +		$(TARGET_DIR)/etc
>
> And a full destination path here:
>
> 		$(TARGET_DIR)/etc/nfsmount.conf
>
> Thanks!
>
> Thomas
>

Hi Thomas,
Thanks. I submitted another version, v1, of the patch just now.

  - yba


-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
