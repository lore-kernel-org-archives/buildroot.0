From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 13 Feb 2018 01:14:40 -0200
Subject: [Buildroot] [PATCH 08/14] diffconfig: fix code style
References: <20180130202512.GA7723@gmail.com>
Message-ID: <5a825820cac23_51963fbb9c9c7128471b1@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Jan 30, 2018 at 06:25 PM, Marcus Folkesson wrote:

> On Mon, Jan 29, 2018 at 11:11:52PM +0100, Thomas Petazzoni wrote:
[snip]
>> I haven't applied this one, because I don't really like the fact that
>> we're further tweaking a script that comes from the kernel sources. On
>> the other hand, we have already tweaked it for our purposes.
>>
>> What do others think? Should we stay as close to the original upstream
>> version as possible? Or because we have anyway already tweaked it, we
>> don't really care and can now do whatever changes we believe are useful?

I am happy either way.
If no one argues against, I will make flake8 ignore the file.

> Well, I will try to keep the script reasonably synchronized between the
> buildroot and kernel repo, and these type of patches does not really
> help with that.

Ignoring the file can be accomplished by 2 ways:

Adding this line to utils/diffconfig
# flake8: noqa

Adding this line to .flake8
exclude=utils/diffconfig

It looks to me the later is preferable. This way a script that don't need any
tweak can be a raw copy from the original.

Regards,
Ricardo
