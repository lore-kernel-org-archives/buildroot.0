From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 9 Mar 2012 09:54:08 +0100
Subject: [Buildroot] [PATCH 11/13] cmake: move creation of toolchain
 file to package/pkg-cmaketargets.mk
In-Reply-To: <20120309085330.7c5f901b@skate>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
 <e165f3e7d58343c33b295e78c7ec60b0f6bbb839.1331148806.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LW88QiWEWG5qSTQ7Uvh_5hM1r7kQaXQ6Fs7uyimCPCP+Q@mail.gmail.com>
 <20120309085330.7c5f901b@skate>
Message-ID: <CAAXf6LX25+uAiE20wq7QXyfoOS4Bet7vqnPcHZ9EZL6-ONYPpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 9, 2012 at 8:53 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Fri, 9 Mar 2012 07:54:32 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> Currently, BASE_TARGETS is still:
>> $(BASE_TARGETS): dirs
>> $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
>>
>> Now that the recipe for toolchainfile.cmake has moved, I find it a bit
>> strange that the 'magic' path to this file still appears here.
>> What about creating a nicer name and using that in BASE_TARGETS, and
>> let the pkg-cmaketargets.mk file resolve the nice name into the actual
>> path?
>
> Something like:
>
> CMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
>
> in pkg-cmaketargets.mk
>
> and then in the main Makefile:
>
> $(BASE_TARGETS): dirs $(CMAKE_TOOLCHAIN_FILE)
>
> Is this what you're suggesting?

Although I was thinking of an actual target, like 'cmake-prepare' or
something, using a variable like you suggest above is also fine with
me. It's maybe more simple and equally covers my comment.

Best regards,
Thomas
