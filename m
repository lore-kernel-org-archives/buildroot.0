From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Feb 2021 12:28:31 +0100
Subject: [Buildroot] [PATCH] package/plg-utils: escape \ in generated
 legal-info
In-Reply-To: <87sg681aq7.fsf@dell.be.48ers.dk>
References: <20210206085102.1017439-1-yann.morin.1998@free.fr>
 <87sg681aq7.fsf@dell.be.48ers.dk>
Message-ID: <20210207112831.GK2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-02-07 10:35 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> I still wonder if it wouldn't be better to not have the backslashes in
> the variable and do whatever escaping is needed inside the CVE logic,

I think quite the opposite, in fact: we want the CPE_ID value to be
exactly what is in the NVD database without any mangling on our side.

The rules to encode the CPE stuff are non-trivial at least to me),
requiring some escaping/de-escaping in the various formats, and with
different rules for the attributes and their representation

All is defined in NISTIR 7695 [0], in the following chapters:
    5.3.2 - Restrictions on attribute-value strings
    6.2.1 - Syntax for Formatted String Binding

[0] https://doi.org/10.6028/NIST.IR.7695

> but OK - We need a quick fix and this solves it.
> 
> Perhaps we should add a gitlab test to verify that we generate valid
> json, E.G. by piping it to jq (or similar).

Yeah, I'm working on it... But we can't do that in gitlab, because the
output of show-info depends on the selected packages, so it would have
to be done in the autobuilders.

> Committed, thanks.

Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
