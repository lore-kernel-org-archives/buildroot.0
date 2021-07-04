From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Jul 2021 13:01:32 +0200
Subject: [Buildroot] [PATCHv4 02/16] core: enable 'NDEBUG' unless
 BR2_ENABLE_RUNTIME_DEBUG is set
In-Reply-To: <20210704111539.3ce01855@windsurf> (Thomas Petazzoni's message of
 "Sun, 4 Jul 2021 11:15:39 +0200")
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
 <20210601143422.25064-3-patrickdepinguin@gmail.com>
 <20210704111539.3ce01855@windsurf>
Message-ID: <87k0m61gxf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Tue,  1 Jun 2021 16:34:07 +0200
 > Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

 >> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 >> 
 >> The 'assert' statement in glibc honors the 'NDEBUG' preprocessor macro: if
 >> it is set, then the assert statement is compiled away.
 >> 
 >> Define this 'NDEBUG' macro when BR2_ENABLE_RUNTIME_DEBUG is disabled (the
 >> default case).
 >> 
 >> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

 > So, I would like to challenge whether this change is really a good
 > idea. Since this has been merged, we had to add a significant number of
 > patches to undefine NDEBUG.

Indeed.

 > I believe this change is too dangerous, has caused a number of build
 > breakage + can cause run-time breakage that is difficult to predict.

 > What do you think ?

I agree, I don't think it ends up being a net positive regarding
cost/benefit. I would prefer to revert it.

-- 
Bye, Peter Korsgaard
