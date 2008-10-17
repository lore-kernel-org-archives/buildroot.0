From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 17 Oct 2008 09:38:29 +0200
Subject: [Buildroot] [PATCH 9/9] Add support for cloning Linux git trees
In-Reply-To: <fa686aa40810161609k3dd259abo7f10b4ed0d871163@mail.gmail.com>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
	<20081016203301.15826.50075.stgit@localhost.localdomain>
	<20081016211449.GE11249@mx.loc>
	<fa686aa40810161609k3dd259abo7f10b4ed0d871163@mail.gmail.com>
Message-ID: <20081017073829.GA10738@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 16, 2008 at 05:09:13PM -0600, Grant Likely wrote:
>On Thu, Oct 16, 2008 at 3:14 PM, Bernhard Reutner-Fischer
><rep.dot.nop@gmail.com> wrote:
>> On Thu, Oct 16, 2008 at 02:33:01PM -0600, Grant Likely wrote:

>>>@@ -418,6 +447,7 @@ config BR2_LINUX26_VERSION

>>>       default "$(BR2_KERNEL_CURRENT_VERSION)"if BR2_LINUX_2_6_STABLE
>>
>> looking at the URI of this file. No wonder.
>
>Umm, I don't know what you are referring to here.  Are you referring
>to using 'git' as the value of BR2_LINUX26_VERSION instead of the full
>URL?

No, sorry. I was referring to the preexisting line cited above.

>> I've done something like this for libtool, and i *think* that i will not
>> waste _that_ much bandwith over and over again. Not my call, though.
>
>It should be okay.  Using the --depth flag keeps the download size to
>the bear minimum.  Using it on current mainline results in ~100MB of
>git repo (as opposed to ~50MB for a bz2 tarball and ~300MB for a full
>git clone).  Also, in the help text I recommend to use a local git
>tree to keep clone bandwidth costs to a minimum.

Yes. I'll do this differently though, never mind.
>
>>>@@ -499,6 +508,9 @@ linux-status:
>>
>> linux-status. If you have make, you most likely have grep, too.

>I had mostly just been following the existing lead.  I can drop this
>change if it is preferred.

I don't care about this bit, leave it in if you liked it.

PS:
So what about powerpc's crtsavres.o. Since i don't have a powerpc (and
as such only stumbled across this accidentally) and furthermore don't
need real external modules as opposed to in-tree modules for compile
tests, i will not pursue this further. Perhaps you want to take care
of it (kernel bugzilla #11143)? TIA.. :)
