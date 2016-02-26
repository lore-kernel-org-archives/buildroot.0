From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Feb 2016 20:45:53 +0100
Subject: [Buildroot] [PATCH 1/1] New package: uwsgi
In-Reply-To: <61CE0A74-9F69-42A8-AE60-0D486700307E@xiot.nl>
References: <1451577776-29708-1-git-send-email-a.cappelli@gmail.com>
 <0BBD31CA-6B23-476F-842F-8F704E319510@xiot.nl> <56CF89F5.5030609@mind.be>
 <61CE0A74-9F69-42A8-AE60-0D486700307E@xiot.nl>
Message-ID: <56D0AB71.8050905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/26/16 09:01, Eelco Chaudron wrote:
> Hi Arnout,
> 
> For now I fixed it by changing the uclib configuration to include backtrace()
> support.
> 
> +++ uClibc-ng.config
> @@ -39,3 +39,4 @@ DEVEL_PREFIX="/usr/"
>  UCLIBC_HAS_SSP=y
>  UCLIBC_BUILD_NOW=y
>  # DOSTRIP is not set
> +UCLIBC_HAS_BACKTRACE=y

 Since uClibc _can_ be configured without backtrace, the package must either
detect missing backtrace support and work around it, or be disabled completely
on uClibc. We can't detect the backtrace support at Kconfig level, so it really
has to be conditional in the package configure/make itself.

 For an example, look at package/clamav/0003-backtrace-uClibc.patch


 Regards,
 Arnout


> 
> Cheers,
> 
> Eelco
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
