From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Jan 2013 23:10:10 +0100
Subject: [Buildroot] new <pkg>_CONFIG_FIXUP variable
In-Reply-To: <1357596078-7762-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1357596078-7762-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <201301072310.10765.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Monday 07 January 2013 Stefan Fr?berg wrote:
> This patch provides new variable called <pkg>_CONFIG_FIXUP.
> It's purpose is to fix wrong prefixes of $(STAGING_DIR)/usr/bin/*-config file(s)
> that many library packages install after staging installation phase.
> 
> Some packages provide multible *-config files.
> 
> So as suggested by Thomas Petazzoni and Gustavo Zacarias this 
> variable can be feeded multible files.
> 
> All filenames are relative to $(STAGING_DIR)/usr/bin
> 
> Example:
> 
> DIVINE_CONFIG_FIXUP = divine-config
> 
> or:
> 
> IMAGEMAGICK_CONFIG_FIXUP = Magick-config Wand-config

Please, put this explanation in the commit message.

Also, add this variable to the documentation:
    docs/manual/adding-packages-generic.txt

Next time, also add a snall changelog to your message, so we know there
was prior discussion and to help Peter to apply the correct patch series.
I do something like:
  Changes v1 -> v2:
    - accept multiple files (Thomas, Gustavo)
    - use paths relative to $(STAGING)/usr/bin

And keep this changelog in each iteration. Add the version of the iteration
in your mail subject.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
