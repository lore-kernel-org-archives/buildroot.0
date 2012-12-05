From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Dec 2012 11:00:27 -0800
Subject: [Buildroot] [PATCH 4/4] lua: support linenoise
In-Reply-To: <1354551135-30056-4-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Mon, 3 Dec 2012 17:12:14 +0100")
References: <1354551135-30056-1-git-send-email-francois.perrad@gadz.org>
 <1354551135-30056-4-git-send-email-francois.perrad@gadz.org>
Message-ID: <87boe89vec.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 Francois> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks (but see below).

 Francois> @@ -16,10 +16,16 @@ LUA_MYLIBS += -ldl
 Francois>  ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
 Francois>  	LUA_DEPENDENCIES = readline ncurses
 Francois>  	LUA_MYLIBS += -lreadline -lhistory -lncurses
 Francois> -	LUA_CFLAGS += -DLUA_USE_LINUX
 Francois> +	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN -DLUA_USE_READLINE

Why did you change LUA_USE_LINUX to LUA_USE_POSIX?


-- 
Bye, Peter Korsgaard
