From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Wed, 21 Dec 2016 08:45:20 -0600
Subject: [Buildroot] [PATCH v13 2/8] refpolicy: new package
In-Reply-To: <20161213230840.46d5abff@free-electrons.com>
References: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
 <1477423570-15694-2-git-send-email-bryce.ferguson@rockwellcollins.com>
 <20161212232121.01e9059e@free-electrons.com>
 <20161213230840.46d5abff@free-electrons.com>
Message-ID: <CAKGmAFocuS1SNa1pW4N_LFv4t9STuKHG=0h1ZVeWEp_E134wGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Dec 13, 2016 at 4:08 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 12 Dec 2016 23:21:21 +0100, Thomas Petazzoni wrote:
>
>> > +REFPOLICY_DEPENDENCIES += host-m4 host-checkpolicy host-policycoreutils \
>> > +   host-setools host-gawk host-python policycoreutils
>>
>> It's not clear to me why we need to have a build dependency on
>> policycoreutils. Could you explain?
>
> I checked by doing a build test: the target policycoreutils dependency
> is not needed for build time, and it seems like the host-setools
> dependency is also not needed.
>
> Could you double check this, by doing a build which has *only*
> refpolicy enabled and nothing else, and verify that the dependencies
> are really necessary?

I have performed a build with only refpolicy enabled and you are
correct.  I will update this to remove that dependency.  I am also
currently working to address your other comments.

>
> Thanks a lot,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

Thanks for your feedback!

-- 


Bryce Ferguson
Software Engineer
Airborne Information Solutions \ Secure Platforms

400 Collins Rd NE Cedar Rapids, Iowa 52498

Bryce.Ferguson at rockwellcollins.com
