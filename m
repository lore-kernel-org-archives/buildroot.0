From: =?UTF-8?Q?Beno=C3=AEt_Mauduit?= <benoit.mauduit@gmail.com>
Date: Wed, 20 Jul 2011 10:10:36 +0200
Subject: [Buildroot] [PATCH 1/2] linux: Add Linux Kernel extensions menu
In-Reply-To: <CAAXf6LVOjw_pePUqiN3ikG0N=y_H=hGC8CXYMnUYk8rLURLJ0A@mail.gmail.com>
References: <1310572380-26403-1-git-send-email-benoit.mauduit@gmail.com>
 <1310572380-26403-2-git-send-email-benoit.mauduit@gmail.com>
 <CAAXf6LVOjw_pePUqiN3ikG0N=y_H=hGC8CXYMnUYk8rLURLJ0A@mail.gmail.com>
Message-ID: <CAHeZHmur1_YCf3VHevMbSHY9D92FOSfSsn3mfjcc1M=VSy5v-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 20, 2011 at 8:12 AM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hi,
Hi !

> On Wed, Jul 13, 2011 at 5:52 PM, ?<benoit.mauduit@gmail.com> wrote:
>> From: Benoit Mauduit <benoit.mauduit@openwide.fr>
>>
>> Add a kernel sub-menu (called "Linux Kernel Extensions"), which makes
>> possible to patch it or tweak the kernel build step.
>>
>> ?* All linux/*.mk files will be read by the make process.
>> ?* The menu can be customized in "linux/Config.ext.in".
>>
>> Signed-off-by: Benoit Mauduit <benoit.mauduit@openwide.fr>
>> ---
>> ?Makefile ? ? ? ? ? ?| ? ?2 +-
>> ?linux/Config.ext.in | ? ?3 +++
>> ?linux/Config.in ? ? | ? ?4 ++++
>> ?3 files changed, 8 insertions(+), 1 deletions(-)
>> ?create mode 100644 linux/Config.ext.in
>>
>> diff --git a/Makefile b/Makefile
>> index 2f3802c..27e4375 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -313,7 +313,7 @@ include package/*/*.mk
>>
>> ?include boot/common.mk
>> ?include target/Makefile.in
>> -include linux/linux.mk
>> +include linux/*.mk
>
> Shouldn't the linux.mk file be included *before* all the other .mk
> files? I can imagine that some of the extra .mk files depend on linux
> variables.
>

You are right, this is a mistake.
I suggest to name all linux makefile extension like that :
"xenomai_ext.mk".
And include them with:
include linux/*_ext.mk

Thanks !

-- 
Benoit Mauduit
