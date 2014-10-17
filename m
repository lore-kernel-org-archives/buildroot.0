From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Oct 2014 01:06:07 +0200
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <CAJtjsKZC=Fi4ND7HX+YEEyGrNivu+6RduYnQ08FmVWU+NAiYqA@mail.gmail.com>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
 <20141011162152.GA4254@free.fr>
 <CAJtjsKZC=Fi4ND7HX+YEEyGrNivu+6RduYnQ08FmVWU+NAiYqA@mail.gmail.com>
Message-ID: <5441A0DF.20309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/10/14 14:38, Johan Oudinet wrote:
> ** Fix ejabberd build system
> ** ===================
> The only solution i see is to create a buildroot package for every
> ejabberd dependency, listed in rebar.config.script :
> esip, goldrush, lager, p1_cache_tab, p1_iconv, p1_stringprep, p1_stun,
> p1_tls, p1_utils, p1_xml, p1_yaml, p1_zlib, xmlrpc
> Then, modify ejabberd package to not use rebar at all, or at least to
> not call rebar get-deps. Thus, if I remove deps from the `all'
> makefile rule and deps/.build from the `src' rule dependency, it might
> work.
> 
> Do you have a better idea?

 Perhaps it's an option to run rebar in download-only mode in the download step?
We'd probably need to add a rebar-specific download option, and make sure that
it downloads to the download directory, and make sure that it doesn't do any
network access if the files are already there. This may be complicated...

 If you need to create separate packages, it's probably worthwhile to create a
script to automate that, like Francois Perrad did for the perl modules.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
