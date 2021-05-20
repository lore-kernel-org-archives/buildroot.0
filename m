From: Chan, Donald <hoiho@lab126.com>
Date: Thu, 20 May 2021 01:50:27 +0000
Subject: [Buildroot] [PATCH 1/1] package/python3-six: add python3 variant
In-Reply-To: <20210519210833.GO2268078@scaer>
References: <1620853148995.76548@lab126.com> <20210518150056.GQ2506@scaer>
 <1621370634009.93154@lab126.com> <20210519120015.GU2268078@scaer>
 <1621458008892.46397@lab126.com>,<20210519210833.GO2268078@scaer>
Message-ID: <1621475427693.92707@lab126.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Submitted a new set of 5 patches - thanks for helping!

________________________________________
From: Yann E. MORIN <yann.morin.1998@free.fr>
Sent: Wednesday, May 19, 2021 2:08 PM
To: Chan, Donald
Cc: buildroot at busybox.net
Subject: RE: [EXTERNAL] [Buildroot] [PATCH 1/1] package/python3-six: add python3 variant

CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.



Chan, All,

On 2021-05-19 21:00 +0000, Chan, Donald via buildroot spake thusly:
> On 2021-05-18 20:43 +0000, Chan, Donald spake thusly:
> > > On 2021-05-12 20:59 +0000, Chan, Donald via buildroot spake thusly:
> > > >> Signed-off-by: Donald Chan <hoiho@lab126.com>
> > > >Why do you need a python3-specific version of six?
> > > This was for the host side Python packages
> > Your patch was adding both the target and the host variants, though.
> Should I remove the $(eval $(python-package)) line then?

Yes. Just keep the host-python-package one.

> > If you can provide such an example that a specific host-python3-six
> > is needed, do not hesitate to resend your patch with such an explanation
> > in your commit log.
> Yes do let me explain - I am making some contributions to another OSS
> software (OP-TEE) that uses buildroot, and it requires a python3
> variant of the python-cryptography module, which in returns requires
> python3 variants of its dependencies (python-cffi, python-six,
> python-pycparser, python-pip). etc.

Ah, good explanations. Thanks. Please explain that in the commit log
when you resubmit (see below).

> Shall I re-submit everything in a new patch set (split to multiple patches)?

Yes, please. Having the new host-python3-six alone does not make much
sense. If it is followed in the same series by a patch that makes use of
it, then it becones obvious what it is for.

Thanks you for the follow-up with the explanations! :-)

Regards,
Yann E. MORIN.

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
