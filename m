From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 22:00:49 +0200
Subject: [Buildroot] [PATCH 05/13] packages: use new $($PKG)_DL_DIR)
 variable
In-Reply-To: <20170704162211.13238-6-maxime.hadjinlian@gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170704162211.13238-6-maxime.hadjinlian@gmail.com>
Message-ID: <06aba0c0-ced3-a9ee-3f35-93a7dcf67ade@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 18:22, Maxime Hadjinlian wrote:
> Instead of DL_DIR, the package should now use $(PKG)_DL_DIR to ease the
> transition into a new directory structure for DL_DIR.
> 
> This commit has been generated with the following scripts:
> 
> for i in package/*/*.mk; do
> 	if ! grep -q "\$(DL_DIR)" ${i}; then
> 		continue
> 	fi
> 	pkg_name="$(basename $(dirname ${i}))"
> 	raw_pkg_name=$(echo ${pkg_name} | tr [a-z] [A-Z] | tr '-' '_')
> 	pkg_dl_dir="${raw_pkg_name}_DL_DIR"
> 	sed -i "s/\$(DL_DIR)/\$($pkg_dl_dir)/" ${i}
> done
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[snip]
>  48 files changed, 52 insertions(+), 52 deletions(-)

 This patch could be a lot smaller if we first had a patch that adds support for
unzip to suitable-extractor...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
