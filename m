From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Sep 2015 22:39:17 +0200
Subject: [Buildroot] [PATCH 1/2] openssl: use git formatted patches
In-Reply-To: <CALq67GBOBNRFFaR4d7ttf+Qw2Y4LCSv7b7kwcD6Z1Je5Bh=u8Q@mail.gmail.com>
References: <1442289591-30376-1-git-send-email-ryanbarnett3@gmail.com>
 <1442289591-30376-2-git-send-email-ryanbarnett3@gmail.com>
 <55F84B9F.8060908@mind.be>
 <CALq67GBOBNRFFaR4d7ttf+Qw2Y4LCSv7b7kwcD6Z1Je5Bh=u8Q@mail.gmail.com>
Message-ID: <55F881F5.4000009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-09-15 21:44, Ryan Barnett wrote:
> Arnout,
> 
> On Tue, Sep 15, 2015 at 11:47 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 15-09-15 05:59, Ryan Barnett wrote:
>>> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>>
>>> Using Git formatted patches makes it easier to adjust the patches when
>>> needed.
>>>
>>> [Ryan: removed unnecessary patch and updated offsets]
>>>
>>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
>>> ---
>>>  ...time-building-manpages-if-we-re-not-going.patch | 27 +++++++++
>>>  ...odev-Fix-issue-with-signature-generation.patch} | 70 +++++++++++++---------
>>>  package/openssl/001-do-not-build-docs.patch        | 13 ----
>>>  3 files changed, 68 insertions(+), 42 deletions(-)
>>>  create mode 100644 package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
>>>  rename package/openssl/{003-cryptodev-Fix-issue-with-signature-generation.patch => 0002-cryptodev-Fix-issue-with-signature-generation.patch} (82%)
>>>  delete mode 100644 package/openssl/001-do-not-build-docs.patch
>>>
>>> diff --git a/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch b/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
>>> new file mode 100644
>>> index 0000000..93e2118
>>> --- /dev/null
>>> +++ b/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
>>> @@ -0,0 +1,27 @@
>>> +From 53980448064b362a58e4ab2aca6f38fec93c07c3 Mon Sep 17 00:00:00 2001
>>> +From: Mike Frysinger <vapier@gentoo.org>
>>> +Date: Sat, 16 May 2015 18:53:51 +0200
>>> +Subject: [PATCH 1/3] Dont waste time building manpages if we're not going to
>>             ^^^^^^^^^^
>>  Please generate patches with -N to avoid the 1/3: it's incorrect (there are
>> only 2 patches) and it causes additional churn when patches are regenerated.
> 
> When I was adopting these patches, I was lazy and didn't make any
> changes from Thomas's last patch other than just dropping the
> unnecessary third patch.
> 
>>  I also like to add --subject-prefix= to remove the [PATCH] part, which is not
>> at all useful in this context. But others may disagree.
> 
> I agree with this.
> 
> Do we want to update our buildroot documentation to reflect this?
> 
> Secondly, do you think it would be useful to add a new subsection that
> documents how to properly use git to generate patches for use within
> buildroot?
> 
> http://nightly.buildroot.org/manual.html#patch-policy

 Both suggestions sound really nice!

> 
>>> + use em.
>>> +
>>> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> +---
>>> + Makefile.org | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>> [snip]
>>> diff --git a/package/openssl/001-do-not-build-docs.patch b/package/openssl/001-do-not-build-docs.patch
>>
>>  If you resend, perhaps you can add -M20% so the rename is detected?
> 
> Sure. Might just stick with '-M'.
> 
> Is 20% similarity more acceptable amount than just -M (by default it
> is 50%)? In our buildroot documentation we list just using -M when
> sending patches upstream.

 I thought you already did use -M, otherwise the other patch wouldn't have been
detected as a rename. The default -M50% is normally good enough - if more than
half the lines change, it's probably not a reall rename. Only in this case, the
file was pretty small to begin with and all the git headers double its size, so
-M50% won't hit it. So if you see that in your format-patch output you can
decide to go for a smaller -M.

 Obviously, it makes no difference for what gets committed in the end. It just
looks nicer for the reviewers.

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
