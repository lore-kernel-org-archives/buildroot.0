From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 21 May 2012 10:12:32 +0200
Subject: [Buildroot] [PATCH 1/3] Convert gettext to autotargets
In-Reply-To: <CAFbHwiQX5facsOBf3TYDU4m_-u=AP1kJzEabJhWgy5-9c=GVqw@mail.gmail.com>
References: <4F7C6130.102@free-electrons.com>
 <1336475958-5714-1-git-send-email-s.martin49@gmail.com>
 <87k407lu8m.fsf@macbook.be.48ers.dk>
 <CAHXCMMJi=GZpyk6Uzc2f=emzVGnRHOOuDo-Q6JQWWhvm9TAinw@mail.gmail.com>
 <8762bqklli.fsf@macbook.be.48ers.dk>
 <CAFbHwiQX5facsOBf3TYDU4m_-u=AP1kJzEabJhWgy5-9c=GVqw@mail.gmail.com>
Message-ID: <4FB9F8F0.5000201@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 21/05/2012 10:08, Will Newton a ?crit :
> On Mon, May 21, 2012 at 9:02 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
>>
>> Hi,
>>
>>  >> This seems backwards. Wouldn't you want to keep the binaries if libintl
>>  >> is enabled?
>>
>>  Samuel> Actually, do we really need to remove these binaries?
>>  Samuel> On an arm build, these 3 binaries take less than 80KB.
>>
>> I don't feel strongly about it. The stuff needing gettext is typically
>> quite a lot bigger than 80KB, so perhaps simplifying stuff is indeed the
>> way to go.
> 
> I would suggest that if we used to remove it then we should keep
> removing it. Otherwise you end up in the situation where you update
> buildroot and your filesystem image gets ever so slightly bigger and
> won't fit in flash any more.

I think that it is something you should expect when upgrading buildroot.
I mean, you already have a lot of packages version bump that can lead to
the same filesystem size increase, with the result you described.

Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
