From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 23 Aug 2007 13:26:39 +0200
Subject: [Buildroot] User-space packages - Staging_Dir or Target_Dir
In-Reply-To: <b6838d3a0708221647x723c470eq6d9ba50858b3e4eb@mail.gmail.com>
References: <b6838d3a0708221647x723c470eq6d9ba50858b3e4eb@mail.gmail.com>
Message-ID: <20070823112639.GK11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 22, 2007 at 07:47:59PM -0400, Daniel Frey wrote:
>When constructing my make files for my packages in the package/, what is the
>suggested installation directory, TARGET_DIR or STAGING_DIR?
>
>Some of the included packages install them to STAGING_DIR.  The
>Documentation on the buildroot website has them installed in the TARGET_DIR.
>
>Is there a correct way, or preferred way?

Depends :)

Files that go straight to the target have to me installed to the
TARGET_DIR. Intermediate files (prerequisites of stuff that will be on
the target like helper libraries, headers, etc) have to live in
STAGING_DIR. Sometimes only a small fraction of files in the staging_dir
is needed in the real target, so they are copied selectively.

HTH,
Bernhard
