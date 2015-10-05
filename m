From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 5 Oct 2015 15:59:59 -0300
Subject: [Buildroot] [PATCH v2 2/2] axfs: add new filesystem type
In-Reply-To: <5612C712.6020209@mind.be>
References: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1444064102-13575-3-git-send-email-ariel@vanguardiasur.com.ar>
 <5612C712.6020209@mind.be>
Message-ID: <CAAEAJfD9aqax=VA3oXocGUC37GNt3AspfdNrWSroOMntBx1hqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 October 2015 at 15:53, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 05-10-15 17:55, Ariel D'Alessandro wrote:
>> The Advanced XIP File System is a Linux kernel filesystem driver that enables
>> files to be executed directly from flash or ROM memory rather than being copied
>> into RAM.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
>> ---
>>  fs/Config.in      |  1 +
>>  fs/axfs/Config.in |  4 ++++
>>  fs/axfs/axfs.mk   | 13 +++++++++++++
>>  3 files changed, 18 insertions(+)
>>  create mode 100644 fs/axfs/Config.in
>>  create mode 100644 fs/axfs/axfs.mk
>>
>> diff --git a/fs/Config.in b/fs/Config.in
>> index 5853113..51ccf28 100644
>> --- a/fs/Config.in
>> +++ b/fs/Config.in
>> @@ -1,5 +1,6 @@
>>  menu "Filesystem images"
>>
>> +source "fs/axfs/Config.in"
>>  source "fs/cloop/Config.in"
>>  source "fs/cpio/Config.in"
>>  source "fs/cramfs/Config.in"
>> diff --git a/fs/axfs/Config.in b/fs/axfs/Config.in
>> new file mode 100644
>> index 0000000..7e25fe7
>> --- /dev/null
>> +++ b/fs/axfs/Config.in
>> @@ -0,0 +1,4 @@
>> +config BR2_TARGET_ROOTFS_AXFS
>> +     bool "axfs root filesystem"
>> +     help
>> +       Build an axfs root filesystem
>
>  This needs a lot more explanation. For starters, repeat the explanation you put
> in the commit message (but wrap at 72 columns!). And perhaps you should add that
> all files will be XIPified (or whatever the verb is). Also, you should mention
> that the kernel has to be built with the axfs patches to be able to read it.
>
>  It would be nice to add the axfs kernel side as a kernel extension as well. But
> that looks heavily non-trivial.
>

Should we clarify that the FS is not supported in Linux mainline?
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
