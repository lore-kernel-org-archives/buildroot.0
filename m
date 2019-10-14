From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Oct 2019 09:27:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-ws4py: add patch to fit
 Python 3.7 syntax
In-Reply-To: <CALFsTFWcHWQuOaeS06PCcQ4sm4wCR7UhxWa1DOZg7YCm9dtNsQ@mail.gmail.com>
References: <20191013141601.6662-1-asafka7@gmail.com>
 <5b972d9c-1b8c-5729-ead2-c2289532f733@mind.be>
 <CALFsTFWcHWQuOaeS06PCcQ4sm4wCR7UhxWa1DOZg7YCm9dtNsQ@mail.gmail.com>
Message-ID: <038b539f-e579-3ab5-29f8-40d2d57a5ccb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/10/2019 07:44, Asaf Kahlon wrote:
> Hello,
> 
> On Sun, Oct 13, 2019 at 11:43 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 13/10/2019 16:16, Asaf Kahlon wrote:
>>> Fixes:
>>>  - http://autobuild.buildroot.net/results/2999d8de19ed7bf7a5ce148da4b1b98f144bad9b
>>>
>>> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
>>> ---
>>>  ...1-Adjust-ws4py-for-Python-3.7-syntax.patch | 55 +++++++++++++++++++
>>>  1 file changed, 55 insertions(+)
>>>  create mode 100644 package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
>>>
>>> diff --git a/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch b/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
>>> new file mode 100644
>>> index 0000000000..07fbb6ccc1
>>> --- /dev/null
>>> +++ b/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
>>> @@ -0,0 +1,55 @@
>>> +From dfe6f65b7078315c32cebb727e9c47ead7603475 Mon Sep 17 00:00:00 2001
>>> +From: Asaf Kahlon <asafka7@gmail.com>
>>> +Date: Sun, 13 Oct 2019 16:44:44 +0300
>>> +Subject: [PATCH 1/1] Adjust ws4py for Python 3.7 syntax
>>> +
>>> +Since Python 3.7, "async" has become a keyword and cannot be used.
>>> +Thus, instead of asyncio.async we will use asyncio.ensure_future.
>>> +
>>> +There's also a pull request with this change:
>>> +https://github.com/Lawouach/WebSocket-for-Python/pull/245
>>
>>  So why don't you use the commit from that PR? It looks more complete because it
>> also fixes a test (not really relevant for us, obviously, but we prefer upstream
>> commits or PRs...)
> 
> Actually, I tried that, but then I realized that the patch won't apply
> since the test file is not included on the tarball.
> 
>>
>>> +
>>> +Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
>>
>>  You would still need your SoB to it of course.
>>
> 
> It probably doesn't matter, but the guy doesn't have his own SoB on the PR...
> 
> Anyway, it seems like the original patch can't be taken as-is.
> Maybe I should amend the commit message to make it clear why a custom
> patch is needed?

 Don't bother, I did that and applied to master, thanks.

 Regards,
 Arnout
