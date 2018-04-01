From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 16:35:47 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-golang: use 'build' instead
 of 'install'
In-Reply-To: <14f910b9-da10-954d-2d40-13e4b6237b99@mind.be> (Arnout
 Vandecappelle's message of "Sun, 1 Apr 2018 14:26:47 +0200")
References: <20180401115136.1345-1-thomas.petazzoni@bootlin.com>
 <14f910b9-da10-954d-2d40-13e4b6237b99@mind.be>
Message-ID: <87bmf3ro3g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >  Minor nit...
 > On 01-04-18 13:51, Thomas Petazzoni wrote:
 >> @@ -102,7 +102,9 @@ define $(2)_BUILD_CMDS
 >> $$(GO_TARGET_ENV) \
 >> GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
 >> $$($(2)_GO_ENV) \
 >> -			$$(GO_BIN) install -v $$($(2)_BUILD_OPTS) ./$$(d)
 >> +			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
 >> +			-o $$(@D)/$$($(2)_BINDIR)/$$(if $$($(2)_BIN_NAME),$$($(2)_BIN_NAME),$$(notdir $$(d))) \

 >  I find the $(or ...) construct to be more readable:

 > 			-o $$(@D)/$$($(2)_BINDIR)/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \

We do use a lot more $(if than $(or, but OK - $(or is shorter.

-- 
Bye, Peter Korsgaard
