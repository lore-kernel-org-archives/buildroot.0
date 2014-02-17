From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 17 Feb 2014 11:32:14 +0100
Subject: [Buildroot] [PATCH 04/10] toolchain/external: add choice to
 select 'AT_LEAST_XXX' header version
In-Reply-To: <20140217113023.7e5a0845@skate>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
 <74d76e7816e2de0eccb9a24acd0b768c22078dfa.1392571021.git.yann.morin.1998@free.fr>
 <8fdcf8b3-c275-4250-be9c-11bcf4feaa11@email.android.com>
 <20140216204721.GD3417@free.fr>
 <CAAXf6LVOiOQ1jwWX4wT-NjB3gnE=YrroKMhjwsn9Cxa4F=9o5Q@mail.gmail.com>
 <20140217113023.7e5a0845@skate>
Message-ID: <CAAXf6LVfv7WWYMykb_FC_BRJxkNxabOJRTPxh-m+vuJSH6rG=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 17, 2014 at 11:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Mon, 17 Feb 2014 09:07:29 +0100, Thomas De Schampheleire wrote:
>
>> > I'm not sure I entirely grok your comment. This choice is only visible
>> > for external toolchains, not for the internal backend, so there is not
>> > two choices to set the kernel headers version.
>>
>> True, but suppose the user did make the externel toolchain himself,
>> for example with crosstool-ng. While creating the toolchain, he did
>> get the question of which headers to use already, so he/she may think
>> 'Huh? Why do I have to choose it again, and what will happen if I
>> select a newer version here?"
>
> This is something we already have for C++, large file, RPC, IPv6 and so
> on. We have a typical help text for this:
>
>           Select this option if your external toolchain has thread
>           support. If you don't know, leave the default value,
>           Buildroot will tell you if it's correct or not.
>
>> Maybe you could also add that if the user is unsure about the exact
>> version, it's 'safer' to specify an older version than a newer one.
>> And maybe a way of determining the header version used in a toolchain,
>> in case the user does not know it.
>
> We should simply have a check that ensures the selection is correct.
>

This was probably answered before, but if we can detect that the
selection is incorrect, why don't we set the right value
automatically?
