From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jul 2017 23:03:34 +0200
Subject: [Buildroot] [PATCH v8 03/10] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <1500561321-6623-4-git-send-email-wg@grandegger.com>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-4-git-send-email-wg@grandegger.com>
Message-ID: <686a296f-488a-1cb9-cdf0-af949349b7d7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-07-17 16:35, Wolfgang Grandegger wrote:
[snip]

 You forgot:
> +    This script scans a tree and sanitize ELF files' RPATH found in there.
                                            ^s
> +
> +    Sanitization behaves the same whatever the kind of the processed tree,
> +    but the resulting RPATH differs. The rpath sanitization is done using
> +    "patchelf --make-rpath-relazive".
                                  ^t

[snip]
> +            for excludepath in ${HOST_EXCLUDEPATHS}; do
> +                find_args+=( "-path" "${HOST_DIR}""${excludepath}" "-prune" "-o" );

 Unneeded ;

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
