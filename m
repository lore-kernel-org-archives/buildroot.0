From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Sep 2009 16:29:36 +0200
Subject: [Buildroot] coreutils build failing
In-Reply-To: <4AA58BB1.50906@rodgers.sdcoxmail.com> (Stephen Rodgers's message
	of "Mon\, 07 Sep 2009 15\:39\:45 -0700")
References: <4AA3EBC6.3080306@rodgers.sdcoxmail.com>
	<877hwbmi5k.fsf@macbook.be.48ers.dk>
	<4AA5300B.3060804@rodgers.sdcoxmail.com>
	<87r5ui63d1.fsf@macbook.be.48ers.dk>
	<4AA5529F.7050906@rodgers.sdcoxmail.com>
	<8763bu5twt.fsf@macbook.be.48ers.dk>
	<4AA58BB1.50906@rodgers.sdcoxmail.com>
Message-ID: <87r5ugyywf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephen" == Stephen Rodgers <hwstar@rodgers.sdcoxmail.com> writes:

Hi,

 >> Could you either try with the default uclibc config or post your config?

 Stephen> I can confirm that default uClibc config fails in the same
 Stephen> way. The only difference between my custom config and the
 Stephen> default config is the enabling of SUSV3 legacy support which
 Stephen> is required for Asterisk/Zaptel.

 Stephen> In the meantime, As a test I modified the config.h in in the
 Stephen> build_i686/coreutils-7.4 directory to see if it would compile,
 Stephen> and it did:

 Stephen> /* Define if rename does not work when the destination file exists, as
 Stephen> on Windows. */
 Stephen> /* #define RENAME_DEST_EXISTS_BUG 1 */

Ok, but then you need to figure out why that gets defined. Looking at
the code it doesn't make any sense to me:

    case "$host_os" in
      mingw*) gl_cv_func_rename_dest_exists_bug=yes ;;
      *) gl_cv_func_rename_dest_exists_bug=no ;;
    esac

your host_os definately shouldn't be mingw on a Linux machine. Could you
please put your (compressed) coreutils-7.4/config.log file somewhere so
I can take a look?

-- 
Bye, Peter Korsgaard
