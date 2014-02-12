From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Feb 2014 00:59:53 +0100
Subject: [Buildroot] [PATCH V4 2/2] i.MX: Update versions to match
 latest Freescale release
In-Reply-To: <52FC0980.8010003@boundarydevices.com>
References: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381287931-7070-3-git-send-email-eric.nelson@boundarydevices.com>
 <20140212190351.GD17804@free.fr>
 <52FBC72D.3090706@boundarydevices.com>
 <52FBD772.40900@boundarydevices.com> <52FBEE79.9070901@mind.be>
 <20140212161518.75ac8839@core2quad.morethan.org>
 <52FBFBD6.1070609@boundarydevices.com>
 <52FC0980.8010003@boundarydevices.com>
Message-ID: <20140212235952.GG17804@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-02-12 16:53 -0700, Eric Nelson spake thusly:
> >On 02/12/2014 03:15 PM, Mike Zick wrote:
> >>Perhaps alias "mkdir" to "mkdir -p" for the duration of the commands?
> 
> I can't figure out how to get an alias to be effective in the middle of
> this:
> 
> (cd $(BUILD_DIR); \
> 	sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept)

An alias won't work, as aliases are not passed in the environment.

So, while the shell executing the '(.....)' commands will have an mkdir
alias, the shell that runs the self-extractor 'sh $(DL_DIR)/....' will
not have that alias.

You can try it easily:
    (1)$ alias toto='echo TOTO'
    (1)$ toto
    TOTO
    (1)$ /bin/sh
    (2)$ toto
    toto: command not found
    (2)$ exit
    (1)$ toto
    TOTO

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
