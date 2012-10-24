From: Valentine Barshak <gvaxon@gmail.com>
Date: Thu, 25 Oct 2012 01:35:34 +0400
Subject: [Buildroot] [PATCH] gqview: Fix build failure due to missing -lm
In-Reply-To: <CAFbHwiSwLqa=JSw=yqsEmHO7sqvgRmPQEgR454g=rBCu0qLdOg@mail.gmail.com>
References: <1349555736-10008-1-git-send-email-gvaxon@gmail.com>
 <5088400C.4040000@gmail.com>
 <CAFbHwiSwLqa=JSw=yqsEmHO7sqvgRmPQEgR454g=rBCu0qLdOg@mail.gmail.com>
Message-ID: <50885F26.8000701@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/25/2012 12:51 AM, Will Newton wrote:
> On Wed, Oct 24, 2012 at 8:22 PM, Valentine Barshak <gvaxon@gmail.com> wrote:
>> On 10/07/2012 12:35 AM, Valentine Barshak wrote:
>>>
>>> Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
>>> ---
>>>    package/gqview/gqview.mk | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
>>> index 2f64cd0..7d09fda 100644
>>> --- a/package/gqview/gqview.mk
>>> +++ b/package/gqview/gqview.mk
>>> @@ -7,6 +7,7 @@ GQVIEW_VERSION = 2.1.5
>>>    GQVIEW_SOURCE = gqview-$(GQVIEW_VERSION).tar.gz
>>>    GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
>>>    GQVIEW_DEPENDENCIES = host-pkg-config libgtk2
>>> +GQVIEW_CONF_ENV = LIBS="-lm"
>>>
>>>    $(eval $(autotools-package))
>>>
>>>
>>
>> Does this work for everyone else or is it just deprecated and nobody should
>> use it?
>>
>> I can't build without -lm neither in BR nor using my native host tools.
>
> Which version of binutils are you using? 2.22?
>

Yes, 2.22.

Thanks,
Val.
