From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 17:14:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-python: fix python 3.8.0
 package builds
In-Reply-To: <20191017162127.4261-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Thu, 17 Oct 2019 10:21:27 -0600")
References: <20191017162127.4261-1-james.hilliard1@gmail.com>
Message-ID: <87o8yekrvs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > We need to update the sysconfigdata path for python 3.8.0 per upstream
 > commit 7efc526e5cfb929a79c192ac2dcf7eb78d3a4401 which indicates the "m"
 > flag has been removed from sys.abiflags.

 > Fixes this build error when building target packages:
 > ValueError: Empty module name

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > ---
 >  package/pkg-python.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/pkg-python.mk b/package/pkg-python.mk
 > index e906920417..be1ce071df 100644
 > --- a/package/pkg-python.mk
 > +++ b/package/pkg-python.mk
 > @@ -21,7 +21,7 @@
 >  ################################################################################
 
 >  define PKG_PYTHON_SYSCONFIGDATA_NAME
 > -$(basename $(notdir $(wildcard $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata_m_linux_*.py)))
 > +$(basename $(notdir $(wildcard $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata__linux_*.py)))

Ehh, this presumably then breaks it for python 2.7?

-- 
Bye, Peter Korsgaard
