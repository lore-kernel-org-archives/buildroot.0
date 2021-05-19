From: Chan, Donald <hoiho@lab126.com>
Date: Wed, 19 May 2021 21:00:10 +0000
Subject: [Buildroot] [PATCH 1/1] package/python3-six: add python3 variant
In-Reply-To: <20210519120015.GU2268078@scaer>
References: <1620853148995.76548@lab126.com> <20210518150056.GQ2506@scaer>
 <1621370634009.93154@lab126.com>,<20210519120015.GU2268078@scaer>
Message-ID: <1621458008892.46397@lab126.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


________________________________________
From: buildroot <buildroot-bounces@busybox.net> on behalf of Yann E. MORIN <yann.morin.1998@free.fr>

Chan, All,

On 2021-05-18 20:43 +0000, Chan, Donald spake thusly:
> > On 2021-05-12 20:59 +0000, Chan, Donald via buildroot spake thusly:
> > >> Signed-off-by: Donald Chan <hoiho@lab126.com>
> > >Why do you need a python3-specific version of six?
> > This was for the host side Python packages

> Your patch was adding both the target and the host variants, though.

Should I remove the $(eval $(python-package)) line then?

>  > Let me me know if this makes sense.

> Yeah, I see the reasoning, but we are only adding the python3-specific
> variant when there is an actual need for it.

> If you can provide such an example that a specific host-python3-six
> is needed, do not hesitate to resend your patch with such an explanation
> in your commit log.

Yes do let me explain - I am making some contributions to another OSS software (OP-TEE) that uses buildroot, and it requires a python3 variant of the python-cryptography module, which in returns requires python3 variants of its dependencies (python-cffi, python-six, python-pycparser, python-pip). etc.

Shall I re-submit everything in a new patch set (split to multiple patches)?

Thanks
Donald
