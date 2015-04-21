From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 21 Apr 2015 16:54:26 +0200
Subject: [Buildroot] [RFC 2/4] legal-info: allow to declare the actual
 sources for binary packages
In-Reply-To: <54D373D7.3010402@lucaceresoli.net>
References: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
 <1420199015-16907-3-git-send-email-luca@lucaceresoli.net>
 <54CFF057.2060000@mind.be> <54D373D7.3010402@lucaceresoli.net>
Message-ID: <553664A2.6050705@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

for the records, I have not forgot this patchset...

Luca Ceresoli wrote:
> Dear Arnout,
>
> Arnout Vandecappelle wrote:
[...]
>>> +else
>>> +ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
>>> +    $(call
>>> DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE:/=)/$$($(2)$($(PKG)_SITE:/=)_ACTUAL_SOURCE_TARBALL))
>>>
>>
>>   I think the $($(PKG)_SITE:/=) construct was just introduced because
>> for some
>> packages, the _SITE ends with a / and that should be stripped, and we
>> were too
>> lazy to fix the packages. Hm, looks like all the the external
>> toolchain _SITEs
>> end with a /...
>
> So I'll remove all of those '/'s from toolchain-external.mk first...

I started working on Arnout's comment above and sent a patchset to
cleanup _SITE URLs with a trailing '/'. I sent a patchset in March
(http://lists.busybox.net/pipermail/buildroot/2015-March/121502.html)
for that.

That patchset was partially applied, but an improvement was asked before
it could be fully applied.

So the present patchset sits on the bottom of my stack, until I have
time to implement the requested improvement...

I marked this patched as "Changes Requested" in patchwork, and will
send a v2 when possible, along with the other improvements requested
in this thread (which hopefully won't push again on my stack!).

-- 
Luca
