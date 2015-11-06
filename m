From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Nov 2015 17:05:09 +0100
Subject: [Buildroot] [PATCH 1/2] gcc: add patches for powerpc e6500
	64-bit support
In-Reply-To: <1446818745-32224-1-git-send-email-arnout@mind.be>
References: <1446818745-32224-1-git-send-email-arnout@mind.be>
Message-ID: <563CCFB5.4040109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06-11-15 15:05, Arnout Vandecappelle (Essensium/Mind) wrote:
> Building with -mtune=e6500 led to build failures in glibc (probably in
> uclibc as well) because gcc was built for a 32-bit target even though
> the target tuple is powerpc64-*. This lead to a mix of 32-bit and
> 64-bit support and build errors like:
> 
>   fatal error: gnu/lib-names-32.h: No such file or directory
> 
> The root cause is that the configure script is not handling e6500
> correctly, because of stupid typo in the condition.
> 
> Change has been submitted upstream.

 Patch has been accepted upstream.

 Regards,
 Arnout

> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Alvaro Gamez <alvaro.gamez@hazent.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
