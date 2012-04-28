From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Apr 2012 17:10:48 +0200
Subject: [Buildroot] libqwt: new package
In-Reply-To: <4F8B3459.1030304@gezedo.com>
References: <4F8B3459.1030304@gezedo.com>
Message-ID: <201204281710.50808.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 15 April 2012 22:49:29 Laurent GONZALEZ wrote:
> hi there,
> 
> with the help of Thomas, I propose this patch to add libqwt.

 Hoi Laurent,

 Thank you for your contribution!  We have pretty strict requirements
for incoming patches, so here are some comments.

 First of all, please post patches in the form as it is produced by
git send-email, i.e.:
- one separate mail per patch;
- Subject of the mail is "[PATCH] qwt: new package";
- Body of the mail has the following structure:

Commit message (typically empty in case of a new package, unless there
is something special to say about it).

Signed-off-by: Your full name <your.email@address.net>
Signed-off-by: Other contributer name <his.email@address.org>
---
Additional free-text comments that should not go into the commit
message.  If you post a second or third version of the patch, this
typically contains a changelog.
---
diff --git a/package/Config.in b/package/Config.in
index d703b8c..d72fcc3 100644
--- a/package/Config.in
+++ b/package/Config.in
...


 Second, each patch should contain your Signed-off-by line.  This is a
statement from you that you have the right to publish it.  See 
http://elinux.org/Developer_Certificate_Of_Origin
Note that even Thomas's patch should contain your sign-off because you're
in its forwarding path.


 And now some comments about the libqwt patch itself.

 Since the upstream package is called qwt, I'd call the buildroot package
qwt instead of libqwt.  Also, because it provides a widget, I'd put it
under 'other GUIs', directly below qt.

 The help text of the Config.in should be wrapped at 80 columns (where the
tab counts as 8 characters).

 For the sed expressions, I'd use % everywhere to make it more consistent.

 There will probably be more remarks, but it's easier to comment on those
when the patch is posted inline instead of as an attachment.


 If you don't have the time to continue work on this patch, please let us
know so someone else can pick it up.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
