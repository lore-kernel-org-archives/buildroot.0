From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jan 2020 16:08:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/ptm2human: new package
In-Reply-To: <20200124182447.17295-1-juju@cotds.org>
References: <20200124182447.17295-1-juju@cotds.org>
Message-ID: <20200126150805.GN32369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2020-01-24 19:24 +0100, Julien Olivain spake thusly:
> ptm2human is a decoder for trace data outputted by Program
> Trace Macrocell (PTM) and Embedded Trace Macrocell (ETMv4).
> It deconstructs ID packets and data packets from the
> formatter of ARM Coresight ETB, and then translates the
> trace data to a human-readable format.
> 
> ./utils/test-pkg --package ptm2human --all
> 44 builds, 29 skipped, 0 build failed, 0 legal-info failed
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>

I've applied to msater, with the folowing chamges:

  - drop the host variant
  - introduce _ARCH_SUPPORTS
  - comment why we need autoreconf
  - drop spurious empty line

For the host variant, I dropped it because I don't see how this would be
usefull as a build-time tool. If you believe you have a good case for
it, please resend a patch adding the host variant with a commit log that
explains why it is nice to have it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
