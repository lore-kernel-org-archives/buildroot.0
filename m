From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 17 Mar 2016 14:39:36 +0300
Subject: [Buildroot] [PATCH 05/16] uclibc: disable DOPIC on ARM noMMU
In-Reply-To: <20160317120003.0ff6b5be@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <56E9E791.3090104@mind.be>
 <20160317090648.3900c10a@free-electrons.com>
 <CAMo8BfK66_TVGbJo=4TBmXATSX=7axE1+=Xj9Q1vdTBCdJUG0g@mail.gmail.com>
 <20160317120003.0ff6b5be@free-electrons.com>
Message-ID: <CAMo8BfKGOY0XmLqaf49iS7q5ruLcf+WxVh1pboWe2xA0X2=6Ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 17, 2016 at 2:00 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 17 Mar 2016 13:32:46 +0300, Max Filippov wrote:
>
>> > I have no idea if Xtensa noMMU has ever been tested, whether it uses
>> > FLAT or FDPIC, etc. Could we leave this up to people interested in
>> > Xtensa ? Or alternatively, remove noMMU Xtensa support altogether.
>> >
>> > I'm Cc'ing Max to see if he knows what the status of noMMU Xtensa is.
>>
>> I tested noMMU xtensa lightly. It uses FLAT
>> ( https://github.com/uclinux-dev/elf2flt/commit/052ec62c087a3e9dfb62d231ee4aad253bce2f7e
>> ),
>> requires a patch for gcc
>> ( https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e3c15dbe1c4cd63d906eb67c1c607cc4fab6b329
>> ),
>> and currently it defaults to generating PIC code.
>> It appears to work with both DOPIC enabled and disabled.
>
> Does it work within Buildroot? I think we should either have support
> for Xtensa noMMU and make it work, or we should remove it.
>
> From what you say, if it doesn't work already, it seems like it should
> be a huge work to get it working, right?

It should not, yes. Let me post the patches.

-- 
Thanks.
-- Max
