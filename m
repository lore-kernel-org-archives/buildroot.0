From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Jul 2014 18:44:01 +0200
Subject: [Buildroot] [PATCH 4 of 6] uclibc: rename SETUP_DOT_CONFIG to
	FIXUP_DOT_CONFIG
In-Reply-To: <CAAXf6LWobeHbQB+d8MvtMF3x3=W1FPPdfSr-4yU_bi+ZKF3cGg@mail.gmail.com>
References: <patchbomb.1405338624@localhost>
 <1f15cd84996d1bb6fb3a.1405338628@localhost>
 <20140714163325.231613e5@free-electrons.com> <20140714143931.GK3684@free.fr>
 <CAAXf6LWobeHbQB+d8MvtMF3x3=W1FPPdfSr-4yU_bi+ZKF3cGg@mail.gmail.com>
Message-ID: <53C408D1.8070709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/07/14 16:43, Thomas De Schampheleire wrote:
> On Mon, Jul 14, 2014 at 4:39 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Thomas?, All,
>>
>> On 2014-07-14 16:33 +0200, Thomas Petazzoni spake thusly:
>>> On Mon, 14 Jul 2014 13:50:28 +0200, Thomas De Schampheleire wrote:
>>>
>>>> -define UCLIBC_SETUP_DOT_CONFIG
>>>> +define UCLIBC_FIXUP_DOT_CONFIG
>>>>     $(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@D)/.config
>>>
>>> This this variable is actually copying the configuration file, I
>>> believe the current name of the variable is more correct than the one
>>> you propose to use, no?
>>
>> Thomas did the change, because in patch 5/6 it no longer does the copy,
>> it only does the fixup.
>>
>> This should probably have been explained in the commit log that the
>> change was needed by a future patch.
> 
> Ok, I see. I split off the change to a separate patch for clarity, but
> indeed at this moment it is not yet fully accurate. I can fold this
> patch with the 5th patch, or otherwise update the commit msg as Yann
> proposed, what do you prefer?

 I'd fold it.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
