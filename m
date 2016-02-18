From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 18 Feb 2016 14:14:26 -0200 (BRST)
Subject: [Buildroot] [PATCH 4/5] gtest: Upgrade to GitHub HEAD
In-Reply-To: <3E1323DE-EB35-4012-9DD2-BC0448C4A84B@softiron.co.uk>
References: <1444859483-2268-1-git-send-email-alan@softiron.co.uk>
 <1444859483-2268-5-git-send-email-alan@softiron.co.uk>
 <20151014235522.774491e2@free-electrons.com>
 <561ED08C.5010301@softiron.co.uk>
 <1629967145.779413.1445282966636.JavaMail.zimbra@datacom.ind.br>
 <1531197965.3282303.1455733032855.JavaMail.zimbra@datacom.ind.br>
 <20160217215023.79adbe1c@free-electrons.com>
 <3E1323DE-EB35-4012-9DD2-BC0448C4A84B@softiron.co.uk>
Message-ID: <1397733218.10703.1455812066287.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Alan Ott" <alan@softiron.co.uk>
> To: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Sent: Wednesday, February 17, 2016 10:13:39 PM
> Subject: Re: [Buildroot] [PATCH 4/5] gtest: Upgrade to GitHub HEAD

> On February 17, 2016 1:50:23 PM MST, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>>Hello,
>>
>>On Wed, 17 Feb 2016 16:17:12 -0200 (BRST), Carlos Santos wrote:
>>
>>> Hello Alan,
>>> 
>>> I noticed that this patch set is still in "Changes Requested" state.
>>Is there anything I can do to help?
>>
>>You can take over the patch, make the necessary changes and post an
>>updated version of it.
>>
>>If your changes are limited, it is customary to keep the original
>>author as the author of the patch.
>>
>>If your changes are really major and essentially rewrite the whole
>>patch, then you can re-assign the authorship of the patch to you, but
>>keep a reference to the original author in the commit log.
>>
>>It is definitely more than welcome to pick up old patches for which
>>changes were requested, but whose author didn't had the time to
>>implement.
>>
> 
> Hi Carlos, I agree. I ran out of time on this, unfortunately :( .Have a look at
> the original comments from Thomas here:
> https://patchwork.ozlabs.org/patch/530390/
> 
> As far as a authorship, the changes requested are significant enough that you
> can take my authorship off. I don't mind.
> 
> Alan.

Alan/Thomas,

I propose doing this in three steps:

1. Submit a patchset that replaces the sites from googlecode.com to github, maintaining the same package versions (including gtest and gmock, that would be left at version 1.7.0).

This change is easy to apply and could even be brought to the impending Buildroot 2016.02, IMO, since it does not change the package versions, only reduces the risk of build failures due to problems in googlecode.com (I consider this a bug fix). The patchset would update the following patches:

    http://patchwork.ozlabs.org/patch/530387/
    http://patchwork.ozlabs.org/patch/530388/
    http://patchwork.ozlabs.org/patch/530389/
    http://patchwork.ozlabs.org/patch/530390/
    http://patchwork.ozlabs.org/patch/530391/


2. Submit a patchset that replaces packages gtest and gmock by a "googletest" package, as suggested by Thomas. This change is quite disruptive for us at DATACOM because it may require changing the recipes that we maintain in $(BR2_EXTERNAL), so I humbly ask you to postpone the change.

3. Submit a patchset that upgrades googletest to a newer release, hopefully v1.8.0, or to the current HEAD, as decided by Peter Korsgaard and Alan. I will do this after ensuring that the change does not break anything.

Do you agree?

Carlos Santos (Casantos)
DATACOM, P&D
