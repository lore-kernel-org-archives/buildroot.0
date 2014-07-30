From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 30 Jul 2014 18:07:19 +0200
Subject: [Buildroot] [PATCH v2 3/3] apply-patches.sh: don't print
 anything when "make -s" is used
In-Reply-To: <f104a79f-5b3e-46d5-9ad1-a5470e1137fe@email.android.com>
References: <1406306319-11972-1-git-send-email-fabio.porcedda@gmail.com>
 <1406306319-11972-4-git-send-email-fabio.porcedda@gmail.com>
 <20140725174515.GE3955@free.fr>
 <f104a79f-5b3e-46d5-9ad1-a5470e1137fe@email.android.com>
Message-ID: <CAHkwnC_JbAt3wkoqLZkQTK4+4qa3=OfP=Y6u+63ysXjUPnbn=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 26, 2014 at 7:31 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>>Fabio, All,
>>
>>On 2014-07-25 18:38 +0200, Fabio Porcedda spake thusly:
>>> The make "-s" option is used to enable the "Silent operation" so if that
>>> option is used don't print anything as far as there isn't any error.
>>>
>>> Add the "-s" option to "apply-patches.sh" to enable silent operation.
>>>
>>> Also add the "BR_SILENT" variable the contain "YES" when "make -s" is
>>> used so others parts can use it to silence the build as well.
>>>
>>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>>[--SNIP--]
>>> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
>>> index 37f2d81..8d4ba6d 100755
>>> --- a/support/scripts/apply-patches.sh
>>> +++ b/support/scripts/apply-patches.sh
>>> @@ -6,6 +6,8 @@
>>>  # (c) 2002 Erik Andersen <andersen@codepoet.org>
>>>  #
>>>  # Parameters:
>>> +# - "-s",optional. Silent operation, don't print anything if there
>>> +# isn't any error.
>>>  # - the build directory, optional, default value is '.'. The place where are
>>>  # the package sources.
>>>  # - the patch directory, optional, default '../kernel-patches'. The place
>>> @@ -28,6 +30,13 @@
>>>  # applied. The list of the patches applied is stored in '.applied_patches_list'
>>>  # file in the build directory.
>>>
>>> +silent=
>>> +if [[ $1 == "-s" ]] ; then
>>
>>The script uses single-[ tests, so please stay aligned with that. E.g.:

Because the "[[ ]]" operator is a safer improvement on the "[ ]" i
prefer to use the "[[ ]]" operator, so for sake of consistency i
prefer to do another patch to convert all tests to use the better "[[
]]" operator.

>>    if [ ${1} == "-s" ]; then
>
> In standard 'test' this should then also be a single = sign.
>

Thanks, I've discovered only now that i can use the single "=" sign
with both operators.

Thanks & BR
-- 
Fabio Porcedda
