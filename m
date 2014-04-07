From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 07 Apr 2014 23:48:39 +0200
Subject: [Buildroot] [PATCH v3] infra: Add PRE_*_HOOKS for every step
In-Reply-To: <20140406143133.69594f69@skate>
References: <1396031372-23308-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20140406143133.69594f69@skate>
Message-ID: <53431D37.4090601@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni wrote:
> Hello,
>
> On Fri, 28 Mar 2014 19:29:32 +0100, Maxime Hadjinlian wrote:
>
>> +* +LIBFOO_PRE_LEGAL_INFO_HOOKS+
>>   * +LIBFOO_POST_LEGAL_INFO_HOOKS+
>
> I'm generally fine with the patch, but I'm wondering what's the
> usefulness of the legal-info hooks. I know you're merely adding a
> pre-hook to match an existing post-hook, but I'm wondering what would
> be the usage of a post-legal-info hook actually.
>
> Luca?

Maybe some mysterious package wants to save some additional files in the
sources directory, or anything even more strange...?
No, I can't really think of anything sound.

OTOH having pre- and post-hooks for all steps /except one/ does not look
very polished, and I think the effort to maintain an unused hook is
minimal.

So I would keep Maxime's patch as-is, unless there is a solid
reason to do otherwise.

-- 
Luca
