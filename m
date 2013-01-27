From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Jan 2013 00:15:25 +0100
Subject: [Buildroot] [PATCH] Fix PYC-only installation for Python3
In-Reply-To: <CADS0akgsXxFp_hnH9=7t6-KFTFdoXOMqtc8UycdfsDDRVFGW2A@mail.gmail.com>
References: <1359313382-2257-1-git-send-email-daniel@sigpwr.com>
 <5105AD6F.4070105@mind.be>
 <CADS0akgsXxFp_hnH9=7t6-KFTFdoXOMqtc8UycdfsDDRVFGW2A@mail.gmail.com>
Message-ID: <5105B50D.1020509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/01/13 23:52, Daniel N wrote:
> Arnout,
>
> Not quite. The commit you reference _does_ remove .py files on PYC_ONLY
> installations, but the logic in python3 will not look for a .pyc file in
> the __pycache__ directory if the parent .py file is not present. Thus, in
> its current incarnation, the PYC_ONLY option breaks python3 at runtime.
>
> python3 does fall back to looking for a .pyc file in the directory that
> it expects the .py to be in.
>
> http://www.python.org/dev/peps/pep-3147/#flow-chart

  Okay, in that case your patch looks good.


  Regards,
  Arnout

  PS Please avoid top-posting.

>
> Daniel
>
>
> On Sun, Jan 27, 2013 at 2:42 PM, Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> wrote:
>
>     On 27/01/13 20:03, Daniel Nelson wrote:
>      > All,
>      >
>      > This is my first buildroot/open source submission. I'd appreciate
>     some feedback.
>      >
>      > Python3 changes the behavior of .pyc caching, breaking the
>     PYC-only option in buildroot. The details are
>     inhttp://www.python.org/dev/peps/pep-3147
>     <http://www.python.org/dev/peps/pep-3147>
>      >
>      > I've added a configure flag to Python3, and corresponding logic in
>     buildroot.
>
>       Hasn't this been fixed in git 6ffab129 ?
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
