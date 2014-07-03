From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 3 Jul 2014 21:56:09 +0200
Subject: [Buildroot] [PATCH] infra: /usr support: STAGING_DIR can be
	outside BASE_DIR
In-Reply-To: <53B4ED45.1070704@mind.be>
References: <4f110d39879dacbf50a8.1404135990@localhost>
 <53B4ED45.1070704@mind.be>
Message-ID: <CAAXf6LVYdSLa9HjixAhmfC3odYHc8uSDNn-B5drW21Xwk+ikFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 3, 2014 at 7:42 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 30/06/14 15:46, Thomas De Schampheleire wrote:
>> If the user sets a custom BR2_HOST_DIR, then STAGING_DIR is not under
>> BASE_DIR. The .pc/.la file fixup commands incorrectly made this assumption
>> and thus should be corrected.
>>
>> Additionally, this patch rewords the comment in pkg-autotools that explains
>> the replacements.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> ---
>>  package/pkg-autotools.mk |  23 ++++++++++++-----------
>>  package/pkg-generic.mk   |   5 +++--
>
>  Doesn't QT5_LA_PRL_FILES_FIXUP need this as well?

Yes indeed, and the above patch is broken for pkg-generic too. I'll
fix and resubmit...

>
>  Also, perhaps you should mention in the commit message the for -> xargs change.

Will do.

Thanks!
Thomas
