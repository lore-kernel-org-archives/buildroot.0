From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 09 Mar 2015 23:49:59 +0100
Subject: [Buildroot] [PATCH 0/3] Cleanup trailing slashed from FOO_SITE
In-Reply-To: <20150309232643.7c1e9495@free-electrons.com>
References: <1425939292-14719-1-git-send-email-luca@lucaceresoli.net>
 <20150309232643.7c1e9495@free-electrons.com>
Message-ID: <54FE2397.1070503@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Mon,  9 Mar 2015 23:14:49 +0100, Luca Ceresoli wrote:
>
>> Luca Ceresoli (3):
>>    manual: download: remove trailing slash from package FOO_SITE
>>    Remove trailing slash from all package site URLs
>>    Download: remove trailing slash cleanups for SITE URLs
>
> Sounds good, but shouldn't we add a check to make sure that such
> trailing slashes don't get added again? Like a check in pkg-generic.mk
> that verifies that $($(2)_SITE) is the same as $($(2)_SITE:=/) ?

Sure, good idea.

I had been thinking about some sort of checkpatch.pl to prevent such
errors, but it would probably be uselessly complex so I didn't go down
that path.

I'll have a look at implementing what you suggest.

-- 
Luca
