From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Feb 2020 18:11:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: annotate _IGNORE_CVES
 for CVE-2009-3654
In-Reply-To: <87k145gw45.fsf@dell.be.48ers.dk>
References: <20200229094609.2451566-1-fontaine.fabrice@gmail.com>
 <20200229163608.GO8743@scaer> <87k145gw45.fsf@dell.be.48ers.dk>
Message-ID: <20200229171156.GR8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Fabrice, All,

On 2020-02-29 18:07 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Fabrice, All,
>  > On 2020-02-29 10:46 +0100, Fabrice Fontaine spake thusly:
>  >> Unspecified vulnerability in Boost before 6.x-1.03, a module for Drupal,
>  >> allows remote attackers to create new webroot directories via unknown
>  >> attack vectors.
> 
>  > Yes, good to know, but the interesting bit is why we are not affected,
>  > which your commit log fails to specify.
> 
>  > Also, the comment should say so as well. Maybe just something like:
> 
>  >     # Module for Drupal, not installed in Buildroot
>  >     BOOST_IGNORE_CVES +=...
> 
> It is not because we don't install some optional part of boost, it is
> simply that our CVE logic thinks that this CVE applies to our boost
> package, whereas it is really for some kind of drupal module:
> 
> https://nvd.nist.gov/vuln/detail/CVE-2009-3654

Ah, it is the other way around, then...

I'll apply to master with a bit of rephrasing to make that obvious,
then.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
