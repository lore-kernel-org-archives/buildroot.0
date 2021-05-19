From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 16:17:24 +0200
Subject: [Buildroot] [External] Re: [PATCH 1/1] package/libopenssl: add
 option to enable some features
In-Reply-To: <DM2P110MB01051BDEDB77556563850C07F22B9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
References: <20200511132133.738039-1-erwan.gautron@bertin.fr>
 <20210516170955.GP2506@scaer>
 <DM2P110MB01051BDEDB77556563850C07F22B9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
Message-ID: <20210519141724.GX2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2021-05-19 13:31 +0000, Weber, Matthew L Collins via buildroot spake thusly:
> On 2020-05-11 15:21 +0200, Erwan GAUTRON spake thusly:
> > From: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>
> > 
> > Openssl implements lot of algorithms that are not required in
> > some emdedded devices and cyphers known as weak.
> > Secure embedded systems shall disable unused algorithms (and weak algo)
> > in order to be certified.
> > This patch allows to select weak algorithms and mecanims to enable
> > such as md5
> > To ensure backward compatibility, all items are selected by default
> > 
> > Signed-off-by: Erwan GAUTRON <erwan.gautron@bertin.fr>
> I noticed a build failure related to no-md5.  Were there cases where some of these weren't defined?
> http://autobuild.buildroot.net/results/9d79c9f313ff989449e9b47c1ff0afd3a167fd2d/

As per CHANGES in the openssl tree:

    Changes between 1.0.2h and 1.1.0  [25 Aug 2016]
    [--SNIP--]
      *) Remove the no-aes, no-hmac, no-rsa, no-sha and no-md5 Configure options.

So, this can't have really worked with a recent openssl, in fact...

Care to send a fixup patch dropping the md5 option, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
