From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Feb 2017 22:40:06 +0100
Subject: [Buildroot] [PATCH] pkg-cmake: pass <pkg>_CONF_ENV for the
	target configure step
In-Reply-To: <1488130968-20114-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 26 Feb 2017 18:42:48 +0100")
References: <1488130968-20114-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87tw7gljgp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The Buildroot manual documents that <pkg>_CONF_ENV is passed in the
 > environment when calling cmake during the configure step. However, the
 > actual implementation in pkg-cmake passes HOST_<pkg>_CONF_ENV when
 > configuring the host variant of a cmake package, but does not pass
 > <pkg>_CONF_ENV when configuring the target variant of a cmake package.

 > This commit fixes that by passing <pkg>_CONF_ENV in the environment as
 > expected. It should not cause any behavior change, because this
 > feature is in fact not used by any package in upstream Buildroot:

 > $ grep CONF_ENV $(git grep -l cmake-package package/)
 > package/pkg-cmake.mk:$(2)_CONF_ENV			?=
 > package/pkg-cmake.mk:	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 > package/pkg-cmake.mk:	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \

 > This issue was reported by Olivier <ovalentin@awox.com> as bug #9616.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
