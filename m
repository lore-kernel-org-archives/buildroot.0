From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Jul 2017 15:06:20 +0200
Subject: [Buildroot] [PATCH v2] pixz: new package
In-Reply-To: <20170702212757.639-1-vincent.stehle@laposte.net>
References: <08fd09b4-f3e6-52d0-3138-3ea251edc2ac@mind.be>
 <20170702212757.639-1-vincent.stehle@laposte.net>
Message-ID: <25d817cb-a478-40fc-e6b8-8ce92c1086a5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Vincent,

On 02-07-17 23:27, Vincent Stehle wrote:
> From: Vincent Stehl? <vincent.stehle@laposte.net>
> 
> Add a package for pixz (pronounced pixie), a parallel, indexing version of
> xz.
> 
> See https://github.com/vasi/pixz
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
> 
> 
> Changes since v1:
> -----------------
> - Select libarchive and depend on wchar, as suggested by Arnout
> - Rework comment on conf_env, as suggested by Arnout
> - Make pixz a host package, too. This to prepare making it a selectable
>   alternative to host-xz, as suggested by Arnout

 Since pixz in fact uses xz, it seems like a bad idea to use it as a replacement
for host-xz. It's not as if the xz tarball extraction is such an important part
of build time... So the host package can be removed I guess.

 Sorry for changing my mind.

 Otherwise the patch looks good, so after removing the two lines referring to
the host package you can add my

 Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout


> - Change my e-mail address in DEVELOPERS
> 
> 
>  DEVELOPERS             |  3 ++-
>  package/Config.in      |  1 +
>  package/pixz/Config.in | 13 +++++++++++++
>  package/pixz/pixz.hash |  2 ++
>  package/pixz/pixz.mk   | 21 +++++++++++++++++++++
>  5 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 package/pixz/Config.in
>  create mode 100644 package/pixz/pixz.hash
>  create mode 100644 package/pixz/pixz.mk
> 

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
