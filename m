From: Daniel Mack <zonque@gmail.com>
Date: Tue, 06 Dec 2011 00:20:24 +0100
Subject: [Buildroot] [PATCH v3] Add package connman
In-Reply-To: <87bormsjcz.fsf@macbook.be.48ers.dk>
References: <4EDCFEB2.60603@gmail.com>
 <1323106241-22192-1-git-send-email-zonque@gmail.com>
 <87fwgyslv8.fsf@macbook.be.48ers.dk> <4EDD4EAE.7010808@gmail.com>
 <87bormsjcz.fsf@macbook.be.48ers.dk>
Message-ID: <4EDD51B8.5050705@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/06/2011 12:13 AM, Peter Korsgaard wrote:
>>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:
> 
> Hi,
> 
>  >> What about installing an initscript? I see there's an example init
>  >> script in the connman sources, but that doesn't seem directly applicable
>  >> to our busybox based system.
> 
>  Daniel> Yes, I can write one up.
> 
> Great, thanks.
> 
>  Daniel> Yes, this is the reason why I added resolver support to uClibc some
>  Daniel> months back, and all the stuff in upstream now.
> 
>  >> I don't like to add it if doesn't work with uClibc based toolchains. 
> 
>  Daniel> Well, it does, if you enable UCLIBC_HAS_RESOLVER_SUPPORT. What about
>  Daniel> adding a dependency for that? If people want to have connman, they have
>  Daniel> to manually select this feature and rebuild their uClibc. Does that
>  Daniel> sound ok?
> 
> In concept, yes - But as the RESOLVER_SUPPORT isn't in any release yet,
> it becomes a bit more tricky. We can backport the changes to 0.9.32, but
> existing binary toolchains and ctng (unless Yann agrees and we also
> backport to there) stuff will fail.

In a previous discussion on this list I was asking about just this, and
back then you agreed we could depend on BR2_UCLIBC_VERSION_SNAPSHOT in
such a case until there's a new release.

> I'll take a look at it.

Ok, great. I'll post a new version with the discussed topics and leave
the decision of how to handle the toolchain deps to you. Is that ok for you?


Daniel
