From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Mar 2020 20:45:27 +0100
Subject: [Buildroot] [PATCH] package/pkg-meson.mk: fix multiple
 _MESON_EXTRA_BINARIES
In-Reply-To: <20200310121510.905791-1-john@metanate.com> (John Keeping's
 message of "Tue, 10 Mar 2020 12:15:10 +0000")
References: <20200310121510.905791-1-john@metanate.com>
Message-ID: <877dzd5w6g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Keeping <john@metanate.com> writes:

 > If multiple entries are specified for _MESON_EXTRA_BINARIES, the current
 > sed expression will only replace the first one.

 > Specifically, from GNU sed 4.8 the manual says:

 >     /regexp/
 >         Match  lines matching the regular expression regexp.  Matching
 >         is performed on the current pattern space, which can be modified
 >         with commands such as ``s///''.

 > so after the first binary has been added, the next entry no longer
 > matches since the pattern space has been modifed.

 > Instead of adding a script for each value, apply the match once and add
 > a subsitution for each entry.

 > Signed-off-by: John Keeping <john@metanate.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
