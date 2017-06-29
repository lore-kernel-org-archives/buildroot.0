From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Jun 2017 07:32:30 +0200
Subject: [Buildroot] [PATCH v5] autofs: allow to use libtirpc instead of
	internal C implementation
In-Reply-To: <b42395c2-82e8-5eab-83a2-cd0a8f54898d@mind.be>
References: <20170628105037.GA28275@waldemar-brodkorb.de>
 <20170628204501.GA2973@scaer> <20170628215007.GB2973@scaer>
 <b42395c2-82e8-5eab-83a2-cd0a8f54898d@mind.be>
Message-ID: <4223C98A-A76A-4F7A-84C6-5ABF8E3ED74D@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Waldemar, All,

On June 29, 2017 12:43:44 AM GMT+02:00, Arnout Vandecappelle <arnout@mind.be> wrote:
>On 28-06-17 23:50, Yann E. MORIN wrote:
>> On 2017-06-28 22:45 +0200, Yann E. MORIN spake thusly:
[snip]
>> So, it looks like aclocal.m4 acts as a kind of "I bundle all I
>> need, don't look in system include dirs".
>
>Yep, that's exactly what aclocal does... However, autoreconf should
>remove
>aclocal.m4 and regenerate it. Or is that the problem, that aclocal.m4
>contains
>something hand-written and it gets overwritten by autoreconf?

Exactly. They have (only?) custom macros in there. Hence the reason
I suggest it is renamed and moved to m4/autofs-macros.m4

Regards,
Yann E. MORIN.

> Regards,
> Arnout


-- 
Sent from my phone. Please excuse my brevity.
