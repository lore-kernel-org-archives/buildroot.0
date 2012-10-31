From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 31 Oct 2012 07:43:54 +0000
Subject: [Buildroot] [PATCH] Add support for custom package patches
In-Reply-To: <50904A0F.5020206@mind.be>
References: <1351632205-15815-1-git-send-email-spdawson@gmail.com>
 <50904A0F.5020206@mind.be>
Message-ID: <CAHt8ZCOGSXfkVWi4DHwJUZ5SThVeYOg58+=BtLd9OwDXTJryVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30 October 2012 21:43, Arnout Vandecappelle <arnout@mind.be> wrote:
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> but some potential improvements below.

Hi Arnout. Thanks for the feedback.

>> +config BR2_CUSTOM_PACKAGE_PATCH_DIRS
>> +       string "custom package patch directories"
>
>
>  I would call it extra patch dirs, otherwise it sounds like it's overriding
> the BR patch set.

Yes, agreed.

>  For the custom patch dirs, we may also want to support the
> $(1)/$(RAWNAME)/*.patch pattern.  So that would give:
>
>             elif test -d $(1)/$(RAWNAME); then \
>               support/scripts/apply-patches.sh $(@D) $(1)/$(RAWNAME)
> \*.patch \*.patch.$(ARCH) || exit 1; \

Yes, good idea.

I'll fix my patch, and resubmit.

Simon.
