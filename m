From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Feb 2017 15:29:27 +0100
Subject: [Buildroot] [PATCH v5 01/19] reproducible: fix DATE/TIME macros
	in toolchain-wrapper
In-Reply-To: <1762252.FU4Uq4VmnQ@sagittea> (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Wed, 08 Feb 2017 15:11:25 +0100")
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <20170208132039.0160d3ea@free-electrons.com>
 <87k290pzha.fsf@dell.be.48ers.dk> <1762252.FU4Uq4VmnQ@sagittea>
Message-ID: <87fujopxh4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:


 >> Yes, if the function is considered large and and original enough to be
 >> considered copyrightable - Afterall it is just a getenv + strtoll and a
 >> bit of error checking.

 > I am not a lawyer, but my code is clearly a "derivative work" of 
 > get_source_date_epoch() from gcc.

Neither am I. I guess the question is if that function contains
"substantial amount of creative work" to make it copyrightable.


 > What do you prefer?

 >   1. Revert and rewrite function: it is not a big amount of work.

But it is hard to claim that your reimplementation isn't a derrived work
of get_source_date_epoch() - I mean, there is a limit to how many
different ways you can write getenv + strtoll and a bit of error
handling.


 >   2. Postpone problem: Buildroot also contains patches under GPLv3 and
 >      anyway, users will use a GPLv3 compiler.

I think that is the most sensible thing to do. What do others say?

-- 
Bye, Peter Korsgaard
