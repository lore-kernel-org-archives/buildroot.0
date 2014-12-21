From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 21 Dec 2014 22:24:31 +0100
Subject: [Buildroot] [PATCH RFC 2/2] package/perl-gd: Add a new option
 to set the path to gdlib-config
In-Reply-To: <20141221132027.0d69abf8@free-electrons.com>
References: <1419119460-1437-1-git-send-email-romain.naour@openwide.fr>	<1419119460-1437-2-git-send-email-romain.naour@openwide.fr>
 <20141221132027.0d69abf8@free-electrons.com>
Message-ID: <54973A8F.3080100@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 21/12/2014 13:20, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
>
> On Sun, 21 Dec 2014 00:51:00 +0100, Romain Naour wrote:
>> The build of perl-gd use the gdlib-config from the host that in result
>> incorect features enabled, incorrect header and library paths.
>>
>> Should fixes:
>> http://autobuild.buildroot.net/results/15c/15ce69b916167305aba2820a157c880e487ee8c7/
>> http://autobuild.buildroot.net/results/504/504d64d992eb504e02c127feb4734a917ad95d0a/
>> http://autobuild.buildroot.net/results/551/5512213c8861e51b390c1c223d53add0ec1ed758/
>>
>> And many more.
>>
>> Note:
>> In the generated Makefile, LDFLAGS still contains "-L/usr/local/lib"
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  .../0004-gdlib-config-is-now-configurable.patch    | 67 ++++++++++++++++++++++
>>  package/perl-gd/perl-gd.mk                         |  3 +-
>>  2 files changed, 69 insertions(+), 1 deletion(-)
>>  create mode 100644 package/perl-gd/0004-gdlib-config-is-now-configurable.patch
> We have another patch from Fran?ois for the same issue, at
> http://patchwork.ozlabs.org/patch/415924/. However, Peter raised some
> concerns about Fran?ois approach, and your patch indeed seems better.
>
> Fran?ois, can you comment/review Romain's patch? See
> http://patchwork.ozlabs.org/patch/423143/.
>
> Romain, any chance you can submit your patch upstream?
>
I'll do.

perl-gd upstream has added a new Build.PL file that has the same issues for cross-compiling. Also, Fran?ois's patches haven't been merged yet.

Best regards,
Romain Naour
