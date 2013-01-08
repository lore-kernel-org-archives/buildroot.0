From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Jan 2013 13:51:38 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: export BR2_CONFIG_FILE,
	pointing to our .config
In-Reply-To: <50EBC1CB.8030900@mind.be>
References: <cover.1357595083.git.yann.morin.1998@free.fr>
 <fd01d05b62a384b43722e790e3e491f87c818797.1357595083.git.yann.morin.1998@free.fr>
 <50EBC1CB.8030900@mind.be>
Message-ID: <201301081351.38832.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,, All,

On Tuesday 08 January 2013 07:50:51 Arnout Vandecappelle wrote:
> On 07/01/13 22:52, Yann E. MORIN wrote:
[--SNIP--]
> > +# Scripts in support/ may need to parse out .config, so give
> > +# them easy access
> > +export BR2_CONFIG_FILE=$(CONFIG_DIR)/.config.
> 
>   Convention is that BR2_* is set by Kconfig. I kind of like that, it 
> helps us developers to understand a variable's meaning.

I am afraid CONFIG_FILE as is could clash with some packages.
Maybe DOT_CONFIG instead? I'll use that.

>   I would replace the occurences of the plain config file with 
> $(CONFIG_FILE). $(CONFIG_FILE).nopkg does indeed look stupid, so that one 
> should be left alone.

OK, will do. Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
