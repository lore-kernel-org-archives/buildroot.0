From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 15 Feb 2011 13:10:57 +0100
Subject: [Buildroot] [PATCH] Makefile: improve $(TARGET_DIR) (re)creation
In-Reply-To: <AANLkTi==jLjhNbswUC1wsgUySjB_kM_7VD1Ns9mQoMsE@mail.gmail.com>
References: <1297627745-17087-1-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTi==jLjhNbswUC1wsgUySjB_kM_7VD1Ns9mQoMsE@mail.gmail.com>
Message-ID: <AANLkTikvPodMe8ZGmo452Zn_hBU5c2S=2RpMNYKOoMAP@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/2/15 Bj?rn Forsman <bjorn.forsman@gmail.com>:
> 2011/2/13 Bj?rn Forsman <bjorn.forsman@gmail.com>:
>> This patch fixes the following use case:
>>
>> ?1. Build, hack, ...
>> ?2. Oh no, $(TARGET_DIR) is no longer in sync with $(TARGET_SKELETON)
>> ? ?and/or the packages selected in menuconfig. If only there was a way
>> ? ?to *easily* rebuild $(TARGET_DIR) so it is in sync...
>>
>> With this patch, just remove $(TARGET_DIR) and Buildroot will recreate
>> it.
>>
>> Main changes:
>> ?* Always copy $(TARGET_SKELETON). This is the easiest way to ensure
>> ? $(TARGET_DIR) has the latest skeleton.
>> ?* If $(TARGET_DIR) needs to be created (i.e. if the directory is
>> ? missing), remove $(BUILD_DIR)/*/.stamp_target_installed files so
>> ? all currently selected packages will be reinstalled.
>
> I just realized that linux.mk also needs patching for TARGET_DIR
> rebuild (to ensure kernel modules are installed). But before I post
> that I'd like to get some feedback on this approach...ack/nak?

I'm afraid I can't say anything about this particular approach (I
don't even have time to test it right now) but I do would love a way
to regenerate the target dir.
