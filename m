From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Mar 2017 18:41:43 +0100
Subject: [Buildroot] [PATCH v5 17/19] infra-libtool: no longer disable
 install directory sanity check
In-Reply-To: <1482241596-31688-18-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-18-git-send-email-jezz@sysmic.org>
Message-ID: <c9ce4486-d0c3-14a4-1ec7-a5a93d6e1bd7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-12-16 14:46, J?r?me Pouiller wrote:
> During install, libtool check if $libdir is a subdirectory of $DESTDIR. Until
                               ^s
> now $DESTDIR was $(TARGET_DIR) and $libdir was $(STAGING_DIR)/usr/lib.
> Consequently, this test failed. Since $libdir is now /usr/lib, there is not more
                                 ^Therefore, the Buildroot libtool patch
disabled that test.
                                                                          no
> reason to skipped that test.
            skip
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>


Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(tested on a static arm musl build with about 20 packages)


 Regards,
 Arnout


> ---
>  support/libtool/buildroot-libtool-v1.5.patch   | 18 ------------------
>  support/libtool/buildroot-libtool-v2.2.patch   | 26 ++++++--------------------
>  support/libtool/buildroot-libtool-v2.4.4.patch | 25 +++++--------------------
>  support/libtool/buildroot-libtool-v2.4.patch   | 24 +++++-------------------
>  4 files changed, 16 insertions(+), 77 deletions(-)
[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
