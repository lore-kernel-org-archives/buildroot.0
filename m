From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2020 13:48:13 +0200
Subject: [Buildroot] [PATCH 1/3] package/mbedtls: add
 BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
In-Reply-To: <20200424113226.mhi7l3r46wluyu7v@einstein.dilieto.eu>
References: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
 <20200423220905.06d9dc59@windsurf.home>
 <20200423232758.zwos3e5f55pz23ld@einstein.dilieto.eu>
 <20200424090710.GA5035@scaer>
 <20200424112639.xdzs4ggqtijcij74@einstein.dilieto.eu>
 <20200424113226.mhi7l3r46wluyu7v@einstein.dilieto.eu>
Message-ID: <20200424114813.GH5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicola, All,

On 2020-04-24 13:32 +0200, Nicola Di Lieto spake thusly:
> On Fri, Apr 24, 2020 at 01:26:39PM +0200, Nicola Di Lieto wrote:
> >>
> >>I think we should refuse to use mbedtls with uacme.
> >
> >I agree, at least until mbedTLS changes its approach.
> 
> Just to clarify. It's sufficient to disable building ualpn at configure
> stage with --without-ualpn. The main binary uacme is fine, even without
> unsupported critical extensions in mbedTLS.

Still, I think we should just entirely drop support for embedtls.

Users would be surprised if they have a different behaviour between
using openssl v.s gnutls v.s embedtls.

Then, when embedtls is updated to undersdand that critical extension, we
can re-instate support for embedtls in uacme.

Until then, my opinion is that we should just stop building uacme with
embedtls.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
