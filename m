From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Mar 2021 08:14:48 +0200
Subject: [Buildroot] [PATCH] package/perl: fix configure when
 BR2_VERSION_FULL contains a '/'
In-Reply-To: <20210327224220.961977-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 27 Mar 2021 23:42:20 +0100")
References: <20210327224220.961977-1-yann.morin.1998@free.fr>
Message-ID: <87sg4bc0iv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When BR2_VERSION_FULL contains one or more '/', injection our version
 > in the perl patch-level fails:

 >     /usr/bin/sed: -e expression #1, char 27: unknown option to `s'

 > When the build is done in a git tree, and HEAD is a tag, BR2_VERSION_FULL
 > will contain that tag name. Even if not widely common, it is not unusual
 > for a tag to contain a '/', and this is perfectly legit in git.

 > So, mangle BR2_VERSION_FULL to escape all '/' with a backslash '\', so
 > that the sed expression is correct, and so that we eventually have a
 > correct pathclevel string in perl's --version output.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Francois Perrad <francois.perrad@gadz.org>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
