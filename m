From: Jaap Crezee <jaap@jcz.nl>
Date: Thu, 22 Mar 2018 22:12:51 +0100
Subject: [Buildroot] Unicode problem with check-uniq-files
In-Reply-To: <20180322204145.GB4580@scaer>
References: <3a25e768-759e-e377-fcae-48c8e3e36ddd@jcz.nl>
 <20180319213240.GA340@scaer> <86fb507f-1fa7-8355-6ec6-7b346e6945e7@jcz.nl>
 <20180321214436.GA2085@scaer> <5ffd29df-7b21-122a-2d50-03fc86f29224@jcz.nl>
 <f965a6fb-db48-b39c-6f49-46a025fc63ad@jcz.nl> <20180322204145.GB4580@scaer>
Message-ID: <15ed1668-3051-434f-d510-05f68164430c@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


On 03/22/18 21:41, Yann E. MORIN wrote:
> Please, keep the list in Cc next time...

Okay, I was thoughfull of not bothering everyone with what seems to me as internal development stuff between two devs.
Anyway,

> On 2018-03-22 11:56 +0100, Jaap Crezee spake thusly:
> I'll be testing that, but it has to work in quite a few situations:
> 
>   - python 2.6, python 2.7, python 3.x

Okay; that's wide, but it is as it is.

>   - current locale is UTF-8 (is it LANG, or any of the other LC_* ones?)
>     or it is not an UTF-8 locale.

These are my current settings which work for me on almost any system I encounter:

[jaap at jaap ~ ]$ locale
LANG=C
LC_CTYPE="C"
LC_NUMERIC="C"
LC_TIME="C"
LC_COLLATE="C"
LC_MONETARY="C"
LC_MESSAGES="C"
LC_PAPER="C"
LC_NAME="C"
LC_ADDRESS="C"
LC_TELEPHONE="C"
LC_MEASUREMENT="C"
LC_IDENTIFICATION="C"
LC_ALL=


I tend to only use ext4 but sometimes whatever comes default with the customers choice of buildserver distro.

> So, even if UTF-8 is the prevalent encoding, nothing guarantees that it
> is the only one we'd ever see, AFAIU...

That seems legit unfortunately yes.

> Which means that your solution is probably just only a workaround that
> happens to work for you and a lot of other situations, but is not the
> correct solution.

Okay, let's "reject" that in this case. For now I will silently start applying this patch locally.

> now, so that would break on those distros... Do you use such a distro,
> by chance? Which one?

Archlinux. But I always set python to python3. If I want to use python2.x I use virtualenv or just type python2.
My customers want me to support/install to Fedora, Ubuntu and Debian (for now).
I am thinking about also designing a docker container for buildroot building purposes. Might be something anybody within the BR project could also
investigate?

> Anyway, more testing to be done here, thanks for the suggestion. I'll
> report back later...


Thanks. Let me now I you want me to test anything.

regards,


Jaap
