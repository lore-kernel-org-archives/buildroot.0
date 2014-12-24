From: Steve James <ste@junkomatic.net>
Date: Wed, 24 Dec 2014 12:25:54 +0000
Subject: [Buildroot] [PATCH v3] leveldb: new package
In-Reply-To: <1419418559-23870-1-git-send-email-ste@junkomatic.net>
References: <1419418559-23870-1-git-send-email-ste@junkomatic.net>
Message-ID: <201412241225.54658.ste@junkomatic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 24 Dec 2014 10:55:59 Steve James wrote:
> Adds new package: leveldb
> 
>   LevelDB is a fast key-value storage library written at Google that
>   provides an ordered mapping from string keys to string values.
> 
--snip--
> +
> +TARGET_CFLAGS += $(LEVELDB_CFLAGS)
> +TARGET_CXXFLAGS += $(LEVELDB_CFLAGS)
> +TARGET_MAKE_ARGS += $(LEVELDB_MAKE_ARGS)
> +
--snip--

Hang on, have I done something evil there? I'm working on another package now
and these flags are leaking into it. Looks like apending to TARGET_CFLAGS is
a no-no. So the rule to follow is: all Make macros should be scoped with the
package name. What I wanted to do was add to the value of CFLAGS as passed
by TARGET_CONFIGURE_OPTS. I'm looking for the right way to do that...

Steve.
