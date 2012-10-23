From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Oct 2012 15:15:13 +0200
Subject: [Buildroot] [PATCH 04/10] busybox: busybox-update-config should
 depend on busybox-configure
In-Reply-To: <CAHXCMM+sp=qu29Qu8XxM80Jd7_y1z4ph4zsWz_XgKJpwYAAG3Q@mail.gmail.com>
References: <1350776731-8467-1-git-send-email-arnout@mind.be>
 <1350776731-8467-5-git-send-email-arnout@mind.be>
 <CAHXCMM+sp=qu29Qu8XxM80Jd7_y1z4ph4zsWz_XgKJpwYAAG3Q@mail.gmail.com>
Message-ID: <50869861.6050402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/10/12 17:07, Samuel Martin wrote:
> Arnout, all,
>
> 2012/10/21 Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>:
>> >  From: "Arnout Vandecappelle (Essensium/Mind)"<arnout@mind.be>
>> >
>> >  Before the config file can be copied, it has to exist.  The
>> >  other xxx-update-config targets to this as well.
>> >
>> >  Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>> >  ---
>> >    package/busybox/busybox.mk |    2 +-
>> >    1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> >  diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
>> >  index 33f8633..e95364c 100644
>> >  --- a/package/busybox/busybox.mk
>> >  +++ b/package/busybox/busybox.mk
>> >  @@ -215,5 +215,5 @@ busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
>> >           rm -f $(BUSYBOX_DIR)/.stamp_built
>> >           rm -f $(BUSYBOX_DIR)/.stamp_target_installed
>> >
>> >  -busybox-update-config:
>> >  +busybox-update-config: busybox-configure
>> >           cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
> How about saving the busybox-defconfig instead?

  Is there a busybox version that has a savedefconfig target?

  Anyway, that would again be a separate patch.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
