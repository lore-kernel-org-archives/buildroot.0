From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 2 May 2014 13:25:59 +0200
Subject: [Buildroot] [PATCH] manual: use one-line titles instead of
 two-line titles (trivial)
In-Reply-To: <20140502104351.GB3503@free.fr>
References: <0f7edee196f1f7a6643f.1399009650@argentina>
 <20140502104351.GB3503@free.fr>
Message-ID: <CAAXf6LVP1xtcgBRD5ztrKt9mSbOC5JK-3aO20PDjVL1TrfcxBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, May 2, 2014 at 12:43 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2014-05-02 07:47 +0200, Thomas De Schampheleire spake thusly:
>> Asciidoc supports two syntaxes for section titles: two-line titles (title
>> plus underline consisting of a particular symbol), and one-line titles
>> (title prefixed with a specific number of = signs).
> [--SNIP--]
>> and the one-line title prefixes:
>> = Document Title (level 0) =
>> == Section title (level 1) ==
>> === Section title (level 2) ===
>> ==== Section title (level 3) ====
>> ===== Section title (level 4) =====
>
> Here you use both a prefix and a suffix...
>
>> diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
>> --- a/docs/manual/adding-packages-autotools.txt
>> +++ b/docs/manual/adding-packages-autotools.txt
>> @@ -1,13 +1,11 @@
>>  // -*- mode:doc; -*-
>>  // vim: set syntax=asciidoc:
>>
>> -Infrastructure for autotools-based packages
>> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +=== Infrastructure for autotools-based packages
>
> ... but your script only added the prefix.
>
> I just checked, and asciidoc does the right thing. The asciidoc site
> itself is written with only the prefixes, and the doc says the suffix is
> optional.
>
> Yet, I found it weird that the commit log says one thing, but the patch
> does it differently. I don't care either way, but it should have been
> coherent.

Sorry about this irregularity in the commit message. That part was
copied verbatim from the asciidoc documentation, and I did not fully
realize it still had the suffixes which I didn't add in the actual
code.
I don't like the optional suffixes a lot, as it doesn't provide any
more clarity than the prefix does and is overhead to type (and
change). So not adding the suffixes was intentional (I was aware that
it's optional in asciidoc).

Thanks for the feedback,
Thomas
