From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 17:32:03 +0200
Subject: [Buildroot] [PATCH 2/2] package/aespipe: fix host compile
References: <20161217071659.3975-1-bernd.kuhls@t-online.de>
 <20161217071659.3975-2-bernd.kuhls@t-online.de>
 <20161217155904.4d5b4511@free-electrons.com>
 <87inqia42h.fsf@dell.be.48ers.dk>
Message-ID: <j47rvdxfme.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 17 Dec 2016 17:55:02 +0100 schrieb Peter Korsgaard:

>>>>>> "Thomas" == Thomas Petazzoni
>>>>>> <thomas.petazzoni-wi1
+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>>>>> writes:
> 
>  > Hello,
>  > On Sat, 17 Dec 2016 08:16:59 +0100, Bernd Kuhls wrote:
> 
>  >> +HOST_AESPIPE_CONF_ENV = \ +	CFLAGS="$(HOST_CFLAGS) -no-pie" \
>  >> +	LDFLAGS="$(HOST_LDFLAGS) -no-pie"
> 
>  > I reverted this patch as it breaks the build on systems where gcc
>  > does not understand -no-pie:
> 
>  >   http://autobuild.buildroot.net/?reason=host-aespipe-2.4d
> 
> Crap, so the option is also a Debian specific change? :/
> 
>  > A better solution is needed for this problem.

Hi,

any progress on this issue? I just stumbled across it while building an 
allyesconfig setup on the next branch.

Regards, Bernd
