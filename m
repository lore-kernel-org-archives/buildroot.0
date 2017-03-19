From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Mar 2017 00:00:27 +0100
Subject: [Buildroot] [PATCH v2 2/2] tesseract-ocr: new package
In-Reply-To: <20170319145455.27ceaa84@free-electrons.com>
References: <1489910873-8450-1-git-send-email-gilles.talis@gmail.com>
 <1489910873-8450-3-git-send-email-gilles.talis@gmail.com>
 <20170319145455.27ceaa84@free-electrons.com>
Message-ID: <ecfe5b92-0800-cb5c-3f22-53448c1255f9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-03-17 14:54, Thomas Petazzoni wrote:
> Regarding the language files, I'm not entirely happy with the current
> solution, but I couldn't come up with something better. I looked at the
> two following options:
> 
>  * Creating a separate package for the tessdata repository
>    https://github.com/tesseract-ocr/tessdata/, but this repository is
>    3.4GB in size, which is admittedly a bit annoying to download when
>    you just want a single language.
> 
>  * Since the list of languages is quite long, having an explicit option
>    for each of them is a bit annoying. So I looked into turning your
>    one-option-per-language idea into a single option with a space
>    separated list of languages. Except that we anyway need to have the
>    hash file for each language in tesseract-ocr.hash.

 That's why we have BR_NO_CHECK_HASH_FOR, no?

 Regards,
 Arnout

> 
> So in the end, I kept it as-is. We'll see if other folks have better
> idea.

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
