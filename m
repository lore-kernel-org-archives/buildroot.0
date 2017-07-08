From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Jul 2017 20:55:50 +0200
Subject: [Buildroot] [PATCH] ccache: make default host-ccache cache dir
	fit for multi-user setups
In-Reply-To: <20170706104841.7711-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 6 Jul 2017 12:48:41 +0200")
References: <20170706104841.7711-1-peter@korsgaard.com>
Message-ID: <87o9suvjux.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > While building I noticed:
 >>>> host-ccache 3.3.4 Building
 > conf.c: In function 'conf_create':
 > conf.c:314:2: warning: too many arguments for format [-Wformat-extra-args]
 conf-> cache_dir = format("/home/peko/.buildroot-ccache", get_home_directory());
 >   ^

 > As host-ccache gets installed into $(HOST_DIR) and is part of the SDK,
 > hardcoding the build user homedir isn't really nice for the relocatable
 > SDK feature (or simply for a SDK used by multiple users).

 > As the warning shows, CCache replaces "%s" with the current user home
 > directory, so rewrite BR_CACHE_DIR to use this feature if it begins with
 > $HOME.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
