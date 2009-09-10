From: Stephen Rodgers <hwstar@rodgers.sdcoxmail.com>
Date: Wed, 09 Sep 2009 20:53:10 -0700
Subject: [Buildroot] coreutils build failing
In-Reply-To: <87r5ugyywf.fsf@macbook.be.48ers.dk>
References: <4AA3EBC6.3080306@rodgers.sdcoxmail.com>	<877hwbmi5k.fsf@macbook.be.48ers.dk>	<4AA5300B.3060804@rodgers.sdcoxmail.com>	<87r5ui63d1.fsf@macbook.be.48ers.dk>	<4AA5529F.7050906@rodgers.sdcoxmail.com>	<8763bu5twt.fsf@macbook.be.48ers.dk>	<4AA58BB1.50906@rodgers.sdcoxmail.com>
	<87r5ugyywf.fsf@macbook.be.48ers.dk>
Message-ID: <4AA87826.5020506@rodgers.sdcoxmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Stephen" == Stephen Rodgers <hwstar@rodgers.sdcoxmail.com> writes:
> 
> Hi,
> 
>  >> Could you either try with the default uclibc config or post your config?
> 
>  Stephen> I can confirm that default uClibc config fails in the same
>  Stephen> way. The only difference between my custom config and the
>  Stephen> default config is the enabling of SUSV3 legacy support which
>  Stephen> is required for Asterisk/Zaptel.
> 
>  Stephen> In the meantime, As a test I modified the config.h in in the
>  Stephen> build_i686/coreutils-7.4 directory to see if it would compile,
>  Stephen> and it did:
> 
>  Stephen> /* Define if rename does not work when the destination file exists, as
>  Stephen> on Windows. */
>  Stephen> /* #define RENAME_DEST_EXISTS_BUG 1 */
> 
> Ok, but then you need to figure out why that gets defined. Looking at
> the code it doesn't make any sense to me:
> 
>     case "$host_os" in
>       mingw*) gl_cv_func_rename_dest_exists_bug=yes ;;
>       *) gl_cv_func_rename_dest_exists_bug=no ;;
>     esac
> 
> your host_os definately shouldn't be mingw on a Linux machine. Could you
> please put your (compressed) coreutils-7.4/config.log file somewhere so
> I can take a look?
> 
Hi Peter,

As you requested, I tarred up the config.log from the failed
coreutils-7.4 build. You should be able to wget config.log.tar.gz using
the following url:

http://test.qrvc.com/config.log.tar.gz

Steve.
