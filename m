From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Nov 2015 22:05:22 +0100
Subject: [Buildroot] [PATCH 0/5] Introduce alternative archive format
In-Reply-To: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
References: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
Message-ID: <565B6892.9040706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-11-15 11:36, J?r?me Pouiller wrote:
> Hello,
> 
> As suggested by Arnout [1], this series provide an alternative archive
> format. This new format contains a shallowed version of upstream
> repository. This format is a little bigger and a little longer to
> create but it allow a better workflow with upstream. I describe some
> good practice in patch 2.

 The use case I had in mind with [1] was not so much working with upstream (for
that, OVERRIDE_SRCDIR is much more appropriate), but rather to make it cheaper
to get different upstream versions. Particularly for linux repositories, if you
downloaded one of them, you can reuse a large part of it when you get another
version. When you can do a shallow clone there is often not so much to gain from
that, but in many of our defconfigs a shallow clone is not possible because we
specify a sha. In that case, an incremental download really saves a lot of time.


 Regards,
 Arnout

> 
> Notice projects hosted by github don't yet benefit of this feature
> since I have not found any elegant way to do it :-(. 
> 
> During my tests, I have noticed current shallow clone is mostly broken
> (at least with git < 2.5 [2]). Indeed, shallow clone only work with
> symbolic references (HEAD, a tag or a branch). However, we avoid use of
> symbolic references in VERSION.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-November/144296.html
> [2] http://stackoverflow.com/a/30701724/301717
> 
> 
> J?r?me Pouiller (5):
>   pkg-download: do not test SITE_METHOD
>   download/git: allow to create archives containing shallowed git repos
>   pkg-generic: allow to populate build directory from a git archive
>   pkg-generic: provide an option to use git archives
>   pkg-generic: tag sources if git is used
> 
>  Config.in               | 13 +++++++++++
>  package/pkg-download.mk |  7 +-----
>  package/pkg-generic.mk  | 60 ++++++++++++++++++++++++++++++++++---------------
>  support/download/git    | 30 ++++++++++++++++++++++---
>  4 files changed, 83 insertions(+), 27 deletions(-)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
