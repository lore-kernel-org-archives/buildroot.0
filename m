From: Simon Dawson <spdawson@gmail.com>
Date: Mon, 18 Mar 2013 16:41:05 +0000
Subject: [Buildroot] [PATCH] zeromq: add C++ bindings
In-Reply-To: <20130318170614.2c9d21f3@skate>
References: <1363618617-2969-1-git-send-email-spdawson@gmail.com>
 <20130318170614.2c9d21f3@skate>
Message-ID: <CAHt8ZCP8sUUiCyaKpAHWwgK7RibOCn7_WraFc8OaJyLpL7uwNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 18 March 2013 16:06, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> I really believe cppzmq and zmqpp should be normal separate packages,
> that select the zeromq package. I don't see why we would "invert" the
> traditional logic we use for all packages.

Okay; I'll make them separate packages then.

>> +define ZMQPP_BUILD_CMDS
>> +     $(TARGET_MAKE_ENV) $(ZMQPP_MAKE_ENV) $(MAKE) $(ZMQPP_MAKE_OPT) -C $(@D)
>> +endef
>
> I'm surprised, you're not passing CC, CXX and al. ? Not needed?

Hmm. You're quite right --- this doesn't work at all. Will fix in the
next iteration.

Thanks for the feedback.

Simon.
