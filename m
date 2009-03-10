From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Mar 2009 09:29:58 +0100
Subject: [Buildroot] problems configuring libcurl
In-Reply-To: <49B5BA80.5090103@unix-beratung.de> (Robert Urban's message of
	"Tue\, 10 Mar 2009 01\:55\:28 +0100")
References: <49B5BA80.5090103@unix-beratung.de>
Message-ID: <87tz61aigp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robert" == Robert Urban <urban@unix-beratung.de> writes:

 Robert> Hi Folks,
 Robert> i've enabled libcurl in svn-buildroot, but the configure-run fails with:

 Robert> configure: Added
 Robert> /big/home/urban/Build/Buildroot/svn/buildroot/build_i586/staging_dir/usr/lib
 Robert> to LD_LIBRARY_PATH
 Robert> checking for inflateEnd in -lz... grep: error while loading shared
 Robert> libraries: libc.so.0: cannot open shared object file: No such
 Robert> file or directory

Are you building for the same architecture as your host? Are you also
building grep? It seems like configure somehow picked up the target
version of grep.

Please post your .config

-- 
Bye, Peter Korsgaard
