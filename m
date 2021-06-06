From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jun 2021 23:10:13 +0200
Subject: [Buildroot] [PATCH 5/5] package/python3-cryptography: add
 python3 host variant
In-Reply-To: <20210522083257.GY3208066@scaer>
References: <1621475383746.46545@lab126.com> <20210521162220.GL3208066@scaer>
 <1621644168551.61151@lab126.com> <20210522083257.GY3208066@scaer>
Message-ID: <20210606211013.GL168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Donald, All,

On 2021-05-22 10:32 +0200, Yann E. MORIN spake thusly:
> On 2021-05-22 00:42 +0000, Chan, Donald via buildroot spake thusly:
> > On 2021-05-20 01:49 +0000, Chan, Donald via buildroot spake thusly:
> > > > Add a python3 host variant since another downstream OSS component
> > > > (OP-TEE) uses buildroot and it will depend on a python3 host variant
> > > > of python-cryptography.
> > > So, those 5 patches are OK (but still, see below for some comments)),
> > > but there is still nothing that uses those new host packages in the
> > > Buildroot tree.
> [--SNIP--]
> > > In which case, adding those pacakges should be part of the series that
> > > updates optee_os.
> > It's a chicken and egg problem - the original OP-TEE ticket to migrate
> > to pyca/cryptography is https://github.com/OP-TEE/optee_os/issues/4599,
> > but if it's merged now, it will immediately break their CI because they
> > are still using buildroot 2021.02 (https://github.com/OP-TEE/manifest/blob/master/default.xml#L24).
> 
> Ah. that's the piece I was missing: the CI is using an unmodified,
> released version of Buildroot. That's neat! :-)
> 
> I can see the chicken-n-egg problem, now, thanks.
> 
> > So the best approach seems to be:
> > 1. Update buildroot with these new packages
> > 2. Wait till there is a new buildroot release, submit a PR to update their manifest
> > 3. Then submit another PR to migrate to pyca/cryptography
> > It's going to be a long process but it will cause the least amount of disruptions. 
> 
> I've reinistated these pactches in the "new" state, so they are back
> under consideration. We'll see what the opinion of the other maintainers
> are.
> 
> Peter, Thomas, Arnout: your thoughts?

Without further replies, I've applied this 5-patch series to master,
thanks.

Please review the individual commits, I had to do a few tweaks to the 5
packages.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
