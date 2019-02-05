From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 14:25:04 +0100
Subject: [Buildroot] [PATCH] Makefile: unexport 'PLATFORM' and 'OS'
 environment variables
In-Reply-To: <20190205110342.29725-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Tue, 5 Feb 2019 12:03:42 +0100")
References: <20190205110342.29725-1-patrickdepinguin@gmail.com>
Message-ID: <87k1ienz9r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Some package builds may fail when environment variables are present with the
 > same names as make variables in a package. This is a bigger problem for
 > environment variables with generic names, like 'PLATFORM' and 'OS'.

 > 'PLATFORM' is for example a problem for host-acl.

I'm OK with the patch, but what is the error exactly for host-acl? I
don't seem to see any reference to the string 'PLATFORM' in host-acl:

make host-acl-patch
grep -rs PLATFORM build/host-acl-2.2.53
build/host-acl-2.2.53/build-aux/ltmain.sh:         v.dwPlatformId == VER_PLATFORM_WIN32_NT;
build/host-acl-2.2.53/build-aux/ltmain.sh.orig:         v.dwPlatformId == VER_PLATFORM_WIN32_NT;

-- 
Bye, Peter Korsgaard
