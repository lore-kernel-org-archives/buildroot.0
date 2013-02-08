From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Feb 2013 23:02:36 +0100
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
	create users
In-Reply-To: <5111A009.10304@mind.be>
References: <cover.1360075956.git.yann.morin.1998@free.fr>
 <5f1de03287fa8817aa692419c52e0997ec3e2489.1360075956.git.yann.morin.1998@free.fr>
 <5111A009.10304@mind.be>
Message-ID: <201302082302.37055.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Wednesday 06 February 2013 Arnout Vandecappelle wrote:
> On 05/02/13 15:54, Yann E. MORIN wrote:
[--SNIP--]
> > +PASSWD_METHOD="$( sed -r -e '/^BR2_TARGET_GENERIC_PASSWD_METHOD="(.)*"$/!d' \
> > +                         -e 's//\1/;'                                       \
> > +                         "${BUILDROOT_CONFIG}"                              \
> > +                )"
> 
>   I'm personally more in favour of sourcing ${BUILDROOT_CONFIG} and using 
> "${BR2_TARGET_GENERIC_PASSWD_METHOD}" directly.

We can't simply source .config from shell scripts. .config may contain
constructs of the form:
    BR2_HOST_DIR="$(BASE_DIR)/host"

which would ultimately try to call a command named 'BASE_DIR' which is
obviously wrong for virtually everybody on Earth (and probably other
planets, too).

So, I kept a sed expression to extract the password encoding method form
the .config.

Note: I applied most of your suggestions, and added your ACK, as per your
initial mail. I hope it will be still valid once you see the nes script! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
