From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 May 2013 23:30:49 +0200
Subject: [Buildroot] buildroot needs a root pasword, why ??
In-Reply-To: <B2E777BEED5E4FB9A7E403CE15ED3A4A@M58p>
References: <2F3FBE81FE784B19BA37A3BE62C1FA7A@M58p>
 <20130524174319.GA3205@free.fr>
 <B2E777BEED5E4FB9A7E403CE15ED3A4A@M58p>
Message-ID: <20130524213049.GB3205@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sabri,

1. Do not top-post, this is considered bad-behaviour,
2. keep the list copied on replies.

On 2013-05-24 22:57 +0200, Sabri Altunbas spake thusly:
> If I press ENTER I get this error message
> 
> Welcome to Buildroot
> buildroot login: root
> Password: 
> Login incorrect
> buildroot login:

What version of Buildroot are you using?

For quite sometime now, the default password is the empty string.
However, if you forgot what password you've set, you can recover it by
looking at the .config file in the Buildroot tree:
    $ grep ROOT_PASSWD .config
    BR2_TARGET_GENERIC_ROOT_PASSWD=""

If it is not the empty string, then this is your password.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
