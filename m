From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Feb 2014 00:00:12 +0100
Subject: [Buildroot] [PATCH 04/10] toolchain/external: add choice to
 select 'AT_LEAST_XXX' header version
In-Reply-To: <530290F4.1060507@mind.be>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
 <74d76e7816e2de0eccb9a24acd0b768c22078dfa.1392571021.git.yann.morin.1998@free.fr>
 <8fdcf8b3-c275-4250-be9c-11bcf4feaa11@email.android.com>
 <530290F4.1060507@mind.be>
Message-ID: <20140217230012.GD3411@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-02-17 23:45 +0100, Arnout Vandecappelle spake thusly:
> On 16/02/14 21:08, Thomas De Schampheleire wrote:
> > "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
> >> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >>
> >> Select the appropriate BR2_TOOLCHAIN_HEADERS_AT_LEAST_XXX options for the
> >> external, custom toolchain backend.
> >>
> >> We try to be conservative here, and default to kernel headers 2.6.x.
> >>
> >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> >> Cc: Arnout Vandecappelle <arnout@mind.be>
> >> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> >> ---
> >> toolchain/toolchain-external/Config-headers.in | 65 ++++++++++++++++++++++++++
> >> toolchain/toolchain-external/Config.in         |  2 +
> >> 2 files changed, 67 insertions(+)
> >> create mode 100644 toolchain/toolchain-external/Config-headers.in
> >>
> >> diff --git a/toolchain/toolchain-external/Config-headers.in b/toolchain/toolchain-external/Config-headers.in
> >> new file mode 100644
> >> index 0000000..60ac384
> >> --- /dev/null
> >> +++ b/toolchain/toolchain-external/Config-headers.in
> >> @@ -0,0 +1,65 @@
> >> +choice
> >> +	bool "External toolchain kernel headers"
> >> +	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM
> >> +	default BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
> >> +
> > 
> > Shouldn't there be a help text explaining what this is used for, so as to remove confusion about the fact that the kernel header version was already chosen when the toolchain was built?
> 
>  Note, however, that you can't add help text to a choice. So the only
> option is to add the text to every choice option.

Wrong. Just try... ;-)

>  Ah, the limitations of Kconfig...

You talking to me? You talking to me?  :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
