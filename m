From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 08 Feb 2017 15:11:25 +0100
Subject: [Buildroot] [PATCH v5 01/19] reproducible: fix DATE/TIME macros
	in toolchain-wrapper
In-Reply-To: <87k290pzha.fsf@dell.be.48ers.dk>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <20170208132039.0160d3ea@free-electrons.com>
 <87k290pzha.fsf@dell.be.48ers.dk>
Message-ID: <1762252.FU4Uq4VmnQ@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 08 February 2017 14:46:09 Peter Korsgaard wrote:
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  > On Wed, 08 Feb 2017 11:07:07 +0100, J?r?me Pouiller wrote:
> 
>  >> > I'm not sure this detailed error handling is really needed, but 
OK.  
>  >> 
>  >> In fact I copy-paste get_source_date_epoch() from gcc git. So 
toolchain
>  >> wrapper will produce exactly same error messages than upstream gcc
>  >> (and it include same coding style error :-) ).
> 
>  > So now our toolchain-wrapper is under GPLv3 :-/

Indeed, I didn't noticed this problem.

> Yes, if the function is considered large and and original enough to be
> considered copyrightable - Afterall it is just a getenv + strtoll and 
a
> bit of error checking.

I am not a lawyer, but my code is clearly a "derivative work" of 
get_source_date_epoch() from gcc.

What do you prefer?

  1. Revert and rewrite function: it is not a big amount of work.

  2. Postpone problem: Buildroot also contains patches under GPLv3 and
     anyway, users will use a GPLv3 compiler.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
