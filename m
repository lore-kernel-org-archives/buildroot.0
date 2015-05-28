From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 28 May 2015 06:10:01 +0300
Subject: [Buildroot] [PATCH] gcc/gcc-final: pass TARGET_ABI flags to
 configure with --enable-cxx-flags
In-Reply-To: <55663AFF.4090107@mind.be>
References: <1432625556-14611-1-git-send-email-jcmvbkbc@gmail.com>
 <55663AFF.4090107@mind.be>
Message-ID: <CAMo8BfKmBgweFoO3JoVv7gwBg1g3ba39ywGaYyH=CtmedSqWCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 28, 2015 at 12:45 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 05/26/15 09:32, Max Filippov wrote:
>> libstdc++ is in all regards a normal library, it needs to be built with
>> TARGET_ABI flags, otherwise linking it with other C++ code may fail.
>
>  Then why only do it for xtensa? And why not pass the full TARGET_CFLAGS?

To minimize the impact of the change: currently it's only problem for xtensa
and only TARGET_ABI flags are really missing.
Yes, passing TARGET_CFLAGS works too. And probably it works for other
architectures, but that needs testing. I can send v2 with these changes.

-- 
Thanks.
-- Max
