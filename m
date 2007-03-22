From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 22 Mar 2007 14:26:09 +0100
Subject: [Buildroot] BSP patch
In-Reply-To: <02e801c76c0e$c9eec980$01c4af0a@Glamdring>
References: <02a401c76c07$c75473c0$01c4af0a@Glamdring>
	<20070321224324.GD5468@aon.at>
	<02e801c76c0e$c9eec980$01c4af0a@Glamdring>
Message-ID: <20070322132609.GA11410@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 22, 2007 at 12:13:59AM +0100, Ulf Samuelsson wrote:
>>On Wed, Mar 21, 2007 at 11:24:32PM +0100, Ulf Samuelsson wrote:
>>>Any chance of having this reviewed soon?
>>>I am kinda stuck on AVR32 before that is applied.
>>
>>There was someone on irc that had an alternative approach. He said that
>>he'd be in contact with you to discuss both approaches. Unfortunately
>>this discussion didn't end up on the list.. What was the outcome of that
>>discussion?
>>
>
>I think you refer to the discussions I had with S?ren Straarup
>It is actually not two approaches.

[snip]

>I actually have a "configs" directory as well in my private buildroot
>but I copy stuff manually to the top level.
>I think that S?ren's patch is orthogonal to my work.

ok.
>
>The BSP patch is really there to allow two different configurations
>to be built within the same buildroot directory so they can share:
>
>* toolchain
>* root file system build directory.
>but have different configurations for linux kernel and busybox
>and eventually you may want to have different content of the root file 
>system.
>
>The solution is to create a new directory structure
>target_build_<arch>/<board> where everything is built.
>The patch allows pre/postfixes to this directory name.
>
>The BSP patch also put some structure on where the result ends up.
>Today everything is stored in the top directory, but if you
>want to build multiple boards, then you are going to get a lot of clutter.

We need to better differentiate between arch and cpu (generally, not in
your board support patch).

Applying your patch now locally. Let's see..
