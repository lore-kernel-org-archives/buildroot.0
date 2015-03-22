From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 15:35:09 +0100
Subject: [Buildroot] [RFC 02/11] per-package .users and .files lists
In-Reply-To: <e1c1a71680aa988903d278c9413cef7b48bad2ad.1426960081.git.alex.suykov@gmail.com>
References: <cover.1426960081.git.alex.suykov@gmail.com>
 <e1c1a71680aa988903d278c9413cef7b48bad2ad.1426960081.git.alex.suykov@gmail.com>
Message-ID: <550ED31D.6040902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/03/15 19:27, Alex Suykov wrote:
> This change does not simplify things much at present, but it
> removes inter-package dependency via make variables.
> Without this patch, reading all enabled package/*/*.mk files from
> a single Makefile was necessary to build user and permission lists.

 But we're not planning to change that... Running a separate make per package
sounds like a terribly bad idea...

> With this patch, the data is stored outside of make, possibly
> allowing one make invocation per package .mk file in the future.

 So, is there any reason left to move USERS and PERMS to a file?

 It has one big disadvantage: it spreads out the package logic over different
files. We currently only have a separate file for the hashes, and that was
probably a bad idea to begin with (as witnessed by the many version bumps that
forget to update the hash file).


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
