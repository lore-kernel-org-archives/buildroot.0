From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Jan 2016 14:10:30 +0100
Subject: [Buildroot] [PATCH 4/4] package/sqlite: add optional support
	for libedit
In-Reply-To: <20160123131048.579f660b@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 23 Jan 2016 13:10:48 +0100")
References: <1453544625-30597-1-git-send-email-bernd.kuhls@t-online.de>
 <1453544625-30597-4-git-send-email-bernd.kuhls@t-online.de>
 <20160123131048.579f660b@free-electrons.com>
Message-ID: <87oaccqw55.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Bernd Kuhls,
 > On Sat, 23 Jan 2016 11:23:45 +0100, Bernd Kuhls wrote:

 >> diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
 >> index 7ea9eb1..31add17 100644
 >> --- a/package/sqlite/Config.in
 >> +++ b/package/sqlite/Config.in
 >> @@ -8,13 +8,25 @@ config BR2_PACKAGE_SQLITE
 >> 
 >> if BR2_PACKAGE_SQLITE
 >> 
 >> +choice
 >> +	prompt "Command-line editing"
 >> +	default BR2_PACKAGE_SQLITE_READLINE
 >> +	help
 >> +	  Enable command-line editing.
 >> +
 >> +config BR2_PACKAGE_SQLITE_LIBEDIT
 >> +	bool "libedit"
 >> +	select BR2_PACKAGE_LIBEDIT
 >> +
 >> config BR2_PACKAGE_SQLITE_READLINE
 >> -	bool "Command-line editing"
 >> +	bool "readline"
 >> select BR2_PACKAGE_NCURSES
 >> select BR2_PACKAGE_READLINE
 >> help
 >> Enable command-line editing. This requires ncurses and readline.

 > I am not sure I like adding a choice for such a simple thing.
 > Config.in choices are not randomized in our build testing.

 > What about instead dropping the BR2_PACKAGE_SQLITE_READLINE option, and
 > automatically enable readline/libedit support in sqlite when the
 > corresponding packages are enabled ?

 > Peter, what do you think ?

Yes, I also think that would be nicer. The situation with readline is
imho quite like openssl, E.G. we should just enable support for it in
packages if it is present.

-- 
Venlig hilsen,
Peter Korsgaard 
