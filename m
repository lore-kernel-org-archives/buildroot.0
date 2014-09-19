From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 19 Sep 2014 07:23:04 +0200
Subject: [Buildroot] [PATCH v2] Add support for Flattened Image Trees
In-Reply-To: <CAGm1_kvvNMcCgpZvS+YOxrnsQNHtCxt8Wd_0kprvTMS0zYXJFg@mail.gmail.com>
References: <1410981210-7788-1-git-send-email-yegorslists@googlemail.com>
 <c3bf0f66-d29d-4a77-930d-c33ac938368c@email.android.com>
 <CAGm1_ks=xwD4pm9aFF9AfKsFDeOhLPthkdx6BbLwY71z1e8TXg@mail.gmail.com>
 <CAAXf6LXtSvZQoJc0qibQhdCvS3XEECgMShr1tncrKduhTAsJGQ@mail.gmail.com>
 <CAGm1_ktxYNG99Vq+=tyhFyQqYuVE2==-psqRPh1Dp7H2aUgMJQ@mail.gmail.com>
 <81266ccf-e3d8-470e-9c94-4a63931a4fa2@email.android.com>
 <CAGm1_kvvNMcCgpZvS+YOxrnsQNHtCxt8Wd_0kprvTMS0zYXJFg@mail.gmail.com>
Message-ID: <216395b4-20a8-400c-be86-87ec3f22ae14@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor Yefremov <yegorslists@googlemail.com> schreef:
>On Thu, Sep 18, 2014 at 6:21 PM, Thomas De Schampheleire
><patrickdepinguin@gmail.com> wrote:
>> Yegor Yefremov <yegorslists@googlemail.com> schreef:
>>>
>>>I've figured the stuff out too:
>>>
>>>ROOTFS_FIT_DEPENDENCIES = uboot-tools
>>
>> This should be host-uboot-tools, no?
>
>Fixed
>
>>>ifeq ($(BR2_FIT_INSTALL_TARGET),y)
>>>define ROOTFS_FIT_CMD
>>>        cp $(BR2_FIT_PATH) $(BINARIES_DIR) && \
>>>        $(HOST_DIR)/usr/bin/mkimage -f $(BINARIES_DIR)/`basename
>>>$(BR2_FIT_PATH)` $(BINARIES_DIR)/$(BR2_FIT_BLOB_NAME) && \
>>>        mkdir -p $(TARGET_DIR)/boot/ && \
>>>        cp $(BINARIES_DIR)/$(BR2_FIT_BLOB_NAME) $(TARGET_DIR)/boot/
>>>endef
>>>else
>>>define ROOTFS_FIT_CMD
>>>        cp $(BR2_FIT_PATH) $(BINARIES_DIR) && \
>>>        $(HOST_DIR)/usr/bin/mkimage -f $(BINARIES_DIR)/`basename
>>>$(BR2_FIT_PATH)` $(BINARIES_DIR)/$(BR2_FIT_BLOB_NAME)
>>>endef
>>>endif
>>>
>>>$(eval $(call ROOTFS_TARGET,fit))
>>
>> There's a lot of duplication here that can be avoided...
>
>How do I define "nop" in a Makefile syntactically? What do you  mean
>with "target_cmd ('true') "?

I meant what Thomas P proposed in his comments on v3, the shell command true which is basically a nop if used in this way..

Best regards,
Thomas
