From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 14:10:51 +0200
Subject: [Buildroot] [PATCH v2 1/1] core: rename FOO_BASE_NAME to
 FOO_BASENAME to avoid clashes
In-Reply-To: <20180206125923.GB20598@australia.be.alcatel-lucent.com> (Thomas
 De Schampheleire's message of "Tue, 6 Feb 2018 13:59:23 +0100")
References: <20180206125923.GB20598@australia.be.alcatel-lucent.com>
Message-ID: <871sfzt9dg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <thomas.de_schampheleire@nokia.com> writes:

 > In current Buildroot, clashes occur between the variables _NAME and
 > _BASE_NAME for two packages called foo and foo-base, i.e.

 > Package foo:
 > FOO_NAME = foo
 > FOO_BASE_NAME = foo-1.2.3

 > Package foo-base:
 > FOO_BASE_NAME = foo-base
 > FOO_BASE_BASE_NAME = foo-base-4.5.6

 > where variable FOO_BASE_NAME is clashing between these two packages.
 > Specific cases where this clash is already existing are:
 > - alljoyn-base
 > - alljoyn-tcl-base
 > - perl-xml-sax-base

 > The problem is generic and can occur for a number of variables in Buildroot.
 > A non-exhaustive list:
 >     <pkg>_BASE and <pkg>_BASE_NAME
 >     <pkg>_BASE_NAME and <pkg>_RAW_BASE_NAME
 >     <pkg>_DIR and <pkg>_DL_DIR
 >     <pkg>_VERSION and <pkg>_DL_VERSION
 >     <pkg>_SOURCE and <pkg>_TARGET_SOURCE
 >     <pkg>_INSTALL_IMAGES and <pkg>_TARGET_INSTALL_IMAGES  (same for _STAGING and _TARGET)
 >     <pkg>_LICENSE_FILES and <pkg>_MANIFEST_LICENSE_FILES
 >     <pkg>_DEPENDENCIES and <pkg>_FINAL_DEPENDENCIES

 > One solution is to use another separator than '_' to separate the
 > package name from the rest of the variable name. For example, a double
 > underscore:
 > FOO__NAME
 > FOO__BASE_NAME
 > FOO_BASE__NAME
 > FOO_BASE__BASE_NAME

 > However, making that change for only this case means that the variable
 > naming is no longer consistent. And making the change for all variables has
 > a large impact, also on certain user scripts.

 > For now, keep it simple, and rename FOO_BASE_NAME into FOO_BASENAME, so that
 > the variables become:
 > FOO_NAME
 > FOO_BASENAME
 > FOO_BASE_NAME
 > FOO_BASE_BASENAME

 > For consistency, also adapt FOO_RAW_BASE_NAME. Since FOO_RAW_BASENAME would
 > still pose a conflict with a package called 'foo-raw', take the opportunity
 > to rename it into FOO_BASENAME_RAW instead, which does not pose a conflict
 > as we have no variable called FOO_RAW.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
