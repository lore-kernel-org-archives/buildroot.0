From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 7 Jun 2011 16:47:28 +0200
Subject: [Buildroot] How do I configure crosstool-NG when built from in
	buildroot?`
In-Reply-To: <22B4F7B11BD34704A74C0E8AD60593AA@beraninstruments.com.local>
References: <22B4F7B11BD34704A74C0E8AD60593AA@beraninstruments.com.local>
Message-ID: <201106071647.28724.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will, All,

On Tuesday 07 June 2011 162825 Will Moore wrote:
> What is the right way to reconfigure crosstool-NG when built from within
> buildroot?

---8<---
  # make help
  [--SNIP--]
    ctng-menuconfig        - Run crosstool-NG menuconfig
  [--SNIP--]
---8<---

Alternatively, look at the help entry for "crosstool-NG configuration file"
in the buildroot menuconfig:

---8<---
  BR2_TOOLCHAIN_CTNG_CONFIG:

  Enter here the crosstool-NG's .config file to use.
  To fine-tune your toolchain, you can also call:
    make ctng-menuconfig

  If unsure, keep the default value.

  Symbol: BR2_TOOLCHAIN_CTNG_CONFIG [=............]
  Type  : string
  Prompt: crosstool-NG configuration file to use
    Defined@toolchain/toolchain-crosstool-ng/Config.in:39
    Depends on: BR2_TOOLCHAIN_CTNG [=y]
    Location:
      -> Toolchain
---8<---

Granteed, the second one is not that easy to find, but not too complicated
either. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
