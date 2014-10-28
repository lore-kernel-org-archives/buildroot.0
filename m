From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 28 Oct 2014 11:43:34 +0300
Subject: [Buildroot] [PATCH] package/schifra: move -o option from
	OPTIONS to build commands
In-Reply-To: <CAMo8BfL5VgrpMv=6nKyDNMPO_fyq903dbWQj2PnPTxesergLYQ@mail.gmail.com>
References: <1414477058-3382-1-git-send-email-jcmvbkbc@gmail.com>
 <544F4EE1.5010508@mind.be>
 <CAMo8BfL5VgrpMv=6nKyDNMPO_fyq903dbWQj2PnPTxesergLYQ@mail.gmail.com>
Message-ID: <CAMo8BfK0hmMLRPCGroCOWB5PWmwZsmrFjX8_wKBaAE6aezrckw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 28, 2014 at 11:25 AM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Tue, Oct 28, 2014 at 11:08 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 28/10/14 07:17, Max Filippov wrote:
>>> This allows redefining OPTIONS w/o risk of having too many or too few -o
>>> in the end of it.
>>>
>>> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>>> ---
>>>  package/schifra/0001-fix-makefile-options.patch |  119 +++++++++++++++++++++++
>>>  1 files changed, 119 insertions(+), 0 deletions(-)
>>>  create mode 100644 package/schifra/0001-fix-makefile-options.patch
>>>
>>> diff --git a/package/schifra/0001-fix-makefile-options.patch b/package/schifra/0001-fix-makefile-options.patch
>>> new file mode 100644
>>> index 0000000..c8395e9
>>> --- /dev/null
>>> +++ b/package/schifra/0001-fix-makefile-options.patch
>>> @@ -0,0 +1,119 @@
>>> +Move -o option from OPTIONS to build commands
>>> +
>>> +This allows redefining OPTIONS w/o risk of having too many or too few -o
>>> +in the end of it.
>>> +
>>> +Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>>> +
>>> +--- schifra-0.0.1/Makefile   1999-12-31 17:00:00.000000000 +0300
>>> ++++ schifra-0.0.1/Makefile.new       2014-10-28 10:07:19.000000000 +0400
>>> +@@ -22,7 +22,7 @@
>>> +
>>> + COMPILER         = -c++
>>> + OPTIMIZATION_OPT = -O3
>>> +-OPTIONS          = -ansi -pedantic-errors -Wall -Wextra -Werror -Wno-long-long -lstdc++ $(OPTIMIZATION_OPT) -o
>>> ++OPTIONS          = -ansi -pedantic-errors -Wall -Wextra -Werror -Wno-long-long -lstdc++ $(OPTIMIZATION_OPT)
>>
>>  This patch doesn't apply to my schifra... In fact, the Makefile in my schifra
>> looks as if this patch has already been applied! So I think upstream has changed
>> the tarball without changing the version (well, actually, there is no version in
>> the tarball, but the Makefile etc. still claim it's version 0.0.1).
>>
>>  This thing desperately needs a hash! My schifra.tgz has sh256sum
>> 3e60478cf024d87735d1cc1460aa2176c449e6c7f76914eefda25d3b20d22522  schifra.tgz
>
> Oh, great. That explains it. Mine:
> df59cf287b7f8923ec28a99971673a48a4147d961ed0588f9fe0f62a4d09344e  dl/schifra.tgz

My version was downloaded 2014-06-01, after removing and re-fetching it
it builds well with your patch.

-- 
Thanks.
-- Max
