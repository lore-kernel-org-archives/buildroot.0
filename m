From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Feb 2021 21:19:30 +0100
Subject: [Buildroot] buildroot packages from svn repo fail
In-Reply-To: <AS8PR06MB7686BDC4D80BA193BE5E486384859@AS8PR06MB7686.eurprd06.prod.outlook.com>
References: <AS8PR06MB7686BDC4D80BA193BE5E486384859@AS8PR06MB7686.eurprd06.prod.outlook.com>
Message-ID: <20210219201930.GA2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Henri, All,

Thanks for the reporton this svn issue.

On 2021-02-18 12:19 +0000, Roosen Henri spake thusly:
> Hi Yann,

Please do not write to individual contributors directly. Write to the
mailing list, so that everyon has a chance to learn about the issue,
provide feedback, suggest ways to resolve the issue, and so that
everyone can benefit from this.

By writing to the list, you also stand better chance that someone spots
the mail, in case the contributor is not available (like me this week, I
was unable to work on Buldroot dur to familly concerns).

> We use a custom kernel which is available using our internal svn-repo.
> The download now fails with the following:
> 
> tar: Time stamp is out of allowed range
> tar: Exiting with failure status due to previous errors
> 
> Reverting commit c043ecb20ce6ac316fe31da6d2db5b13a34dc414 fixes the problem.

As has been discovered by Vincent in the rest of this private thread,
the root cause seems to be the svn client you are using, that reports
sub-second timestamps, which are not supported by the PAX format we are
now using.

I'll be waiting for the patch from Vincent (or anyone else) to fix the
issue.

Also, as Arnout suggested, it would be nice to have a runtime test, like
we have for git;
    support/testing/tests/download/test_git.py

I don't think we need somethign totally exhaustive, but even just a
basic test would be enough (e.g. tests with svn:external are not a
requirement).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
