From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 2 Feb 2009 07:09:01 +0100
Subject: [Buildroot] svn commit:
 trunk/buildroot/package/multimedia/alsa-lib
In-Reply-To: <20090131101825.7DC5376219@busybox.osuosl.org>
References: <20090131101825.7DC5376219@busybox.osuosl.org>
Message-ID: <20090202070901.1b015522@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 31 Jan 2009 10:18:25 +0000 (UTC)
ulf at uclibc.org wrote:

> Author: ulf
> Date: 2009-01-31 10:18:23 +0000 (Sat, 31 Jan 2009)
> New Revision: 25175
> 
> Log:
> Workaround for AVR32 compiler issue affecting inlining, causing
> alsa-lib to break, feedback to AVR32 compiler team will be sent
> 

Huh? Inline bug?

> ++#if	defined(AVR32_INLINE_BUG)
> ++int _snd_pcm_hw_params_set_format(snd_pcm_hw_params_t *params,
> ++						snd_pcm_format_t
> val); ++int _snd_pcm_hw_params_set_subformat(snd_pcm_hw_params_t
> *params, ++				     snd_pcm_subformat_t
> val); ++#else

Do you have a test case where this is needed to work?

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
