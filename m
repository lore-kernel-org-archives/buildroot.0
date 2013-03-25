From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 09:32:29 +0100
Subject: [Buildroot] [PATCH 6/6] manual: do not track generated files
In-Reply-To: <514FF950.4080307@mind.be>
References: <1363983159-4357-1-git-send-email-s.martin49@gmail.com>
 <514FF950.4080307@mind.be>
Message-ID: <20130325093229.4ea7044b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 25 Mar 2013 08:14:24 +0100, Arnout Vandecappelle wrote:

>   If they are not committed, they shouldn't be in the buildroot tree. 
> Instead they should move to output/docs/manual/...
> 
>   Or is asciidoc making that hard?

Yes, we already discussed that with Samuel yesterday, and he has pushed
to his branch a new version that generates the files in $(O). It's not
entirely pretty though because asciidoc cannot include .txt files from
multiple directories, so we have to copy all the static .txt files to
somewhere in $(O) so that they can be in the same directory as the
generated .txt files.

Yann has sent a patch set that includes Samuel changes, see:

From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot at busybox.net
Subject: [Buildroot] [PATCH 07/14] manual: do not track generated files
Date: Sun, 24 Mar 2013 23:50:42 +0100

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
