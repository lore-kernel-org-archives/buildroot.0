From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Jun 2010 09:40:48 +0200
Subject: [Buildroot] On strip and debugging symbols
In-Reply-To: <20100623091224.266d1030@surf> (Thomas Petazzoni's message of
	"Wed, 23 Jun 2010 09:12:24 +0200")
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
	<87hbkv6sej.fsf@macbook.be.48ers.dk>
	<0D753D10438DA54287A00B027084269763715D651B@AUSP01VMBX24.collaborationhost.net>
	<87d3vi7qqq.fsf@macbook.be.48ers.dk> <20100623091224.266d1030@surf>
Message-ID: <874ogu6vsv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Therefore, I'd propose to add two options (which would replace the
 Thomas> existing ENABLE_DEBUG knob) :

 Thomas>  * ENABLE_DEBUG_IN_STAGING, which is enabled by default, and has the
 Thomas>    effect of building all packages with '-g', and installing them
 Thomas>    unstripped in $(STAGING_DIR). All *packages* would be installed in
 Thomas>    STAGING, be there libraries or end-user applications, so we could
 Thomas>    get rid of the <pkg>_INSTALL_STAGING and <pkg>_INSTALL_TARGET knobs.
 Thomas>    Having the debugging symbols in $(STAGING_DIR) allows to use remote
 Thomas>    debugging correctly.

As mentioned before, the problem with this is that people have
historically expected that they can just export
PATH=path/to/staging/usr/bin:$PATH and use the cross compiler outside
buildroot. If you start installing target binaries into staging/usr/bin
then this would break horrible.

(Yes, I know people should atleast append it to the path (export
PATH=$PATH:path/to/staging/usr/bin), but people will forget and it used
to work.

-- 
Bye, Peter Korsgaard
