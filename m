From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Jan 2020 11:50:49 +0100
Subject: [Buildroot] [PATCH/RFC 1/1] package/libiconv: enable extra
 encodings
In-Reply-To: <20200128222140.367045-1-bernd.kuhls@t-online.de>
References: <20200128222140.367045-1-bernd.kuhls@t-online.de>
Message-ID: <20200129115049.313f6d6a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Jan 2020 23:21:40 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Quoting https://www.gnu.org/software/libiconv/
> 
> "When configured with the option --enable-extra-encodings, it also
>  provides support for a few extra encodings:
> 
> European languages
>     CP{437,737,775,852,853,855,857,858,860,861,863,865,869,1125}
> Semitic languages
>     CP864
> Japanese
>     EUC-JISX0213, Shift_JISX0213, ISO-2022-JP-3
> Chinese
>     BIG5-2003 (experimental)
> Turkmen
>     TDS565
> Platform specifics
>     ATARIST, RISCOS-LATIN1"
> 
> Updating Kodi from version 17.6 to 18.5 caused runtime errors on systems
> with locale support disabled, here Kodi uses libiconv but needs CP437:
> 
> ERROR: customConvert: iconv_open() for "CP437" -> "UTF-8" failed,
>  errno = 22 (Invalid argument)
> 
> The size of libiconv.so.2.6.0 grows from 941K to 1,1M.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

In the Kodi use case, a size increase of 160 KB is not important
obviously, but libiconv is also used in other situations where size
might matter. I don't have a very strongly formed opinion on this, but
perhaps this is a case where a Config.in sub-option might be useful,
which would be selected by Kodi. Please wait a bit for others feedback
before implementing this though, as others may disagree.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
