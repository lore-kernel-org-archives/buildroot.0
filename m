From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jun 2014 22:34:57 +0200
Subject: [Buildroot] [PATCH] infra: indent the Config.in source-ing of
	packages
In-Reply-To: <1399584943-26869-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Thu, 8 May 2014 23:35:43 +0200")
References: <1399584943-26869-1-git-send-email-arnout@mind.be>
Message-ID: <87y4x3famm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > This makes sure that a patch adding a package shows in which menu the
 > package is added.

 > Before this commit, the patch has something like this:
 >> diff --git a/package/Config.in b/package/Config.in
 >> index 7800f23..433312e 100644
 >> --- a/package/Config.in
 >> +++ b/package/Config.in
 >> @@ -864,6 +864,7 @@ source "package/googlefontdirectory/Config.in"
 >> source "package/haveged/Config.in"
 >> source "package/mcrypt/Config.in"
 >> source "package/mobile-broadband-provider-info/Config.in"
 >> +source "package/mypackage/Config.in"
 >> source "package/shared-mime-info/Config.in"
 >> source "package/snowball-init/Config.in"
 >> source "package/sound-theme-borealis/Config.in"

 > [> added to avoid git-am recognizing this as the patch]

 > After this commit, the function marker shows in which menu the new
 > package was added:
 >> diff --git a/package/Config.in b/package/Config.in
 >> index b1111c8..7e6e1a4 100644
 >> --- a/package/Config.in
 >> +++ b/package/Config.in
 >> @@ -864,6 +864,7 @@ menu "Miscellaneous"
 >> source "package/haveged/Config.in"
 >> source "package/mcrypt/Config.in"
 >> source "package/mobile-broadband-provider-info/Config.in"
 >> +	source "package/mypackage/Config.in"
 >> source "package/shared-mime-info/Config.in"
 >> source "package/snowball-init/Config.in"
 >> source "package/sound-theme-borealis/Config.in"

 > To keep things consistent, this is done for Config.in.host there, even
 > though we don't have sub-menus there at the moment.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > Obviously, this patch is very fragile: it will be broken if any new
 > package is added. Therefore, please don't apply it as is, but use:
 > sed -i "/^source/s//$(printf \\t)source/" package/Config.in package/Config.in.host
 > (printf for easy cut&paste).
 > Verify that nothing important changed with
 > git diff --ignore-all-change

Committed (regenerated), thanks!

-- 
Bye, Peter Korsgaard
