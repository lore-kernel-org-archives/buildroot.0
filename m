From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 3 Oct 2013 09:34:47 +0200
Subject: [Buildroot] [PATCH 2 of 3 v2] manual: add section about
 depending on target and toolchain options
In-Reply-To: <524D00D9.9070800@mind.be>
References: <patchbomb.1380099393@argentina>
 <679aaf4f4d6cb323f13d.1380099395@argentina>
 <524D00D9.9070800@mind.be>
Message-ID: <CAAXf6LXLV59szv9d-7FJJdGE=cOvvDowTTZGpWep5vyFFxJ2jQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, Oct 3, 2013 at 7:30 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 09/25/13 10:56, Thomas De Schampheleire wrote:
[..]
>> Notes:
>> - How we will specify the C library is currently marked as 'to be
>> decided'.
>> This patch series does not yet unify that, but I plan to do that in a new
>> patch (or update this series if we can reach a decision shortly).  The
>> problem
>> is that not all packages that have a dependency on e.g. glibc add a
>> comment to
>> show this to the user. A proposal would be to have a comment like:
>>      foo needs a (e)glibc toolchain w/ featA, featB, featC
>> where the '(e)glibc' string would be left out if there is no constraint on
>> the
>> C library.
>
>
>  Looks good to me. Though for glibc there is only one feature AFAIK: C++.
>
>

I'm not sure what you mean here. I think that some packages depend on
an (e)glibc toolchain because it requires certain features that are
lacking in uclibc. I haven't checked for the details though. It may be
the presence of certain system calls.

[..]

>> +[[dependencies-target-toolchain-options]]
>> +Dependencies on target and toolchain options
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> +Many packages depend on certain options of the toolchain, like the
>
>
>  "like" indicates that you're giving a few examples, but you're actually
> giving an exhaustive list. So instead I't put a colon.
>

Ok, will fix.

>
>> +C library, C++ support, largefile support, thread support, RPC
>
>
>  the choice of C library,

Ok, will fix.

>
>
>> +support, IPv6 support, wchar support, or dynamic libraries. Some
>
>
>  dynamic library support.

This is partially related to the PREFER_STATIC_LIB discussion, but
right now it's probably cleaner to add support, so will fix.

[..]
>> +
>> +The rest of this section enumerates the different target and toolchain
>> +options, the corresponding config symbols to depend on, and the string
>> +literals to use in the comment.
>
>
>  "string literals" sounds a bit strange here. "text" seems more appropriate
> to me.
>

Ok, will fix.

>
>> +
>> +* Target architecture
>> +** Dependency symbol: +BR2_powerpc+, +BR2_mips+, ... (see
>> +arch/Config.in+)
>> +** Comment string: no comment to be added
>> +
>
>
>  I could be wrong, but I think asciidoc doesn't allow an empty line here:
> you'll end up with two <ul>s with a single <li>. Can you verify that?

I do see one overal <ul> with several list items 'target
architecture', 'mmu support', etc. so it looks ok to me.

[..]
>> +
>> +* dynamic library
>> +** Dependency symbol: +BR2_PREFER_STATIC_LIB+
>
>
>  !BR2_PREFER_STATIC_LIB

Ok, that's clearer, will fix.

>
>
>> +** Comment string: +dynamic library+
>
>
>  For the sake of brevity, maybe "DLL"?

DLL really has a Windows annotation for me. Moreover, it's not so
commonly used in the Linux world, don't you think?

Thanks for your review!

Best regards,
Thomas
