From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Aug 2013 12:33:04 +0200
Subject: [Buildroot] [PATCH v2] pkg-download: take some more care of
 <PKG_>VERSION with git
In-Reply-To: <520A618A.7060005@mind.be>
References: <1364931609-2459-1-git-send-email-Patrick.Boettcher@parrot.com>
 <20130813121539.58b5e801@skate> <520A618A.7060005@mind.be>
Message-ID: <CAAXf6LUB2q60HfoX4fCnJZDMiJaR0gzi9N-xNNt+f8MFEBqQcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 13, 2013 at 6:40 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 13/08/13 12:15, Thomas Petazzoni wrote:
>>
>> Hello,
>>
>> On Tue,  2 Apr 2013 21:40:08 +0200, Patrick Boettcher wrote:
>>>
>>> This replaces the one-liner patch I made last week after a comment by
>>> Thomas De Schampheleire. (it is now a 5-liner)
>>>
>>> I added comment to explain why using HEAD is better in the current
>>> situation. I did not change the hg-part as it is different to git -
>>> after a quick read it won't work at all when VERSION is not set in a
>>> packge.
>>>
>>> Please apply if appropriate and helpful (it is for me).
>>>
>>> Patrick Boettcher (1):
>>>    pkg-download: take some more care of <PKG_>VERSION when METHOD is git
>>>
>>>   package/pkg-download.mk |    6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>>
>> Thomas, Arnout, Gustavo, some thoughts about this patch?
>>
>> I'm not a big fan of the fact that <pkg>_VERSION would be optional for
>> the git site method, but mandatory for the hg site method, but it's not
>> really a strong opinion.
>
>
>  Considering the commit message of 3a7a0a which you just committed:
>
> "Specifying a floating tag like HEAD for a repository version is bad
> practice, as it results in non-reproducible builds."
>
> I would say this is a bad idea. Instead, there could be a check that
> PKG_VERSION is not empty.

I agree with this suggestion, this would be a better solution for the
mentioned problem.

Best regards,
Thomas
