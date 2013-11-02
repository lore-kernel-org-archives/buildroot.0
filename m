From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Nov 2013 18:45:40 +0100
Subject: [Buildroot] [PATCH 1/2] qt: remove the
 BR2_PACKAGE_QT_JAVASCRIPTCORE option
In-Reply-To: <1383409024-17839-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383409024-17839-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131102174540.GD3542@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-11-02 17:17 +0100, Thomas Petazzoni spake thusly:
> The BR2_PACKAGE_QT_JAVASCRIPTCORE option was incorrectly used in
> Buildroot: it's help text and name was pretending it's here to
> enable/disable the JavaScriptCore, but what it did in fact is force
> enable or force disable the usage of the JIT mechanism for the
> JavaScript support in Qt.
> 
> However, the JIT mechanism is architecture-specific, and therefore not
> available for all architectures, and Qt already knows on which
> architectures it is appropriate to enable JIT and on which
> architectures it is not.
> 
> Therefore, this commit simply removes the
> BR2_PACKAGE_QT_JAVASCRIPTCORE option. We don't add it to
> Config.in.legacy, because the feature is still available, it's just
> that Qt will know automatically decide whether JIT should be used or
> not.

In fact, I think we should include it in legacy options, just so the
user is informed that this option is no longer available.

Your little blurb above would make a good help entry for that new legacy
option, BTW.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
