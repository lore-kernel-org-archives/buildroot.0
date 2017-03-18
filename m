From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Mar 2017 18:45:40 +0100
Subject: [Buildroot] [PATCH v5 18/19] infra-libtool: remove workaround
 for calls without `--tag'
In-Reply-To: <1482241596-31688-19-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-19-git-send-email-jezz@sysmic.org>
Message-ID: <ab8ebb86-b0b0-b213-9c66-35d8a37d58ce@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-12-16 14:46, J?r?me Pouiller wrote:
> Buildroot included a work around for the case libtool was called with a
> non-existant `--tag'. We was not able create reproduce this problem anymore. So,
> we drop this workaround.

 It's better to refer to the commit adding it. Something like:

Buildroot included a work around for the case libtool was called with a
non-existent '--tag'. This was introduced as a series of hacks to make
cross-compilation of fontconfig work in commit ee8f2133, ten years ago. The hack
was carried over in various incarnations of the libtool patch, but is no longer
relevant.

> 
> Please send a bug report if you encounter this problem again.

 I don't think this sentence is necessary. The hack is just too far out - if the
package build system calls libtool with an unknown --tag option, something is
truly rotten.

> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>


Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(tested on a static arm musl build with about 20 packages)


 Regards,
 Arnout

> ---
>  support/libtool/buildroot-libtool-v1.5.patch   | 12 ------------
>  support/libtool/buildroot-libtool-v2.2.patch   | 11 -----------
>  support/libtool/buildroot-libtool-v2.4.4.patch | 11 -----------
>  support/libtool/buildroot-libtool-v2.4.patch   | 11 -----------
>  4 files changed, 45 deletions(-)
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
