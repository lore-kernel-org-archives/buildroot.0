From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 02 Feb 2009 07:34:03 +0100
Subject: [Buildroot] svn
	commit:	trunk/buildroot/package/multimedia/alsa-lib
In-Reply-To: <20090202070901.1b015522@hcegtvedt>
References: <20090131101825.7DC5376219@busybox.osuosl.org>
	<20090202070901.1b015522@hcegtvedt>
Message-ID: <1233556443.5742.42.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-02-02 klockan 07:09 +0100 skrev Hans-Christian Egtvedt:
> On Sat, 31 Jan 2009 10:18:25 +0000 (UTC)
> ulf at uclibc.org wrote:
> 
> > Author: ulf
> > Date: 2009-01-31 10:18:23 +0000 (Sat, 31 Jan 2009)
> > New Revision: 25175
> > 
> > Log:
> > Workaround for AVR32 compiler issue affecting inlining, causing
> > alsa-lib to break, feedback to AVR32 compiler team will be sent
> > 
> 
> Huh? Inline bug?

If I download the latest trunk and build atstk100x/alsa-lib 
(without the patch) then I get an error which to me indicates
that the compiler issues a jump instruction with a limited 
jump range, and then it turns out that the jump is
longer than allowed.

Same happens on www.atmel.no/buildroot-avr32-2.3.0

I am running OpenSuSE 11.0

There are other applications which show the same problem,
but I don't have a list of those.

BR
Ulf Samuelsson

> > ++#if	defined(AVR32_INLINE_BUG)
> > ++int _snd_pcm_hw_params_set_format(snd_pcm_hw_params_t *params,
> > ++						snd_pcm_format_t
> > val); ++int _snd_pcm_hw_params_set_subformat(snd_pcm_hw_params_t
> > *params, ++				     snd_pcm_subformat_t
> > val); ++#else
> 
> Do you have a test case where this is needed to work?
> 
> <snipp>
> 
