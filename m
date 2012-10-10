From: Valentine Barshak <gvaxon@gmail.com>
Date: Wed, 10 Oct 2012 16:58:28 +0400
Subject: [Buildroot] [PATCH v3] sylpheed: Fix includedir
In-Reply-To: <20121008110113.3032157c@skate>
References: <1349649599-12615-1-git-send-email-gvaxon@gmail.com>
 <20121008110113.3032157c@skate>
Message-ID: <507570F4.1030809@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/2012 01:01 PM, Thomas Petazzoni wrote:
> Dear Valentine Barshak,
>
> On Mon,  8 Oct 2012 02:39:59 +0400, Valentine Barshak wrote:
>> The sylpheed headers are installed to $(DESTDIR)$(includedir),
>> while DESTDIR is $(TARGET_DIR) and includedir is set to
>> $(STAGING_DIR)/usr/include in the SYLPHEED_CONF_OPT.
>> Thus, the full staging directory path is created in the
>> target root filesystem, which is wrong.
>>
>> The includedir was set to staging include because sylpheed
>> incorrectly adds includedir to its include path, and does
>> not cross-compile with the default includedir set to
>> /usr/include.
>>
>> This removes includedir setting and also removes it from
>> include paths in Makefiles to prevent using host headers
>> from /usr/include. The same approach is used in the OE.
>>
>> Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
>
> If you have the time, it would be great to submit a patch to the
> upstream project in order to fix this problem.

Applied upstream:
http://www.sraoss.jp/pipermail/sylpheed/2012-October/005424.html

Thanks,
Val.

>
> Thanks,
>
> Thomas
>
