From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Feb 2021 15:21:07 +0100
Subject: [Buildroot] [PATCH] package/plg-utils: escape \ in generated
 legal-info
In-Reply-To: <20210207133310.GM2384@scaer> (Yann E. MORIN's message of "Sun, 7
 Feb 2021 14:33:10 +0100")
References: <20210206085102.1017439-1-yann.morin.1998@free.fr>
 <87sg681aq7.fsf@dell.be.48ers.dk> <20210207112831.GK2384@scaer>
 <87czxcysud.fsf@dell.be.48ers.dk> <20210207133310.GM2384@scaer>
Message-ID: <878s80yn58.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2021-02-07 13:18 +0100, Peter Korsgaard spake thusly:
 >> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> > Peter, All,
 >> > On 2021-02-07 10:35 +0100, Peter Korsgaard spake thusly:
 >> >> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> >> Perhaps we should add a gitlab test to verify that we generate valid
 >> >> json, E.G. by piping it to jq (or similar).
 >> > Yeah, I'm working on it... But we can't do that in gitlab, because the
 >> > output of show-info depends on the selected packages, so it would have
 >> > to be done in the autobuilders.
 >> But that then requires jq on the autobuilder. Can't we just do a 'make
 >> allyespackageconfig' in gitlab?

 > So, allyespackageconfig is not buildable:

 >     package/luajit/luajit.mk:77: *** Configuration error: both "luajit" and
 >     "lua" are selected as providers for virtual package "luainterpreter".
 >     Only one provider can be selected at a time. Please fix your
 >     configuration.  Stop.

:/

 > Solving this means reimplementing parts of the logic in the
 > autobuilders... So I still think it would be better to augment the
 > autobuilder script to run and validate show-info against a valid
 > configuration...

That is also fine by me.

-- 
Bye, Peter Korsgaard
