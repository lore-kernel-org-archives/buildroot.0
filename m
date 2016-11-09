From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 9 Nov 2016 00:18:07 -0800
Subject: [Buildroot] [PATCH] package/e2fsprogs: backport build fix for
 rhel5 due to missing magic
In-Reply-To: <20161109080341.5vmnkhdchbibzofz@tarshish>
References: <1478677142-11627-1-git-send-email-jcmvbkbc@gmail.com>
 <20161109080341.5vmnkhdchbibzofz@tarshish>
Message-ID: <CAMo8BfJnGVYAd_3nUDFZbtWDQNkTOcOr_z6NpV9OK8YKNS4N8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Wed, Nov 9, 2016 at 12:03 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> On Tue, Nov 08, 2016 at 11:39:02PM -0800, Max Filippov wrote:
>> RHEL 5.x does have magic.h, but it does not define all expected symbols. In
>> particular, the NO_CHECK symbols were only added in file 4.20 and RHEL 5.x
>> is using 4.17.
>
> Instead of relying on host libmagic that may or may not be installed, why not
> add host-file to HOST_E2FSPROGS_DEPENDENCIES?

My first reaction was to look if the issue is addressed in the package mainline,
and that's how e2fsprogs mainline decided to deal with that. So the next
version bump of e2fsprogs will make host-libmagic not necessary, there's
probably no reason to introduce that dependency?

"libmagic installed" vs. "not installed" is handled well by e2fsprogs, it's
"installed, but too old" case that fails.

-- 
Thanks.
-- Max
