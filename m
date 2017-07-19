From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Jul 2017 13:49:51 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: add test of BR2_CCACHE
 with an external toolchain
In-Reply-To: <596ebdb223c47_3a713fbb44b45304469cb@ultri3.mail>
References: <2bb2847d-c094-2319-5de2-9ea540acf8bf@mind.be>
 <596ebdb223c47_3a713fbb44b45304469cb@ultri3.mail>
Message-ID: <b9055307-0fa8-b618-509f-9d31416ae66e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-07-17 04:02, Ricardo Martincoski wrote:
> Hello,
> 
> On Tue, Jul 18, 2017 at 06:38 AM, Arnout Vandecappelle wrote:
> 
>> On 15-07-17 05:07, Ricardo Martincoski wrote:
>>> [snip]
>>>> +        self.config = self.config + self.extraconfig.format(builddir = self.builddir)
>>> 3 nits:
>>> - why not += ?
>>  Because config is initialized as a class member, and += would update the class
>> member instead of the instance member like we want.
[snip]
> The same does not apply to strings, only to mutable objects.

 Right, I didn't think of that! I just learned to be wary of using += when the
left-hand side is a class member (or function argument with a default value), I
didn't consider mutability.


> But if i.e. for some reason we change the type of config from string to an array
> of lines the += would need to be changed, while your code would still work.

 However, with Yann's change in '[PATCHv3] support/tests: allow properly
indented config fragment', self.config will already have been updated to be an
instance member instead of a class member. Therefore, += should be fine.

 I'll respin with all your nits applied.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
