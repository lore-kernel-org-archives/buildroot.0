From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 24 Sep 2014 09:36:38 +0200
Subject: [Buildroot] [PATCH 12/23 v5] docs/manual: last pass at removing
 hard-coded path in GENDOC_INNER
In-Reply-To: <CAAXf6LXVFn4Fvbceoy+Mvcsms9s4LXtpRwxWrxLsjZgZ34LVCw@mail.gmail.com>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <661d747642ce1e9ca884829b0a295faf35933209.1410692670.git.yann.morin.1998@free.fr>
 <CAAXf6LUbrYHqCReJLRMRf4jfRGfH=0C=-TwYd2foZjpzzYonCw@mail.gmail.com>
 <20140923172106.GA4283@free.fr>
 <CAAXf6LXVFn4Fvbceoy+Mvcsms9s4LXtpRwxWrxLsjZgZ34LVCw@mail.gmail.com>
Message-ID: <CAHXCMMKiKFbvNsDd_CEWZsvx4xyP_-2A9e_Tzh7TwYJgYGDcXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas, all

On Wed, Sep 24, 2014 at 8:54 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Yann,
>
> On Tue, Sep 23, 2014 at 7:21 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Thomas, All,
>>
>> On 2014-09-22 21:38 +0200, Thomas De Schampheleire spake thusly:
>>> On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>> > GENDOC_INNER still has one hard-coded path to the document's directory:
>>> > the asciidoc .conf files.
>>>
>>> In this patch you assume that the asciidoc configuration is
>>> document-specific,
>>
>> Well, not really. The code already had:
>>     MANUAL_$(2)_ASCIIDOC_CONF = docs/$(1)/asciidoc-$(2).conf
>>
>> so the location where the asciidoc-FORMAT.conf was already supposed to
>> be specific to one document.
>>
>> This patch merely removes the assumption that the document is in a
>> sub-directory of docs:
>>     docs/$(1)/  -->  $(3)/   ($(3) is the directory of the document)
>>
>>> but at least the current contents of
>>> asciidoc-text.conf are global IMO: they simply make sure that
>>> hyperlinks are represented in a sane way, and that images are not
>>> shown (text document only). These are settings that apply to all
>>> documents.
>>
>> I agree. But then, where should we move it?
>>
>>   - keep it in docs/manual/ ? That would imply it is specific to our
>>     manual.
>>
>>   - move it in docs/ ? But docs/ contains our website.
>>
>>   - keep docs/manual, move the website to docs/website/ ? This way we
>>     could move the asciidoc*.conf into docs/ and is IMHO much cleaner
>>     than we have today.
>
> I think this proposal is better than the first two. The layout would be
>
> docs/
>      asciidoc setting files
>      website/
>      manual/
>
> It could be seen as odd to have these asciidoc settings at top-level,
> next to website that is totally unrelated.
> An alternative would be something like (forget about the names):
> docs/
>      docs/
>           asciidoc setting files
>           manual/
>      website/
>

I prefer the first layout over the second one.

Regards,

-- 
Samuel
