From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 Jul 2018 00:10:07 +0200
Subject: [Buildroot] New package: ncrypt
In-Reply-To: <a327fc0f-eff6-d1b7-4c6c-823fdacbc18e@gmail.com>
References: <a327fc0f-eff6-d1b7-4c6c-823fdacbc18e@gmail.com>
Message-ID: <13db6248-37d1-53b0-a6dd-50a1669c5b14@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Kuldeep,

 Thanks a lot for your contribution! It's great to see new people using
Buildroot and contributing to it.

On 07/03/18 20:44, Kuldeep Singh Dhaka wrote:
> Hello everyone,
> 
> Please find the patch attached.

 However, in order to ease the review process, we like to receive patches inline
and not as attachments. Indeed, this allows us to simply hit "reply" and comment
on each part of the patch. This is a very typical review process used in the
open-source community. In order to send patches inline, we recommend you to use
"git send-email" as e-mail clients very often rewrap text and therefore make
patches unusable.

 From a quick look to your patch, here are a few comments:

 The subject line (first line of the commit message) should be something like:

ncrypt: new package

 Also, in the commit message, add a Signed-off-by line for yourself.  This is a
short way for you to assert that you are entitled to contribute the patch under
buildroot's GPL license.  See  http://elinux.org/Developer_Certificate_Of_Origin
for more details.


 The patch 0001-include-getopt-h.patch should also have a description and a
signed-off-by line. We generally prefer git-formatted patches, but in this case,
since upstream uses CVS, it's not strictly needed.


 The hash file should also include a hash for the license file (i.e. COPYING).


 You should also add yourself to the DEVELOPERS file.


 Use $() to delimit variables, not ${}.


 The AUTORECONF = YES doesn't seem to be needed. If it really is needed, please
add a comment above it why it is needed.


 Is there any reason to add it as a host package too? We generally only do that
if it is needed to build some other package.


> Note: I couldn't come up with anything better for NCRYPT_SITE variable.
> Though it may seem that the version code could be used in NCRYPT_SITE
> but no - i couldn't find an pattern.

 You can use $(NCRYPT_VERSION_MAJOR) instead of 0.8.


 Also, I wonder if this package is very useful. There are dozens of other
packages with the same (or rather, a lot more) functionality, and this package
has seen only 1 update in the last 13 years...


 Could you look into those comments, and send an updated version of your
contribution, using git send-email ?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
