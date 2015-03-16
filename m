From: Lionel Orry <lionel.orry@gmail.com>
Date: Mon, 16 Mar 2015 07:43:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/zeromq: enable kernel-based
 feature flags
In-Reply-To: <20150315232850.21412e3a@free-electrons.com>
References: <1423214752-29779-1-git-send-email-lionel.orry@gmail.com>
 <20150315232850.21412e3a@free-electrons.com>
Message-ID: <CAKAx1cjF8Q9ZTJXg4yxHkqQFFkzAEEKzU5V852XZtQMw=59LPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Mar 15, 2015 at 11:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Lionel Orry,
>
> On Fri,  6 Feb 2015 10:25:52 +0100, Lionel Orry wrote:
>> The current configuration system does not check for cached variables for
>> these flags, and thus they are always disabled when cross-compiling.
>> This patch fixes the configuration system to use cached variables and
>> enables them at configuration time.
>>
>> Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
>> ---
>>  ...e.m4-make-kernel-specific-flags-cacheable.patch | 204 +++++++++++++++++++++
>>  package/zeromq/zeromq.mk                           |  10 +
>>  2 files changed, 214 insertions(+)
>>  create mode 100644 package/zeromq/0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch
>
> Thanks for this patch, and sorry for the slow response.
>
> However, I believe it would be a lot better to change the acinclude.m4
> tests to not use AC_TRY_RUN, but instead to simply test if TCP_KEEPCNT,
> TCP_KEEPIDLE, etc. exist at compile time. If they are defined in the
> kernel headers, then you know the kernel supports them, since running a
> kernel older than the kernel headers used in the toolchain cannot work.
>
> So, replace AC_TRY_RUN with AC_TRY_LINK or something like that. Or
> maybe there's even a simpler autoconf macro to test if a definition
> exists or not.

the fact is, I was asked by Arnout to do it that way, and his opinion
was that it was needed to run the snippet on the target to be sure of
the resut. See:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/106055

Is there something I misunderstood ? Who has the final call about this ?

>
> Can you try this instead?
>
> Also, did you submit your patch upstream?

Yes I did, it has been merged into the next branch of zeromq, v4.1.x.

>
> Thanks a lot,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Best regards,
Lionel
