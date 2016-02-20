From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2016 19:08:03 +0100
Subject: [Buildroot] [PATCH v2 05/18] erlang-rebar: bump to version 2.6.1
In-Reply-To: <20160220183731.57f5122f@free-electrons.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-6-git-send-email-fhunleth@troodon-software.com>
 <56B67620.1040700@gmail.com>
 <20160220183731.57f5122f@free-electrons.com>
Message-ID: <20160220180803.GQ3418@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All

On 2016-02-20 18:37 +0100, Thomas Petazzoni spake thusly:
[--SNIP--]
> However, I am not sure about the license information of erlang-rebar.
> We currently have:
> 
> # Although the file LICENSE state Apache-2.0, a lot (if not all) the files
> # in src/ bear the MIT licence.
> ERLANG_LICENSE = Apache-2.0, MIT
> ERLANG_LICENSE_FILES = LICENSE
> 
> But the LICENSE file is really only the text of Apache-2.0. It is not
> because many of the source files carry the MIT license that the whole
> is not licensed under Apache-2.0. The MIT license is a permissive
> license, so MIT code can be included into a project that is
> redistributed only under the Apache 2.0 license.

IANAL, TTYL and so on... ;-)

Well, that's not how licensing works.

Individual files have their own licenses, and they retain those licenses
even when they are combined together. So, if you have two files under
two licenses, like so:
    file-1.c    MIT
    file-2.c    Apache-2.0

If the two licenses are "compatible", then you are allowed to combine
the two files to produce a derived work. That derived work is then
governed by both licenses. In effect, the most stringent license will
dominate, but the other will still apply.

Let's take two hypotetical licenses:

  - the Hello License, which states: If you use that file, you must say
    Hello to the closest Human being.

  - the Tea-Now License, which states: If you use that file, you must
    drink a tea now.

Those two licenses are compatible (i.e. you can say Hello and drink a
tea), so you can combine them. Still, you have to do both, not either.

So yes, we need to specify *all* the licenses that govern files used to
generate the output.

Note that the licenses list in Buildroot is to be interpreted as:
    The combined work generated from this package is governed by those
    licenses.

It is not to be interpreted as:
    You may redistribute the combined work of this program under those
    licenses.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
