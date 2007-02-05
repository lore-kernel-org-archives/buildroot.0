From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 5 Feb 2007 09:57:18 +0100
Subject: [Buildroot] submitting a nice patch - quickguide for CVS users
	[was: Re:..]
In-Reply-To: <964506.40087.qm@web62003.mail.re1.yahoo.com>
References: <20070204111755.GL12488@aon.at>
	<964506.40087.qm@web62003.mail.re1.yahoo.com>
Message-ID: <20070205085718.GD5399@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 04, 2007 at 02:57:44PM -0800, Doug the RockRat wrote:
>Bernhard,
>If/when I submit patches, what form is most useful for
>you?  If it is svn related, would you dump me a short
>command that I might use? I'm a CVS dog, and just
>haven't had time to see what it might take to move my
>CVS repo to svn.

If you create a new directory or add new files, you have to
$ svn add package/mything
resp.
$ svn add package/existing/newfile

To create a patch that we can apply with patch -p1, do
$ foo=$(basename $(pwd))
$ cd ..
$ svn diff --diff-cmd diff -x -rdup $foo > ~/mypatch.diff
$ mail -a ~/mypatch.diff -s "blah" buildroot at there

or the like, depending on your preferred MUA and svn defaults.

HTH,
