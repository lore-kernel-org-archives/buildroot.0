From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Aug 2018 22:22:31 +0200
Subject: [Buildroot] [PATCH 3/3] support/download: detect and abort when
 using a git branch by name
In-Reply-To: <5b74cda659f07_64da2abc4a138cc0754d@ultri5.mail>
References: <20180813160657.GD7915@scaer>
 <5b74cda659f07_64da2abc4a138cc0754d@ultri5.mail>
Message-ID: <8f16afc7-b1c8-ad3a-038a-1a74d9722cee@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/08/2018 03:04, Ricardo Martincoski wrote:
> Hello,
> 
> On Mon, Aug 13, 2018 at 01:06 PM, Yann E. MORIN wrote:
> 
>> On 2018-08-13 11:13 -0300, ricardo.martincoski at gmail.com spake thusly:
>>> On Sun, Aug 12, 2018 at 05:48 PM, Yann E. MORIN wrote:
[snip]
>>> So the best approach IMO is to ask "given we want a named ref, is that ref a
>>> branch in the remote?". That obviously lead to using git ls-remote and check
>>> the second column:
>>
>> I would prefer to avoid another round-trip to the remote, when we have
>> the necessary information locally. What about the git-show-ref snippet I
>> pasted above instead?
> 
> In the other hand with ls-remote we could fail faster, before downloading any
> refs.

 A failure in this case is because the developer specified a branch name instead
of a tag or sha. He in the end still wants to download that specific ref. So
downloading it before the check does make sense, because that way the cache is
already populated and the next attempt will go faster.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
