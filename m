From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Feb 2016 00:05:10 +0100
Subject: [Buildroot] [PATCH v2 05/18] erlang-rebar: bump to version 2.6.1
In-Reply-To: <20160220180803.GQ3418@free.fr>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-6-git-send-email-fhunleth@troodon-software.com>
 <56B67620.1040700@gmail.com> <20160220183731.57f5122f@free-electrons.com>
 <20160220180803.GQ3418@free.fr>
Message-ID: <56C8F126.1040903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/20/16 19:08, Yann E. MORIN wrote:
> Thomas, All
> 
> On 2016-02-20 18:37 +0100, Thomas Petazzoni spake thusly:
> [--SNIP--]
>> However, I am not sure about the license information of erlang-rebar.
>> We currently have:
>>
>> # Although the file LICENSE state Apache-2.0, a lot (if not all) the files
>> # in src/ bear the MIT licence.
>> ERLANG_LICENSE = Apache-2.0, MIT
>> ERLANG_LICENSE_FILES = LICENSE
>>
>> But the LICENSE file is really only the text of Apache-2.0. It is not
>> because many of the source files carry the MIT license that the whole
>> is not licensed under Apache-2.0. The MIT license is a permissive
>> license, so MIT code can be included into a project that is
>> redistributed only under the Apache 2.0 license.
> 
> IANAL, TTYL and so on... ;-)
> 
> Well, that's not how licensing works.
> 
> Individual files have their own licenses, and they retain those licenses
> even when they are combined together. So, if you have two files under
> two licenses, like so:
>     file-1.c    MIT
>     file-2.c    Apache-2.0

 Actually, I think it's not really the files that carry a license. It is how you
got it. This shows in packages that are dual licensed (i.e., with an OR), where
it is possible that you got it under only one of those licenses (e.g. because it
was combined with another work that puts constraints on it).

 And unfortunately, it is not very clear under which license you received the
code when you got it through a combined work. You _could_ claim that because you
received these files as part of the erlang-rebar package, you have only received
file-1.c under the MIT license. However, you could also claim that the
distributors of erlang-rebar never intended to change the license of file-1.c,
so that that individual file can still be used under the MIT license. So:
situation is not clear IMHO.


> If the two licenses are "compatible", then you are allowed to combine
> the two files to produce a derived work. That derived work is then
> governed by both licenses. In effect, the most stringent license will
> dominate, but the other will still apply.
> 
> Let's take two hypotetical licenses:
> 
>   - the Hello License, which states: If you use that file, you must say
>     Hello to the closest Human being.
> 
>   - the Tea-Now License, which states: If you use that file, you must
>     drink a tea now.
> 
> Those two licenses are compatible (i.e. you can say Hello and drink a
> tea), so you can combine them. Still, you have to do both, not either.
> 
> So yes, we need to specify *all* the licenses that govern files used to
> generate the output.
> 
> Note that the licenses list in Buildroot is to be interpreted as:
>     The combined work generated from this package is governed by those
>     licenses.

 I don't think we can put that strong a claim, I think it is: the combined work
generated from this package may be governed by those licenses.

 One example where the 'may' is important is when you configured out some file,
and that was the only file under a particular license, then that license doesn't
apply anymore to the combined work.

 Regards,
 Arnout


> 
> It is not to be interpreted as:
>     You may redistribute the combined work of this program under those
>     licenses.
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
