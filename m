From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 23 Aug 2013 10:00:33 +0200
Subject: [Buildroot] [PATCH v2 2/3] package: fix generic extract target
 for top-level parallel make
In-Reply-To: <20130823093642.3ff0e2bb@skate>
References: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
 <1374138746-23279-3-git-send-email-fabio.porcedda@gmail.com>
 <521513E3.8080401@mind.be> <20130823093642.3ff0e2bb@skate>
Message-ID: <CAHkwnC9tn=zA=WWxneiZeGCCxQ=b_Dfk-o_PBaf_AGBHeJWewg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 23, 2013 at 9:36 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Arnout Vandecappelle,
>
> On Wed, 21 Aug 2013 21:24:19 +0200, Arnout Vandecappelle wrote:
>
>>   On second observation, I don't really like this change, because it
>> makes the extract and patch parts asymmetrical with the others. I would
>> prefer one patch that changes it for all the targets. But then, the
>> behaviour does change, because rebuilding one package will also trigger a
>> rebuild of the packages that depend on it. Which may be a good thing, of
>> course...
>
> When I did some experiments on top-level parallel build some years ago,
> it is also one of the problem I had seen. Today, if you decide to
> rebuild "libfoo", it rebuilds libfoo only and that's it. If libfoo is
> used by something else, it's your responsibility to rebuild this
> something else. Of course, this is all possible because the chain of
> dependencies uses virtual targets and not stamp files.

For this problem there is a simple solution, to use a
"order-only-prerequisites", because
a target is not rebuild if is older than a "order-only-prerequisites".

http://www.gnu.org/software/make/manual/html_node/Prerequisite-Types.html#Prerequisite-Types

Best regards
-- 
Fabio Porcedda
