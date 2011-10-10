From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Oct 2011 12:28:59 +0200
Subject: [Buildroot] Is BR's http git repo up-to-date?
In-Reply-To: <4E92A9E2.7030300@visionsystems.de> (Yegor Yefremov's message of
 "Mon, 10 Oct 2011 10:16:34 +0200")
References: <4E92A9E2.7030300@visionsystems.de>
Message-ID: <87r52lcf84.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> Since last week if I execute git pull I always get "Already up-to-date." Even if I clone the http://git.buildroot.net/git/buildroot.git to a new folder my last commit message is
 Yegor> commit d1c54ade86e8cae6f0aa1bf1709941c70cea1af7
 Yegor> Author: Peter Korsgaard <jacmet@sunsite.dk>
 Yegor> Date:   Wed Oct 5 00:15:47 2011 +0200

 Yegor>     imagemagick: add optional fftw support

 Yegor>     Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

 Yegor> Am I making something wrong? 

No, something has gone wrong.

For http access to work, you need to run git update-server-info on the
server to rewrite the refs. We did have a call to git-update-server-info
in hooks/post-update (notice the git-), but the legacy
git-update-server-info symlink is no longer present on the server,
causing it to fail.

Interesting, /usr/bin was updated just around that time, so it is
probably caused by a git upgrade that I wasn't informed about:

drwxr-xr-x   2 root   root     36K Oct  4 22:54 .

I've fixed it now, so hopefully it should work in the future. If not,
let me know.

-- 
Bye, Peter Korsgaard
