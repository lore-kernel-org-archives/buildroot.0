From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Jun 2014 07:29:33 +0200
Subject: [Buildroot] [PATCH 3/3] perl-xml-libxml: new package
In-Reply-To: <1403547286-8858-3-git-send-email-francois.perrad@gadz.org>
References: <1403547286-8858-1-git-send-email-francois.perrad@gadz.org>
 <1403547286-8858-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <53A90CBD.6000904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/06/14 20:14, Francois Perrad wrote:
> and its CPAN dependencies

 This should be split up into four separate patch, one per package. It's quite
easy to do that with git:

git reset master
git add package/perl-xml-namespacesupport
git add -p package/Config.in

and select 'e' to edit the patch, and remove all + lines except the one for
perl-xml-namespacesupport.


 Otherwise, it all looks good. Seems the scancpan script is working well! So
when you resubmit as separate patches, you can add my Reviewed-by tag.

 Regards,
 Arnout


> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                                          |  4 ++++
>  package/perl-xml-libxml/Config.in                          | 10 ++++++++++
>  package/perl-xml-libxml/perl-xml-libxml.mk                 | 14 ++++++++++++++
>  package/perl-xml-namespacesupport/Config.in                |  6 ++++++
>  .../perl-xml-namespacesupport/perl-xml-namespacesupport.mk | 13 +++++++++++++
>  package/perl-xml-sax-base/Config.in                        |  6 ++++++
>  package/perl-xml-sax-base/perl-xml-sax-base.mk             | 13 +++++++++++++
>  package/perl-xml-sax/Config.in                             |  8 ++++++++
>  package/perl-xml-sax/perl-xml-sax.mk                       | 14 ++++++++++++++
>  9 files changed, 88 insertions(+)
>  create mode 100644 package/perl-xml-libxml/Config.in
>  create mode 100644 package/perl-xml-libxml/perl-xml-libxml.mk
>  create mode 100644 package/perl-xml-namespacesupport/Config.in
>  create mode 100644 package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
>  create mode 100644 package/perl-xml-sax-base/Config.in
>  create mode 100644 package/perl-xml-sax-base/perl-xml-sax-base.mk
>  create mode 100644 package/perl-xml-sax/Config.in
>  create mode 100644 package/perl-xml-sax/perl-xml-sax.mk


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
